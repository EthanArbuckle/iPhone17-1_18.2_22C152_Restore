BOOL specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int *v3;
  int *v4;
  uint64_t v5;
  BOOL result;
  int v7;
  int v8;
  int v9;

  v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32)) {
    return 0;
  }
  v3 = (int *)(a1 + 36);
  v4 = (int *)(a2 + 36);
  v5 = v2 - 1;
  do
  {
    result = v5 == 0;
    if (!v5) {
      break;
    }
    v8 = *v3++;
    v7 = v8;
    v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

{
  uint64_t v2;
  float *v3;
  float *v4;
  uint64_t v5;
  BOOL result;
  float v7;
  float v8;
  float v9;

  v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(float *)(a1 + 32) != *(float *)(a2 + 32)) {
    return 0;
  }
  v3 = (float *)(a1 + 36);
  v4 = (float *)(a2 + 36);
  v5 = v2 - 1;
  do
  {
    result = v5 == 0;
    if (!v5) {
      break;
    }
    v7 = *v3++;
    v8 = v7;
    v9 = *v4++;
    --v5;
  }
  while (v8 == v9);
  return result;
}

BOOL specialized static Array<A>.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  v3 = a1 + 5;
  v4 = a2 + 5;
  uint64_t v5 = v2 - 1;
  do
  {
    BOOL result = v5 == 0;
    if (!v5) {
      break;
    }
    uint64_t v8 = *v3++;
    uint64_t v7 = v8;
    uint64_t v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

uint64_t specialized static Array<A>.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void), uint64_t (*a5)(char *, char *), uint64_t (*a6)(void))
{
  uint64_t v11 = a3(0) - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v17 = (char *)&v27 - v16;
  uint64_t v18 = *(void *)(a1 + 16);
  if (v18 == *(void *)(a2 + 16))
  {
    if (!v18 || a1 == a2)
    {
      char v23 = 1;
    }
    else
    {
      uint64_t v28 = a2;
      v19 = a5;
      unint64_t v20 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
      uint64_t v21 = *(void *)(v15 + 72);
      uint64_t v22 = v18 - 1;
      do
      {
        outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(a1 + v20, (uint64_t)v17, a4);
        outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(v28 + v20, (uint64_t)v14, a4);
        char v23 = v19(v17, v14);
        outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v14, a6);
        outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v17, a6);
        BOOL v25 = v22-- != 0;
        if ((v23 & 1) == 0) {
          break;
        }
        v20 += v21;
      }
      while (v25);
    }
  }
  else
  {
    char v23 = 0;
  }
  return v23 & 1;
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.packing.setter(uint64_t a1)
{
  return AspireSimilaritySerializedCiphertextMatrix.packing.setter(a1, type metadata accessor for AspireSimilaritySerializedCiphertextMatrix, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?, type metadata accessor for AspireSimilarityPlaintextPacking, type metadata accessor for AspireSimilarityPlaintextPacking);
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.packing.getter@<X0>(uint64_t a1@<X8>)
{
  return AspireSimilaritySerializedCiphertextMatrix.packing.getter((uint64_t (*)(void, double))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix, a1);
}

void AspireSimilaritySimilarityMetric.init()(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t AspireSimilaritySimilarityMetric.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = result == 0;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

uint64_t AspireSimilaritySimilarityMetric.rawValue.getter()
{
  if (v0[8]) {
    return 0;
  }
  else {
    return *(void *)v0;
  }
}

uint64_t static AspireSimilaritySimilarityMetric.allCases.getter()
{
  if (one-time initialization token for allCases != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for static CaseIterable.allCases.getter in conformance AspireSimilaritySimilarityMetric@<X0>(void *a1@<X8>)
{
  if (one-time initialization token for allCases != -1) {
    swift_once();
  }
  *a1 = static AspireSimilaritySimilarityMetric.allCases;
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilaritySimilarityMetric(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = lazy protocol witness table accessor for type AspireSimilaritySimilarityMetric and conformance AspireSimilaritySimilarityMetric();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t AspireSimilarityPlaintextPacking.plaintextPackingType.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1, a1, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
}

uint64_t AspireSimilarityPlaintextPacking.plaintextPackingType.setter(uint64_t a1)
{
  return outlined assign with take of AMDPbHEConfig.OneOf_Config?(a1, v1, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
}

uint64_t (*AspireSimilarityPlaintextPacking.plaintextPackingType.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilarityPlaintextPacking.denseRow.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v2, (uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v7 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    return UnknownStorage.init()();
  }
  if (swift_getEnumCaseMultiPayload())
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v6, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    return UnknownStorage.init()();
  }
  return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, a1, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
}

uint64_t _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for AspireSimilarityPlaintextPackingDenseRow(uint64_t a1)
{
  return type metadata accessor for AMDPbHEConfigsReply(a1, (uint64_t *)&type metadata singleton initialization cache for AspireSimilarityPlaintextPackingDenseRow);
}

uint64_t key path getter for AspireSimilarityPlaintextPacking.denseRow : AspireSimilarityPlaintextPacking@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1, (uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v7 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    return UnknownStorage.init()();
  }
  if (swift_getEnumCaseMultiPayload())
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v6, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    return UnknownStorage.init()();
  }
  return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, a2, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
}

uint64_t AspireSimilarityPlaintextPacking.denseRow.setter(uint64_t a1)
{
  return AspireSimilarityPlaintextPacking.denseRow.setter(a1, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
}

void (*AspireSimilarityPlaintextPacking.denseRow.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  void *v4 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  char v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[1] = v6;
  size_t v7 = *(void *)(*(void *)(type metadata accessor for AspireSimilarityPlaintextPackingDenseRow(0) - 8) + 64);
  v4[2] = malloc(v7);
  uint64_t v8 = malloc(v7);
  v4[3] = v8;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v2, (uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v9 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  v4[4] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v4[5] = v10;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  }
  else
  {
    if (!swift_getEnumCaseMultiPayload())
    {
      _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, (uint64_t)v8, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
      return AspireSimilarityPlaintextPacking.denseRow.modify;
    }
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v6, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  }
  UnknownStorage.init()();
  return AspireSimilarityPlaintextPacking.denseRow.modify;
}

void AspireSimilarityPlaintextPacking.denseRow.modify(uint64_t **a1, char a2)
{
}

uint64_t outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t AspireSimilarityPlaintextPacking.diagonal.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v2, (uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v7 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1) {
      return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, a1, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
    }
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v6, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  }
  return UnknownStorage.init()();
}

uint64_t type metadata accessor for AspireSimilarityPlaintextPackingDiagonal(uint64_t a1)
{
  return type metadata accessor for AMDPbHEConfigsReply(a1, (uint64_t *)&type metadata singleton initialization cache for AspireSimilarityPlaintextPackingDiagonal);
}

uint64_t key path getter for AspireSimilarityPlaintextPacking.diagonal : AspireSimilarityPlaintextPacking@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1, (uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v7 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1) {
      return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, a2, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
    }
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v6, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  }
  return UnknownStorage.init()();
}

uint64_t AspireSimilarityPlaintextPacking.diagonal.setter(uint64_t a1)
{
  return AspireSimilarityPlaintextPacking.denseRow.setter(a1, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
}

void (*AspireSimilarityPlaintextPacking.diagonal.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  void *v4 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  char v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[1] = v6;
  size_t v7 = *(void *)(*(void *)(type metadata accessor for AspireSimilarityPlaintextPackingDiagonal(0) - 8) + 64);
  v4[2] = malloc(v7);
  uint64_t v8 = malloc(v7);
  v4[3] = v8;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v2, (uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v9 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  v4[4] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v4[5] = v10;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
LABEL_6:
    UnknownStorage.init()();
    return AspireSimilarityPlaintextPacking.diagonal.modify;
  }
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v6, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    goto LABEL_6;
  }
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, (uint64_t)v8, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
  return AspireSimilarityPlaintextPacking.diagonal.modify;
}

void AspireSimilarityPlaintextPacking.diagonal.modify(uint64_t **a1, char a2)
{
}

uint64_t outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t AspireSimilarityPlaintextPacking.denseColumn.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v2, (uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v7 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2) {
      return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, a1, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
    }
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v6, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  }
  return UnknownStorage.init()();
}

uint64_t type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn(uint64_t a1)
{
  return type metadata accessor for AMDPbHEConfigsReply(a1, (uint64_t *)&type metadata singleton initialization cache for AspireSimilarityPlaintextPackingDenseColumn);
}

uint64_t key path getter for AspireSimilarityPlaintextPacking.denseColumn : AspireSimilarityPlaintextPacking@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1, (uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v7 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2) {
      return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, a2, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
    }
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v6, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  }
  return UnknownStorage.init()();
}

uint64_t key path setter for AspireSimilarityPlaintextPacking.denseRow : AspireSimilarityPlaintextPacking(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  uint64_t v11 = a5(0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v16 - v12;
  outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(a1, (uint64_t)&v16 - v12, a6);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(a2, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v13, a2, a7);
  uint64_t v14 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a2, 0, 1, v14);
}

uint64_t AspireSimilarityPlaintextPacking.denseColumn.setter(uint64_t a1)
{
  return AspireSimilarityPlaintextPacking.denseRow.setter(a1, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
}

uint64_t AspireSimilarityPlaintextPacking.denseRow.setter(uint64_t a1, uint64_t (*a2)(void))
{
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v2, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(a1, v2, a2);
  uint64_t v5 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  swift_storeEnumTagMultiPayload();
  char v6 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  return v6(v2, 0, 1, v5);
}

void (*AspireSimilarityPlaintextPacking.denseColumn.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  void *v4 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  char v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[1] = v6;
  size_t v7 = *(void *)(*(void *)(type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn(0) - 8) + 64);
  v4[2] = malloc(v7);
  uint64_t v8 = malloc(v7);
  v4[3] = v8;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v2, (uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v9 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  v4[4] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v4[5] = v10;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
LABEL_6:
    UnknownStorage.init()();
    return AspireSimilarityPlaintextPacking.denseColumn.modify;
  }
  if (swift_getEnumCaseMultiPayload() != 2)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v6, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    goto LABEL_6;
  }
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, (uint64_t)v8, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
  return AspireSimilarityPlaintextPacking.denseColumn.modify;
}

void AspireSimilarityPlaintextPacking.denseColumn.modify(uint64_t **a1, char a2)
{
}

void AspireSimilarityPlaintextPacking.denseRow.modify(uint64_t **a1, char a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  size_t v7 = *a1;
  uint64_t v8 = (*a1)[4];
  uint64_t v9 = (*a1)[5];
  uint64_t v10 = (void *)(*a1)[2];
  uint64_t v11 = (void *)(*a1)[3];
  uint64_t v13 = **a1;
  uint64_t v12 = (void *)(*a1)[1];
  if (a2)
  {
    outlined init with copy of AspireSimilarityPlaintextPackingDenseRow((*a1)[3], (uint64_t)v10, a5);
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v13, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v10, v13, a3);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v13, 0, 1, v8);
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v11, a6);
  }
  else
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?(**a1, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v11, v13, a3);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v13, 0, 1, v8);
  }
  free(v11);
  free(v10);
  free(v12);
  free(v7);
}

uint64_t AspireSimilarityPlaintextPacking.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return AspireSimilarityPlaintextPacking.unknownFields.getter(type metadata accessor for AspireSimilarityPlaintextPacking, a1);
}

uint64_t AspireSimilarityPlaintextPacking.unknownFields.setter(uint64_t a1)
{
  return AspireSimilarityPlaintextPacking.unknownFields.setter(a1, type metadata accessor for AspireSimilarityPlaintextPacking);
}

uint64_t (*AspireSimilarityPlaintextPacking.unknownFields.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t static AspireSimilarityPlaintextPackingDenseRow.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  size_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - v10;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, double))(v5 + 16);
  v12((char *)&v15 - v10, a1, v4, v9);
  ((void (*)(char *, uint64_t, uint64_t))v12)(v7, a2, v4);
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, MEMORY[0x263F50560]);
  LOBYTE(a2) = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v7, v4);
  v13(v11, v4);
  return a2 & 1;
}

uint64_t (*AspireSimilarityPlaintextPackingDenseRow.unknownFields.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t (*AspireSimilarityPlaintextPackingDiagonal.unknownFields.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t (*AspireSimilarityPlaintextPackingDenseColumn.unknownFields.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.nrows.getter()
{
  return *v0;
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.nrows.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*AspireSimilaritySerializedCiphertextMatrix.nrows.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.ncols.getter()
{
  return *(unsigned int *)(v0 + 4);
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.ncols.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 4) = result;
  return result;
}

uint64_t (*AspireSimilaritySerializedCiphertextMatrix.ncols.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t (*AspireSimilaritySerializedCiphertextMatrix.ciphertexts.modify())()
{
  return Repeated.subscript.readspecialized ;
}

void (*AspireSimilaritySerializedCiphertextMatrix.packing.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for AspireSimilaritySerializedCiphertextMatrix(0) + 32);
  *((_DWORD *)v3 + 12) = v11;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1 + v11, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    uint64_t v12 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
    UnknownStorage.init()();
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  }
  else
  {
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, (uint64_t)v10, type metadata accessor for AspireSimilarityPlaintextPacking);
  }
  return AspireSimilaritySerializedCiphertextMatrix.packing.modify;
}

void AspireSimilaritySerializedCiphertextMatrix.packing.modify(uint64_t a1, char a2)
{
}

BOOL AspireSimilaritySerializedCiphertextMatrix.hasPacking.getter()
{
  return AspireSimilaritySerializedCiphertextMatrix.hasPacking.getter((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?, (uint64_t (*)(void, double))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix, type metadata accessor for AspireSimilarityPlaintextPacking);
}

Swift::Void __swiftcall AspireSimilaritySerializedCiphertextMatrix.clearPacking()()
{
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return AspireSimilaritySerializedCiphertextMatrix.unknownFields.getter(type metadata accessor for AspireSimilaritySerializedCiphertextMatrix, a1);
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.unknownFields.setter(uint64_t a1)
{
  return AspireSimilaritySerializedCiphertextMatrix.unknownFields.setter(a1, type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
}

uint64_t (*AspireSimilaritySerializedCiphertextMatrix.unknownFields.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t (*AspireSimilaritySerializedDcrtPlaintextMatrix.numRows.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t (*AspireSimilaritySerializedDcrtPlaintextMatrix.numCols.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t (*AspireSimilaritySerializedDcrtPlaintextMatrix.plaintexts.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySerializedDcrtPlaintextMatrix.packing.getter@<X0>(uint64_t a1@<X8>)
{
  return AspireSimilaritySerializedCiphertextMatrix.packing.getter((uint64_t (*)(void, double))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix, a1);
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.packing.getter@<X0>(uint64_t (*a1)(void, double)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  double v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1(0, v6);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v2 + *(int *)(v9 + 32), (uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v10 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v8, 1, v10) != 1) {
    return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v8, a2, type metadata accessor for AspireSimilarityPlaintextPacking);
  }
  uint64_t v11 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a2, 1, 1, v11);
  UnknownStorage.init()();
  return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
}

uint64_t key path getter for AspireSimilaritySerializedCiphertextMatrix.packing : AspireSimilaritySerializedCiphertextMatrix@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void, double)@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  double v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a2(0, v7);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v10 + 32), (uint64_t)v9, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v11 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v9, 1, v11) != 1) {
    return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v9, a3, type metadata accessor for AspireSimilarityPlaintextPacking);
  }
  uint64_t v12 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a3, 1, 1, v12);
  UnknownStorage.init()();
  return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v9, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
}

uint64_t key path setter for AspireSimilaritySerializedCiphertextMatrix.packing : AspireSimilaritySerializedCiphertextMatrix(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(a1, (uint64_t)v11, type metadata accessor for AspireSimilarityPlaintextPacking);
  uint64_t v12 = a2 + *(int *)(a5(0) + 32);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v12, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v11, v12, type metadata accessor for AspireSimilarityPlaintextPacking);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v12, 0, 1, v8);
}

uint64_t AspireSimilaritySerializedDcrtPlaintextMatrix.packing.setter(uint64_t a1)
{
  return AspireSimilaritySerializedCiphertextMatrix.packing.setter(a1, type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?, type metadata accessor for AspireSimilarityPlaintextPacking, type metadata accessor for AspireSimilarityPlaintextPacking);
}

void (*AspireSimilaritySerializedDcrtPlaintextMatrix.packing.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix(0) + 32);
  *((_DWORD *)v3 + 12) = v11;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1 + v11, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    uint64_t v12 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
    UnknownStorage.init()();
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  }
  else
  {
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, (uint64_t)v10, type metadata accessor for AspireSimilarityPlaintextPacking);
  }
  return AspireSimilaritySerializedCiphertextMatrix.packing.modify;
}

BOOL AspireSimilaritySerializedDcrtPlaintextMatrix.hasPacking.getter()
{
  return AspireSimilaritySerializedCiphertextMatrix.hasPacking.getter((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?, (uint64_t (*)(void, double))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix, type metadata accessor for AspireSimilarityPlaintextPacking);
}

BOOL AspireSimilaritySerializedCiphertextMatrix.hasPacking.getter(uint64_t *a1, uint64_t (*a2)(void, double), uint64_t (*a3)(void))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  double v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a2(0, v8);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v3 + *(int *)(v11 + 32), (uint64_t)v10, a1);
  uint64_t v12 = a3(0);
  BOOL v13 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v10, 1, v12) != 1;
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v10, a1);
  return v13;
}

Swift::Void __swiftcall AspireSimilaritySerializedDcrtPlaintextMatrix.clearPacking()()
{
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.clearPacking()(uint64_t (*a1)(void), uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = v3 + *(int *)(a1(0) + 32);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v6, a2);
  uint64_t v7 = a3(0);
  double v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  return v8(v6, 1, 1, v7);
}

uint64_t AspireSimilaritySerializedDcrtPlaintextMatrix.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return AspireSimilaritySerializedCiphertextMatrix.unknownFields.getter(type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix, a1);
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.unknownFields.getter@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t AspireSimilaritySerializedDcrtPlaintextMatrix.unknownFields.setter(uint64_t a1)
{
  return AspireSimilaritySerializedCiphertextMatrix.unknownFields.setter(a1, type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.unknownFields.setter(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*AspireSimilaritySerializedDcrtPlaintextMatrix.unknownFields.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySerializedDcrtPlaintextMatrix.init()@<X0>(void *a1@<X8>)
{
  return AspireSimilaritySerializedCiphertextMatrix.init()(type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix, a1);
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.init()@<X0>(uint64_t (*a1)(void)@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = MEMORY[0x263F8EE78];
  uint64_t v3 = a1(0);
  UnknownStorage.init()();
  uint64_t v4 = (char *)a2 + *(int *)(v3 + 32);
  uint64_t v5 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  return v6(v4, 1, 1, v5);
}

uint64_t AspireSimilaritySimilarityClientConfig.encryptionParameters.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1 + *(int *)(v6 + 40), (uint64_t)v5, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  uint64_t v7 = type metadata accessor for AspireHeEncryptionParameters(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1) {
    return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, a1, type metadata accessor for AspireHeEncryptionParameters);
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 1;
  *(void *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 64) = 1;
  UnknownStorage.init()();
  return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
}

uint64_t key path setter for AspireSimilaritySimilarityClientConfig.encryptionParameters : AspireSimilaritySimilarityClientConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AspireHeEncryptionParameters(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(a1, (uint64_t)v7, type metadata accessor for AspireHeEncryptionParameters);
  uint64_t v8 = a2 + *(int *)(type metadata accessor for AspireSimilaritySimilarityClientConfig(0) + 40);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v8, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v7, v8, type metadata accessor for AspireHeEncryptionParameters);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
}

uint64_t AspireSimilaritySimilarityClientConfig.encryptionParameters.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AspireSimilaritySimilarityClientConfig(0) + 40);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v3, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(a1, v3, type metadata accessor for AspireHeEncryptionParameters);
  uint64_t v4 = type metadata accessor for AspireHeEncryptionParameters(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(v3, 0, 1, v4);
}

void (*AspireSimilaritySimilarityClientConfig.encryptionParameters.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for AspireHeEncryptionParameters(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for AspireSimilaritySimilarityClientConfig(0) + 40);
  *((_DWORD *)v3 + 12) = v11;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1 + v11, (uint64_t)v5, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    *uint64_t v10 = 0;
    v10[1] = 0;
    v10[2] = MEMORY[0x263F8EE78];
    v10[3] = 0;
    *((unsigned char *)v10 + 32) = 1;
    v10[5] = 0;
    *((unsigned char *)v10 + 48) = 1;
    v10[7] = 0;
    *((unsigned char *)v10 + 64) = 1;
    UnknownStorage.init()();
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  }
  else
  {
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, (uint64_t)v10, type metadata accessor for AspireHeEncryptionParameters);
  }
  return AspireSimilaritySimilarityClientConfig.encryptionParameters.modify;
}

void AspireSimilaritySimilarityClientConfig.encryptionParameters.modify(uint64_t a1, char a2)
{
}

BOOL AspireSimilaritySimilarityClientConfig.hasEncryptionParameters.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v0 + *(int *)(v4 + 40), (uint64_t)v3, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  uint64_t v5 = type metadata accessor for AspireHeEncryptionParameters(0);
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v3, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  return v6;
}

Swift::Void __swiftcall AspireSimilaritySimilarityClientConfig.clearEncryptionParameters()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for AspireSimilaritySimilarityClientConfig(0) + 40);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v1, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  uint64_t v2 = type metadata accessor for AspireHeEncryptionParameters(0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
}

uint64_t AspireSimilaritySimilarityClientConfig.scalingFactor.getter()
{
  return *(void *)v0;
}

uint64_t AspireSimilaritySimilarityClientConfig.scalingFactor.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*AspireSimilaritySimilarityClientConfig.scalingFactor.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityClientConfig.plaintextPacking.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1 + *(int *)(v6 + 44), (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v7 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1) {
    return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, a1, type metadata accessor for AspireSimilarityPlaintextPacking);
  }
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a1, 1, 1, v8);
  UnknownStorage.init()();
  return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
}

uint64_t key path getter for AspireSimilaritySimilarityClientConfig.plaintextPacking : AspireSimilaritySimilarityClientConfig@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v7 + 44), (uint64_t)v6, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v6, 1, v8) != 1) {
    return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, a2, type metadata accessor for AspireSimilarityPlaintextPacking);
  }
  uint64_t v9 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a2, 1, 1, v9);
  UnknownStorage.init()();
  return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
}

uint64_t key path setter for AspireSimilaritySimilarityClientConfig.plaintextPacking : AspireSimilaritySimilarityClientConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(a1, (uint64_t)v7, type metadata accessor for AspireSimilarityPlaintextPacking);
  uint64_t v8 = a2 + *(int *)(type metadata accessor for AspireSimilaritySimilarityClientConfig(0) + 44);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v8, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v7, v8, type metadata accessor for AspireSimilarityPlaintextPacking);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
}

uint64_t AspireSimilaritySimilarityClientConfig.plaintextPacking.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AspireSimilaritySimilarityClientConfig(0) + 44);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v3, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(a1, v3, type metadata accessor for AspireSimilarityPlaintextPacking);
  uint64_t v4 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(v3, 0, 1, v4);
}

void (*AspireSimilaritySimilarityClientConfig.plaintextPacking.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for AspireSimilaritySimilarityClientConfig(0) + 44);
  *((_DWORD *)v3 + 12) = v11;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1 + v11, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    uint64_t v12 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
    UnknownStorage.init()();
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  }
  else
  {
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, (uint64_t)v10, type metadata accessor for AspireSimilarityPlaintextPacking);
  }
  return AspireSimilaritySerializedCiphertextMatrix.packing.modify;
}

BOOL AspireSimilaritySimilarityClientConfig.hasPlaintextPacking.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v0 + *(int *)(v4 + 44), (uint64_t)v3, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v5 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v3, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  return v6;
}

Swift::Void __swiftcall AspireSimilaritySimilarityClientConfig.clearPlaintextPacking()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for AspireSimilaritySimilarityClientConfig(0) + 44);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v1, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v2 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
}

uint64_t AspireSimilaritySimilarityClientConfig.embeddingDimension.getter()
{
  return *(unsigned int *)(v0 + 8);
}

uint64_t AspireSimilaritySimilarityClientConfig.embeddingDimension.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*AspireSimilaritySimilarityClientConfig.embeddingDimension.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityClientConfig.galoisElts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AspireSimilaritySimilarityClientConfig.galoisElts.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*AspireSimilaritySimilarityClientConfig.galoisElts.modify())()
{
  return Repeated.subscript.readspecialized ;
}

void AspireSimilaritySimilarityClientConfig.similarityMetric.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 32);
  *(void *)a1 = *(void *)(v1 + 24);
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t AspireSimilaritySimilarityClientConfig.similarityMetric.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)(v1 + 24) = *(void *)result;
  *(unsigned char *)(v1 + 32) = v2;
  return result;
}

uint64_t (*AspireSimilaritySimilarityClientConfig.similarityMetric.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityClientConfig.extraPlaintextModuli.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AspireSimilaritySimilarityClientConfig.extraPlaintextModuli.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*AspireSimilaritySimilarityClientConfig.extraPlaintextModuli.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityClientConfig.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AspireSimilaritySimilarityClientConfig(0) + 36);
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t AspireSimilaritySimilarityClientConfig.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AspireSimilaritySimilarityClientConfig(0) + 36);
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*AspireSimilaritySimilarityClientConfig.unknownFields.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityClientConfig.init()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(_DWORD *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = v2;
  uint64_t v3 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  UnknownStorage.init()();
  uint64_t v4 = a1 + *(int *)(v3 + 40);
  uint64_t v5 = type metadata accessor for AspireHeEncryptionParameters(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = a1 + *(int *)(v3 + 44);
  uint64_t v7 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  return v8(v6, 1, 1, v7);
}

uint64_t AspireSimilaritySimilarityServerConfig.clientConfig.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1 + *(int *)(v6 + 24), (uint64_t)v5, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  uint64_t v7 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1) {
    return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, a1, type metadata accessor for AspireSimilaritySimilarityClientConfig);
  }
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  uint64_t v8 = MEMORY[0x263F8EE78];
  *(void *)(a1 + 16) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = v8;
  UnknownStorage.init()();
  uint64_t v9 = a1 + *(int *)(v7 + 40);
  uint64_t v10 = type metadata accessor for AspireHeEncryptionParameters(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = a1 + *(int *)(v7 + 44);
  uint64_t v12 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
}

uint64_t key path getter for AspireSimilaritySimilarityServerConfig.clientConfig : AspireSimilaritySimilarityServerConfig@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v7 + 24), (uint64_t)v6, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  uint64_t v8 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v6, 1, v8) != 1) {
    return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, a2, type metadata accessor for AspireSimilaritySimilarityClientConfig);
  }
  *(void *)a2 = 0;
  *(_DWORD *)(a2 + 8) = 0;
  uint64_t v9 = MEMORY[0x263F8EE78];
  *(void *)(a2 + 16) = MEMORY[0x263F8EE78];
  *(void *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 1;
  *(void *)(a2 + 40) = v9;
  UnknownStorage.init()();
  uint64_t v10 = a2 + *(int *)(v8 + 40);
  uint64_t v11 = type metadata accessor for AspireHeEncryptionParameters(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = a2 + *(int *)(v8 + 44);
  uint64_t v13 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
}

uint64_t key path setter for AspireSimilaritySimilarityServerConfig.clientConfig : AspireSimilaritySimilarityServerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(a1, (uint64_t)v7, type metadata accessor for AspireSimilaritySimilarityClientConfig);
  uint64_t v8 = a2 + *(int *)(type metadata accessor for AspireSimilaritySimilarityServerConfig(0) + 24);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v8, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v7, v8, type metadata accessor for AspireSimilaritySimilarityClientConfig);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
}

uint64_t AspireSimilaritySimilarityServerConfig.clientConfig.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AspireSimilaritySimilarityServerConfig(0) + 24);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v3, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(a1, v3, type metadata accessor for AspireSimilaritySimilarityClientConfig);
  uint64_t v4 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(v3, 0, 1, v4);
}

void (*AspireSimilaritySimilarityServerConfig.clientConfig.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for AspireSimilaritySimilarityServerConfig(0) + 24);
  *((_DWORD *)v3 + 12) = v11;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1 + v11, (uint64_t)v5, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    *(void *)uint64_t v10 = 0;
    v10[2] = 0;
    uint64_t v12 = MEMORY[0x263F8EE78];
    *((void *)v10 + 2) = MEMORY[0x263F8EE78];
    *((void *)v10 + 3) = 0;
    *((unsigned char *)v10 + 32) = 1;
    *((void *)v10 + 5) = v12;
    UnknownStorage.init()();
    uint64_t v13 = (char *)v10 + *(int *)(v6 + 40);
    uint64_t v14 = type metadata accessor for AspireHeEncryptionParameters(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
    uint64_t v15 = (char *)v10 + *(int *)(v6 + 44);
    uint64_t v16 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  }
  else
  {
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, (uint64_t)v10, type metadata accessor for AspireSimilaritySimilarityClientConfig);
  }
  return AspireSimilaritySimilarityServerConfig.clientConfig.modify;
}

void AspireSimilaritySimilarityServerConfig.clientConfig.modify(uint64_t a1, char a2)
{
}

BOOL AspireSimilaritySimilarityServerConfig.hasClientConfig.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v0 + *(int *)(v4 + 24), (uint64_t)v3, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  uint64_t v5 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v3, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  return v6;
}

Swift::Void __swiftcall AspireSimilaritySimilarityServerConfig.clearClientConfig()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for AspireSimilaritySimilarityServerConfig(0) + 24);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v1, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  uint64_t v2 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
}

uint64_t AspireSimilaritySimilarityServerConfig.dbPacking.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1 + *(int *)(v6 + 28), (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v7 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1) {
    return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, a1, type metadata accessor for AspireSimilarityPlaintextPacking);
  }
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a1, 1, 1, v8);
  UnknownStorage.init()();
  return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
}

uint64_t key path getter for AspireSimilaritySimilarityServerConfig.dbPacking : AspireSimilaritySimilarityServerConfig@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v7 + 28), (uint64_t)v6, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v6, 1, v8) != 1) {
    return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, a2, type metadata accessor for AspireSimilarityPlaintextPacking);
  }
  uint64_t v9 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a2, 1, 1, v9);
  UnknownStorage.init()();
  return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
}

uint64_t key path setter for AspireSimilaritySimilarityServerConfig.dbPacking : AspireSimilaritySimilarityServerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(a1, (uint64_t)v7, type metadata accessor for AspireSimilarityPlaintextPacking);
  uint64_t v8 = a2 + *(int *)(type metadata accessor for AspireSimilaritySimilarityServerConfig(0) + 28);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v8, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v7, v8, type metadata accessor for AspireSimilarityPlaintextPacking);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
}

uint64_t AspireSimilaritySimilarityServerConfig.dbPacking.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AspireSimilaritySimilarityServerConfig(0) + 28);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v3, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(a1, v3, type metadata accessor for AspireSimilarityPlaintextPacking);
  uint64_t v4 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(v3, 0, 1, v4);
}

void (*AspireSimilaritySimilarityServerConfig.dbPacking.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for AspireSimilaritySimilarityServerConfig(0) + 28);
  *((_DWORD *)v3 + 12) = v11;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1 + v11, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    uint64_t v12 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
    UnknownStorage.init()();
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  }
  else
  {
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, (uint64_t)v10, type metadata accessor for AspireSimilarityPlaintextPacking);
  }
  return AspireSimilaritySerializedCiphertextMatrix.packing.modify;
}

BOOL AspireSimilaritySimilarityServerConfig.hasDbPacking.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v0 + *(int *)(v4 + 28), (uint64_t)v3, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v5 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v3, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  return v6;
}

Swift::Void __swiftcall AspireSimilaritySimilarityServerConfig.clearDbPacking()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for AspireSimilaritySimilarityServerConfig(0) + 28);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v1, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v2 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
}

uint64_t AspireSimilaritySimilarityServerConfig.parallel.getter()
{
  return *v0;
}

uint64_t AspireSimilaritySimilarityServerConfig.parallel.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*AspireSimilaritySimilarityServerConfig.parallel.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityServerConfig.babyStep.getter()
{
  uint64_t v1 = (unsigned char *)(v0 + *(int *)(type metadata accessor for AspireSimilaritySimilarityServerConfig(0) + 32));
  if (v1[4]) {
    return 0;
  }
  else {
    return *(unsigned int *)v1;
  }
}

uint64_t AspireSimilaritySimilarityServerConfig.babyStep.setter(int a1)
{
  uint64_t result = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v4 = v1 + *(int *)(result + 32);
  *(_DWORD *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 4) = 0;
  return result;
}

uint64_t (*AspireSimilaritySimilarityServerConfig.babyStep.modify(uint64_t a1))(uint64_t result)
{
  *(void *)a1 = v1;
  uint64_t v3 = *(int *)(type metadata accessor for AspireSimilaritySimilarityServerConfig(0) + 32);
  *(_DWORD *)(a1 + 12) = v3;
  uint64_t v4 = (int *)(v1 + v3);
  if (*((unsigned char *)v4 + 4)) {
    int v5 = 0;
  }
  else {
    int v5 = *v4;
  }
  *(_DWORD *)(a1 + 8) = v5;
  return AspireSimilaritySimilarityServerConfig.babyStep.modify;
}

uint64_t AspireSimilaritySimilarityServerConfig.babyStep.modify(uint64_t result)
{
  uint64_t v1 = *(void *)result + *(int *)(result + 12);
  *(_DWORD *)uint64_t v1 = *(_DWORD *)(result + 8);
  *(unsigned char *)(v1 + 4) = 0;
  return result;
}

BOOL AspireSimilaritySimilarityServerConfig.hasBabyStep.getter()
{
  return (*(unsigned char *)(v0 + *(int *)(type metadata accessor for AspireSimilaritySimilarityServerConfig(0) + 32) + 4) & 1) == 0;
}

Swift::Void __swiftcall AspireSimilaritySimilarityServerConfig.clearBabyStep()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for AspireSimilaritySimilarityServerConfig(0) + 32);
  *(_DWORD *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 4) = 1;
}

uint64_t AspireSimilaritySimilarityServerConfig.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return AspireSimilarityPlaintextPacking.unknownFields.getter(type metadata accessor for AspireSimilaritySimilarityServerConfig, a1);
}

uint64_t AspireSimilarityPlaintextPacking.unknownFields.getter@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t AspireSimilaritySimilarityServerConfig.unknownFields.setter(uint64_t a1)
{
  return AspireSimilarityPlaintextPacking.unknownFields.setter(a1, type metadata accessor for AspireSimilaritySimilarityServerConfig);
}

uint64_t AspireSimilarityPlaintextPacking.unknownFields.setter(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*AspireSimilaritySimilarityServerConfig.unknownFields.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityServerConfig.init()@<X0>(unsigned char *a1@<X8>)
{
  *a1 = 0;
  uint64_t v2 = (int *)type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  UnknownStorage.init()();
  uint64_t v3 = &a1[v2[6]];
  uint64_t v4 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = &a1[v2[7]];
  uint64_t v6 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v8 = &a1[v2[8]];
  *(_DWORD *)uint64_t v8 = 0;
  v8[4] = 1;
  return result;
}

uint64_t (*AspireSimilaritySerializedProcessedSimilarityDb.plaintextMatrices.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySerializedProcessedSimilarityDb.entryIds.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AspireSimilaritySerializedProcessedSimilarityDb.entryIds.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*AspireSimilaritySerializedProcessedSimilarityDb.entryIds.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t (*AspireSimilaritySerializedProcessedSimilarityDb.entryMetadatas.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySerializedProcessedSimilarityDb.serverConfig.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1 + *(int *)(v6 + 32), (uint64_t)v5, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  uint64_t v7 = (int *)type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v7 - 1) + 48))(v5, 1, v7) != 1) {
    return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, (uint64_t)a1, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  }
  *a1 = 0;
  UnknownStorage.init()();
  uint64_t v8 = &a1[v7[6]];
  uint64_t v9 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = &a1[v7[7]];
  uint64_t v11 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = &a1[v7[8]];
  *(_DWORD *)uint64_t v12 = 0;
  v12[4] = 1;
  return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
}

uint64_t key path getter for AspireSimilaritySerializedProcessedSimilarityDb.serverConfig : AspireSimilaritySerializedProcessedSimilarityDb@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v7 + 32), (uint64_t)v6, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  uint64_t v8 = (int *)type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v8 - 1) + 48))(v6, 1, v8) != 1) {
    return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v6, (uint64_t)a2, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  }
  *a2 = 0;
  UnknownStorage.init()();
  uint64_t v9 = &a2[v8[6]];
  uint64_t v10 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = &a2[v8[7]];
  uint64_t v12 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = &a2[v8[8]];
  *(_DWORD *)uint64_t v13 = 0;
  v13[4] = 1;
  return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
}

uint64_t key path setter for AspireSimilaritySerializedProcessedSimilarityDb.serverConfig : AspireSimilaritySerializedProcessedSimilarityDb(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(a1, (uint64_t)v7, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  uint64_t v8 = a2 + *(int *)(type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb(0) + 32);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v8, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v7, v8, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
}

uint64_t AspireSimilaritySerializedProcessedSimilarityDb.serverConfig.setter(uint64_t a1)
{
  return AspireSimilaritySerializedCiphertextMatrix.packing.setter(a1, type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?, type metadata accessor for AspireSimilaritySimilarityServerConfig, type metadata accessor for AspireSimilaritySimilarityServerConfig);
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.packing.setter(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t v10 = v5 + *(int *)(a2(0) + 32);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v10, a3);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(a1, v10, a4);
  uint64_t v11 = a5(0);
  uint64_t v12 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  return v12(v10, 0, 1, v11);
}

void (*AspireSimilaritySerializedProcessedSimilarityDb.serverConfig.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = (int *)type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  v3[2] = v6;
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb(0) + 32);
  *((_DWORD *)v3 + 12) = v11;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v1 + v11, (uint64_t)v5, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v8 + 48))(v5, 1, v6) == 1)
  {
    *uint64_t v10 = 0;
    UnknownStorage.init()();
    uint64_t v12 = &v10[v6[6]];
    uint64_t v13 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
    uint64_t v14 = &v10[v6[7]];
    uint64_t v15 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
    uint64_t v16 = &v10[v6[8]];
    *(_DWORD *)uint64_t v16 = 0;
    v16[4] = 1;
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  }
  else
  {
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, (uint64_t)v10, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  }
  return AspireSimilaritySerializedProcessedSimilarityDb.serverConfig.modify;
}

void AspireSimilaritySerializedProcessedSimilarityDb.serverConfig.modify(uint64_t a1, char a2)
{
}

void AspireSimilaritySerializedCiphertextMatrix.packing.modify(uint64_t a1, char a2, uint64_t *a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  uint64_t v8 = *(void **)a1;
  uint64_t v9 = *(int *)(*(void *)a1 + 48);
  uint64_t v10 = *(void **)(*(void *)a1 + 32);
  uint64_t v11 = *(void **)(*(void *)a1 + 40);
  uint64_t v12 = *(void *)(*(void *)a1 + 16);
  uint64_t v13 = *(void *)(*(void *)a1 + 24);
  uint64_t v14 = *(void **)(*(void *)a1 + 8);
  uint64_t v15 = **(void **)a1 + v9;
  if (a2)
  {
    outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(*(void *)(*(void *)a1 + 40), (uint64_t)v10, a5);
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v15, a3);
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v10, v15, a4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v12);
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v11, a6);
  }
  else
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?(**(void **)a1 + v9, a3);
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v11, v15, a4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v12);
  }
  free(v11);
  free(v10);
  free(v14);
  free(v8);
}

BOOL AspireSimilaritySerializedProcessedSimilarityDb.hasServerConfig.getter()
{
  return AspireSimilaritySerializedCiphertextMatrix.hasPacking.getter(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?, (uint64_t (*)(void, double))type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb, type metadata accessor for AspireSimilaritySimilarityServerConfig);
}

Swift::Void __swiftcall AspireSimilaritySerializedProcessedSimilarityDb.clearServerConfig()()
{
}

uint64_t AspireSimilaritySerializedProcessedSimilarityDb.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return AspireSimilaritySerializedCiphertextMatrix.unknownFields.getter(type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb, a1);
}

uint64_t AspireSimilaritySerializedProcessedSimilarityDb.unknownFields.setter(uint64_t a1)
{
  return AspireSimilaritySerializedCiphertextMatrix.unknownFields.setter(a1, type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb);
}

uint64_t (*AspireSimilaritySerializedProcessedSimilarityDb.unknownFields.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySerializedProcessedSimilarityDb.init()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  *a1 = MEMORY[0x263F8EE78];
  a1[1] = v2;
  a1[2] = v2;
  uint64_t v3 = type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb(0);
  UnknownStorage.init()();
  uint64_t v4 = (char *)a1 + *(int *)(v3 + 32);
  uint64_t v5 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  return v6(v4, 1, 1, v5);
}

uint64_t (*AspireSimilaritySimilarityDbRow.entryID.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityDbRow.entryMetadata.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  outlined copy of Data._Representation(v1, *(void *)(v0 + 16));
  return v1;
}

uint64_t AspireSimilaritySimilarityDbRow.entryMetadata.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = outlined consume of Data._Representation(*(void *)(v2 + 8), *(void *)(v2 + 16));
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*AspireSimilaritySimilarityDbRow.entryMetadata.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityDbRow.embedding.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AspireSimilaritySimilarityDbRow.embedding.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*AspireSimilaritySimilarityDbRow.embedding.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityDbRow.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return AspireSimilaritySerializedCiphertextMatrix.unknownFields.getter(type metadata accessor for AspireSimilaritySimilarityDbRow, a1);
}

uint64_t AspireSimilaritySimilarityDbRow.unknownFields.setter(uint64_t a1)
{
  return AspireSimilaritySerializedCiphertextMatrix.unknownFields.setter(a1, type metadata accessor for AspireSimilaritySimilarityDbRow);
}

uint64_t (*AspireSimilaritySimilarityDbRow.unknownFields.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityDbRow.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  uint64_t v1 = MEMORY[0x263F8EE78];
  a1[2] = 0xC000000000000000;
  a1[3] = v1;
  type metadata accessor for AspireSimilaritySimilarityDbRow(0);
  return UnknownStorage.init()();
}

uint64_t AspireSimilaritySimilarityDb.rows.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AspireSimilaritySimilarityDb.rows.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*AspireSimilaritySimilarityDb.rows.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityDb.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return AspireSimilarityPlaintextPacking.unknownFields.getter(type metadata accessor for AspireSimilaritySimilarityDb, a1);
}

uint64_t AspireSimilaritySimilarityDb.unknownFields.setter(uint64_t a1)
{
  return AspireSimilarityPlaintextPacking.unknownFields.setter(a1, type metadata accessor for AspireSimilaritySimilarityDb);
}

uint64_t (*AspireSimilaritySimilarityDb.unknownFields.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilaritySimilarityDb.init()@<X0>(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
  type metadata accessor for AspireSimilaritySimilarityDb(0);
  return UnknownStorage.init()();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.inputDatabase.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20));
  swift_beginAccess();
  if (*(void *)(v1 + 24)) {
    uint64_t v2 = *(void *)(v1 + 16);
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t key path getter for AspireSimilarityPecPreprocessDbArgs.inputDatabase : AspireSimilarityPecPreprocessDbArgs@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20));
  swift_beginAccess();
  if (*(void *)(v3 + 24))
  {
    uint64_t v4 = *(void *)(v3 + 16);
    unint64_t v5 = *(void *)(v3 + 24);
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  *a2 = v4;
  a2[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t key path setter for AspireSimilarityPecPreprocessDbArgs.inputDatabase : AspireSimilarityPecPreprocessDbArgs(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v6 = (void *)swift_retain();
    uint64_t v7 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v6);
    swift_release();
    *(void *)(a2 + v5) = v7;
    swift_release();
  }
  uint64_t v8 = *(void *)(a2 + v5);
  swift_beginAccess();
  *(void *)(v8 + 16) = v4;
  *(void *)(v8 + 24) = v3;
  return swift_bridgeObjectRelease();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.inputDatabase.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v7 = (void *)swift_retain();
    uint64_t v8 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v7);
    swift_release();
    *(void *)(v3 + v6) = v8;
    swift_release();
  }
  uint64_t v9 = *(void *)(v3 + v6);
  swift_beginAccess();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  return swift_bridgeObjectRelease();
}

void (*AspireSimilarityPecPreprocessDbArgs.inputDatabase.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[11] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  *((_DWORD *)v3 + 24) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  if (*(void *)(v5 + 24))
  {
    uint64_t v6 = *(void *)(v5 + 16);
    unint64_t v7 = *(void *)(v5 + 24);
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  v3[9] = v6;
  v3[10] = v7;
  swift_bridgeObjectRetain();
  return AspireSimilarityPecPreprocessDbArgs.inputDatabase.modify;
}

void AspireSimilarityPecPreprocessDbArgs.inputDatabase.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 72);
  uint64_t v4 = *(void *)(*a1 + 80);
  if (a2)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v5 = *(int *)(v2 + 96);
      uint64_t v6 = *(void *)(v2 + 88);
      type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
      swift_allocObject();
      unint64_t v7 = (void *)swift_retain();
      uint64_t v8 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v7);
      swift_release();
      *(void *)(v6 + v5) = v8;
      swift_release();
    }
    uint64_t v9 = *(void *)(*(void *)(v2 + 88) + *(int *)(v2 + 96));
    swift_beginAccess();
    *(void *)(v9 + 16) = v3;
    *(void *)(v9 + 24) = v4;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v10 = *(int *)(v2 + 96);
      uint64_t v11 = *(void *)(v2 + 88);
      type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
      swift_allocObject();
      uint64_t v12 = (void *)swift_retain();
      uint64_t v13 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v12);
      swift_release();
      *(void *)(v11 + v10) = v13;
      swift_release();
    }
    uint64_t v14 = *(void *)(*(void *)(v2 + 88) + *(int *)(v2 + 96));
    swift_beginAccess();
    *(void *)(v14 + 16) = v3;
    *(void *)(v14 + 24) = v4;
  }
  swift_bridgeObjectRelease();
  free((void *)v2);
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasInputDatabase.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20));
  swift_beginAccess();
  return *(void *)(v1 + 24) != 0;
}

Swift::Void __swiftcall AspireSimilarityPecPreprocessDbArgs.clearInputDatabase()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v3 = (void *)swift_retain();
    uint64_t v4 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v3);
    swift_release();
    *(void *)(v1 + v2) = v4;
    swift_release();
  }
  uint64_t v5 = *(void *)(v1 + v2);
  swift_beginAccess();
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  swift_bridgeObjectRelease();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.outputDatabase.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20));
  swift_beginAccess();
  if (*(void *)(v1 + 40)) {
    uint64_t v2 = *(void *)(v1 + 32);
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t key path getter for AspireSimilarityPecPreprocessDbArgs.outputDatabase : AspireSimilarityPecPreprocessDbArgs@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20));
  swift_beginAccess();
  if (*(void *)(v3 + 40))
  {
    uint64_t v4 = *(void *)(v3 + 32);
    unint64_t v5 = *(void *)(v3 + 40);
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  *a2 = v4;
  a2[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t key path setter for AspireSimilarityPecPreprocessDbArgs.outputDatabase : AspireSimilarityPecPreprocessDbArgs(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v6 = (void *)swift_retain();
    uint64_t v7 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v6);
    swift_release();
    *(void *)(a2 + v5) = v7;
    swift_release();
  }
  uint64_t v8 = *(void *)(a2 + v5);
  swift_beginAccess();
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v3;
  return swift_bridgeObjectRelease();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.outputDatabase.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v7 = (void *)swift_retain();
    uint64_t v8 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v7);
    swift_release();
    *(void *)(v3 + v6) = v8;
    swift_release();
  }
  uint64_t v9 = *(void *)(v3 + v6);
  swift_beginAccess();
  *(void *)(v9 + 32) = a1;
  *(void *)(v9 + 40) = a2;
  return swift_bridgeObjectRelease();
}

void (*AspireSimilarityPecPreprocessDbArgs.outputDatabase.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[11] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  *((_DWORD *)v3 + 24) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  if (*(void *)(v5 + 40))
  {
    uint64_t v6 = *(void *)(v5 + 32);
    unint64_t v7 = *(void *)(v5 + 40);
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  v3[9] = v6;
  v3[10] = v7;
  swift_bridgeObjectRetain();
  return AspireSimilarityPecPreprocessDbArgs.outputDatabase.modify;
}

void AspireSimilarityPecPreprocessDbArgs.outputDatabase.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 72);
  uint64_t v4 = *(void *)(*a1 + 80);
  if (a2)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v5 = *(int *)(v2 + 96);
      uint64_t v6 = *(void *)(v2 + 88);
      type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
      swift_allocObject();
      unint64_t v7 = (void *)swift_retain();
      uint64_t v8 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v7);
      swift_release();
      *(void *)(v6 + v5) = v8;
      swift_release();
    }
    uint64_t v9 = *(void *)(*(void *)(v2 + 88) + *(int *)(v2 + 96));
    swift_beginAccess();
    *(void *)(v9 + 32) = v3;
    *(void *)(v9 + 40) = v4;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v10 = *(int *)(v2 + 96);
      uint64_t v11 = *(void *)(v2 + 88);
      type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
      swift_allocObject();
      uint64_t v12 = (void *)swift_retain();
      uint64_t v13 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v12);
      swift_release();
      *(void *)(v11 + v10) = v13;
      swift_release();
    }
    uint64_t v14 = *(void *)(*(void *)(v2 + 88) + *(int *)(v2 + 96));
    swift_beginAccess();
    *(void *)(v14 + 32) = v3;
    *(void *)(v14 + 40) = v4;
  }
  swift_bridgeObjectRelease();
  free((void *)v2);
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasOutputDatabase.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20));
  swift_beginAccess();
  return *(void *)(v1 + 40) != 0;
}

Swift::Void __swiftcall AspireSimilarityPecPreprocessDbArgs.clearOutputDatabase()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v3 = (void *)swift_retain();
    uint64_t v4 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v3);
    swift_release();
    *(void *)(v1 + v2) = v4;
    swift_release();
  }
  uint64_t v5 = *(void *)(v1 + v2);
  swift_beginAccess();
  *(void *)(v5 + 32) = 0;
  *(void *)(v5 + 40) = 0;
  swift_bridgeObjectRelease();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.outputServerConfig.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20));
  swift_beginAccess();
  if (*(void *)(v1 + 56)) {
    uint64_t v2 = *(void *)(v1 + 48);
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t key path getter for AspireSimilarityPecPreprocessDbArgs.outputServerConfig : AspireSimilarityPecPreprocessDbArgs@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20));
  swift_beginAccess();
  if (*(void *)(v3 + 56))
  {
    uint64_t v4 = *(void *)(v3 + 48);
    unint64_t v5 = *(void *)(v3 + 56);
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  *a2 = v4;
  a2[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t key path setter for AspireSimilarityPecPreprocessDbArgs.outputServerConfig : AspireSimilarityPecPreprocessDbArgs(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v6 = (void *)swift_retain();
    uint64_t v7 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v6);
    swift_release();
    *(void *)(a2 + v5) = v7;
    swift_release();
  }
  uint64_t v8 = *(void *)(a2 + v5);
  swift_beginAccess();
  *(void *)(v8 + 48) = v4;
  *(void *)(v8 + 56) = v3;
  return swift_bridgeObjectRelease();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.outputServerConfig.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v7 = (void *)swift_retain();
    uint64_t v8 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v7);
    swift_release();
    *(void *)(v3 + v6) = v8;
    swift_release();
  }
  uint64_t v9 = *(void *)(v3 + v6);
  swift_beginAccess();
  *(void *)(v9 + 48) = a1;
  *(void *)(v9 + 56) = a2;
  return swift_bridgeObjectRelease();
}

void (*AspireSimilarityPecPreprocessDbArgs.outputServerConfig.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[11] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  *((_DWORD *)v3 + 24) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  if (*(void *)(v5 + 56))
  {
    uint64_t v6 = *(void *)(v5 + 48);
    unint64_t v7 = *(void *)(v5 + 56);
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  v3[9] = v6;
  v3[10] = v7;
  swift_bridgeObjectRetain();
  return AspireSimilarityPecPreprocessDbArgs.outputServerConfig.modify;
}

void AspireSimilarityPecPreprocessDbArgs.outputServerConfig.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 72);
  uint64_t v4 = *(void *)(*a1 + 80);
  if (a2)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v5 = *(int *)(v2 + 96);
      uint64_t v6 = *(void *)(v2 + 88);
      type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
      swift_allocObject();
      unint64_t v7 = (void *)swift_retain();
      uint64_t v8 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v7);
      swift_release();
      *(void *)(v6 + v5) = v8;
      swift_release();
    }
    uint64_t v9 = *(void *)(*(void *)(v2 + 88) + *(int *)(v2 + 96));
    swift_beginAccess();
    *(void *)(v9 + 48) = v3;
    *(void *)(v9 + 56) = v4;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v10 = *(int *)(v2 + 96);
      uint64_t v11 = *(void *)(v2 + 88);
      type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
      swift_allocObject();
      uint64_t v12 = (void *)swift_retain();
      uint64_t v13 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v12);
      swift_release();
      *(void *)(v11 + v10) = v13;
      swift_release();
    }
    uint64_t v14 = *(void *)(*(void *)(v2 + 88) + *(int *)(v2 + 96));
    swift_beginAccess();
    *(void *)(v14 + 48) = v3;
    *(void *)(v14 + 56) = v4;
  }
  swift_bridgeObjectRelease();
  free((void *)v2);
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasOutputServerConfig.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20));
  swift_beginAccess();
  return *(void *)(v1 + 56) != 0;
}

Swift::Void __swiftcall AspireSimilarityPecPreprocessDbArgs.clearOutputServerConfig()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v3 = (void *)swift_retain();
    uint64_t v4 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v3);
    swift_release();
    *(void *)(v1 + v2) = v4;
    swift_release();
  }
  uint64_t v5 = *(void *)(v1 + v2);
  swift_beginAccess();
  *(void *)(v5 + 48) = 0;
  *(void *)(v5 + 56) = 0;
  swift_bridgeObjectRelease();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.inputServerConfig.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig;
  swift_beginAccess();
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v6, (uint64_t)v5, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  unint64_t v7 = (int *)type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v7 - 1) + 48))(v5, 1, v7) != 1) {
    return _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, (uint64_t)a1, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  }
  *a1 = 0;
  UnknownStorage.init()();
  uint64_t v8 = &a1[v7[6]];
  uint64_t v9 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = &a1[v7[7]];
  uint64_t v11 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = &a1[v7[8]];
  *(_DWORD *)uint64_t v12 = 0;
  v12[4] = 1;
  return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
}

uint64_t key path setter for AspireSimilarityPecPreprocessDbArgs.inputServerConfig : AspireSimilarityPecPreprocessDbArgs(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(a1, (uint64_t)v4, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  return AspireSimilarityPecPreprocessDbArgs.inputServerConfig.setter((uint64_t)v4);
}

uint64_t AspireSimilarityPecPreprocessDbArgs.inputServerConfig.setter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v17 - v8;
  uint64_t v10 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v11 = (void *)swift_retain();
    uint64_t v12 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v11);
    swift_release();
    *(void *)(v2 + v10) = v12;
    swift_release();
  }
  uint64_t v13 = *(void *)(v2 + v10);
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(a1, (uint64_t)v9, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  uint64_t v14 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 0, 1, v14);
  outlined init with take of AspireSimilaritySimilarityServerConfig?((uint64_t)v9, (uint64_t)v6);
  uint64_t v15 = v13
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig;
  swift_beginAccess();
  swift_retain();
  outlined assign with take of AMDPbHEConfig.OneOf_Config?((uint64_t)v6, v15, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  swift_endAccess();
  return swift_release();
}

void (*AspireSimilarityPecPreprocessDbArgs.inputServerConfig.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[4] = v5;
  uint64_t v6 = (int *)type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v7 = *((void *)v6 - 1);
  size_t v8 = *(void *)(v7 + 64);
  v3[5] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v3[6] = v9;
  uint64_t v10 = *(void *)(v1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig;
  swift_beginAccess();
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v10, (uint64_t)v5, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v7 + 48))(v5, 1, v6) == 1)
  {
    *uint64_t v9 = 0;
    UnknownStorage.init()();
    uint64_t v11 = &v9[v6[6]];
    uint64_t v12 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
    uint64_t v13 = &v9[v6[7]];
    uint64_t v14 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
    uint64_t v15 = &v9[v6[8]];
    *(_DWORD *)uint64_t v15 = 0;
    v15[4] = 1;
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v5, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  }
  else
  {
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v5, (uint64_t)v9, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  }
  return AspireSimilarityPecPreprocessDbArgs.inputServerConfig.modify;
}

void AspireSimilarityPecPreprocessDbArgs.inputServerConfig.modify(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 40);
  uint64_t v4 = *(void **)(*(void *)a1 + 48);
  uint64_t v5 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(*(void *)(*(void *)a1 + 48), (uint64_t)v3, type metadata accessor for AspireSimilaritySimilarityServerConfig);
    AspireSimilarityPecPreprocessDbArgs.inputServerConfig.setter((uint64_t)v3);
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v4, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  }
  else
  {
    AspireSimilarityPecPreprocessDbArgs.inputServerConfig.setter(*(void *)(*(void *)a1 + 48));
  }
  free(v4);
  free(v3);
  free(v5);
  free(v2);
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasInputServerConfig.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(v0 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig;
  swift_beginAccess();
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v4, (uint64_t)v3, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  uint64_t v5 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v3, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  return v6;
}

Swift::Void __swiftcall AspireSimilarityPecPreprocessDbArgs.clearInputServerConfig()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    BOOL v6 = (void *)swift_retain();
    uint64_t v7 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v6);
    swift_release();
    *(void *)(v1 + v5) = v7;
    swift_release();
  }
  uint64_t v8 = *(void *)(v1 + v5);
  uint64_t v9 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  uint64_t v10 = v8
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig;
  swift_beginAccess();
  swift_retain();
  outlined assign with take of AMDPbHEConfig.OneOf_Config?((uint64_t)v4, v10, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  swift_endAccess();
  swift_release();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.entryID.getter()
{
  return AspireSimilarityPecPreprocessDbArgs.entryID.getter(&OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryID);
}

uint64_t AspireSimilarityPecPreprocessDbArgs.entryID.setter(uint64_t a1, uint64_t a2)
{
  return AspireSimilarityPecPreprocessDbArgs.entryID.setter(a1, a2, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryID);
}

void (*AspireSimilarityPecPreprocessDbArgs.entryID.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[11] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  *((_DWORD *)v3 + 24) = v4;
  uint64_t v5 = (uint64_t *)(*(void *)(v1 + v4)
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryID);
  swift_beginAccess();
  if (v5[1])
  {
    uint64_t v6 = *v5;
    unint64_t v7 = v5[1];
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  v3[9] = v6;
  v3[10] = v7;
  swift_bridgeObjectRetain();
  return AspireSimilarityPecPreprocessDbArgs.entryID.modify;
}

void AspireSimilarityPecPreprocessDbArgs.entryID.modify(uint64_t *a1, char a2)
{
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasEntryID.getter()
{
  return AspireSimilarityPecPreprocessDbArgs.hasEntryID.getter(&OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryID);
}

Swift::Void __swiftcall AspireSimilarityPecPreprocessDbArgs.clearEntryID()()
{
}

uint64_t AspireSimilarityPecPreprocessDbArgs.entryMetadataID.getter()
{
  return AspireSimilarityPecPreprocessDbArgs.entryID.getter(&OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryMetadataID);
}

uint64_t AspireSimilarityPecPreprocessDbArgs.entryID.getter(void *a1)
{
  uint64_t v2 = (uint64_t *)(*(void *)(v1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
                 + *a1);
  swift_beginAccess();
  if (v2[1]) {
    uint64_t v3 = *v2;
  }
  else {
    uint64_t v3 = 0;
  }
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t key path getter for AspireSimilarityPecPreprocessDbArgs.entryID : AspireSimilarityPecPreprocessDbArgs@<X0>(uint64_t a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (uint64_t *)(*(void *)(a1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
                 + *a2);
  swift_beginAccess();
  if (v4[1])
  {
    uint64_t v5 = *v4;
    unint64_t v6 = v4[1];
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0xE000000000000000;
  }
  *a3 = v5;
  a3[1] = v6;
  return swift_bridgeObjectRetain();
}

uint64_t key path setter for AspireSimilarityPecPreprocessDbArgs.entryID : AspireSimilarityPecPreprocessDbArgs(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v9 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v10 = (void *)swift_retain();
    uint64_t v11 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v10);
    swift_release();
    *(void *)(a2 + v9) = v11;
    swift_release();
  }
  uint64_t v12 = (void *)(*(void *)(a2 + v9) + *a5);
  swift_beginAccess();
  *uint64_t v12 = v8;
  v12[1] = v7;
  return swift_bridgeObjectRelease();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.entryMetadataID.setter(uint64_t a1, uint64_t a2)
{
  return AspireSimilarityPecPreprocessDbArgs.entryID.setter(a1, a2, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryMetadataID);
}

uint64_t AspireSimilarityPecPreprocessDbArgs.entryID.setter(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = v3;
  uint64_t v8 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v9 = (void *)swift_retain();
    uint64_t v10 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v9);
    swift_release();
    *(void *)(v5 + v8) = v10;
    swift_release();
  }
  uint64_t v11 = (void *)(*(void *)(v5 + v8) + *a3);
  swift_beginAccess();
  *uint64_t v11 = a1;
  v11[1] = a2;
  return swift_bridgeObjectRelease();
}

void (*AspireSimilarityPecPreprocessDbArgs.entryMetadataID.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[11] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  *((_DWORD *)v3 + 24) = v4;
  uint64_t v5 = (uint64_t *)(*(void *)(v1 + v4)
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryMetadataID);
  swift_beginAccess();
  if (v5[1])
  {
    uint64_t v6 = *v5;
    unint64_t v7 = v5[1];
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  v3[9] = v6;
  v3[10] = v7;
  swift_bridgeObjectRetain();
  return AspireSimilarityPecPreprocessDbArgs.entryMetadataID.modify;
}

void AspireSimilarityPecPreprocessDbArgs.entryMetadataID.modify(uint64_t *a1, char a2)
{
}

void AspireSimilarityPecPreprocessDbArgs.entryID.modify(uint64_t *a1, char a2, void *a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(*a1 + 72);
  uint64_t v6 = *(void *)(*a1 + 80);
  if (a2)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v7 = *(int *)(v4 + 96);
      uint64_t v8 = *(void *)(v4 + 88);
      type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
      swift_allocObject();
      uint64_t v9 = (void *)swift_retain();
      uint64_t v10 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v9);
      swift_release();
      *(void *)(v8 + v7) = v10;
      swift_release();
    }
    uint64_t v11 = (void *)(*(void *)(*(void *)(v4 + 88) + *(int *)(v4 + 96)) + *a3);
    swift_beginAccess();
    *uint64_t v11 = v5;
    v11[1] = v6;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v12 = *(int *)(v4 + 96);
      uint64_t v13 = *(void *)(v4 + 88);
      type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
      swift_allocObject();
      uint64_t v14 = (void *)swift_retain();
      uint64_t v15 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v14);
      swift_release();
      *(void *)(v13 + v12) = v15;
      swift_release();
    }
    uint64_t v16 = (void *)(*(void *)(*(void *)(v4 + 88) + *(int *)(v4 + 96)) + *a3);
    swift_beginAccess();
    *uint64_t v16 = v5;
    v16[1] = v6;
  }
  swift_bridgeObjectRelease();
  free((void *)v4);
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasEntryMetadataID.getter()
{
  return AspireSimilarityPecPreprocessDbArgs.hasEntryID.getter(&OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryMetadataID);
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasEntryID.getter(void *a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20)) + *a1;
  swift_beginAccess();
  return *(void *)(v2 + 8) != 0;
}

Swift::Void __swiftcall AspireSimilarityPecPreprocessDbArgs.clearEntryMetadataID()()
{
}

uint64_t AspireSimilarityPecPreprocessDbArgs.clearEntryID()(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = (void *)swift_retain();
    uint64_t v6 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v5);
    swift_release();
    *(void *)(v3 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = (void *)(*(void *)(v3 + v4) + *a1);
  swift_beginAccess();
  *uint64_t v7 = 0;
  v7[1] = 0;
  return swift_bridgeObjectRelease();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.embeddingID.getter()
{
  return AspireSimilarityPecPreprocessDbArgs.entryID.getter(&OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__embeddingID);
}

uint64_t AspireSimilarityPecPreprocessDbArgs.embeddingID.setter(uint64_t a1, uint64_t a2)
{
  return AspireSimilarityPecPreprocessDbArgs.entryID.setter(a1, a2, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__embeddingID);
}

void (*AspireSimilarityPecPreprocessDbArgs.embeddingID.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[11] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  *((_DWORD *)v3 + 24) = v4;
  uint64_t v5 = (uint64_t *)(*(void *)(v1 + v4)
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__embeddingID);
  swift_beginAccess();
  if (v5[1])
  {
    uint64_t v6 = *v5;
    unint64_t v7 = v5[1];
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  v3[9] = v6;
  v3[10] = v7;
  swift_bridgeObjectRetain();
  return AspireSimilarityPecPreprocessDbArgs.embeddingID.modify;
}

void AspireSimilarityPecPreprocessDbArgs.embeddingID.modify(uint64_t *a1, char a2)
{
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasEmbeddingID.getter()
{
  return AspireSimilarityPecPreprocessDbArgs.hasEntryID.getter(&OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__embeddingID);
}

Swift::Void __swiftcall AspireSimilarityPecPreprocessDbArgs.clearEmbeddingID()()
{
}

uint64_t AspireSimilarityPecPreprocessDbArgs.shardID.getter()
{
  return AspireSimilarityPecPreprocessDbArgs.entryID.getter(&OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__shardID);
}

uint64_t AspireSimilarityPecPreprocessDbArgs.shardID.setter(uint64_t a1, uint64_t a2)
{
  return AspireSimilarityPecPreprocessDbArgs.entryID.setter(a1, a2, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__shardID);
}

void (*AspireSimilarityPecPreprocessDbArgs.shardID.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[11] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  *((_DWORD *)v3 + 24) = v4;
  uint64_t v5 = (uint64_t *)(*(void *)(v1 + v4)
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__shardID);
  swift_beginAccess();
  if (v5[1])
  {
    uint64_t v6 = *v5;
    unint64_t v7 = v5[1];
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  v3[9] = v6;
  v3[10] = v7;
  swift_bridgeObjectRetain();
  return AspireSimilarityPecPreprocessDbArgs.shardID.modify;
}

void AspireSimilarityPecPreprocessDbArgs.shardID.modify(uint64_t *a1, char a2)
{
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasShardID.getter()
{
  return AspireSimilarityPecPreprocessDbArgs.hasEntryID.getter(&OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__shardID);
}

Swift::Void __swiftcall AspireSimilarityPecPreprocessDbArgs.clearShardID()()
{
}

uint64_t AspireSimilarityPecPreprocessDbArgs.predefinedEncryptionParameters.getter()
{
  return AspireSimilarityPecPreprocessDbArgs.entryID.getter(&OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__predefinedEncryptionParameters);
}

uint64_t AspireSimilarityPecPreprocessDbArgs.predefinedEncryptionParameters.setter(uint64_t a1, uint64_t a2)
{
  return AspireSimilarityPecPreprocessDbArgs.entryID.setter(a1, a2, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__predefinedEncryptionParameters);
}

void (*AspireSimilarityPecPreprocessDbArgs.predefinedEncryptionParameters.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[11] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  *((_DWORD *)v3 + 24) = v4;
  uint64_t v5 = (uint64_t *)(*(void *)(v1 + v4)
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__predefinedEncryptionParameters);
  swift_beginAccess();
  if (v5[1])
  {
    uint64_t v6 = *v5;
    unint64_t v7 = v5[1];
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  v3[9] = v6;
  v3[10] = v7;
  swift_bridgeObjectRetain();
  return AspireSimilarityPecPreprocessDbArgs.predefinedEncryptionParameters.modify;
}

void AspireSimilarityPecPreprocessDbArgs.predefinedEncryptionParameters.modify(uint64_t *a1, char a2)
{
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasPredefinedEncryptionParameters.getter()
{
  return AspireSimilarityPecPreprocessDbArgs.hasEntryID.getter(&OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__predefinedEncryptionParameters);
}

Swift::Void __swiftcall AspireSimilarityPecPreprocessDbArgs.clearPredefinedEncryptionParameters()()
{
}

uint64_t AspireSimilarityPecPreprocessDbArgs.heScheme.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
  uint64_t result = swift_beginAccess();
  if (*(unsigned char *)(v3 + 9))
  {
    uint64_t v5 = 0;
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = *(void *)v3;
    char v6 = *(unsigned char *)(v3 + 8) & 1;
  }
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v6;
  return result;
}

uint64_t key path getter for AspireSimilarityPecPreprocessDbArgs.heScheme : AspireSimilarityPecPreprocessDbArgs@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
  uint64_t result = swift_beginAccess();
  uint64_t v5 = *(void *)v3;
  char v6 = *(unsigned char *)(v3 + 8);
  char v7 = *(unsigned char *)(v3 + 9);
  if (v7) {
    uint64_t v5 = 0;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = (v7 | v6) & 1;
  return result;
}

uint64_t key path setter for AspireSimilarityPecPreprocessDbArgs.heScheme : AspireSimilarityPecPreprocessDbArgs(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  char v4 = *((unsigned char *)a1 + 8);
  uint64_t v5 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    char v6 = (void *)swift_retain();
    uint64_t v7 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v6);
    swift_release();
    *(void *)(a2 + v5) = v7;
    swift_release();
  }
  uint64_t v8 = *(void *)(a2 + v5)
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v8 = v3;
  *(unsigned char *)(v8 + 8) = v4;
  *(unsigned char *)(v8 + 9) = 0;
  return result;
}

uint64_t AspireSimilarityPecPreprocessDbArgs.heScheme.setter(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *a1;
  char v4 = *((unsigned char *)a1 + 8);
  uint64_t v5 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    char v6 = (void *)swift_retain();
    uint64_t v7 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v6);
    swift_release();
    *(void *)(v2 + v5) = v7;
    swift_release();
  }
  uint64_t v8 = *(void *)(v2 + v5)
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v8 = v3;
  *(unsigned char *)(v8 + 8) = v4;
  *(unsigned char *)(v8 + 9) = 0;
  return result;
}

void (*AspireSimilarityPecPreprocessDbArgs.heScheme.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[11] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  *((_DWORD *)v3 + 21) = v4;
  uint64_t v5 = *(void *)(v1 + v4)
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
  swift_beginAccess();
  if (*(unsigned char *)(v5 + 9))
  {
    uint64_t v6 = 0;
    char v7 = 1;
  }
  else
  {
    uint64_t v6 = *(void *)v5;
    char v7 = *(unsigned char *)(v5 + 8) & 1;
  }
  v3[9] = v6;
  *((unsigned char *)v3 + 80) = v7;
  return AspireSimilarityPecPreprocessDbArgs.heScheme.modify;
}

void AspireSimilarityPecPreprocessDbArgs.heScheme.modify(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*a1 + 72);
  char v5 = *(unsigned char *)(*a1 + 80);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v7 = *(int *)(v3 + 84);
    uint64_t v8 = *(void *)(v3 + 88);
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v9 = (void *)swift_retain();
    uint64_t v10 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v9);
    swift_release();
    *(void *)(v8 + v7) = v10;
    swift_release();
  }
LABEL_4:
  uint64_t v11 = *(void *)(*(void *)(v3 + 88) + *(int *)(v3 + 84))
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
  swift_beginAccess();
  *(void *)uint64_t v11 = v4;
  *(unsigned char *)(v11 + 8) = v5;
  *(unsigned char *)(v11 + 9) = 0;
  free((void *)v3);
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasHeScheme.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
  swift_beginAccess();
  return (*(unsigned char *)(v1 + 9) & 1) == 0;
}

Swift::Void __swiftcall AspireSimilarityPecPreprocessDbArgs.clearHeScheme()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v3 = (void *)swift_retain();
    uint64_t v4 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v3);
    swift_release();
    *(void *)(v1 + v2) = v4;
    swift_release();
  }
  uint64_t v5 = *(void *)(v1 + v2)
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
  swift_beginAccess();
  *(void *)uint64_t v5 = 0;
  *(_WORD *)(v5 + 8) = 256;
}

uint64_t AspireSimilarityPecPreprocessDbArgs.extraPlaintextModuli.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t key path getter for AspireSimilarityPecPreprocessDbArgs.extraPlaintextModuli : AspireSimilarityPecPreprocessDbArgs@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*(void *)(a1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__extraPlaintextModuli);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t key path setter for AspireSimilarityPecPreprocessDbArgs.extraPlaintextModuli : AspireSimilarityPecPreprocessDbArgs(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = (void *)swift_retain();
    uint64_t v6 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = (void *)(*(void *)(a2 + v4)
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__extraPlaintextModuli);
  swift_beginAccess();
  *uint64_t v7 = v3;
  return swift_bridgeObjectRelease();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.extraPlaintextModuli.setter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = (void *)swift_retain();
    uint64_t v6 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v5);
    swift_release();
    *(void *)(v2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = (void *)(*(void *)(v2 + v4)
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__extraPlaintextModuli);
  swift_beginAccess();
  *uint64_t v7 = a1;
  return swift_bridgeObjectRelease();
}

void (*AspireSimilarityPecPreprocessDbArgs.extraPlaintextModuli.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[10] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  *((_DWORD *)v3 + 22) = v4;
  uint64_t v5 = (void *)(*(void *)(v1 + v4)
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__extraPlaintextModuli);
  swift_beginAccess();
  v3[9] = *v5;
  swift_bridgeObjectRetain();
  return AspireSimilarityPecPreprocessDbArgs.extraPlaintextModuli.modify;
}

void AspireSimilarityPecPreprocessDbArgs.extraPlaintextModuli.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 72);
  if (a2)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v4 = *(int *)(v2 + 88);
      uint64_t v5 = *(void *)(v2 + 80);
      type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
      swift_allocObject();
      uint64_t v6 = (void *)swift_retain();
      uint64_t v7 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v6);
      swift_release();
      *(void *)(v5 + v4) = v7;
      swift_release();
    }
    uint64_t v8 = (void *)(*(void *)(*(void *)(v2 + 80) + *(int *)(v2 + 88))
                  + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__extraPlaintextModuli);
    swift_beginAccess();
    *uint64_t v8 = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v9 = *(int *)(v2 + 88);
      uint64_t v10 = *(void *)(v2 + 80);
      type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
      swift_allocObject();
      uint64_t v11 = (void *)swift_retain();
      uint64_t v12 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v11);
      swift_release();
      *(void *)(v10 + v9) = v12;
      swift_release();
    }
    uint64_t v13 = (void *)(*(void *)(*(void *)(v2 + 80) + *(int *)(v2 + 88))
                   + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__extraPlaintextModuli);
    swift_beginAccess();
    *uint64_t v13 = v3;
  }
  swift_bridgeObjectRelease();
  free((void *)v2);
}

uint64_t AspireSimilarityPecPreprocessDbArgs.babyStep.getter()
{
  uint64_t v1 = (unsigned char *)(*(void *)(v0 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
               + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep);
  swift_beginAccess();
  if (v1[4]) {
    return 0;
  }
  else {
    return *(unsigned int *)v1;
  }
}

uint64_t key path getter for AspireSimilarityPecPreprocessDbArgs.babyStep : AspireSimilarityPecPreprocessDbArgs@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
  uint64_t result = swift_beginAccess();
  int v5 = *(_DWORD *)v3;
  if (*(unsigned char *)(v3 + 4)) {
    int v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t key path setter for AspireSimilarityPecPreprocessDbArgs.babyStep : AspireSimilarityPecPreprocessDbArgs(int *a1, uint64_t a2)
{
  int v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    int v5 = (void *)swift_retain();
    uint64_t v6 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(a2 + v4)
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
  uint64_t result = swift_beginAccess();
  *(_DWORD *)uint64_t v7 = v3;
  *(unsigned char *)(v7 + 4) = 0;
  return result;
}

uint64_t AspireSimilarityPecPreprocessDbArgs.babyStep.setter(int a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    int v5 = (void *)swift_retain();
    uint64_t v6 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v5);
    swift_release();
    *(void *)(v2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = *(void *)(v2 + v4)
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
  uint64_t result = swift_beginAccess();
  *(_DWORD *)uint64_t v7 = a1;
  *(unsigned char *)(v7 + 4) = 0;
  return result;
}

void (*AspireSimilarityPecPreprocessDbArgs.babyStep.modify(void *a1))(uint64_t *a1, char a2)
{
  int v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  *((_DWORD *)v3 + 21) = v4;
  uint64_t v5 = *(void *)(v1 + v4)
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
  swift_beginAccess();
  int v6 = *(_DWORD *)v5;
  if (*(unsigned char *)(v5 + 4)) {
    int v6 = 0;
  }
  *((_DWORD *)v3 + 20) = v6;
  return AspireSimilarityPecPreprocessDbArgs.babyStep.modify;
}

void AspireSimilarityPecPreprocessDbArgs.babyStep.modify(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  int v4 = *(_DWORD *)(*a1 + 80);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 84);
    uint64_t v7 = *(void *)(v3 + 72);
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = (void *)swift_retain();
    uint64_t v9 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  uint64_t v10 = *(void *)(*(void *)(v3 + 72) + *(int *)(v3 + 84))
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
  swift_beginAccess();
  *(_DWORD *)uint64_t v10 = v4;
  *(unsigned char *)(v10 + 4) = 0;
  free((void *)v3);
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasBabyStep.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
  swift_beginAccess();
  return (*(unsigned char *)(v1 + 4) & 1) == 0;
}

Swift::Void __swiftcall AspireSimilarityPecPreprocessDbArgs.clearBabyStep()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v3 = (void *)swift_retain();
    uint64_t v4 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v3);
    swift_release();
    *(void *)(v1 + v2) = v4;
    swift_release();
  }
  uint64_t v5 = *(void *)(v1 + v2)
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
  swift_beginAccess();
  *(_DWORD *)uint64_t v5 = 0;
  *(unsigned char *)(v5 + 4) = 1;
}

uint64_t AspireSimilarityPecPreprocessDbArgs.parallel.getter()
{
  uint64_t v1 = (unsigned char *)(*(void *)(v0 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
               + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel);
  swift_beginAccess();
  return *v1 & 1;
}

uint64_t key path setter for AspireSimilarityPecPreprocessDbArgs.parallel : AspireSimilarityPecPreprocessDbArgs(char *a1, uint64_t a2)
{
  char v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = (void *)swift_retain();
    uint64_t v6 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = (unsigned char *)(*(void *)(a2 + v4)
               + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel);
  uint64_t result = swift_beginAccess();
  *uint64_t v7 = v3;
  return result;
}

uint64_t AspireSimilarityPecPreprocessDbArgs.parallel.setter(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = (void *)swift_retain();
    uint64_t v6 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v5);
    swift_release();
    *(void *)(v2 + v4) = v6;
    swift_release();
  }
  char v7 = a1 & 1;
  uint64_t v8 = (unsigned char *)(*(void *)(v2 + v4)
               + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel);
  uint64_t result = swift_beginAccess();
  *uint64_t v8 = v7;
  return result;
}

void (*AspireSimilarityPecPreprocessDbArgs.parallel.modify(void *a1))(uint64_t *a1, char a2)
{
  char v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = (unsigned char *)(*(void *)(v1 + v4)
               + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *v5 & 1;
  return AspireSimilarityPecPreprocessDbArgs.parallel.modify;
}

void AspireSimilarityPecPreprocessDbArgs.parallel.modify(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  char v4 = *(unsigned char *)(*a1 + 84);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 80);
    uint64_t v7 = *(void *)(v3 + 72);
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = (void *)swift_retain();
    uint64_t v9 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  uint64_t v10 = (unsigned char *)(*(void *)(*(void *)(v3 + 72) + *(int *)(v3 + 80))
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel);
  swift_beginAccess();
  *uint64_t v10 = v4;
  free((void *)v3);
}

BOOL AspireSimilarityPecPreprocessDbArgs.hasParallel.getter()
{
  uint64_t v1 = (unsigned __int8 *)(*(void *)(v0
                                     + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
                         + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel);
  swift_beginAccess();
  return *v1 != 2;
}

Swift::Void __swiftcall AspireSimilarityPecPreprocessDbArgs.clearParallel()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v3 = (void *)swift_retain();
    uint64_t v4 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v3);
    swift_release();
    *(void *)(v1 + v2) = v4;
    swift_release();
  }
  uint64_t v5 = (unsigned char *)(*(void *)(v1 + v2)
               + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel);
  swift_beginAccess();
  *uint64_t v5 = 2;
}

uint64_t (*AspireSimilarityPecPreprocessDbArgs.unknownFields.modify())()
{
  return Repeated.subscript.readspecialized ;
}

uint64_t AspireSimilarityPecPreprocessDbArgs.init()@<X0>(uint64_t a1@<X8>)
{
  UnknownStorage.init()();
  uint64_t v2 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if (one-time initialization token for defaultInstance != -1) {
    swift_once();
  }
  *(void *)(a1 + v2) = static AspireSimilarityPecPreprocessDbArgs._StorageClass.defaultInstance;
  return swift_retain();
}

uint64_t static AspireSimilaritySimilarityMetric._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySimilarityMetric._protobuf_nameMap, a1);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilaritySimilarityMetric@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySimilarityMetric._protobuf_nameMap, a1);
}

unint64_t static AspireSimilarityPlaintextPacking.protoMessageName.getter()
{
  return 0xD000000000000022;
}

uint64_t static AspireSimilarityPlaintextPacking._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilarityPlaintextPacking._protobuf_nameMap, a1);
}

uint64_t AspireSimilarityPlaintextPacking.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  while (1)
  {
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    if (v4 || (v10 & 1) != 0) {
      break;
    }
    switch(result)
    {
      case 3:
        closure #3 in AspireSimilarityPlaintextPacking.decodeMessage<A>(decoder:)(v5, a1, a2, a3);
        break;
      case 2:
        closure #2 in AspireSimilarityPlaintextPacking.decodeMessage<A>(decoder:)(v5, a1, a2, a3);
        break;
      case 1:
        closure #1 in AspireSimilarityPlaintextPacking.decodeMessage<A>(decoder:)(v5, a1, a2, a3);
        break;
    }
  }
  return result;
}

uint64_t closure #1 in AspireSimilarityPlaintextPacking.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v50 = a4;
  uint64_t v48 = a2;
  uint64_t v49 = a3;
  uint64_t v5 = type metadata accessor for AspireSimilarityPlaintextPackingDenseRow(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v42 = (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v45 = (char *)&v38 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v19 = (char *)&v38 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseRow?);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v43 = (uint64_t)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v23 = MEMORY[0x270FA5388](v22);
  BOOL v25 = (char *)&v38 - v24;
  uint64_t v44 = v6;
  v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v47 = v5;
  uint64_t v27 = v5;
  uint64_t v28 = v26;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t, double))v26)((char *)&v38 - v24, 1, 1, v27, v23);
  uint64_t v41 = a1;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1, (uint64_t)v12, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v40 = v14;
  int v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if (v29 == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v12, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    uint64_t v30 = v13;
    uint64_t v31 = v47;
  }
  else
  {
    v39 = v28;
    uint64_t v32 = (uint64_t)v45;
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v12, (uint64_t)v19, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v19, (uint64_t)v16, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    uint64_t v30 = v13;
    if (swift_getEnumCaseMultiPayload())
    {
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v16, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
      uint64_t v31 = v47;
    }
    else
    {
      outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseRow?);
      _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v16, v32, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
      _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v32, (uint64_t)v25, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
      uint64_t v31 = v47;
      v39(v25, 0, 1, v47);
    }
  }
  uint64_t v33 = v46;
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseRow and conformance AspireSimilarityPlaintextPackingDenseRow, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
  if (v33) {
    return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseRow?);
  }
  uint64_t v35 = v43;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, v43, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseRow?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v35, 1, v31) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseRow?);
    return outlined destroy of AMDPbHEConfig.OneOf_Config?(v35, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseRow?);
  }
  else
  {
    uint64_t v36 = v42;
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v35, v42, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
    if (v29 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()();
    }
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseRow?);
    uint64_t v37 = v41;
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v41, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v36, v37, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v30);
  }
}

uint64_t closure #2 in AspireSimilarityPlaintextPacking.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v50 = a4;
  uint64_t v48 = a2;
  uint64_t v49 = a3;
  uint64_t v5 = type metadata accessor for AspireSimilarityPlaintextPackingDiagonal(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v42 = (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v45 = (char *)&v38 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v19 = (char *)&v38 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDiagonal?);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v43 = (uint64_t)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v23 = MEMORY[0x270FA5388](v22);
  BOOL v25 = (char *)&v38 - v24;
  uint64_t v44 = v6;
  v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v47 = v5;
  uint64_t v27 = v5;
  uint64_t v28 = v26;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t, double))v26)((char *)&v38 - v24, 1, 1, v27, v23);
  uint64_t v41 = a1;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1, (uint64_t)v12, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v40 = v14;
  int v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if (v29 == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v12, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    uint64_t v30 = v13;
  }
  else
  {
    v39 = v28;
    uint64_t v31 = (uint64_t)v45;
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v12, (uint64_t)v19, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v19, (uint64_t)v16, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    uint64_t v30 = v13;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDiagonal?);
      _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v16, v31, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
      _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v31, (uint64_t)v25, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
      uint64_t v32 = v47;
      v39(v25, 0, 1, v47);
      goto LABEL_7;
    }
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v16, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  }
  uint64_t v32 = v47;
LABEL_7:
  uint64_t v33 = v46;
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDiagonal and conformance AspireSimilarityPlaintextPackingDiagonal, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
  if (v33) {
    return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDiagonal?);
  }
  uint64_t v35 = v43;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, v43, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDiagonal?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v35, 1, v32) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDiagonal?);
    return outlined destroy of AMDPbHEConfig.OneOf_Config?(v35, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDiagonal?);
  }
  else
  {
    uint64_t v36 = v42;
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v35, v42, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
    if (v29 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()();
    }
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDiagonal?);
    uint64_t v37 = v41;
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v41, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v36, v37, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v30);
  }
}

uint64_t closure #3 in AspireSimilarityPlaintextPacking.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v50 = a4;
  uint64_t v48 = a2;
  uint64_t v49 = a3;
  uint64_t v5 = type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v42 = (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v45 = (char *)&v38 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v19 = (char *)&v38 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseColumn?);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v43 = (uint64_t)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v23 = MEMORY[0x270FA5388](v22);
  BOOL v25 = (char *)&v38 - v24;
  uint64_t v44 = v6;
  v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v47 = v5;
  uint64_t v27 = v5;
  uint64_t v28 = v26;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t, double))v26)((char *)&v38 - v24, 1, 1, v27, v23);
  uint64_t v41 = a1;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1, (uint64_t)v12, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v40 = v14;
  int v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if (v29 == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v12, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    uint64_t v30 = v13;
  }
  else
  {
    v39 = v28;
    uint64_t v31 = (uint64_t)v45;
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v12, (uint64_t)v19, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v19, (uint64_t)v16, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    uint64_t v30 = v13;
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseColumn?);
      _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v16, v31, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
      _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v31, (uint64_t)v25, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
      uint64_t v32 = v47;
      v39(v25, 0, 1, v47);
      goto LABEL_7;
    }
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v16, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  }
  uint64_t v32 = v47;
LABEL_7:
  uint64_t v33 = v46;
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseColumn and conformance AspireSimilarityPlaintextPackingDenseColumn, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
  if (v33) {
    return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseColumn?);
  }
  uint64_t v35 = v43;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, v43, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseColumn?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v35, 1, v32) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseColumn?);
    return outlined destroy of AMDPbHEConfig.OneOf_Config?(v35, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseColumn?);
  }
  else
  {
    uint64_t v36 = v42;
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v35, v42, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
    if (v29 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()();
    }
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v25, &demangling cache variable for type metadata for AspireSimilarityPlaintextPackingDenseColumn?);
    uint64_t v37 = v41;
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v41, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v36, v37, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v30);
  }
}

uint64_t AspireSimilarityPlaintextPacking.traverse<A>(visitor:)()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v0, (uint64_t)v4, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v5 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5) == 1) {
    goto LABEL_8;
  }
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1) {
      closure #2 in AspireSimilarityPlaintextPacking.traverse<A>(visitor:)(v0);
    }
    else {
      closure #3 in AspireSimilarityPlaintextPacking.traverse<A>(visitor:)(v0);
    }
  }
  else
  {
    closure #1 in AspireSimilarityPlaintextPacking.traverse<A>(visitor:)(v0);
  }
  uint64_t result = outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v4, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  if (!v1)
  {
LABEL_8:
    type metadata accessor for AspireSimilarityPlaintextPacking(0);
    return UnknownStorage.traverse<A>(visitor:)();
  }
  return result;
}

uint64_t closure #1 in AspireSimilarityPlaintextPacking.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AspireSimilarityPlaintextPackingDenseRow(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1, (uint64_t)v4, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v4, 1, v8) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v4, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    __break(1u);
  }
  else if (!swift_getEnumCaseMultiPayload())
  {
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v4, (uint64_t)v7, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
    _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseRow and conformance AspireSimilarityPlaintextPackingDenseRow, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
    return outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v7, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
  }
  uint64_t result = outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v4, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  __break(1u);
  return result;
}

uint64_t closure #2 in AspireSimilarityPlaintextPacking.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AspireSimilarityPlaintextPackingDiagonal(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1, (uint64_t)v4, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v4, 1, v8) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v4, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    __break(1u);
  }
  else if (swift_getEnumCaseMultiPayload() == 1)
  {
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v4, (uint64_t)v7, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
    _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDiagonal and conformance AspireSimilarityPlaintextPackingDiagonal, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
    return outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v7, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
  }
  uint64_t result = outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v4, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  __break(1u);
  return result;
}

uint64_t closure #3 in AspireSimilarityPlaintextPacking.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1, (uint64_t)v4, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v4, 1, v8) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v4, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    __break(1u);
  }
  else if (swift_getEnumCaseMultiPayload() == 2)
  {
    _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v4, (uint64_t)v7, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
    _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseColumn and conformance AspireSimilarityPlaintextPackingDenseColumn, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
    return outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v7, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
  }
  uint64_t result = outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v4, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  __break(1u);
  return result;
}

Swift::Int AspireSimilarityPlaintextPacking.hashValue.getter()
{
  return AspireSimilarityPlaintextPacking.hashValue.getter((void (*)(void))type metadata accessor for AspireSimilarityPlaintextPacking, &lazy protocol witness table cache variable for type AspireSimilarityPlaintextPacking and conformance AspireSimilarityPlaintextPacking, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
}

uint64_t protocol witness for Message.init() in conformance AspireSimilarityPlaintextPacking@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 1, 1, v2);
  return UnknownStorage.init()();
}

unint64_t protocol witness for static Message.protoMessageName.getter in conformance AspireSimilarityPlaintextPacking()
{
  return 0xD000000000000022;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance AspireSimilarityPlaintextPacking(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AspireSimilarityPlaintextPacking.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance AspireSimilarityPlaintextPacking()
{
  return AspireSimilarityPlaintextPacking.traverse<A>(visitor:)();
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AspireSimilarityPlaintextPacking(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPacking and conformance AspireSimilarityPlaintextPacking, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilarityPlaintextPacking@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilarityPlaintextPacking._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AspireSimilarityPlaintextPacking(uint64_t a1)
{
  uint64_t v2 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPacking and conformance AspireSimilarityPlaintextPacking, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilarityPlaintextPacking(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPacking and conformance AspireSimilarityPlaintextPacking, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
  return MEMORY[0x270F44CD8](a1, a2, v4);
}

unint64_t static AspireSimilarityPlaintextPackingDenseRow.protoMessageName.getter()
{
  return 0xD00000000000002ALL;
}

uint64_t static AspireSimilarityPlaintextPackingDenseRow._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilarityPlaintextPackingDenseRow._protobuf_nameMap, a1);
}

uint64_t AspireSimilarityPlaintextPackingDenseRow.decodeMessage<A>(decoder:)()
{
  return AspireSimilarityPlaintextPackingDenseRow.decodeMessage<A>(decoder:)();
}

{
  uint64_t v0;
  uint64_t result;
  char v2;

  do
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  while (!v0 && (v2 & 1) == 0);
  return result;
}

uint64_t AspireSimilarityPlaintextPackingDenseRow.traverse<A>(visitor:)()
{
  return UnknownStorage.traverse<A>(visitor:)();
}

Swift::Int AspireSimilarityPlaintextPackingDenseRow.hashValue.getter()
{
  return AspireSimilarityPlaintextPacking.hashValue.getter((void (*)(void))type metadata accessor for AspireSimilarityPlaintextPackingDenseRow, &lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseRow and conformance AspireSimilarityPlaintextPackingDenseRow, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
}

unint64_t protocol witness for static Message.protoMessageName.getter in conformance AspireSimilarityPlaintextPackingDenseRow()
{
  return 0xD00000000000002ALL;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance AspireSimilarityPlaintextPackingDenseRow()
{
  return AspireSimilarityPlaintextPackingDenseRow.decodeMessage<A>(decoder:)();
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance AspireSimilarityPlaintextPackingDenseRow()
{
  return AspireSimilarityPlaintextPackingDenseRow.traverse<A>(visitor:)();
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AspireSimilarityPlaintextPackingDenseRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseRow and conformance AspireSimilarityPlaintextPackingDenseRow, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilarityPlaintextPackingDenseRow@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilarityPlaintextPackingDenseRow._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AspireSimilarityPlaintextPackingDenseRow(uint64_t a1)
{
  uint64_t v2 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseRow and conformance AspireSimilarityPlaintextPackingDenseRow, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilarityPlaintextPackingDenseRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseRow and conformance AspireSimilarityPlaintextPackingDenseRow, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
  return MEMORY[0x270F44CD8](a1, a2, v4);
}

unint64_t static AspireSimilarityPlaintextPackingDiagonal.protoMessageName.getter()
{
  return 0xD00000000000002ALL;
}

uint64_t static AspireSimilarityPlaintextPackingDiagonal._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilarityPlaintextPackingDiagonal._protobuf_nameMap, a1);
}

uint64_t AspireSimilarityPlaintextPackingDiagonal.decodeMessage<A>(decoder:)()
{
  return AspireSimilarityPlaintextPackingDenseRow.decodeMessage<A>(decoder:)();
}

Swift::Int AspireSimilarityPlaintextPackingDiagonal.hashValue.getter()
{
  return AspireSimilarityPlaintextPacking.hashValue.getter((void (*)(void))type metadata accessor for AspireSimilarityPlaintextPackingDiagonal, &lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDiagonal and conformance AspireSimilarityPlaintextPackingDiagonal, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
}

unint64_t protocol witness for static Message.protoMessageName.getter in conformance AspireSimilarityPlaintextPackingDiagonal()
{
  return 0xD00000000000002ALL;
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AspireSimilarityPlaintextPackingDiagonal(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDiagonal and conformance AspireSimilarityPlaintextPackingDiagonal, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilarityPlaintextPackingDiagonal@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilarityPlaintextPackingDiagonal._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AspireSimilarityPlaintextPackingDiagonal(uint64_t a1)
{
  uint64_t v2 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDiagonal and conformance AspireSimilarityPlaintextPackingDiagonal, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilarityPlaintextPackingDiagonal(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDiagonal and conformance AspireSimilarityPlaintextPackingDiagonal, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
  return MEMORY[0x270F44CD8](a1, a2, v4);
}

unint64_t static AspireSimilarityPlaintextPackingDenseColumn.protoMessageName.getter()
{
  return 0xD00000000000002DLL;
}

uint64_t one-time initialization function for _protobuf_nameMap(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for _NameMap();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return _NameMap.init()();
}

uint64_t static AspireSimilarityPlaintextPackingDenseColumn._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilarityPlaintextPackingDenseColumn._protobuf_nameMap, a1);
}

uint64_t AspireSimilarityPlaintextPackingDenseColumn.decodeMessage<A>(decoder:)()
{
  return AspireSimilarityPlaintextPackingDenseRow.decodeMessage<A>(decoder:)();
}

Swift::Int AspireSimilarityPlaintextPackingDenseColumn.hashValue.getter()
{
  return AspireSimilarityPlaintextPacking.hashValue.getter((void (*)(void))type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn, &lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseColumn and conformance AspireSimilarityPlaintextPackingDenseColumn, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
}

unint64_t protocol witness for static Message.protoMessageName.getter in conformance AspireSimilarityPlaintextPackingDenseColumn()
{
  return 0xD00000000000002DLL;
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AspireSimilarityPlaintextPackingDenseColumn(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseColumn and conformance AspireSimilarityPlaintextPackingDenseColumn, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilarityPlaintextPackingDenseColumn@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilarityPlaintextPackingDenseColumn._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AspireSimilarityPlaintextPackingDenseColumn(uint64_t a1)
{
  uint64_t v2 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseColumn and conformance AspireSimilarityPlaintextPackingDenseColumn, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilarityPlaintextPackingDenseColumn(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseColumn and conformance AspireSimilarityPlaintextPackingDenseColumn, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
  return MEMORY[0x270F44CD8](a1, a2, v4);
}

unint64_t static AspireSimilaritySerializedCiphertextMatrix.protoMessageName.getter()
{
  return 0xD00000000000002CLL;
}

uint64_t static AspireSimilaritySerializedCiphertextMatrix._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySerializedCiphertextMatrix._protobuf_nameMap, a1);
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  uint64_t v11 = v4;
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
          uint64_t v12 = v11;
          dispatch thunk of Decoder.decodeSingularUInt32Field(value:)();
          goto LABEL_5;
        case 3:
          type metadata accessor for AspireHeSerializedCiphertext(0);
          _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireHeSerializedCiphertext and conformance AspireHeSerializedCiphertext, (void (*)(uint64_t))type metadata accessor for AspireHeSerializedCiphertext);
          uint64_t v12 = v11;
          dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)();
          goto LABEL_5;
        case 4:
          uint64_t v12 = v11;
          closure #4 in AspireSimilaritySerializedCiphertextMatrix.decodeMessage<A>(decoder:)(a1, v5, a2, a3, (void (*)(void))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
LABEL_5:
          uint64_t v11 = v12;
          break;
        default:
          break;
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t AspireSimilaritySerializedCiphertextMatrix.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  if (!*(_DWORD *)v5 || (uint64_t result = dispatch thunk of Visitor.visitSingularUInt32Field(value:fieldNumber:)(), !v4))
  {
    if (!*(_DWORD *)(v5 + 4)
      || (uint64_t result = dispatch thunk of Visitor.visitSingularUInt32Field(value:fieldNumber:)(), !v4))
    {
      if (!*(void *)(*(void *)(v5 + 8) + 16)
        || (type metadata accessor for AspireHeSerializedCiphertext(0),
            _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireHeSerializedCiphertext and conformance AspireHeSerializedCiphertext, (void (*)(uint64_t))type metadata accessor for AspireHeSerializedCiphertext), uint64_t result = dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)(), !v4))
      {
        uint64_t result = closure #1 in AspireSimilaritySerializedCiphertextMatrix.traverse<A>(visitor:)(v5, a1, a2, a3, (uint64_t (*)(void, double))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
        if (!v4)
        {
          type metadata accessor for AspireSimilaritySerializedCiphertextMatrix(0);
          return UnknownStorage.traverse<A>(visitor:)();
        }
      }
    }
  }
  return result;
}

uint64_t static AspireSimilaritySerializedCiphertextMatrix.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return specialized static AspireSimilaritySerializedDcrtPlaintextMatrix.== infix(_:_:)(a1, a2, (uint64_t)specialized static Array<A>.== infix(_:_:), type metadata accessor for AspireSimilaritySerializedCiphertextMatrix) & 1;
}

Swift::Int AspireSimilaritySerializedCiphertextMatrix.hashValue.getter()
{
  return AspireSimilarityPlaintextPacking.hashValue.getter((void (*)(void))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix, &lazy protocol witness table cache variable for type AspireSimilaritySerializedCiphertextMatrix and conformance AspireSimilaritySerializedCiphertextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
}

unint64_t protocol witness for static Message.protoMessageName.getter in conformance AspireSimilaritySerializedCiphertextMatrix()
{
  return 0xD00000000000002CLL;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance AspireSimilaritySerializedCiphertextMatrix(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AspireSimilaritySerializedCiphertextMatrix.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance AspireSimilaritySerializedCiphertextMatrix(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AspireSimilaritySerializedCiphertextMatrix.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AspireSimilaritySerializedCiphertextMatrix(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedCiphertextMatrix and conformance AspireSimilaritySerializedCiphertextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilaritySerializedCiphertextMatrix@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySerializedCiphertextMatrix._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AspireSimilaritySerializedCiphertextMatrix(uint64_t a1)
{
  uint64_t v2 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedCiphertextMatrix and conformance AspireSimilaritySerializedCiphertextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilaritySerializedCiphertextMatrix(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedCiphertextMatrix and conformance AspireSimilaritySerializedCiphertextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
  return MEMORY[0x270F44CD8](a1, a2, v4);
}

unint64_t static AspireSimilaritySerializedDcrtPlaintextMatrix.protoMessageName.getter()
{
  return 0xD00000000000002FLL;
}

uint64_t static AspireSimilaritySerializedDcrtPlaintextMatrix._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySerializedDcrtPlaintextMatrix._protobuf_nameMap, a1);
}

uint64_t AspireSimilaritySerializedDcrtPlaintextMatrix.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  uint64_t v11 = v4;
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
          uint64_t v12 = v11;
          dispatch thunk of Decoder.decodeSingularUInt32Field(value:)();
          goto LABEL_5;
        case 3:
          type metadata accessor for AspireHeSerializedDcrtPlaintext(0);
          _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireHeSerializedDcrtPlaintext and conformance AspireHeSerializedDcrtPlaintext, (void (*)(uint64_t))type metadata accessor for AspireHeSerializedDcrtPlaintext);
          uint64_t v12 = v11;
          dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)();
          goto LABEL_5;
        case 4:
          uint64_t v12 = v11;
          closure #4 in AspireSimilaritySerializedCiphertextMatrix.decodeMessage<A>(decoder:)(a1, v5, a2, a3, (void (*)(void))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
LABEL_5:
          uint64_t v11 = v12;
          break;
        default:
          break;
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t closure #4 in AspireSimilaritySerializedCiphertextMatrix.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

uint64_t AspireSimilaritySerializedDcrtPlaintextMatrix.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  if (!*(_DWORD *)v5 || (uint64_t result = dispatch thunk of Visitor.visitSingularUInt32Field(value:fieldNumber:)(), !v4))
  {
    if (!*(_DWORD *)(v5 + 4)
      || (uint64_t result = dispatch thunk of Visitor.visitSingularUInt32Field(value:fieldNumber:)(), !v4))
    {
      if (!*(void *)(*(void *)(v5 + 8) + 16)
        || (type metadata accessor for AspireHeSerializedDcrtPlaintext(0),
            _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireHeSerializedDcrtPlaintext and conformance AspireHeSerializedDcrtPlaintext, (void (*)(uint64_t))type metadata accessor for AspireHeSerializedDcrtPlaintext), uint64_t result = dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)(), !v4))
      {
        uint64_t result = closure #1 in AspireSimilaritySerializedCiphertextMatrix.traverse<A>(visitor:)(v5, a1, a2, a3, (uint64_t (*)(void, double))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
        if (!v4)
        {
          type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix(0);
          return UnknownStorage.traverse<A>(visitor:)();
        }
      }
    }
  }
  return result;
}

uint64_t closure #1 in AspireSimilaritySerializedCiphertextMatrix.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, double))
{
  v17[3] = a4;
  v17[1] = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v11 = *(void *)(v10 - 8);
  double v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a5(0, v12);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v15 + 32), (uint64_t)v9, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1) {
    return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v9, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  }
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v9, (uint64_t)v14, type metadata accessor for AspireSimilarityPlaintextPacking);
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPacking and conformance AspireSimilarityPlaintextPacking, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
  dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
  return outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v14, type metadata accessor for AspireSimilarityPlaintextPacking);
}

uint64_t static AspireSimilaritySerializedDcrtPlaintextMatrix.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return specialized static AspireSimilaritySerializedDcrtPlaintextMatrix.== infix(_:_:)(a1, a2, (uint64_t)specialized static Array<A>.== infix(_:_:), type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix) & 1;
}

Swift::Int AspireSimilaritySerializedDcrtPlaintextMatrix.hashValue.getter()
{
  return AspireSimilarityPlaintextPacking.hashValue.getter((void (*)(void))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix, &lazy protocol witness table cache variable for type AspireSimilaritySerializedDcrtPlaintextMatrix and conformance AspireSimilaritySerializedDcrtPlaintextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
}

uint64_t protocol witness for Message.init() in conformance AspireSimilaritySerializedCiphertextMatrix@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = MEMORY[0x263F8EE78];
  UnknownStorage.init()();
  uint64_t v4 = (char *)a2 + *(int *)(a1 + 32);
  uint64_t v5 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  return v6(v4, 1, 1, v5);
}

unint64_t protocol witness for static Message.protoMessageName.getter in conformance AspireSimilaritySerializedDcrtPlaintextMatrix()
{
  return 0xD00000000000002FLL;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance AspireSimilaritySerializedDcrtPlaintextMatrix(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AspireSimilaritySerializedDcrtPlaintextMatrix.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance AspireSimilaritySerializedDcrtPlaintextMatrix(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AspireSimilaritySerializedDcrtPlaintextMatrix.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AspireSimilaritySerializedDcrtPlaintextMatrix(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedDcrtPlaintextMatrix and conformance AspireSimilaritySerializedDcrtPlaintextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilaritySerializedDcrtPlaintextMatrix@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySerializedDcrtPlaintextMatrix._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AspireSimilaritySerializedDcrtPlaintextMatrix(uint64_t a1)
{
  uint64_t v2 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedDcrtPlaintextMatrix and conformance AspireSimilaritySerializedDcrtPlaintextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilaritySerializedDcrtPlaintextMatrix(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedDcrtPlaintextMatrix and conformance AspireSimilaritySerializedDcrtPlaintextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
  return MEMORY[0x270F44CD8](a1, a2, v4);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AspireSimilaritySerializedDcrtPlaintextMatrix(uint64_t a1, uint64_t a2)
{
  return specialized static AspireSimilaritySerializedDcrtPlaintextMatrix.== infix(_:_:)(a1, a2, (uint64_t)specialized static Array<A>.== infix(_:_:), type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix) & 1;
}

unint64_t static AspireSimilaritySimilarityClientConfig.protoMessageName.getter()
{
  return 0xD000000000000028;
}

uint64_t static AspireSimilaritySimilarityClientConfig._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySimilarityClientConfig._protobuf_nameMap, a1);
}

uint64_t AspireSimilaritySimilarityClientConfig.decodeMessage<A>(decoder:)()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          closure #1 in AspireSimilaritySimilarityClientConfig.decodeMessage<A>(decoder:)();
          break;
        case 2:
          dispatch thunk of Decoder.decodeSingularUInt64Field(value:)();
          break;
        case 3:
          closure #3 in AspireSimilaritySimilarityClientConfig.decodeMessage<A>(decoder:)();
          break;
        case 4:
          dispatch thunk of Decoder.decodeSingularUInt32Field(value:)();
          break;
        case 5:
          dispatch thunk of Decoder.decodeRepeatedUInt32Field(value:)();
          break;
        case 6:
          lazy protocol witness table accessor for type AspireSimilaritySimilarityMetric and conformance AspireSimilaritySimilarityMetric();
          dispatch thunk of Decoder.decodeSingularEnumField<A>(value:)();
          break;
        case 7:
          dispatch thunk of Decoder.decodeRepeatedUInt64Field(value:)();
          break;
        default:
          break;
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t closure #1 in AspireSimilaritySimilarityClientConfig.decodeMessage<A>(decoder:)()
{
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

uint64_t closure #3 in AspireSimilaritySimilarityClientConfig.decodeMessage<A>(decoder:)()
{
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

uint64_t AspireSimilaritySimilarityClientConfig.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = closure #1 in AspireSimilaritySimilarityClientConfig.traverse<A>(visitor:)(v3, a1, a2, a3);
  if (!v4)
  {
    if (*(void *)v3) {
      dispatch thunk of Visitor.visitSingularUInt64Field(value:fieldNumber:)();
    }
    closure #2 in AspireSimilaritySimilarityClientConfig.traverse<A>(visitor:)(v3, a1, a2, a3);
    if (*(_DWORD *)(v3 + 8)) {
      dispatch thunk of Visitor.visitSingularUInt32Field(value:fieldNumber:)();
    }
    if (*(void *)(*(void *)(v3 + 16) + 16)) {
      dispatch thunk of Visitor.visitPackedUInt32Field(value:fieldNumber:)();
    }
    if ((*(unsigned char *)(v3 + 32) & 1) == 0 && *(void *)(v3 + 24))
    {
      lazy protocol witness table accessor for type AspireSimilaritySimilarityMetric and conformance AspireSimilaritySimilarityMetric();
      dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)();
    }
    if (*(void *)(*(void *)(v3 + 40) + 16)) {
      dispatch thunk of Visitor.visitPackedUInt64Field(value:fieldNumber:)();
    }
    type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
    return UnknownStorage.traverse<A>(visitor:)();
  }
  return result;
}

uint64_t closure #1 in AspireSimilaritySimilarityClientConfig.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AspireHeEncryptionParameters(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v12 + 40), (uint64_t)v7, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v7, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  }
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v7, (uint64_t)v11, type metadata accessor for AspireHeEncryptionParameters);
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2((unint64_t *)&lazy protocol witness table cache variable for type AspireHeEncryptionParameters and conformance AspireHeEncryptionParameters, (void (*)(uint64_t))type metadata accessor for AspireHeEncryptionParameters);
  dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
  return outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v11, type metadata accessor for AspireHeEncryptionParameters);
}

uint64_t closure #2 in AspireSimilaritySimilarityClientConfig.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v12 + 44), (uint64_t)v7, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v7, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  }
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v7, (uint64_t)v11, type metadata accessor for AspireSimilarityPlaintextPacking);
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPacking and conformance AspireSimilarityPlaintextPacking, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
  dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
  return outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v11, type metadata accessor for AspireSimilarityPlaintextPacking);
}

Swift::Int AspireSimilaritySimilarityClientConfig.hashValue.getter()
{
  return AspireSimilarityPlaintextPacking.hashValue.getter((void (*)(void))type metadata accessor for AspireSimilaritySimilarityClientConfig, &lazy protocol witness table cache variable for type AspireSimilaritySimilarityClientConfig and conformance AspireSimilaritySimilarityClientConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityClientConfig);
}

uint64_t protocol witness for Message.init() in conformance AspireSimilaritySimilarityClientConfig@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(_DWORD *)(a2 + 8) = 0;
  uint64_t v4 = MEMORY[0x263F8EE78];
  *(void *)(a2 + 16) = MEMORY[0x263F8EE78];
  *(void *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 1;
  *(void *)(a2 + 40) = v4;
  UnknownStorage.init()();
  uint64_t v5 = a2 + *(int *)(a1 + 40);
  uint64_t v6 = type metadata accessor for AspireHeEncryptionParameters(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = a2 + *(int *)(a1 + 44);
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  return v9(v7, 1, 1, v8);
}

unint64_t protocol witness for static Message.protoMessageName.getter in conformance AspireSimilaritySimilarityClientConfig()
{
  return 0xD000000000000028;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance AspireSimilaritySimilarityClientConfig()
{
  return AspireSimilaritySimilarityClientConfig.decodeMessage<A>(decoder:)();
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance AspireSimilaritySimilarityClientConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AspireSimilaritySimilarityClientConfig.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AspireSimilaritySimilarityClientConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityClientConfig and conformance AspireSimilaritySimilarityClientConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityClientConfig);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilaritySimilarityClientConfig@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySimilarityClientConfig._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AspireSimilaritySimilarityClientConfig(uint64_t a1)
{
  uint64_t v2 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityClientConfig and conformance AspireSimilaritySimilarityClientConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityClientConfig);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilaritySimilarityClientConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityClientConfig and conformance AspireSimilaritySimilarityClientConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityClientConfig);
  return MEMORY[0x270F44CD8](a1, a2, v4);
}

unint64_t static AspireSimilaritySimilarityServerConfig.protoMessageName.getter()
{
  return 0xD000000000000028;
}

uint64_t static AspireSimilaritySimilarityServerConfig._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySimilarityServerConfig._protobuf_nameMap, a1);
}

uint64_t AspireSimilaritySimilarityServerConfig.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    if (v0 || (v2 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 1:
        closure #1 in AspireSimilaritySimilarityServerConfig.decodeMessage<A>(decoder:)();
        break;
      case 2:
        closure #2 in AspireSimilaritySimilarityServerConfig.decodeMessage<A>(decoder:)();
        break;
      case 3:
        dispatch thunk of Decoder.decodeSingularBoolField(value:)();
        break;
      case 4:
        type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
        dispatch thunk of Decoder.decodeSingularUInt32Field(value:)();
        break;
      default:
        continue;
    }
  }
}

uint64_t closure #1 in AspireSimilaritySimilarityServerConfig.decodeMessage<A>(decoder:)()
{
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

uint64_t closure #2 in AspireSimilaritySimilarityServerConfig.decodeMessage<A>(decoder:)()
{
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

uint64_t AspireSimilaritySimilarityServerConfig.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = closure #1 in AspireSimilaritySimilarityServerConfig.traverse<A>(visitor:)((uint64_t)v3, a1, a2, a3);
  if (!v4)
  {
    closure #2 in AspireSimilaritySimilarityServerConfig.traverse<A>(visitor:)((uint64_t)v3, a1, a2, a3);
    if (*v3 == 1) {
      dispatch thunk of Visitor.visitSingularBoolField(value:fieldNumber:)();
    }
    closure #3 in AspireSimilaritySimilarityServerConfig.traverse<A>(visitor:)((uint64_t)v3);
    type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
    return UnknownStorage.traverse<A>(visitor:)();
  }
  return result;
}

uint64_t closure #1 in AspireSimilaritySimilarityServerConfig.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v12 + 24), (uint64_t)v7, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v7, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  }
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v7, (uint64_t)v11, type metadata accessor for AspireSimilaritySimilarityClientConfig);
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityClientConfig and conformance AspireSimilaritySimilarityClientConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityClientConfig);
  dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
  return outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v11, type metadata accessor for AspireSimilaritySimilarityClientConfig);
}

uint64_t closure #2 in AspireSimilaritySimilarityServerConfig.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v12 + 28), (uint64_t)v7, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v7, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  }
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v7, (uint64_t)v11, type metadata accessor for AspireSimilarityPlaintextPacking);
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPacking and conformance AspireSimilarityPlaintextPacking, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
  dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
  return outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v11, type metadata accessor for AspireSimilarityPlaintextPacking);
}

uint64_t closure #3 in AspireSimilaritySimilarityServerConfig.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t result = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 32) + 4) & 1) == 0) {
    return dispatch thunk of Visitor.visitSingularUInt32Field(value:fieldNumber:)();
  }
  return result;
}

Swift::Int AspireSimilaritySimilarityServerConfig.hashValue.getter()
{
  return AspireSimilarityPlaintextPacking.hashValue.getter((void (*)(void))type metadata accessor for AspireSimilaritySimilarityServerConfig, &lazy protocol witness table cache variable for type AspireSimilaritySimilarityServerConfig and conformance AspireSimilaritySimilarityServerConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityServerConfig);
}

uint64_t protocol witness for Message.init() in conformance AspireSimilaritySimilarityServerConfig@<X0>(int *a1@<X0>, unsigned char *a2@<X8>)
{
  *a2 = 0;
  UnknownStorage.init()();
  uint64_t v4 = &a2[a1[6]];
  uint64_t v5 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = &a2[a1[7]];
  uint64_t v7 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v9 = &a2[a1[8]];
  *(_DWORD *)uint64_t v9 = 0;
  v9[4] = 1;
  return result;
}

unint64_t protocol witness for static Message.protoMessageName.getter in conformance AspireSimilaritySimilarityServerConfig()
{
  return 0xD000000000000028;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance AspireSimilaritySimilarityServerConfig()
{
  return AspireSimilaritySimilarityServerConfig.decodeMessage<A>(decoder:)();
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance AspireSimilaritySimilarityServerConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AspireSimilaritySimilarityServerConfig.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AspireSimilaritySimilarityServerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityServerConfig and conformance AspireSimilaritySimilarityServerConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityServerConfig);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilaritySimilarityServerConfig@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySimilarityServerConfig._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AspireSimilaritySimilarityServerConfig(uint64_t a1)
{
  uint64_t v2 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityServerConfig and conformance AspireSimilaritySimilarityServerConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityServerConfig);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilaritySimilarityServerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityServerConfig and conformance AspireSimilaritySimilarityServerConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityServerConfig);
  return MEMORY[0x270F44CD8](a1, a2, v4);
}

unint64_t static AspireSimilaritySerializedProcessedSimilarityDb.protoMessageName.getter()
{
  return 0xD000000000000031;
}

uint64_t static AspireSimilaritySerializedProcessedSimilarityDb._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySerializedProcessedSimilarityDb._protobuf_nameMap, a1);
}

uint64_t AspireSimilaritySerializedProcessedSimilarityDb.decodeMessage<A>(decoder:)()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix(0);
          _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedDcrtPlaintextMatrix and conformance AspireSimilaritySerializedDcrtPlaintextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
          uint64_t v4 = v3;
          dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)();
          goto LABEL_5;
        case 2:
          uint64_t v4 = v3;
          dispatch thunk of Decoder.decodeRepeatedUInt64Field(value:)();
          goto LABEL_5;
        case 3:
          uint64_t v4 = v3;
          dispatch thunk of Decoder.decodeRepeatedBytesField(value:)();
          goto LABEL_5;
        case 4:
          uint64_t v4 = v3;
          closure #4 in AspireSimilaritySerializedProcessedSimilarityDb.decodeMessage<A>(decoder:)();
LABEL_5:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t closure #4 in AspireSimilaritySerializedProcessedSimilarityDb.decodeMessage<A>(decoder:)()
{
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

uint64_t AspireSimilaritySerializedProcessedSimilarityDb.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  if (!*(void *)(*v5 + 16)
    || (type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix(0),
        _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedDcrtPlaintextMatrix and conformance AspireSimilaritySerializedDcrtPlaintextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix), uint64_t result = dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)(), !v4))
  {
    if (!*(void *)(v5[1] + 16)
      || (uint64_t result = dispatch thunk of Visitor.visitPackedUInt64Field(value:fieldNumber:)(), !v4))
    {
      if (!*(void *)(v5[2] + 16)
        || (uint64_t result = dispatch thunk of Visitor.visitRepeatedBytesField(value:fieldNumber:)(), !v4))
      {
        uint64_t result = closure #1 in AspireSimilaritySerializedProcessedSimilarityDb.traverse<A>(visitor:)((uint64_t)v5, a1, a2, a3);
        if (!v4)
        {
          type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb(0);
          return UnknownStorage.traverse<A>(visitor:)();
        }
      }
    }
  }
  return result;
}

uint64_t closure #1 in AspireSimilaritySerializedProcessedSimilarityDb.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v12 + 32), (uint64_t)v7, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v7, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  }
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v7, (uint64_t)v11, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityServerConfig and conformance AspireSimilaritySimilarityServerConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityServerConfig);
  dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
  return outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v11, type metadata accessor for AspireSimilaritySimilarityServerConfig);
}

Swift::Int AspireSimilaritySerializedProcessedSimilarityDb.hashValue.getter()
{
  return AspireSimilarityPlaintextPacking.hashValue.getter((void (*)(void))type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb, &lazy protocol witness table cache variable for type AspireSimilaritySerializedProcessedSimilarityDb and conformance AspireSimilaritySerializedProcessedSimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb);
}

uint64_t protocol witness for Message.init() in conformance AspireSimilaritySerializedProcessedSimilarityDb@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = MEMORY[0x263F8EE78];
  *a2 = MEMORY[0x263F8EE78];
  a2[1] = v4;
  a2[2] = v4;
  UnknownStorage.init()();
  uint64_t v5 = (char *)a2 + *(int *)(a1 + 32);
  uint64_t v6 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(v5, 1, 1, v6);
}

unint64_t protocol witness for static Message.protoMessageName.getter in conformance AspireSimilaritySerializedProcessedSimilarityDb()
{
  return 0xD000000000000031;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance AspireSimilaritySerializedProcessedSimilarityDb()
{
  return AspireSimilaritySerializedProcessedSimilarityDb.decodeMessage<A>(decoder:)();
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance AspireSimilaritySerializedProcessedSimilarityDb(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AspireSimilaritySerializedProcessedSimilarityDb.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AspireSimilaritySerializedProcessedSimilarityDb(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedProcessedSimilarityDb and conformance AspireSimilaritySerializedProcessedSimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilaritySerializedProcessedSimilarityDb@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySerializedProcessedSimilarityDb._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AspireSimilaritySerializedProcessedSimilarityDb(uint64_t a1)
{
  uint64_t v2 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedProcessedSimilarityDb and conformance AspireSimilaritySerializedProcessedSimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilaritySerializedProcessedSimilarityDb(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedProcessedSimilarityDb and conformance AspireSimilaritySerializedProcessedSimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb);
  return MEMORY[0x270F44CD8](a1, a2, v4);
}

unint64_t static AspireSimilaritySimilarityDbRow.protoMessageName.getter()
{
  return 0xD000000000000021;
}

uint64_t static AspireSimilaritySimilarityDbRow._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySimilarityDbRow._protobuf_nameMap, a1);
}

uint64_t AspireSimilaritySimilarityDbRow.decodeMessage<A>(decoder:)()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 3:
          dispatch thunk of Decoder.decodeRepeatedFloatField(value:)();
          break;
        case 2:
          dispatch thunk of Decoder.decodeSingularBytesField(value:)();
          break;
        case 1:
          dispatch thunk of Decoder.decodeSingularUInt64Field(value:)();
          break;
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t AspireSimilaritySimilarityDbRow.traverse<A>(visitor:)()
{
  if (!*v0 || (uint64_t result = dispatch thunk of Visitor.visitSingularUInt64Field(value:fieldNumber:)(), !v1))
  {
    uint64_t v3 = v0[1];
    unint64_t v4 = v0[2];
    switch(v4 >> 62)
    {
      case 1uLL:
        if ((int)v3 != v3 >> 32) {
          goto LABEL_9;
        }
        goto LABEL_10;
      case 2uLL:
        if (*(void *)(v3 + 16) != *(void *)(v3 + 24)) {
          goto LABEL_9;
        }
        goto LABEL_10;
      case 3uLL:
        goto LABEL_10;
      default:
        if ((v4 & 0xFF000000000000) == 0) {
          goto LABEL_10;
        }
LABEL_9:
        uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
        if (!v1)
        {
LABEL_10:
          if (!*(void *)(v0[3] + 16)
            || (uint64_t result = dispatch thunk of Visitor.visitPackedFloatField(value:fieldNumber:)(), !v1))
          {
            type metadata accessor for AspireSimilaritySimilarityDbRow(0);
            uint64_t result = UnknownStorage.traverse<A>(visitor:)();
          }
        }
        break;
    }
  }
  return result;
}

Swift::Int AspireSimilaritySimilarityDbRow.hashValue.getter()
{
  return AspireSimilarityPlaintextPacking.hashValue.getter((void (*)(void))type metadata accessor for AspireSimilaritySimilarityDbRow, &lazy protocol witness table cache variable for type AspireSimilaritySimilarityDbRow and conformance AspireSimilaritySimilarityDbRow, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDbRow);
}

uint64_t protocol witness for Message.init() in conformance AspireSimilaritySimilarityDbRow@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  uint64_t v1 = MEMORY[0x263F8EE78];
  a1[2] = 0xC000000000000000;
  a1[3] = v1;
  return UnknownStorage.init()();
}

unint64_t protocol witness for static Message.protoMessageName.getter in conformance AspireSimilaritySimilarityDbRow()
{
  return 0xD000000000000021;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance AspireSimilaritySimilarityDbRow()
{
  return AspireSimilaritySimilarityDbRow.decodeMessage<A>(decoder:)();
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance AspireSimilaritySimilarityDbRow()
{
  return AspireSimilaritySimilarityDbRow.traverse<A>(visitor:)();
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AspireSimilaritySimilarityDbRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDbRow and conformance AspireSimilaritySimilarityDbRow, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDbRow);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilaritySimilarityDbRow@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySimilarityDbRow._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AspireSimilaritySimilarityDbRow(uint64_t a1)
{
  uint64_t v2 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDbRow and conformance AspireSimilaritySimilarityDbRow, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDbRow);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilaritySimilarityDbRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDbRow and conformance AspireSimilaritySimilarityDbRow, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDbRow);
  return MEMORY[0x270F44CD8](a1, a2, v4);
}

unint64_t static AspireSimilaritySimilarityDb.protoMessageName.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t static AspireSimilaritySimilarityDb._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySimilarityDb._protobuf_nameMap, a1);
}

uint64_t AspireSimilaritySimilarityDb.decodeMessage<A>(decoder:)()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 1)
      {
        type metadata accessor for AspireSimilaritySimilarityDbRow(0);
        _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDbRow and conformance AspireSimilaritySimilarityDbRow, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDbRow);
        dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)();
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t AspireSimilaritySimilarityDb.traverse<A>(visitor:)()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for AspireSimilaritySimilarityDbRow(0),
        _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDbRow and conformance AspireSimilaritySimilarityDbRow, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDbRow), uint64_t result = dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)(), !v1))
  {
    type metadata accessor for AspireSimilaritySimilarityDb(0);
    return UnknownStorage.traverse<A>(visitor:)();
  }
  return result;
}

Swift::Int AspireSimilaritySimilarityDb.hashValue.getter()
{
  return AspireSimilarityPlaintextPacking.hashValue.getter((void (*)(void))type metadata accessor for AspireSimilaritySimilarityDb, &lazy protocol witness table cache variable for type AspireSimilaritySimilarityDb and conformance AspireSimilaritySimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDb);
}

unint64_t protocol witness for static Message.protoMessageName.getter in conformance AspireSimilaritySimilarityDb()
{
  return 0xD00000000000001ELL;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance AspireSimilaritySimilarityDb()
{
  return AspireSimilaritySimilarityDb.decodeMessage<A>(decoder:)();
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance AspireSimilaritySimilarityDb()
{
  return AspireSimilaritySimilarityDb.traverse<A>(visitor:)();
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AspireSimilaritySimilarityDb(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDb and conformance AspireSimilaritySimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDb);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilaritySimilarityDb@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilaritySimilarityDb._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AspireSimilaritySimilarityDb(uint64_t a1)
{
  uint64_t v2 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDb and conformance AspireSimilaritySimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDb);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilaritySimilarityDb(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDb and conformance AspireSimilaritySimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDb);
  return MEMORY[0x270F44CD8](a1, a2, v4);
}

unint64_t static AspireSimilarityPecPreprocessDbArgs.protoMessageName.getter()
{
  return 0xD000000000000025;
}

uint64_t static AspireSimilarityPecPreprocessDbArgs._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static AMDPbFetchHEConfigs._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilarityPecPreprocessDbArgs._protobuf_nameMap, a1);
}

_OWORD *one-time initialization function for defaultInstance()
{
  type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
  swift_allocObject();
  uint64_t result = AspireSimilarityPecPreprocessDbArgs._StorageClass.init()();
  static AspireSimilarityPecPreprocessDbArgs._StorageClass.defaultInstance = (uint64_t)result;
  return result;
}

_OWORD *AspireSimilarityPecPreprocessDbArgs._StorageClass.init()()
{
  v0[2] = 0u;
  v0[3] = 0u;
  v0[1] = 0u;
  uint64_t v1 = (char *)v0
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig;
  uint64_t v2 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = (void *)((char *)v0
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryID);
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = (void *)((char *)v0
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryMetadataID);
  void *v4 = 0;
  v4[1] = 0;
  uint64_t v5 = (void *)((char *)v0
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__embeddingID);
  *uint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (void *)((char *)v0
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__shardID);
  *uint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (void *)((char *)v0
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__predefinedEncryptionParameters);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = (char *)v0
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
  *(void *)uint64_t v8 = 0;
  *((_WORD *)v8 + 4) = 256;
  *(void *)((char *)v0
            + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__extraPlaintextModuli) = MEMORY[0x263F8EE78];
  uint64_t v9 = (char *)v0
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
  *(_DWORD *)uint64_t v9 = 0;
  v9[4] = 1;
  *((unsigned char *)v0
  + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel) = 2;
  return v0;
}

uint64_t AspireSimilarityPecPreprocessDbArgs._StorageClass.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v0+ OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AspireSimilarityPecPreprocessDbArgs._StorageClass.__deallocating_deinit()
{
  AspireSimilarityPecPreprocessDbArgs._StorageClass.deinit();
  return swift_deallocClassInstance();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
    swift_allocObject();
    uint64_t v3 = (void *)swift_retain();
    uint64_t v4 = specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(v3);
    swift_release();
    *(void *)(v1 + v2) = v4;
    swift_release();
  }
  swift_retain();
  closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)();
  return swift_release();
}

uint64_t closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          closure #1 in closure #1 in AspirePirPirPreprocessDbArgs.decodeMessage<A>(decoder:)();
          break;
        case 2:
          closure #2 in closure #1 in AspirePirPirPreprocessDbArgs.decodeMessage<A>(decoder:)();
          break;
        case 3:
          closure #3 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)();
          break;
        case 4:
          closure #4 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)();
          break;
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          closure #5 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)();
          break;
        case 10:
          closure #10 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)();
          break;
        case 11:
          closure #11 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)();
          break;
        case 12:
          closure #12 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)();
          break;
        case 13:
          closure #13 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)();
          break;
        default:
          break;
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t closure #3 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)()
{
  return swift_endAccess();
}

uint64_t closure #4 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)()
{
  return swift_endAccess();
}

uint64_t closure #5 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)()
{
  return swift_endAccess();
}

uint64_t closure #10 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)()
{
  return swift_endAccess();
}

uint64_t closure #11 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)()
{
  return swift_endAccess();
}

uint64_t closure #12 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)()
{
  return swift_endAccess();
}

uint64_t closure #13 in closure #1 in AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)()
{
  return swift_endAccess();
}

uint64_t AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0);
  uint64_t v7 = swift_retain();
  closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(v7, a1, a2, a3);
  uint64_t result = swift_release();
  if (!v3) {
    return UnknownStorage.traverse<A>(visitor:)();
  }
  return result;
}

uint64_t closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = closure #1 in closure #1 in AspirePirPirPreprocessDbArgs.traverse<A>(visitor:)(a1);
  if (!v4)
  {
    closure #2 in closure #1 in AspirePirPirPreprocessDbArgs.traverse<A>(visitor:)(a1);
    closure #3 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(a1);
    closure #4 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(a1, a2, a3, a4);
    closure #5 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(a1, a2, a3, a4, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryID);
    closure #5 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(a1, a2, a3, a4, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryMetadataID);
    closure #5 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(a1, a2, a3, a4, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__embeddingID);
    closure #5 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(a1, a2, a3, a4, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__shardID);
    closure #5 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(a1, a2, a3, a4, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__predefinedEncryptionParameters);
    closure #10 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(a1);
    uint64_t v10 = a1
        + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__extraPlaintextModuli;
    swift_beginAccess();
    if (*(void *)(*(void *)v10 + 16))
    {
      swift_bridgeObjectRetain();
      dispatch thunk of Visitor.visitPackedUInt64Field(value:fieldNumber:)();
      swift_bridgeObjectRelease();
    }
    closure #11 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(a1);
    return closure #12 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(a1);
  }
  return result;
}

uint64_t closure #3 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  if (*(void *)(a1 + 56))
  {
    swift_bridgeObjectRetain();
    dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t closure #4 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig;
  swift_beginAccess();
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v12, (uint64_t)v7, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v7, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  }
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0((uint64_t)v7, (uint64_t)v11, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityServerConfig and conformance AspireSimilaritySimilarityServerConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityServerConfig);
  dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
  return outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v11, type metadata accessor for AspireSimilaritySimilarityServerConfig);
}

uint64_t closure #5 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1 + *a5;
  uint64_t result = swift_beginAccess();
  if (*(void *)(v5 + 8))
  {
    swift_bridgeObjectRetain();
    dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t closure #10 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t v1 = a1
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(v1 + 9) & 1) == 0)
  {
    lazy protocol witness table accessor for type AspireHeHeScheme and conformance AspireHeHeScheme();
    return dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)();
  }
  return result;
}

uint64_t closure #11 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t v1 = a1
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(v1 + 4) & 1) == 0) {
    return dispatch thunk of Visitor.visitSingularUInt32Field(value:fieldNumber:)();
  }
  return result;
}

uint64_t closure #12 in closure #1 in AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t v1 = (unsigned char *)(a1
               + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel);
  uint64_t result = swift_beginAccess();
  if (*v1 != 2) {
    return dispatch thunk of Visitor.visitSingularBoolField(value:fieldNumber:)();
  }
  return result;
}

uint64_t closure #1 in static AspireSimilarityPecPreprocessDbArgs.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v82 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v81 = (unsigned __int8 *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AspireSimilaritySimilarityServerConfig?, AspireSimilaritySimilarityServerConfig?));
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (unsigned __int8 *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v81 - v13;
  swift_beginAccess();
  uint64_t v16 = a1[2];
  uint64_t v15 = a1[3];
  swift_beginAccess();
  v83 = a2;
  uint64_t v17 = a2[3];
  if (!v15)
  {
    if (v17) {
      return 0;
    }
    goto LABEL_8;
  }
  if (!v17) {
    return 0;
  }
  if (v16 == v83[2] && v15 == v17
    || (v18 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v18 & 1) != 0))
  {
LABEL_8:
    swift_beginAccess();
    uint64_t v20 = a1[4];
    uint64_t v21 = a1[5];
    uint64_t v22 = v83;
    swift_beginAccess();
    uint64_t v23 = v22[5];
    if (v21)
    {
      if (!v23) {
        return 0;
      }
      if (v20 != v83[4] || v21 != v23)
      {
        char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t result = 0;
        if ((v24 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v23)
    {
      return 0;
    }
    swift_beginAccess();
    uint64_t v25 = a1[6];
    uint64_t v26 = a1[7];
    uint64_t v27 = v83;
    swift_beginAccess();
    uint64_t v28 = v27[7];
    if (v26)
    {
      if (v28)
      {
        if (v25 != v83[6] || v26 != v28)
        {
          char v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
          uint64_t result = 0;
          if ((v29 & 1) == 0) {
            return result;
          }
        }
LABEL_22:
        uint64_t v30 = (uint64_t)a1
            + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig;
        swift_beginAccess();
        outlined init with copy of AMDPbHEConfig.OneOf_Config?(v30, (uint64_t)v14, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
        uint64_t v31 = v83;
        uint64_t v32 = (uint64_t)v83
            + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig;
        swift_beginAccess();
        uint64_t v33 = (uint64_t)&v8[*(int *)(v6 + 48)];
        outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v14, (uint64_t)v8, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
        outlined init with copy of AMDPbHEConfig.OneOf_Config?(v32, v33, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
        v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v82 + 48);
        if (v34((uint64_t)v8, 1, v4) == 1)
        {
          swift_retain();
          swift_retain();
          outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v14, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
          int v35 = v34(v33, 1, v4);
          uint64_t v36 = v31;
          if (v35 == 1)
          {
            outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v8, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
LABEL_31:
            v39 = (void *)((char *)a1
                           + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryID);
            swift_beginAccess();
            uint64_t v40 = *v39;
            uint64_t v41 = v39[1];
            uint64_t v42 = (void *)((char *)v36
                           + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryID);
            swift_beginAccess();
            uint64_t v43 = v42[1];
            if (v41)
            {
              if (!v43 || (v40 != *v42 || v41 != v43) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
                goto LABEL_28;
              }
            }
            else if (v43)
            {
              goto LABEL_28;
            }
            uint64_t v44 = (void *)((char *)a1
                           + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryMetadataID);
            swift_beginAccess();
            uint64_t v45 = *v44;
            uint64_t v46 = v44[1];
            uint64_t v47 = (void *)((char *)v36
                           + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryMetadataID);
            swift_beginAccess();
            uint64_t v48 = v47[1];
            if (v46)
            {
              if (!v48 || (v45 != *v47 || v46 != v48) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
                goto LABEL_28;
              }
            }
            else if (v48)
            {
              goto LABEL_28;
            }
            uint64_t v49 = (void *)((char *)a1
                           + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__embeddingID);
            swift_beginAccess();
            uint64_t v50 = *v49;
            uint64_t v51 = v49[1];
            v52 = (void *)((char *)v36
                           + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__embeddingID);
            swift_beginAccess();
            uint64_t v53 = v52[1];
            if (v51)
            {
              if (!v53 || (v50 != *v52 || v51 != v53) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
                goto LABEL_28;
              }
            }
            else if (v53)
            {
              goto LABEL_28;
            }
            v54 = (void *)((char *)a1
                           + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__shardID);
            swift_beginAccess();
            uint64_t v55 = *v54;
            uint64_t v56 = v54[1];
            v57 = (void *)((char *)v36
                           + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__shardID);
            swift_beginAccess();
            uint64_t v58 = v57[1];
            if (v56)
            {
              if (!v58 || (v55 != *v57 || v56 != v58) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
                goto LABEL_28;
              }
            }
            else if (v58)
            {
              goto LABEL_28;
            }
            v59 = (void *)((char *)a1
                           + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__predefinedEncryptionParameters);
            swift_beginAccess();
            uint64_t v60 = *v59;
            uint64_t v61 = v59[1];
            v62 = (void *)((char *)v36
                           + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__predefinedEncryptionParameters);
            swift_beginAccess();
            uint64_t v63 = v62[1];
            if (v61)
            {
              if (!v63 || (v60 != *v62 || v61 != v63) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
                goto LABEL_28;
              }
            }
            else if (v63)
            {
              goto LABEL_28;
            }
            v64 = (char *)a1
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
            swift_beginAccess();
            uint64_t v65 = *(void *)v64;
            char v66 = v64[9];
            v67 = (char *)v36
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
            swift_beginAccess();
            if (v66)
            {
              if ((v67[9] & 1) == 0) {
                goto LABEL_28;
              }
            }
            else
            {
              if (v67[9]) {
                goto LABEL_28;
              }
              uint64_t v75 = *(void *)v67;
              if (v67[8])
              {
                if (v75)
                {
                  if (v75 == 1) {
                    BOOL v76 = v65 == 1;
                  }
                  else {
                    BOOL v76 = v65 == 2;
                  }
                  uint64_t v36 = v83;
                  if (!v76) {
                    goto LABEL_28;
                  }
                }
                else
                {
                  uint64_t v36 = v83;
                  if (v65) {
                    goto LABEL_28;
                  }
                }
              }
              else if (v65 != v75)
              {
                goto LABEL_28;
              }
            }
            v68 = (void **)((char *)a1
                            + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__extraPlaintextModuli);
            swift_beginAccess();
            v69 = *v68;
            v70 = (void **)((char *)v36
                            + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__extraPlaintextModuli);
            swift_beginAccess();
            if (specialized static Array<A>.== infix(_:_:)(v69, *v70))
            {
              v71 = (char *)a1
                  + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
              swift_beginAccess();
              int v72 = *(_DWORD *)v71;
              char v73 = v71[4];
              v74 = (char *)v36
                  + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
              swift_beginAccess();
              if (v73)
              {
                if ((v74[4] & 1) == 0) {
                  goto LABEL_28;
                }
              }
              else if ((v74[4] & 1) != 0 || v72 != *(_DWORD *)v74)
              {
                goto LABEL_28;
              }
              v77 = (unsigned __int8 *)a1
                  + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel;
              swift_beginAccess();
              int v78 = *v77;
              swift_release();
              v79 = (unsigned __int8 *)v83
                  + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel;
              swift_beginAccess();
              int v80 = *v79;
              swift_release();
              if (v78 == 2)
              {
                if (v80 != 2) {
                  return 0;
                }
              }
              else if (v80 == 2 || ((((v80 & 1) == 0) ^ v78) & 1) == 0)
              {
                return 0;
              }
              return 1;
            }
LABEL_28:
            swift_release();
            swift_release();
            return 0;
          }
        }
        else
        {
          outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v8, (uint64_t)v11, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
          if (v34(v33, 1, v4) != 1)
          {
            uint64_t v37 = v81;
            _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v33, (uint64_t)v81, type metadata accessor for AspireSimilaritySimilarityServerConfig);
            swift_retain();
            uint64_t v36 = v83;
            swift_retain();
            char v38 = specialized static AspireSimilaritySimilarityServerConfig.== infix(_:_:)(v11, v37);
            outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v37, type metadata accessor for AspireSimilaritySimilarityServerConfig);
            outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v14, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
            outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v11, type metadata accessor for AspireSimilaritySimilarityServerConfig);
            outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v8, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
            if ((v38 & 1) == 0) {
              goto LABEL_28;
            }
            goto LABEL_31;
          }
          swift_retain();
          swift_retain();
          outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v14, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
          outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v11, type metadata accessor for AspireSimilaritySimilarityServerConfig);
        }
        outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v8, &demangling cache variable for type metadata for (AspireSimilaritySimilarityServerConfig?, AspireSimilaritySimilarityServerConfig?));
        goto LABEL_28;
      }
    }
    else if (!v28)
    {
      goto LABEL_22;
    }
    return 0;
  }
  return result;
}

Swift::Int AspireSimilarityPecPreprocessDbArgs.hashValue.getter()
{
  return AspireSimilarityPlaintextPacking.hashValue.getter((void (*)(void))type metadata accessor for AspireSimilarityPecPreprocessDbArgs, &lazy protocol witness table cache variable for type AspireSimilarityPecPreprocessDbArgs and conformance AspireSimilarityPecPreprocessDbArgs, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPecPreprocessDbArgs);
}

Swift::Int AspireSimilarityPlaintextPacking.hashValue.getter(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Message.init() in conformance AspireSimilarityPecPreprocessDbArgs@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  UnknownStorage.init()();
  uint64_t v4 = *(int *)(a1 + 20);
  if (one-time initialization token for defaultInstance != -1) {
    swift_once();
  }
  *(void *)(a2 + v4) = static AspireSimilarityPecPreprocessDbArgs._StorageClass.defaultInstance;
  return swift_retain();
}

unint64_t protocol witness for static Message.protoMessageName.getter in conformance AspireSimilarityPecPreprocessDbArgs()
{
  return 0xD000000000000025;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance AspireSimilarityPecPreprocessDbArgs()
{
  return AspireSimilarityPecPreprocessDbArgs.decodeMessage<A>(decoder:)();
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance AspireSimilarityPecPreprocessDbArgs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AspireSimilarityPecPreprocessDbArgs.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance AspireSimilarityPecPreprocessDbArgs(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPecPreprocessDbArgs and conformance AspireSimilarityPecPreprocessDbArgs, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPecPreprocessDbArgs);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AspireSimilarityPecPreprocessDbArgs@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance AMDPbFetchHEConfigs(&one-time initialization token for _protobuf_nameMap, (uint64_t)static AspireSimilarityPecPreprocessDbArgs._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AspireSimilarityPecPreprocessDbArgs(uint64_t a1)
{
  uint64_t v2 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPecPreprocessDbArgs and conformance AspireSimilarityPecPreprocessDbArgs, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPecPreprocessDbArgs);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AspireSimilarityPecPreprocessDbArgs(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPecPreprocessDbArgs and conformance AspireSimilarityPecPreprocessDbArgs, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPecPreprocessDbArgs);
  return MEMORY[0x270F44CD8](a1, a2, v4);
}

uint64_t closure #1 in closure #1 in static Data.== infix(_:_:)@<X0>(uint64_t __s2@<X0>, void *__s1@<X2>, uint64_t a3@<X1>, BOOL *a4@<X8>)
{
  if (__s1)
  {
    if (__s2)
    {
      __s2 = memcmp(__s1, (const void *)__s2, a3 - __s2);
      *a4 = __s2 == 0;
      return __s2;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return __s2;
}

unint64_t specialized Array._checkSubscript(_:wasNativeTypeChecked:)(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)(a3 + 16) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized static AspireSimilarityPecPreprocessDbArgs.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20);
  uint64_t v12 = *(void **)(a1 + v11);
  uint64_t v13 = *(void **)(a2 + v11);
  if (v12 == v13
    || (swift_retain(),
        swift_retain(),
        char v14 = closure #1 in static AspireSimilarityPecPreprocessDbArgs.== infix(_:_:)(v12, v13),
        swift_release(),
        swift_release(),
        (v14 & 1) != 0))
  {
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v15(v10, a1, v4);
    v15(v7, a2, v4);
    _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, MEMORY[0x263F50560]);
    char v16 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
    v17(v7, v4);
    v17(v10, v4);
  }
  else
  {
    char v16 = 0;
  }
  return v16 & 1;
}

uint64_t specialized static AspireSimilaritySerializedCiphertextMatrix.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return specialized static AspireSimilaritySerializedDcrtPlaintextMatrix.== infix(_:_:)(a1, a2, (uint64_t)specialized static Array<A>.== infix(_:_:), type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
}

uint64_t specialized static AspireSimilaritySerializedDcrtPlaintextMatrix.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v56 = a4;
  uint64_t v57 = a3;
  uint64_t v6 = type metadata accessor for UnknownStorage();
  uint64_t v55 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v46 - v10;
  uint64_t v12 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AspireSimilarityPlaintextPacking?, AspireSimilarityPlaintextPacking?));
  MEMORY[0x270FA5388](v16);
  char v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  MEMORY[0x270FA5388](v21);
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    goto LABEL_10;
  }
  uint64_t v50 = v15;
  uint64_t v51 = v11;
  uint64_t v53 = v6;
  v54 = v18;
  v52 = v9;
  if (*(_DWORD *)(a1 + 4) != *(_DWORD *)(a2 + 4)) {
    goto LABEL_10;
  }
  uint64_t v25 = a2;
  uint64_t v48 = v24;
  uint64_t v49 = (uint64_t)&v46 - v22;
  uint64_t v47 = v23;
  if ((((uint64_t (*)(void, void))v57)(*(void *)(a1 + 8), *(void *)(a2 + 8)) & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v26 = v56(0);
  uint64_t v27 = v49;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v26 + 32), v49, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v57 = v26;
  uint64_t v28 = a2 + *(int *)(v26 + 32);
  uint64_t v29 = v48;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v28, v48, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v30 = (uint64_t)v54;
  uint64_t v31 = (uint64_t)&v54[*(int *)(v16 + 48)];
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v27, (uint64_t)v54, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v29, v31, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (v32(v30, 1, v12) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v29, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v27, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    if (v32(v31, 1, v12) == 1)
    {
      outlined destroy of AMDPbHEConfig.OneOf_Config?(v30, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
LABEL_13:
      uint64_t v38 = v57;
      uint64_t v39 = v55;
      uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(v55 + 16);
      uint64_t v41 = v51;
      uint64_t v42 = v53;
      v40(v51, a1 + *(int *)(v57 + 28), v53);
      uint64_t v43 = v25 + *(int *)(v38 + 28);
      uint64_t v44 = v52;
      v40(v52, v43, v42);
      _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, MEMORY[0x263F50560]);
      char v34 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v45 = *(void (**)(char *, uint64_t))(v39 + 8);
      v45(v44, v42);
      v45(v41, v42);
      return v34 & 1;
    }
    goto LABEL_9;
  }
  uint64_t v33 = v47;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v30, v47, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  if (v32(v31, 1, v12) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v48, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v49, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v33, type metadata accessor for AspireSimilarityPlaintextPacking);
LABEL_9:
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v30, &demangling cache variable for type metadata for (AspireSimilarityPlaintextPacking?, AspireSimilarityPlaintextPacking?));
    goto LABEL_10;
  }
  uint64_t v36 = (uint64_t)v50;
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v31, (uint64_t)v50, type metadata accessor for AspireSimilarityPlaintextPacking);
  char v37 = specialized static AspireSimilarityPlaintextPacking.== infix(_:_:)(v33, v36);
  outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v36, type metadata accessor for AspireSimilarityPlaintextPacking);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v48, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v49, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v33, type metadata accessor for AspireSimilarityPlaintextPacking);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v30, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  if (v37) {
    goto LABEL_13;
  }
LABEL_10:
  char v34 = 0;
  return v34 & 1;
}

uint64_t specialized static AspireSimilaritySerializedProcessedSimilarityDb.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v55 = type metadata accessor for UnknownStorage();
  uint64_t v58 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v57 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v56 = (char *)&v48 - v6;
  uint64_t v7 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v59 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (unsigned __int8 *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AspireSimilaritySimilarityServerConfig?, AspireSimilaritySimilarityServerConfig?));
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (unsigned __int8 *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  char v18 = (char *)&v48 - v17;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v48 - v20;
  if ((specialized static Array<A>.== infix(_:_:)(*(void *)a1, *(void *)a2) & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v53 = v18;
  v54 = v21;
  uint64_t v50 = v9;
  uint64_t v51 = v15;
  uint64_t v22 = v59;
  v52 = v12;
  if (!specialized static Array<A>.== infix(_:_:)(*(void **)(a1 + 8), *(void **)(a2 + 8))) {
    goto LABEL_10;
  }
  uint64_t v23 = a2;
  if ((specialized static Array<A>.== infix(_:_:)(*(void *)(a1 + 16), *(void *)(a2 + 16)) & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v24 = type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb(0);
  uint64_t v25 = (uint64_t)v54;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1 + *(int *)(v24 + 32), (uint64_t)v54, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  uint64_t v26 = *(int *)(v24 + 32);
  uint64_t v49 = v23;
  uint64_t v27 = (uint64_t)v53;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v23 + v26, (uint64_t)v53, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  uint64_t v28 = (uint64_t)v52;
  uint64_t v29 = (uint64_t)&v52[*(int *)(v10 + 48)];
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v25, (uint64_t)v52, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v27, v29, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  uint64_t v30 = v22;
  uint64_t v31 = v28;
  uint64_t v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48);
  if (v32(v31, 1, v7) == 1)
  {
    uint64_t v59 = v24;
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v27, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v25, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
    if (v32(v29, 1, v7) == 1)
    {
      outlined destroy of AMDPbHEConfig.OneOf_Config?(v31, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
LABEL_13:
      uint64_t v40 = v59;
      uint64_t v41 = v58;
      uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
      uint64_t v43 = v55;
      uint64_t v44 = v56;
      v42(v56, a1 + *(int *)(v59 + 28), v55);
      uint64_t v45 = v49 + *(int *)(v40 + 28);
      uint64_t v46 = v57;
      v42(v57, v45, v43);
      _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, MEMORY[0x263F50560]);
      char v36 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v47 = *(void (**)(char *, uint64_t))(v41 + 8);
      v47(v46, v43);
      v47(v44, v43);
      return v36 & 1;
    }
    goto LABEL_9;
  }
  uint64_t v33 = v31;
  uint64_t v34 = v31;
  int v35 = v51;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v33, (uint64_t)v51, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  if (v32(v29, 1, v7) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v53, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v54, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v35, type metadata accessor for AspireSimilaritySimilarityServerConfig);
    uint64_t v31 = v34;
LABEL_9:
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v31, &demangling cache variable for type metadata for (AspireSimilaritySimilarityServerConfig?, AspireSimilaritySimilarityServerConfig?));
    goto LABEL_10;
  }
  uint64_t v59 = v24;
  uint64_t v38 = v50;
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v29, (uint64_t)v50, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  char v39 = specialized static AspireSimilaritySimilarityServerConfig.== infix(_:_:)(v35, v38);
  outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v38, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v53, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v54, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v35, type metadata accessor for AspireSimilaritySimilarityServerConfig);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v34, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  if (v39) {
    goto LABEL_13;
  }
LABEL_10:
  char v36 = 0;
  return v36 & 1;
}

uint64_t specialized static AspireSimilaritySimilarityDbRow.== infix(_:_:)(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v16 - v9;
  if (*(void *)a1 == *(void *)a2
    && (specialized static Data.== infix(_:_:)(*((void *)a1 + 1), *((void *)a1 + 2), *((void *)a2 + 1), *((void *)a2 + 2)) & 1) != 0&& specialized static Array<A>.== infix(_:_:)(*((void *)a1 + 3), *((void *)a2 + 3)))
  {
    uint64_t v11 = type metadata accessor for AspireSimilaritySimilarityDbRow(0);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, &a1[*(int *)(v11 + 28)], v4);
    v12(v7, &a2[*(int *)(v11 + 28)], v4);
    _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, MEMORY[0x263F50560]);
    char v13 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v7, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t specialized static AspireSimilaritySimilarityDb.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v16 - v9;
  if (specialized static Array<A>.== infix(_:_:)(*a1, *a2))
  {
    uint64_t v11 = type metadata accessor for AspireSimilaritySimilarityDb(0);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, (char *)a1 + *(int *)(v11 + 20), v4);
    v12(v7, (char *)a2 + *(int *)(v11 + 20), v4);
    _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, MEMORY[0x263F50560]);
    char v13 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v7, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t specialized static AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v35 = (uint64_t)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AspireSimilarityPlaintextPackingDiagonal(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v34 = (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPackingDenseRow(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v34 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v34 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType, AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType));
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v23 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = (uint64_t)&v23[*(int *)(v21 + 56)];
  outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(a1, (uint64_t)v23, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  outlined init with copy of AspireSimilarityPlaintextPackingDenseRow(a2, v24, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      outlined init with copy of AspireSimilarityPlaintextPackingDenseRow((uint64_t)v23, (uint64_t)v17, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v26 = v34;
        _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v24, v34, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
        type metadata accessor for UnknownStorage();
        _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, MEMORY[0x263F50560]);
        char v27 = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v28 = type metadata accessor for AspireSimilarityPlaintextPackingDiagonal;
        outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v26, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
        uint64_t v29 = (uint64_t)v17;
LABEL_13:
        outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v29, v28);
        outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v23, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
        return v27 & 1;
      }
      uint64_t v30 = type metadata accessor for AspireSimilarityPlaintextPackingDiagonal;
      uint64_t v31 = (uint64_t)v17;
    }
    else
    {
      outlined init with copy of AspireSimilarityPlaintextPackingDenseRow((uint64_t)v23, (uint64_t)v14, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v32 = v35;
        _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v24, v35, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
        type metadata accessor for UnknownStorage();
        _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, MEMORY[0x263F50560]);
        char v27 = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v28 = type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn;
        outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v32, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
        uint64_t v29 = (uint64_t)v14;
        goto LABEL_13;
      }
      uint64_t v30 = type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn;
      uint64_t v31 = (uint64_t)v14;
    }
  }
  else
  {
    outlined init with copy of AspireSimilarityPlaintextPackingDenseRow((uint64_t)v23, (uint64_t)v19, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    if (!swift_getEnumCaseMultiPayload())
    {
      _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v24, (uint64_t)v10, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
      type metadata accessor for UnknownStorage();
      _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, MEMORY[0x263F50560]);
      char v27 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v28 = type metadata accessor for AspireSimilarityPlaintextPackingDenseRow;
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v10, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
      uint64_t v29 = (uint64_t)v19;
      goto LABEL_13;
    }
    uint64_t v30 = type metadata accessor for AspireSimilarityPlaintextPackingDenseRow;
    uint64_t v31 = (uint64_t)v19;
  }
  outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v31, v30);
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v23, &demangling cache variable for type metadata for (AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType, AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType));
  char v27 = 0;
  return v27 & 1;
}

uint64_t type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix(uint64_t a1)
{
  return type metadata accessor for AMDPbHEConfigsReply(a1, (uint64_t *)&type metadata singleton initialization cache for AspireSimilaritySerializedDcrtPlaintextMatrix);
}

uint64_t type metadata accessor for AspireSimilaritySimilarityClientConfig(uint64_t a1)
{
  return type metadata accessor for AMDPbHEConfigsReply(a1, (uint64_t *)&type metadata singleton initialization cache for AspireSimilaritySimilarityClientConfig);
}

uint64_t type metadata accessor for AspireSimilaritySimilarityServerConfig(uint64_t a1)
{
  return type metadata accessor for AMDPbHEConfigsReply(a1, (uint64_t *)&type metadata singleton initialization cache for AspireSimilaritySimilarityServerConfig);
}

uint64_t type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb(uint64_t a1)
{
  return type metadata accessor for AMDPbHEConfigsReply(a1, (uint64_t *)&type metadata singleton initialization cache for AspireSimilaritySerializedProcessedSimilarityDb);
}

uint64_t type metadata accessor for AspireSimilaritySimilarityDbRow(uint64_t a1)
{
  return type metadata accessor for AMDPbHEConfigsReply(a1, (uint64_t *)&type metadata singleton initialization cache for AspireSimilaritySimilarityDbRow);
}

uint64_t type metadata accessor for AspireSimilaritySimilarityDb(uint64_t a1)
{
  return type metadata accessor for AMDPbHEConfigsReply(a1, (uint64_t *)&type metadata singleton initialization cache for AspireSimilaritySimilarityDb);
}

uint64_t type metadata accessor for AspireSimilarityPecPreprocessDbArgs(uint64_t a1)
{
  return type metadata accessor for AMDPbHEConfigsReply(a1, (uint64_t *)&type metadata singleton initialization cache for AspireSimilarityPecPreprocessDbArgs);
}

uint64_t type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(uint64_t a1)
{
  return type metadata accessor for AMDPbHEConfigsReply(a1, (uint64_t *)&type metadata singleton initialization cache for AspireSimilarityPecPreprocessDbArgs._StorageClass);
}

uint64_t specialized static AspireSimilarityPlaintextPacking.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v42 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v41 = (char *)&v37 - v7;
  uint64_t v8 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v38 = (uint64_t)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?, AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?));
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v37 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v37 - v22;
  uint64_t v39 = a1;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1, (uint64_t)&v37 - v22, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v40 = a2;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a2, (uint64_t)v21, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v24 = (uint64_t)&v14[*(int *)(v12 + 56)];
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v23, (uint64_t)v14, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v21, v24, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v25((uint64_t)v14, 1, v8) != 1)
  {
    outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v14, (uint64_t)v18, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    if (v25(v24, 1, v8) != 1)
    {
      uint64_t v26 = v38;
      _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v24, v38, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
      char v27 = specialized static AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType.== infix(_:_:)((uint64_t)v18, v26);
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v26, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
      outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v21, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
      outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v23, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v18, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
      outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v14, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
      if (v27) {
        goto LABEL_8;
      }
LABEL_9:
      char v34 = 0;
      return v34 & 1;
    }
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v21, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v23, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v18, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
LABEL_6:
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v14, &demangling cache variable for type metadata for (AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?, AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?));
    goto LABEL_9;
  }
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v21, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v23, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  if (v25(v24, 1, v8) != 1) {
    goto LABEL_6;
  }
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v14, &demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
LABEL_8:
  uint64_t v28 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v30 = v43;
  uint64_t v29 = v44;
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 16);
  uint64_t v32 = v41;
  v31(v41, v39 + *(int *)(v28 + 20), v44);
  uint64_t v33 = v42;
  v31(v42, v40 + *(int *)(v28 + 20), v29);
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, MEMORY[0x263F50560]);
  char v34 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v35 = *(void (**)(char *, uint64_t))(v30 + 8);
  v35(v33, v29);
  v35(v32, v29);
  return v34 & 1;
}

uint64_t specialized static AspireSimilaritySimilarityServerConfig.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v80 = a1;
  v81 = a2;
  uint64_t v2 = type metadata accessor for UnknownStorage();
  uint64_t v69 = *(void *)(v2 - 8);
  uint64_t v70 = v2;
  MEMORY[0x270FA5388](v2);
  v68 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v67 = (char *)&v66 - v5;
  uint64_t v6 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v75 = *(void *)(v6 - 8);
  uint64_t v76 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v71 = (uint64_t)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AspireSimilarityPlaintextPacking?, AspireSimilarityPlaintextPacking?));
  MEMORY[0x270FA5388](v73);
  uint64_t v77 = (uint64_t)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v72 = (uint64_t)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v79 = (uint64_t)&v66 - v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v74 = (uint64_t)&v66 - v14;
  uint64_t v15 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (uint64_t *)((char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AspireSimilaritySimilarityClientConfig?, AspireSimilaritySimilarityClientConfig?));
  uint64_t v20 = v19 - 8;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (uint64_t *)((char *)&v66 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v66 - v27;
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)&v66 - v30;
  uint64_t v32 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)&v80[*(int *)(v32 + 24)], (uint64_t)v31, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  int v78 = (int *)v32;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)&v81[*(int *)(v32 + 24)], (uint64_t)v28, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  uint64_t v33 = (uint64_t)&v22[*(int *)(v20 + 56)];
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v31, (uint64_t)v22, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v28, v33, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  char v34 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  if (v34((uint64_t)v22, 1, v15) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v28, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v31, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
    if (v34(v33, 1, v15) == 1)
    {
      outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v22, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v35 = &demangling cache variable for type metadata for (AspireSimilaritySimilarityClientConfig?, AspireSimilaritySimilarityClientConfig?);
    uint64_t v36 = (uint64_t)v22;
LABEL_14:
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v36, v35);
    goto LABEL_15;
  }
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v22, (uint64_t)v25, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  if (v34(v33, 1, v15) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v28, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v31, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v25, type metadata accessor for AspireSimilaritySimilarityClientConfig);
    goto LABEL_6;
  }
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v33, (uint64_t)v18, type metadata accessor for AspireSimilaritySimilarityClientConfig);
  char v37 = specialized static AspireSimilaritySimilarityClientConfig.== infix(_:_:)(v25, v18);
  outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v18, type metadata accessor for AspireSimilaritySimilarityClientConfig);
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v28, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v31, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v25, type metadata accessor for AspireSimilaritySimilarityClientConfig);
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v22, &demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  if ((v37 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v38 = v78;
  uint64_t v39 = v80;
  uint64_t v40 = v74;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)&v80[v78[7]], v74, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v41 = v81;
  uint64_t v42 = v79;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)&v81[v38[7]], v79, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v43 = v77;
  uint64_t v44 = v77 + *(int *)(v73 + 48);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v40, v77, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v42, v44, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v45 = v76;
  uint64_t v46 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v75 + 48);
  if (v46(v43, 1, v76) != 1)
  {
    uint64_t v47 = v72;
    outlined init with copy of AMDPbHEConfig.OneOf_Config?(v43, v72, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    if (v46(v44, 1, v45) != 1)
    {
      uint64_t v50 = v71;
      _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v44, v71, type metadata accessor for AspireSimilarityPlaintextPacking);
      char v51 = specialized static AspireSimilarityPlaintextPacking.== infix(_:_:)(v47, v50);
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v50, type metadata accessor for AspireSimilarityPlaintextPacking);
      outlined destroy of AMDPbHEConfig.OneOf_Config?(v79, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      outlined destroy of AMDPbHEConfig.OneOf_Config?(v40, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v47, type metadata accessor for AspireSimilarityPlaintextPacking);
      outlined destroy of AMDPbHEConfig.OneOf_Config?(v43, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      if ((v51 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_18;
    }
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v79, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v40, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v47, type metadata accessor for AspireSimilarityPlaintextPacking);
    goto LABEL_13;
  }
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v42, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v40, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  if (v46(v44, 1, v45) != 1)
  {
LABEL_13:
    uint64_t v35 = &demangling cache variable for type metadata for (AspireSimilarityPlaintextPacking?, AspireSimilarityPlaintextPacking?);
    uint64_t v36 = v43;
    goto LABEL_14;
  }
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v43, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
LABEL_18:
  if (*v39 == *v41)
  {
    uint64_t v52 = v78[8];
    uint64_t v53 = &v39[v52];
    unsigned __int8 v54 = v39[v52 + 4];
    uint64_t v55 = &v41[v52];
    int v56 = v41[v52 + 4];
    if (v54)
    {
      if (v56)
      {
LABEL_25:
        uint64_t v57 = v78;
        uint64_t v58 = &v39[v78[5]];
        uint64_t v60 = v69;
        uint64_t v59 = v70;
        uint64_t v61 = *(void (**)(char *, unsigned __int8 *, uint64_t))(v69 + 16);
        v62 = v67;
        v61(v67, v58, v70);
        uint64_t v63 = &v41[v57[5]];
        v64 = v68;
        v61(v68, v63, v59);
        _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, MEMORY[0x263F50560]);
        char v48 = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v65 = *(void (**)(char *, uint64_t))(v60 + 8);
        v65(v64, v59);
        v65(v62, v59);
        return v48 & 1;
      }
    }
    else
    {
      if (*(_DWORD *)v53 != *(_DWORD *)v55) {
        LOBYTE(v56) = 1;
      }
      if ((v56 & 1) == 0) {
        goto LABEL_25;
      }
    }
  }
LABEL_15:
  char v48 = 0;
  return v48 & 1;
}

uint64_t specialized static AspireSimilaritySimilarityClientConfig.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v76 = a1;
  uint64_t v77 = a2;
  uint64_t v2 = type metadata accessor for UnknownStorage();
  uint64_t v65 = *(void *)(v2 - 8);
  uint64_t v66 = v2;
  MEMORY[0x270FA5388](v2);
  v64 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v63 = (char *)&v62 - v5;
  uint64_t v6 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v70 = *(void *)(v6 - 8);
  uint64_t v71 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v67 = (uint64_t)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AspireSimilarityPlaintextPacking?, AspireSimilarityPlaintextPacking?));
  MEMORY[0x270FA5388](v69);
  uint64_t v72 = (uint64_t)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v68 = (uint64_t)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v74 = (uint64_t)&v62 - v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v75 = (uint64_t)&v62 - v14;
  uint64_t v15 = type metadata accessor for AspireHeEncryptionParameters(0);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AspireHeEncryptionParameters?, AspireHeEncryptionParameters?));
  uint64_t v20 = v19 - 8;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v62 - v27;
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)&v62 - v30;
  uint64_t v32 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v76 + *(int *)(v32 + 40), (uint64_t)v31, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  uint64_t v73 = v32;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v77 + *(int *)(v32 + 40), (uint64_t)v28, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  uint64_t v33 = (uint64_t)&v22[*(int *)(v20 + 56)];
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v31, (uint64_t)v22, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v28, v33, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  char v34 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  if (v34((uint64_t)v22, 1, v15) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v28, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v31, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
    if (v34(v33, 1, v15) == 1)
    {
      outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v22, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
      goto LABEL_9;
    }
LABEL_6:
    uint64_t v35 = &demangling cache variable for type metadata for (AspireHeEncryptionParameters?, AspireHeEncryptionParameters?);
    uint64_t v36 = (uint64_t)v22;
LABEL_7:
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v36, v35);
    goto LABEL_28;
  }
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v22, (uint64_t)v25, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  if (v34(v33, 1, v15) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v28, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v31, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v25, type metadata accessor for AspireHeEncryptionParameters);
    goto LABEL_6;
  }
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v33, (uint64_t)v18, type metadata accessor for AspireHeEncryptionParameters);
  char v37 = specialized static AspireHeEncryptionParameters.== infix(_:_:)((uint64_t)v25, (uint64_t)v18);
  outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v18, type metadata accessor for AspireHeEncryptionParameters);
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v28, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v31, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v25, type metadata accessor for AspireHeEncryptionParameters);
  outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v22, &demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  if ((v37 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_9:
  uint64_t v39 = v76;
  uint64_t v38 = v77;
  if (*v76 != *v77) {
    goto LABEL_28;
  }
  uint64_t v40 = v73;
  uint64_t v41 = v75;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v76 + *(int *)(v73 + 44), v75, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v42 = v74;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?((uint64_t)v38 + *(int *)(v40 + 44), v74, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v43 = v72;
  uint64_t v44 = v72 + *(int *)(v69 + 48);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v41, v72, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v42, v44, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v45 = v71;
  uint64_t v46 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48);
  if (v46(v43, 1, v71) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v42, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v41, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    if (v46(v44, 1, v45) == 1)
    {
      outlined destroy of AMDPbHEConfig.OneOf_Config?(v43, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  uint64_t v47 = v68;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v43, v68, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  if (v46(v44, 1, v45) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v74, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v75, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v47, type metadata accessor for AspireSimilarityPlaintextPacking);
LABEL_15:
    uint64_t v35 = &demangling cache variable for type metadata for (AspireSimilarityPlaintextPacking?, AspireSimilarityPlaintextPacking?);
    uint64_t v36 = v43;
    goto LABEL_7;
  }
  uint64_t v48 = v67;
  _s8CipherML32AspireSimilarityPlaintextPackingVWObTm_0(v44, v67, type metadata accessor for AspireSimilarityPlaintextPacking);
  char v49 = specialized static AspireSimilarityPlaintextPacking.== infix(_:_:)(v47, v48);
  outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v48, type metadata accessor for AspireSimilarityPlaintextPacking);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v74, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v75, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v47, type metadata accessor for AspireSimilarityPlaintextPacking);
  outlined destroy of AMDPbHEConfig.OneOf_Config?(v43, (uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  if ((v49 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_17:
  if (*((_DWORD *)v39 + 2) != *((_DWORD *)v38 + 2) || !specialized static Array<A>.== infix(_:_:)(v39[2], v38[2])) {
    goto LABEL_28;
  }
  if (v39[4])
  {
    if (v38[4]) {
      goto LABEL_26;
    }
    uint64_t v50 = 0;
LABEL_25:
    if (v50 == v38[3]) {
      goto LABEL_26;
    }
LABEL_28:
    char v59 = 0;
    return v59 & 1;
  }
  uint64_t v50 = v39[3];
  if ((v38[4] & 1) == 0) {
    goto LABEL_25;
  }
  if (v50) {
    goto LABEL_28;
  }
LABEL_26:
  if (!specialized static Array<A>.== infix(_:_:)((void *)v39[5], (void *)v38[5])) {
    goto LABEL_28;
  }
  uint64_t v51 = v73;
  uint64_t v52 = (char *)v39 + *(int *)(v73 + 36);
  uint64_t v54 = v65;
  uint64_t v53 = v66;
  uint64_t v55 = *(void (**)(char *, char *, uint64_t))(v65 + 16);
  int v56 = v63;
  v55(v63, v52, v66);
  uint64_t v57 = (char *)v38 + *(int *)(v51 + 36);
  uint64_t v58 = v64;
  v55(v64, v57, v53);
  _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, MEMORY[0x263F50560]);
  char v59 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v60 = *(void (**)(char *, uint64_t))(v54 + 8);
  v60(v58, v53);
  v60(v56, v53);
  return v59 & 1;
}

uint64_t specialized AspireSimilarityPecPreprocessDbArgs._StorageClass.init(copying:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v57 = (uint64_t)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)(v1 + 48) = 0u;
  uint64_t v55 = (void *)(v1 + 48);
  *(_OWORD *)(v1 + 32) = 0u;
  uint64_t v6 = (void *)(v1 + 32);
  *(_OWORD *)(v1 + 16) = 0u;
  uint64_t v7 = v1
     + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig;
  uint64_t v56 = v1
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig;
  uint64_t v8 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = (void *)(v1
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryID);
  *uint64_t v9 = 0;
  v9[1] = 0;
  uint64_t v10 = (void *)(v1
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryMetadataID);
  *uint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = (void *)(v1
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__embeddingID);
  uint64_t v58 = v11;
  *uint64_t v11 = 0;
  v11[1] = 0;
  uint64_t v12 = (void *)(v1
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__shardID);
  char v59 = v12;
  *uint64_t v12 = 0;
  v12[1] = 0;
  uint64_t v13 = (void *)(v1
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__predefinedEncryptionParameters);
  uint64_t v60 = v13;
  *uint64_t v13 = 0;
  v13[1] = 0;
  uint64_t v14 = v1
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
  uint64_t v61 = v14;
  *(void *)uint64_t v14 = 0;
  *(_WORD *)(v14 + 8) = 256;
  uint64_t v62 = (void *)(v1
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__extraPlaintextModuli);
  void *v62 = MEMORY[0x263F8EE78];
  uint64_t v15 = v1
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
  uint64_t v63 = v15;
  *(_DWORD *)uint64_t v15 = 0;
  *(unsigned char *)(v15 + 4) = 1;
  v64 = (unsigned char *)(v1
                + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel);
  unsigned char *v64 = 2;
  swift_beginAccess();
  uint64_t v16 = a1[2];
  uint64_t v17 = a1[3];
  swift_beginAccess();
  *(void *)(v1 + 16) = v16;
  *(void *)(v1 + 24) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v19 = a1[4];
  uint64_t v18 = a1[5];
  swift_beginAccess();
  *uint64_t v6 = v19;
  *(void *)(v2 + 40) = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v21 = a1[6];
  uint64_t v20 = a1[7];
  uint64_t v22 = v55;
  swift_beginAccess();
  *uint64_t v22 = v21;
  *(void *)(v2 + 56) = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = (uint64_t)a1
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__inputServerConfig;
  swift_beginAccess();
  uint64_t v24 = v57;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(v23, v57, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  uint64_t v25 = v56;
  swift_beginAccess();
  outlined assign with take of AMDPbHEConfig.OneOf_Config?(v24, v25, &demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  swift_endAccess();
  uint64_t v26 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryID);
  swift_beginAccess();
  uint64_t v28 = *v26;
  uint64_t v27 = v26[1];
  swift_beginAccess();
  *uint64_t v9 = v28;
  v9[1] = v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryMetadataID);
  swift_beginAccess();
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  swift_beginAccess();
  *uint64_t v10 = v31;
  v10[1] = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__embeddingID);
  swift_beginAccess();
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  uint64_t v35 = v58;
  swift_beginAccess();
  *uint64_t v35 = v34;
  v35[1] = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v36 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__shardID);
  swift_beginAccess();
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  uint64_t v39 = v59;
  swift_beginAccess();
  void *v39 = v38;
  v39[1] = v37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__predefinedEncryptionParameters);
  swift_beginAccess();
  uint64_t v42 = *v40;
  uint64_t v41 = v40[1];
  uint64_t v43 = v60;
  swift_beginAccess();
  *uint64_t v43 = v42;
  v43[1] = v41;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v44 = (char *)a1
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__heScheme;
  swift_beginAccess();
  uint64_t v45 = *(void *)v44;
  LOBYTE(v42) = v44[8];
  LOBYTE(v44) = v44[9];
  uint64_t v46 = v61;
  swift_beginAccess();
  *(void *)uint64_t v46 = v45;
  *(unsigned char *)(v46 + 8) = v42;
  *(unsigned char *)(v46 + 9) = (_BYTE)v44;
  uint64_t v47 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__extraPlaintextModuli);
  swift_beginAccess();
  uint64_t v48 = *v47;
  char v49 = v62;
  swift_beginAccess();
  *char v49 = v48;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v50 = (char *)a1
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__babyStep;
  swift_beginAccess();
  LODWORD(v45) = *(_DWORD *)v50;
  LOBYTE(v50) = v50[4];
  uint64_t v51 = v63;
  swift_beginAccess();
  *(_DWORD *)uint64_t v51 = v45;
  *(unsigned char *)(v51 + 4) = (_BYTE)v50;
  uint64_t v52 = (char *)a1
      + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel;
  swift_beginAccess();
  LOBYTE(v52) = *v52;
  uint64_t v53 = v64;
  swift_beginAccess();
  *uint64_t v53 = (_BYTE)v52;
  return v2;
}

uint64_t outlined init with take of AspireSimilaritySimilarityServerConfig?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t lazy protocol witness table accessor for type [AspireSimilaritySimilarityMetric] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [AspireSimilaritySimilarityMetric] and conformance [A];
  if (!lazy protocol witness table cache variable for type [AspireSimilaritySimilarityMetric] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AspireSimilaritySimilarityMetric]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [AspireSimilaritySimilarityMetric] and conformance [A]);
  }
  return result;
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AspireSimilarityPlaintextPacking()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPacking and conformance AspireSimilarityPlaintextPacking, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
}

uint64_t base witness table accessor for Message in AspireSimilarityPlaintextPacking()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPacking and conformance AspireSimilarityPlaintextPacking, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
}

uint64_t base witness table accessor for Hashable in AspireSimilarityPlaintextPacking()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPacking and conformance AspireSimilarityPlaintextPacking, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
}

uint64_t base witness table accessor for Equatable in AspireSimilarityPlaintextPacking()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPacking and conformance AspireSimilarityPlaintextPacking, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AspireSimilarityPlaintextPackingDenseRow()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseRow and conformance AspireSimilarityPlaintextPackingDenseRow, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
}

uint64_t base witness table accessor for Message in AspireSimilarityPlaintextPackingDenseRow()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseRow and conformance AspireSimilarityPlaintextPackingDenseRow, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
}

uint64_t base witness table accessor for Hashable in AspireSimilarityPlaintextPackingDenseRow()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseRow and conformance AspireSimilarityPlaintextPackingDenseRow, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
}

uint64_t base witness table accessor for Equatable in AspireSimilarityPlaintextPackingDenseRow()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseRow and conformance AspireSimilarityPlaintextPackingDenseRow, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AspireSimilarityPlaintextPackingDiagonal()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDiagonal and conformance AspireSimilarityPlaintextPackingDiagonal, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
}

uint64_t base witness table accessor for Message in AspireSimilarityPlaintextPackingDiagonal()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDiagonal and conformance AspireSimilarityPlaintextPackingDiagonal, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
}

uint64_t base witness table accessor for Hashable in AspireSimilarityPlaintextPackingDiagonal()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDiagonal and conformance AspireSimilarityPlaintextPackingDiagonal, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
}

uint64_t base witness table accessor for Equatable in AspireSimilarityPlaintextPackingDiagonal()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDiagonal and conformance AspireSimilarityPlaintextPackingDiagonal, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AspireSimilarityPlaintextPackingDenseColumn()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseColumn and conformance AspireSimilarityPlaintextPackingDenseColumn, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
}

uint64_t base witness table accessor for Message in AspireSimilarityPlaintextPackingDenseColumn()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseColumn and conformance AspireSimilarityPlaintextPackingDenseColumn, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
}

uint64_t base witness table accessor for Hashable in AspireSimilarityPlaintextPackingDenseColumn()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseColumn and conformance AspireSimilarityPlaintextPackingDenseColumn, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
}

uint64_t base witness table accessor for Equatable in AspireSimilarityPlaintextPackingDenseColumn()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPlaintextPackingDenseColumn and conformance AspireSimilarityPlaintextPackingDenseColumn, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AspireSimilaritySerializedCiphertextMatrix()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedCiphertextMatrix and conformance AspireSimilaritySerializedCiphertextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
}

uint64_t base witness table accessor for Message in AspireSimilaritySerializedCiphertextMatrix()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedCiphertextMatrix and conformance AspireSimilaritySerializedCiphertextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
}

uint64_t base witness table accessor for Hashable in AspireSimilaritySerializedCiphertextMatrix()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedCiphertextMatrix and conformance AspireSimilaritySerializedCiphertextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
}

uint64_t base witness table accessor for Equatable in AspireSimilaritySerializedCiphertextMatrix()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedCiphertextMatrix and conformance AspireSimilaritySerializedCiphertextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AspireSimilaritySerializedDcrtPlaintextMatrix()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedDcrtPlaintextMatrix and conformance AspireSimilaritySerializedDcrtPlaintextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
}

uint64_t base witness table accessor for Message in AspireSimilaritySerializedDcrtPlaintextMatrix()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedDcrtPlaintextMatrix and conformance AspireSimilaritySerializedDcrtPlaintextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
}

uint64_t base witness table accessor for Hashable in AspireSimilaritySerializedDcrtPlaintextMatrix()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedDcrtPlaintextMatrix and conformance AspireSimilaritySerializedDcrtPlaintextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
}

uint64_t base witness table accessor for Equatable in AspireSimilaritySerializedDcrtPlaintextMatrix()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedDcrtPlaintextMatrix and conformance AspireSimilaritySerializedDcrtPlaintextMatrix, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AspireSimilaritySimilarityClientConfig()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityClientConfig and conformance AspireSimilaritySimilarityClientConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityClientConfig);
}

uint64_t base witness table accessor for Message in AspireSimilaritySimilarityClientConfig()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityClientConfig and conformance AspireSimilaritySimilarityClientConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityClientConfig);
}

uint64_t base witness table accessor for Hashable in AspireSimilaritySimilarityClientConfig()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityClientConfig and conformance AspireSimilaritySimilarityClientConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityClientConfig);
}

uint64_t base witness table accessor for Equatable in AspireSimilaritySimilarityClientConfig()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityClientConfig and conformance AspireSimilaritySimilarityClientConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityClientConfig);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AspireSimilaritySimilarityServerConfig()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityServerConfig and conformance AspireSimilaritySimilarityServerConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityServerConfig);
}

uint64_t base witness table accessor for Message in AspireSimilaritySimilarityServerConfig()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityServerConfig and conformance AspireSimilaritySimilarityServerConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityServerConfig);
}

uint64_t base witness table accessor for Hashable in AspireSimilaritySimilarityServerConfig()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityServerConfig and conformance AspireSimilaritySimilarityServerConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityServerConfig);
}

uint64_t base witness table accessor for Equatable in AspireSimilaritySimilarityServerConfig()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityServerConfig and conformance AspireSimilaritySimilarityServerConfig, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityServerConfig);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AspireSimilaritySerializedProcessedSimilarityDb()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedProcessedSimilarityDb and conformance AspireSimilaritySerializedProcessedSimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb);
}

uint64_t base witness table accessor for Message in AspireSimilaritySerializedProcessedSimilarityDb()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedProcessedSimilarityDb and conformance AspireSimilaritySerializedProcessedSimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb);
}

uint64_t base witness table accessor for Hashable in AspireSimilaritySerializedProcessedSimilarityDb()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedProcessedSimilarityDb and conformance AspireSimilaritySerializedProcessedSimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb);
}

uint64_t base witness table accessor for Equatable in AspireSimilaritySerializedProcessedSimilarityDb()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySerializedProcessedSimilarityDb and conformance AspireSimilaritySerializedProcessedSimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySerializedProcessedSimilarityDb);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AspireSimilaritySimilarityDbRow()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDbRow and conformance AspireSimilaritySimilarityDbRow, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDbRow);
}

uint64_t base witness table accessor for Message in AspireSimilaritySimilarityDbRow()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDbRow and conformance AspireSimilaritySimilarityDbRow, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDbRow);
}

uint64_t base witness table accessor for Hashable in AspireSimilaritySimilarityDbRow()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDbRow and conformance AspireSimilaritySimilarityDbRow, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDbRow);
}

uint64_t base witness table accessor for Equatable in AspireSimilaritySimilarityDbRow()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDbRow and conformance AspireSimilaritySimilarityDbRow, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDbRow);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AspireSimilaritySimilarityDb()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDb and conformance AspireSimilaritySimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDb);
}

uint64_t base witness table accessor for Message in AspireSimilaritySimilarityDb()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDb and conformance AspireSimilaritySimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDb);
}

uint64_t base witness table accessor for Hashable in AspireSimilaritySimilarityDb()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDb and conformance AspireSimilaritySimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDb);
}

uint64_t base witness table accessor for Equatable in AspireSimilaritySimilarityDb()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilaritySimilarityDb and conformance AspireSimilaritySimilarityDb, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityDb);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in AspireSimilarityPecPreprocessDbArgs()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPecPreprocessDbArgs and conformance AspireSimilarityPecPreprocessDbArgs, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPecPreprocessDbArgs);
}

uint64_t base witness table accessor for Message in AspireSimilarityPecPreprocessDbArgs()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPecPreprocessDbArgs and conformance AspireSimilarityPecPreprocessDbArgs, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPecPreprocessDbArgs);
}

uint64_t base witness table accessor for Hashable in AspireSimilarityPecPreprocessDbArgs()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPecPreprocessDbArgs and conformance AspireSimilarityPecPreprocessDbArgs, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPecPreprocessDbArgs);
}

uint64_t base witness table accessor for Equatable in AspireSimilarityPecPreprocessDbArgs()
{
  return _s21InternalSwiftProtobuf14UnknownStorageVACSQAAWlTm_2(&lazy protocol witness table cache variable for type AspireSimilarityPecPreprocessDbArgs and conformance AspireSimilarityPecPreprocessDbArgs, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPecPreprocessDbArgs);
}

uint64_t sub_249E6E290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AspireSimilarityPlaintextPacking.denseRow : AspireSimilarityPlaintextPacking(a1, a2, a3, a4, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow, type metadata accessor for AspireSimilarityPlaintextPackingDenseRow);
}

uint64_t sub_249E6E2EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AspireSimilarityPlaintextPacking.denseRow : AspireSimilarityPlaintextPacking(a1, a2, a3, a4, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal, type metadata accessor for AspireSimilarityPlaintextPackingDiagonal);
}

uint64_t sub_249E6E348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AspireSimilarityPlaintextPacking.denseRow : AspireSimilarityPlaintextPacking(a1, a2, a3, a4, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn, type metadata accessor for AspireSimilarityPlaintextPackingDenseColumn);
}

uint64_t sub_249E6E3A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return key path getter for AspireSimilaritySerializedCiphertextMatrix.packing : AspireSimilaritySerializedCiphertextMatrix(a1, (uint64_t (*)(void, double))type metadata accessor for AspireSimilaritySerializedCiphertextMatrix, a2);
}

uint64_t sub_249E6E3CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AspireSimilaritySerializedCiphertextMatrix.packing : AspireSimilaritySerializedCiphertextMatrix(a1, a2, a3, a4, type metadata accessor for AspireSimilaritySerializedCiphertextMatrix);
}

uint64_t sub_249E6E3F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return key path getter for AspireSimilaritySerializedCiphertextMatrix.packing : AspireSimilaritySerializedCiphertextMatrix(a1, (uint64_t (*)(void, double))type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix, a2);
}

uint64_t sub_249E6E424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AspireSimilaritySerializedCiphertextMatrix.packing : AspireSimilaritySerializedCiphertextMatrix(a1, a2, a3, a4, type metadata accessor for AspireSimilaritySerializedDcrtPlaintextMatrix);
}

uint64_t sub_249E6E450@<X0>(uint64_t a1@<X8>)
{
  return AspireSimilaritySimilarityClientConfig.encryptionParameters.getter(a1);
}

uint64_t sub_249E6E490@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v5 = (int *)(a1 + *(int *)(result + 32));
  if (*((unsigned char *)v5 + 4)) {
    int v6 = 0;
  }
  else {
    int v6 = *v5;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_249E6E4D8(int *a1, uint64_t a2)
{
  int v3 = *a1;
  uint64_t result = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v5 = a2 + *(int *)(result + 32);
  *(_DWORD *)uint64_t v5 = v3;
  *(unsigned char *)(v5 + 4) = 0;
  return result;
}

uint64_t sub_249E6E534@<X0>(unsigned char *a1@<X8>)
{
  return AspireSimilarityPecPreprocessDbArgs.inputServerConfig.getter(a1);
}

uint64_t sub_249E6E55C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return key path getter for AspireSimilarityPecPreprocessDbArgs.entryID : AspireSimilarityPecPreprocessDbArgs(a1, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryID, a2);
}

uint64_t sub_249E6E57C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AspireSimilarityPecPreprocessDbArgs.entryID : AspireSimilarityPecPreprocessDbArgs(a1, a2, a3, a4, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryID);
}

uint64_t sub_249E6E59C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return key path getter for AspireSimilarityPecPreprocessDbArgs.entryID : AspireSimilarityPecPreprocessDbArgs(a1, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryMetadataID, a2);
}

uint64_t sub_249E6E5BC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AspireSimilarityPecPreprocessDbArgs.entryID : AspireSimilarityPecPreprocessDbArgs(a1, a2, a3, a4, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__entryMetadataID);
}

uint64_t sub_249E6E5DC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return key path getter for AspireSimilarityPecPreprocessDbArgs.entryID : AspireSimilarityPecPreprocessDbArgs(a1, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__embeddingID, a2);
}

uint64_t sub_249E6E5FC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AspireSimilarityPecPreprocessDbArgs.entryID : AspireSimilarityPecPreprocessDbArgs(a1, a2, a3, a4, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__embeddingID);
}

uint64_t sub_249E6E61C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return key path getter for AspireSimilarityPecPreprocessDbArgs.entryID : AspireSimilarityPecPreprocessDbArgs(a1, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__shardID, a2);
}

uint64_t sub_249E6E63C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AspireSimilarityPecPreprocessDbArgs.entryID : AspireSimilarityPecPreprocessDbArgs(a1, a2, a3, a4, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__shardID);
}

uint64_t sub_249E6E65C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return key path getter for AspireSimilarityPecPreprocessDbArgs.entryID : AspireSimilarityPecPreprocessDbArgs(a1, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__predefinedEncryptionParameters, a2);
}

uint64_t sub_249E6E67C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AspireSimilarityPecPreprocessDbArgs.entryID : AspireSimilarityPecPreprocessDbArgs(a1, a2, a3, a4, &OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__predefinedEncryptionParameters);
}

uint64_t sub_249E6E6B4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  int v3 = (unsigned char *)(*(void *)(a1 + *(int *)(type metadata accessor for AspireSimilarityPecPreprocessDbArgs(0) + 20))
               + OBJC_IVAR____TtCV8CipherML35AspireSimilarityPecPreprocessDbArgsP33_4D7576BA24B7551E27E183CD62A8FB2B13_StorageClass__parallel);
  uint64_t result = swift_beginAccess();
  *a2 = *v3 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AspireSimilaritySimilarityMetric()
{
  return &type metadata for AspireSimilaritySimilarityMetric;
}

uint64_t *initializeBufferWithCopyOfBuffer for AspireSimilarityPlaintextPacking(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      swift_getEnumCaseMultiPayload();
      uint64_t v11 = type metadata accessor for UnknownStorage();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v12 = *(int *)(a3 + 20);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for AspireSimilarityPlaintextPacking(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4)
    && swift_getEnumCaseMultiPayload() <= 2)
  {
    uint64_t v5 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = type metadata accessor for UnknownStorage();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

char *initializeWithCopy for AspireSimilarityPlaintextPacking(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v9 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

char *assignWithCopy for AspireSimilarityPlaintextPacking(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      swift_getEnumCaseMultiPayload();
      uint64_t v11 = type metadata accessor for UnknownStorage();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
    goto LABEL_7;
  }
  if (v10)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)a1, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    goto LABEL_6;
  }
  if (a1 != a2)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)a1, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    swift_getEnumCaseMultiPayload();
    uint64_t v18 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(a1, a2, v18);
    swift_storeEnumTagMultiPayload();
  }
LABEL_7:
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

char *initializeWithTake for AspireSimilarityPlaintextPacking(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v9 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

char *assignWithTake for AspireSimilarityPlaintextPacking(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      swift_getEnumCaseMultiPayload();
      uint64_t v11 = type metadata accessor for UnknownStorage();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
    goto LABEL_7;
  }
  if (v10)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)a1, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    goto LABEL_6;
  }
  if (a1 != a2)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)a1, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    swift_getEnumCaseMultiPayload();
    uint64_t v18 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a1, a2, v18);
    swift_storeEnumTagMultiPayload();
  }
LABEL_7:
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AspireSimilarityPlaintextPacking(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249E6F3AC);
}

uint64_t sub_249E6F3AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for UnknownStorage();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for AspireSimilarityPlaintextPacking(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249E6F4BC);
}

uint64_t sub_249E6F4BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for UnknownStorage();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void type metadata completion function for AspireSimilarityPlaintextPacking()
{
  type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?(319, &lazy cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
  if (v0 <= 0x3F)
  {
    type metadata accessor for UnknownStorage();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v6 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result <= 2)
  {
    uint64_t v3 = type metadata accessor for UnknownStorage();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

uint64_t initializeWithCopy for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(a1, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(a1, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata completion function for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType()
{
  uint64_t result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AspireSimilarityPlaintextPackingDenseRow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_62Tm);
}

uint64_t storeEnumTagSinglePayload for AspireSimilarityPlaintextPackingDenseRow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_63Tm);
}

uint64_t getEnumTagSinglePayload for AspireSimilarityPlaintextPackingDiagonal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_62Tm_0);
}

uint64_t storeEnumTagSinglePayload for AspireSimilarityPlaintextPackingDiagonal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_63Tm_0);
}

uint64_t getEnumTagSinglePayload for AspireSimilarityPlaintextPackingDenseColumn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249E6FC4C);
}

uint64_t __swift_get_extra_inhabitant_index_62Tm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AspireSimilarityPlaintextPackingDenseColumn(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249E6FCD0);
}

uint64_t __swift_store_extra_inhabitant_index_63Tm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t getEnumTagSinglePayload for AspireSimilaritySerializedCiphertextMatrix(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_71Tm_0);
}

uint64_t storeEnumTagSinglePayload for AspireSimilaritySerializedCiphertextMatrix(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_72Tm_0);
}

void type metadata completion function for AspireSimilaritySerializedCiphertextMatrix(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for AspireSimilaritySerializedCiphertextMatrix(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    uint64_t *v4 = *a2;
    unint64_t v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    a1[1] = a2[1];
    uint64_t v7 = *(int *)(a3 + 28);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for UnknownStorage();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
    uint64_t v12 = *(int *)(a3 + 32);
    uint64_t v13 = (char *)v4 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      uint64_t v19 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
      uint64_t v20 = *(void *)(v19 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v14, 1, v19))
      {
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
        memcpy(v13, v14, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        swift_getEnumCaseMultiPayload();
        v11(v13, v14, v10);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v13, 0, 1, v19);
      }
      v11(&v13[*(int *)(v15 + 20)], &v14[*(int *)(v15 + 20)], v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
  }
  return v4;
}

uint64_t destroy for AspireSimilaritySerializedCiphertextMatrix(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v11(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t v7 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v6, 1, v9)
      && swift_getEnumCaseMultiPayload() <= 2)
    {
      v11(v6, v5);
    }
    uint64_t v10 = v6 + *(int *)(v7 + 20);
    return ((uint64_t (*)(uint64_t, uint64_t))v11)(v10, v5);
  }
  return result;
}

void *initializeWithCopy for AspireSimilaritySerializedCiphertextMatrix(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    uint64_t v17 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v13, 1, v17))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
      memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      swift_getEnumCaseMultiPayload();
      v10(v12, v13, v9);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v12, 0, 1, v17);
    }
    v10(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t assignWithCopy for AspireSimilaritySerializedCiphertextMatrix(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v38 = v9;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v37 + 24);
  v10(v7, v8);
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v39 = a1;
  uint64_t v12 = (char *)(a1 + v11);
  uint64_t v13 = (char *)(a2 + v11);
  uint64_t v14 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (!v17)
  {
    uint64_t v36 = v10;
    if (v18)
    {
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v12, type metadata accessor for AspireSimilarityPlaintextPacking);
      goto LABEL_7;
    }
    uint64_t v26 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v27 = *(void *)(v26 - 8);
    uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
    int v29 = v28(v12, 1, v26);
    int v30 = v28(v13, 1, v26);
    uint64_t v25 = v39;
    if (v29)
    {
      if (!v30)
      {
        swift_getEnumCaseMultiPayload();
        uint64_t v31 = v38;
        (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v12, v13, v38);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v12, 0, 1, v26);
LABEL_16:
        uint64_t v33 = (void (*)(char *, char *, uint64_t))v36;
LABEL_17:
        v33(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v31);
        return v25;
      }
    }
    else
    {
      if (!v30)
      {
        BOOL v35 = v39 == a2;
        uint64_t v31 = v38;
        uint64_t v33 = (void (*)(char *, char *, uint64_t))v36;
        if (!v35)
        {
          outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v12, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
          swift_getEnumCaseMultiPayload();
          (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v12, v13, v38);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_17;
      }
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v12, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    }
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v12, v13, *(void *)(*(void *)(v32 - 8) + 64));
    uint64_t v31 = v38;
    goto LABEL_16;
  }
  if (v18)
  {
LABEL_7:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v12, v13, *(void *)(*(void *)(v24 - 8) + 64));
    return v39;
  }
  uint64_t v19 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v13, 1, v19))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v12, v13, *(void *)(*(void *)(v21 - 8) + 64));
    uint64_t v22 = v38;
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v22 = v38;
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
    v23(v12, v13, v38);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v12, 0, 1, v19);
  }
  uint64_t v25 = v39;
  v23(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return v25;
}

void *initializeWithTake for AspireSimilaritySerializedCiphertextMatrix(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    uint64_t v17 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v13, 1, v17))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
      memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      swift_getEnumCaseMultiPayload();
      v10(v12, v13, v9);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v12, 0, 1, v17);
    }
    v10(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

void *assignWithTake for AspireSimilaritySerializedCiphertextMatrix(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v38 = v9;
  uint64_t v10 = *(void (**)(char *, char *))(v37 + 40);
  v10(v7, v8);
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v39 = a1;
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (!v17)
  {
    uint64_t v36 = v10;
    if (v18)
    {
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v12, type metadata accessor for AspireSimilarityPlaintextPacking);
      goto LABEL_7;
    }
    uint64_t v26 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v27 = *(void *)(v26 - 8);
    uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
    int v29 = v28(v12, 1, v26);
    int v30 = v28(v13, 1, v26);
    uint64_t v25 = v39;
    if (v29)
    {
      if (!v30)
      {
        swift_getEnumCaseMultiPayload();
        uint64_t v31 = v38;
        (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v12, v13, v38);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v12, 0, 1, v26);
LABEL_16:
        uint64_t v33 = (void (*)(char *, char *, uint64_t))v36;
LABEL_17:
        v33(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v31);
        return v25;
      }
    }
    else
    {
      if (!v30)
      {
        BOOL v35 = v39 == a2;
        uint64_t v31 = v38;
        uint64_t v33 = (void (*)(char *, char *, uint64_t))v36;
        if (!v35)
        {
          outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v12, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
          swift_getEnumCaseMultiPayload();
          (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v12, v13, v38);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_17;
      }
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v12, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    }
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v12, v13, *(void *)(*(void *)(v32 - 8) + 64));
    uint64_t v31 = v38;
    goto LABEL_16;
  }
  if (v18)
  {
LABEL_7:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v12, v13, *(void *)(*(void *)(v24 - 8) + 64));
    return v39;
  }
  uint64_t v19 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v13, 1, v19))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v12, v13, *(void *)(*(void *)(v21 - 8) + 64));
    uint64_t v22 = v38;
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v22 = v38;
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
    v23(v12, v13, v38);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v12, 0, 1, v19);
  }
  uint64_t v25 = v39;
  v23(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return v25;
}

uint64_t getEnumTagSinglePayload for AspireSimilaritySerializedDcrtPlaintextMatrix(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249E71218);
}

uint64_t __swift_get_extra_inhabitant_index_71Tm_0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for AspireSimilaritySerializedDcrtPlaintextMatrix(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249E71360);
}

uint64_t __swift_store_extra_inhabitant_index_72Tm_0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for AspireSimilaritySimilarityClientConfig(uint64_t a1, uint64_t *a2, int *a3)
{
  unint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    void *v4 = *a2;
    unint64_t v4 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(_DWORD *)(a1 + 8) = *((_DWORD *)a2 + 2);
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v8 = a3[9];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    *(void *)(a1 + 40) = a2[5];
    uint64_t v11 = type metadata accessor for UnknownStorage();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[10];
    uint64_t v14 = (_OWORD *)((char *)v4 + v13);
    uint64_t v15 = (_OWORD *)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for AspireHeEncryptionParameters(0);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      _OWORD *v14 = *v15;
      uint64_t v20 = *((void *)v15 + 3);
      *((void *)v14 + 2) = *((void *)v15 + 2);
      *((void *)v14 + 3) = v20;
      *((unsigned char *)v14 + 32) = *((unsigned char *)v15 + 32);
      *((void *)v14 + 5) = *((void *)v15 + 5);
      *((unsigned char *)v14 + 48) = *((unsigned char *)v15 + 48);
      *((void *)v14 + 7) = *((void *)v15 + 7);
      *((unsigned char *)v14 + 64) = *((unsigned char *)v15 + 64);
      uint64_t v21 = *(int *)(v16 + 40);
      uint64_t v22 = (char *)v14 + v21;
      uint64_t v23 = (char *)v15 + v21;
      swift_bridgeObjectRetain();
      v12((uint64_t)v22, (uint64_t)v23, v11);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    uint64_t v24 = a3[11];
    uint64_t v25 = (char *)v4 + v24;
    uint64_t v26 = (char *)a2 + v24;
    uint64_t v27 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      uint64_t v30 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
      uint64_t v31 = *(void *)(v30 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v26, 1, v30))
      {
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
        memcpy(v25, v26, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        swift_getEnumCaseMultiPayload();
        v12((uint64_t)v25, (uint64_t)v26, v11);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v25, 0, 1, v30);
      }
      v12((uint64_t)&v25[*(int *)(v27 + 20)], (uint64_t)&v26[*(int *)(v27 + 20)], v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
    }
  }
  return v4;
}

uint64_t destroy for AspireSimilaritySimilarityClientConfig(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[9];
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v13(v4, v5);
  uint64_t v6 = a1 + a2[10];
  uint64_t v7 = type metadata accessor for AspireHeEncryptionParameters(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7))
  {
    swift_bridgeObjectRelease();
    v13(v6 + *(int *)(v7 + 40), v5);
  }
  uint64_t v8 = a1 + a2[11];
  uint64_t v9 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9);
  if (!result)
  {
    uint64_t v11 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v8, 1, v11)
      && swift_getEnumCaseMultiPayload() <= 2)
    {
      v13(v8, v5);
    }
    uint64_t v12 = v8 + *(int *)(v9 + 20);
    return ((uint64_t (*)(uint64_t, uint64_t))v13)(v12, v5);
  }
  return result;
}

uint64_t initializeWithCopy for AspireSimilaritySimilarityClientConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v10 = type metadata accessor for UnknownStorage();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = v9;
  uint64_t v13 = a3;
  v11(v8, v12, v10);
  uint64_t v14 = *(int *)(a3 + 40);
  uint64_t v15 = (_OWORD *)(a1 + v14);
  uint64_t v16 = (_OWORD *)(a2 + v14);
  uint64_t v17 = type metadata accessor for AspireHeEncryptionParameters(0);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    *uint64_t v15 = *v16;
    uint64_t v20 = *((void *)v16 + 3);
    *((void *)v15 + 2) = *((void *)v16 + 2);
    *((void *)v15 + 3) = v20;
    *((unsigned char *)v15 + 32) = *((unsigned char *)v16 + 32);
    *((void *)v15 + 5) = *((void *)v16 + 5);
    *((unsigned char *)v15 + 48) = *((unsigned char *)v16 + 48);
    *((void *)v15 + 7) = *((void *)v16 + 7);
    *((unsigned char *)v15 + 64) = *((unsigned char *)v16 + 64);
    uint64_t v21 = *(int *)(v17 + 40);
    uint64_t v36 = v13;
    uint64_t v22 = (char *)v15 + v21;
    uint64_t v23 = (char *)v16 + v21;
    swift_bridgeObjectRetain();
    uint64_t v24 = v22;
    uint64_t v13 = v36;
    v11((uint64_t)v24, (uint64_t)v23, v10);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v25 = v10;
  uint64_t v26 = *(int *)(v13 + 44);
  uint64_t v27 = (char *)(a1 + v26);
  uint64_t v28 = (char *)(a2 + v26);
  uint64_t v29 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v30 = *(void *)(v29 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    uint64_t v32 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v28, 1, v32))
    {
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
      memcpy(v27, v28, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      swift_getEnumCaseMultiPayload();
      v11((uint64_t)v27, (uint64_t)v28, v25);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v27, 0, 1, v32);
    }
    v11((uint64_t)&v27[*(int *)(v29 + 20)], (uint64_t)&v28[*(int *)(v29 + 20)], v25);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  return a1;
}

uint64_t assignWithCopy for AspireSimilaritySimilarityClientConfig(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for UnknownStorage();
  uint64_t v52 = *(void *)(v10 - 8);
  uint64_t v53 = v10;
  uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v52 + 24);
  v51(v8, v9);
  uint64_t v11 = a3[10];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for AspireHeEncryptionParameters(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      *(void *)uint64_t v12 = *(void *)v13;
      *(void *)(v12 + 8) = *(void *)(v13 + 8);
      *(void *)(v12 + 16) = *(void *)(v13 + 16);
      uint64_t v19 = *(void *)(v13 + 24);
      *(unsigned char *)(v12 + 32) = *(unsigned char *)(v13 + 32);
      *(void *)(v12 + 24) = v19;
      uint64_t v20 = *(void *)(v13 + 40);
      *(unsigned char *)(v12 + 48) = *(unsigned char *)(v13 + 48);
      *(void *)(v12 + 40) = v20;
      uint64_t v21 = *(void *)(v13 + 56);
      *(unsigned char *)(v12 + 64) = *(unsigned char *)(v13 + 64);
      *(void *)(v12 + 56) = v21;
      uint64_t v22 = *(int *)(v14 + 40);
      uint64_t v23 = v12 + v22;
      uint64_t v24 = v13 + v22;
      uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16);
      swift_bridgeObjectRetain();
      v25(v23, v24, v53);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v12, type metadata accessor for AspireHeEncryptionParameters);
LABEL_6:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
    memcpy((void *)v12, (const void *)v13, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  *(void *)uint64_t v12 = *(void *)v13;
  *(void *)(v12 + 8) = *(void *)(v13 + 8);
  *(void *)(v12 + 16) = *(void *)(v13 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = *(void *)(v13 + 24);
  *(unsigned char *)(v12 + 32) = *(unsigned char *)(v13 + 32);
  *(void *)(v12 + 24) = v39;
  uint64_t v40 = *(void *)(v13 + 40);
  *(unsigned char *)(v12 + 48) = *(unsigned char *)(v13 + 48);
  *(void *)(v12 + 40) = v40;
  uint64_t v41 = *(void *)(v13 + 56);
  *(unsigned char *)(v12 + 64) = *(unsigned char *)(v13 + 64);
  *(void *)(v12 + 56) = v41;
  ((void (*)(uint64_t, uint64_t, uint64_t))v51)(v12 + *(int *)(v14 + 40), v13 + *(int *)(v14 + 40), v53);
LABEL_7:
  uint64_t v27 = a3[11];
  uint64_t v28 = (char *)(a1 + v27);
  uint64_t v29 = (char *)(a2 + v27);
  uint64_t v30 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48);
  int v33 = v32(v28, 1, v30);
  int v34 = v32(v29, 1, v30);
  if (!v33)
  {
    if (v34)
    {
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v28, type metadata accessor for AspireSimilarityPlaintextPacking);
      goto LABEL_13;
    }
    uint64_t v42 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v43 = *(void *)(v42 - 8);
    uint64_t v44 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v43 + 48);
    int v45 = v44(v28, 1, v42);
    int v46 = v44(v29, 1, v42);
    if (v45)
    {
      if (!v46)
      {
        swift_getEnumCaseMultiPayload();
        uint64_t v47 = v53;
        (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v28, v29, v53);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v28, 0, 1, v42);
LABEL_23:
        ((void (*)(char *, char *, uint64_t))v51)(&v28[*(int *)(v30 + 20)], &v29[*(int *)(v30 + 20)], v47);
        return a1;
      }
    }
    else
    {
      if (!v46)
      {
        uint64_t v47 = v53;
        if (a1 != a2)
        {
          outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v28, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
          swift_getEnumCaseMultiPayload();
          (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v28, v29, v53);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_23;
      }
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v28, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    }
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v28, v29, *(void *)(*(void *)(v49 - 8) + 64));
    uint64_t v47 = v53;
    goto LABEL_23;
  }
  if (v34)
  {
LABEL_13:
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v28, v29, *(void *)(*(void *)(v38 - 8) + 64));
    return a1;
  }
  uint64_t v35 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v36 = *(void *)(v35 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v29, 1, v35))
  {
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v28, v29, *(void *)(*(void *)(v37 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v52 + 16))(&v28[*(int *)(v30 + 20)], &v29[*(int *)(v30 + 20)], v53);
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
    v48(v28, v29, v53);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v28, 0, 1, v35);
    v48(&v28[*(int *)(v30 + 20)], &v29[*(int *)(v30 + 20)], v53);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  return a1;
}

uint64_t initializeWithTake for AspireSimilaritySimilarityClientConfig(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for UnknownStorage();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  uint64_t v12 = a3[10];
  uint64_t v13 = (_OWORD *)(a1 + v12);
  uint64_t v14 = (_OWORD *)(a2 + v12);
  uint64_t v15 = type metadata accessor for AspireHeEncryptionParameters(0);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    *uint64_t v13 = *v14;
    uint64_t v18 = *((void *)v14 + 3);
    *((void *)v13 + 2) = *((void *)v14 + 2);
    *((void *)v13 + 3) = v18;
    *((unsigned char *)v13 + 32) = *((unsigned char *)v14 + 32);
    *((void *)v13 + 5) = *((void *)v14 + 5);
    *((unsigned char *)v13 + 48) = *((unsigned char *)v14 + 48);
    *((void *)v13 + 7) = *((void *)v14 + 7);
    *((unsigned char *)v13 + 64) = *((unsigned char *)v14 + 64);
    v11((uint64_t)v13 + *(int *)(v15 + 40), (uint64_t)v14 + *(int *)(v15 + 40), v10);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v19 = a3[11];
  uint64_t v20 = (char *)(a1 + v19);
  uint64_t v21 = (char *)(a2 + v19);
  uint64_t v22 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    uint64_t v25 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v26 = *(void *)(v25 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v21, 1, v25))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
      memcpy(v20, v21, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      swift_getEnumCaseMultiPayload();
      v11((uint64_t)v20, (uint64_t)v21, v10);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v20, 0, 1, v25);
    }
    v11((uint64_t)&v20[*(int *)(v22 + 20)], (uint64_t)&v21[*(int *)(v22 + 20)], v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

uint64_t assignWithTake for AspireSimilaritySimilarityClientConfig(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[9];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v42 = *(void *)(v9 - 8);
  uint64_t v43 = v9;
  uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v42 + 40);
  v41(v7, v8);
  uint64_t v10 = a3[10];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = type metadata accessor for AspireHeEncryptionParameters(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
      uint64_t v18 = *(void *)(v12 + 24);
      *(void *)(v11 + 16) = *(void *)(v12 + 16);
      *(void *)(v11 + 24) = v18;
      *(unsigned char *)(v11 + 32) = *(unsigned char *)(v12 + 32);
      *(unsigned char *)(v11 + 48) = *(unsigned char *)(v12 + 48);
      *(void *)(v11 + 40) = *(void *)(v12 + 40);
      *(void *)(v11 + 56) = *(void *)(v12 + 56);
      *(unsigned char *)(v11 + 64) = *(unsigned char *)(v12 + 64);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32))(v11 + *(int *)(v13 + 40), v12 + *(int *)(v13 + 40), v43);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v11, type metadata accessor for AspireHeEncryptionParameters);
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
    memcpy((void *)v11, (const void *)v12, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *(void *)(v11 + 16) = *(void *)(v12 + 16);
  swift_bridgeObjectRelease();
  *(void *)(v11 + 24) = *(void *)(v12 + 24);
  *(unsigned char *)(v11 + 32) = *(unsigned char *)(v12 + 32);
  *(void *)(v11 + 40) = *(void *)(v12 + 40);
  *(unsigned char *)(v11 + 48) = *(unsigned char *)(v12 + 48);
  *(void *)(v11 + 56) = *(void *)(v12 + 56);
  *(unsigned char *)(v11 + 64) = *(unsigned char *)(v12 + 64);
  ((void (*)(uint64_t, uint64_t, uint64_t))v41)(v11 + *(int *)(v13 + 40), v12 + *(int *)(v13 + 40), v43);
LABEL_7:
  uint64_t v20 = a3[11];
  uint64_t v21 = (char *)(a1 + v20);
  uint64_t v22 = (char *)(a2 + v20);
  uint64_t v23 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (v27)
    {
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v21, type metadata accessor for AspireSimilarityPlaintextPacking);
      goto LABEL_13;
    }
    uint64_t v32 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v33 = *(void *)(v32 - 8);
    int v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
    int v35 = v34(v21, 1, v32);
    int v36 = v34(v22, 1, v32);
    if (v35)
    {
      if (!v36)
      {
        swift_getEnumCaseMultiPayload();
        uint64_t v37 = v43;
        (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v21, v22, v43);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v21, 0, 1, v32);
LABEL_23:
        ((void (*)(char *, char *, uint64_t))v41)(&v21[*(int *)(v23 + 20)], &v22[*(int *)(v23 + 20)], v37);
        return a1;
      }
    }
    else
    {
      if (!v36)
      {
        uint64_t v37 = v43;
        if (a1 != a2)
        {
          outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v21, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
          swift_getEnumCaseMultiPayload();
          (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v21, v22, v43);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_23;
      }
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v21, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    }
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v21, v22, *(void *)(*(void *)(v39 - 8) + 64));
    uint64_t v37 = v43;
    goto LABEL_23;
  }
  if (v27)
  {
LABEL_13:
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v21, v22, *(void *)(*(void *)(v31 - 8) + 64));
    return a1;
  }
  uint64_t v28 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v22, 1, v28))
  {
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v21, v22, *(void *)(*(void *)(v30 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(&v21[*(int *)(v23 + 20)], &v22[*(int *)(v23 + 20)], v43);
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
    v38(v21, v22, v43);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v21, 0, 1, v28);
    v38(&v21[*(int *)(v23 + 20)], &v22[*(int *)(v23 + 20)], v43);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  return a1;
}

uint64_t getEnumTagSinglePayload for AspireSimilaritySimilarityClientConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249E73114);
}

uint64_t sub_249E73114(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = type metadata accessor for UnknownStorage();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[9];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v13(a1 + v11, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[10];
    goto LABEL_9;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + a3[11];
  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for AspireSimilaritySimilarityClientConfig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249E732A8);
}

uint64_t sub_249E732A8(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
    return result;
  }
  uint64_t v8 = type metadata accessor for UnknownStorage();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[9];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v13(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[10];
    goto LABEL_7;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = v5 + a4[11];
  return v15(v17, a2, a2, v16);
}

void type metadata completion function for AspireSimilaritySimilarityClientConfig()
{
  type metadata accessor for UnknownStorage();
  if (v0 <= 0x3F)
  {
    type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?(319, &lazy cache variable for type metadata for AspireHeEncryptionParameters?, (void (*)(uint64_t))type metadata accessor for AspireHeEncryptionParameters);
    if (v1 <= 0x3F)
    {
      type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?(319, &lazy cache variable for type metadata for AspireSimilarityPlaintextPacking?, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void *initializeBufferWithCopyOfBuffer for AspireSimilaritySimilarityServerConfig(unsigned char *a1, void *a2, int *a3)
{
  uint64_t v3 = a2;
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    void *v4 = *a2;
    unint64_t v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a3;
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for UnknownStorage();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    v11(v8, v9, v10);
    uint64_t v12 = v6[6];
    uint64_t v13 = (void *)((char *)v4 + v12);
    uint64_t v14 = (void *)((char *)v3 + v12);
    uint64_t v15 = (int *)type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
    uint64_t v16 = *((void *)v15 - 1);
    uint64_t v60 = v11;
    uint64_t v61 = v10;
    if ((*(unsigned int (**)(void *, uint64_t, int *))(v16 + 48))(v14, 1, v15))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      uint64_t v56 = v16;
      uint64_t v57 = v6;
      uint64_t v58 = v3;
      *uint64_t v13 = *v14;
      *((_DWORD *)v13 + 2) = *((_DWORD *)v14 + 2);
      uint64_t v19 = v14[3];
      v13[2] = v14[2];
      v13[3] = v19;
      *((unsigned char *)v13 + 32) = *((unsigned char *)v14 + 32);
      v13[5] = v14[5];
      uint64_t v20 = v15[9];
      uint64_t v21 = (char *)v13 + v20;
      uint64_t v22 = (char *)v14 + v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v11(v21, v22, v10);
      uint64_t v23 = v15[10];
      uint64_t v24 = (_OWORD *)((char *)v13 + v23);
      uint64_t v25 = (_OWORD *)((char *)v14 + v23);
      uint64_t v26 = type metadata accessor for AspireHeEncryptionParameters(0);
      uint64_t v27 = *(void *)(v26 - 8);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
      {
        uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
        memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
      }
      else
      {
        *uint64_t v24 = *v25;
        uint64_t v29 = *((void *)v25 + 3);
        *((void *)v24 + 2) = *((void *)v25 + 2);
        *((void *)v24 + 3) = v29;
        *((unsigned char *)v24 + 32) = *((unsigned char *)v25 + 32);
        *((void *)v24 + 5) = *((void *)v25 + 5);
        *((unsigned char *)v24 + 48) = *((unsigned char *)v25 + 48);
        *((void *)v24 + 7) = *((void *)v25 + 7);
        *((unsigned char *)v24 + 64) = *((unsigned char *)v25 + 64);
        uint64_t v30 = *(int *)(v26 + 40);
        uint64_t v55 = (char *)v24 + v30;
        uint64_t v31 = (char *)v25 + v30;
        swift_bridgeObjectRetain();
        v11(v55, v31, v61);
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
      }
      uint64_t v32 = v15[11];
      uint64_t v33 = (char *)v13 + v32;
      int v34 = (char *)v14 + v32;
      uint64_t v35 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
      uint64_t v36 = *(void *)(v35 - 8);
      uint64_t v37 = v56;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
      {
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
        memcpy(v33, v34, *(void *)(*(void *)(v38 - 8) + 64));
      }
      else
      {
        uint64_t v39 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
        uint64_t v40 = *(void *)(v39 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v34, 1, v39))
        {
          uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
          memcpy(v33, v34, *(void *)(*(void *)(v41 - 8) + 64));
        }
        else
        {
          swift_getEnumCaseMultiPayload();
          v60(v33, v34, v61);
          swift_storeEnumTagMultiPayload();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v33, 0, 1, v39);
        }
        uint64_t v37 = v56;
        v60(&v33[*(int *)(v35 + 20)], &v34[*(int *)(v35 + 20)], v61);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
      }
      (*(void (**)(void *, void, uint64_t, int *))(v37 + 56))(v13, 0, 1, v15);
      uint64_t v6 = v57;
      uint64_t v3 = v58;
    }
    uint64_t v42 = v6[7];
    uint64_t v43 = (char *)v4 + v42;
    uint64_t v44 = (char *)v3 + v42;
    uint64_t v45 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    uint64_t v46 = *(void *)(v45 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45))
    {
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      memcpy(v43, v44, *(void *)(*(void *)(v47 - 8) + 64));
    }
    else
    {
      char v59 = v3;
      uint64_t v48 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
      uint64_t v49 = *(void *)(v48 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v44, 1, v48))
      {
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
        memcpy(v43, v44, *(void *)(*(void *)(v50 - 8) + 64));
      }
      else
      {
        swift_getEnumCaseMultiPayload();
        v60(v43, v44, v61);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v43, 0, 1, v48);
      }
      v60(&v43[*(int *)(v45 + 20)], &v44[*(int *)(v45 + 20)], v61);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
      uint64_t v3 = v59;
    }
    uint64_t v51 = v6[8];
    uint64_t v52 = (char *)v4 + v51;
    uint64_t v53 = (char *)v3 + v51;
    *(_DWORD *)uint64_t v52 = *(_DWORD *)v53;
    v52[4] = v53[4];
  }
  return v4;
}

uint64_t destroy for AspireSimilaritySimilarityServerConfig(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v18(v4, v5);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = (int *)type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v7 - 1) + 48))(v6, 1, v7))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18(v6 + v7[9], v5);
    uint64_t v8 = v6 + v7[10];
    uint64_t v9 = type metadata accessor for AspireHeEncryptionParameters(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
    {
      swift_bridgeObjectRelease();
      v18(v8 + *(int *)(v9 + 40), v5);
    }
    uint64_t v10 = v6 + v7[11];
    uint64_t v11 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
    {
      uint64_t v12 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v10, 1, v12)
        && swift_getEnumCaseMultiPayload() <= 2)
      {
        v18(v10, v5);
      }
      v18(v10 + *(int *)(v11 + 20), v5);
    }
  }
  uint64_t v13 = a1 + a2[7];
  uint64_t v14 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14);
  if (!result)
  {
    uint64_t v16 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v13, 1, v16)
      && swift_getEnumCaseMultiPayload() <= 2)
    {
      v18(v13, v5);
    }
    uint64_t v17 = v13 + *(int *)(v14 + 20);
    return ((uint64_t (*)(uint64_t, uint64_t))v18)(v17, v5);
  }
  return result;
}

unsigned char *initializeWithCopy for AspireSimilaritySimilarityServerConfig(unsigned char *a1, unsigned char *a2, int *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2;
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  v10(v7, v8, v9);
  uint64_t v11 = v3[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &v4[v11];
  uint64_t v14 = (int *)type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  uint64_t v15 = *((void *)v14 - 1);
  uint64_t v63 = v10;
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    uint64_t v59 = v15;
    uint64_t v60 = v3;
    uint64_t v61 = v4;
    *uint64_t v12 = *v13;
    *((_DWORD *)v12 + 2) = *((_DWORD *)v13 + 2);
    uint64_t v17 = v13[3];
    v12[2] = v13[2];
    v12[3] = v17;
    *((unsigned char *)v12 + 32) = *((unsigned char *)v13 + 32);
    v12[5] = v13[5];
    uint64_t v18 = v14[9];
    uint64_t v19 = (char *)v12 + v18;
    uint64_t v20 = (char *)v13 + v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v19, v20, v9);
    uint64_t v21 = v14[10];
    uint64_t v22 = (_OWORD *)((char *)v12 + v21);
    uint64_t v23 = (_OWORD *)((char *)v13 + v21);
    uint64_t v24 = type metadata accessor for AspireHeEncryptionParameters(0);
    uint64_t v25 = v10;
    uint64_t v26 = v9;
    uint64_t v27 = *(void *)(v24 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v27 + 48))(v23, 1, v24))
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
      memcpy(v22, v23, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      *uint64_t v22 = *v23;
      uint64_t v29 = *((void *)v23 + 3);
      *((void *)v22 + 2) = *((void *)v23 + 2);
      *((void *)v22 + 3) = v29;
      *((unsigned char *)v22 + 32) = *((unsigned char *)v23 + 32);
      *((void *)v22 + 5) = *((void *)v23 + 5);
      *((unsigned char *)v22 + 48) = *((unsigned char *)v23 + 48);
      *((void *)v22 + 7) = *((void *)v23 + 7);
      *((unsigned char *)v22 + 64) = *((unsigned char *)v23 + 64);
      uint64_t v30 = *(int *)(v24 + 40);
      uint64_t v57 = (char *)v22 + v30;
      uint64_t v31 = (char *)v23 + v30;
      swift_bridgeObjectRetain();
      v25(v57, v31, v26);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v27 + 56))(v22, 0, 1, v24);
    }
    uint64_t v32 = v14[11];
    uint64_t v33 = (char *)v12 + v32;
    int v34 = (char *)v13 + v32;
    uint64_t v35 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    uint64_t v36 = *(void *)(v35 - 8);
    uint64_t v9 = v26;
    uint64_t v37 = v59;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      memcpy(v33, v34, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      uint64_t v58 = v36;
      uint64_t v39 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
      uint64_t v40 = *(void *)(v39 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v34, 1, v39))
      {
        uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
        memcpy(v33, v34, *(void *)(*(void *)(v41 - 8) + 64));
        uint64_t v42 = v63;
      }
      else
      {
        swift_getEnumCaseMultiPayload();
        uint64_t v56 = v40;
        uint64_t v42 = v63;
        v63(v33, v34, v26);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v33, 0, 1, v39);
      }
      uint64_t v37 = v59;
      v42(&v33[*(int *)(v35 + 20)], &v34[*(int *)(v35 + 20)], v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v58 + 56))(v33, 0, 1, v35);
      uint64_t v9 = v26;
    }
    (*(void (**)(void *, void, uint64_t, int *))(v37 + 56))(v12, 0, 1, v14);
    uint64_t v3 = v60;
    uint64_t v4 = v61;
  }
  uint64_t v43 = v3[7];
  uint64_t v44 = &a1[v43];
  uint64_t v45 = &v4[v43];
  uint64_t v46 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v47 = *(void *)(v46 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46))
  {
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
  }
  else
  {
    uint64_t v62 = v4;
    uint64_t v49 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v50 = *(void *)(v49 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v45, 1, v49))
    {
      uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
      memcpy(v44, v45, *(void *)(*(void *)(v51 - 8) + 64));
    }
    else
    {
      swift_getEnumCaseMultiPayload();
      v63(v44, v45, v9);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v44, 0, 1, v49);
    }
    v63(&v44[*(int *)(v46 + 20)], &v45[*(int *)(v46 + 20)], v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v44, 0, 1, v46);
    uint64_t v4 = v62;
  }
  uint64_t v52 = v3[8];
  uint64_t v53 = &a1[v52];
  uint64_t v54 = &v4[v52];
  *(_DWORD *)uint64_t v53 = *(_DWORD *)v54;
  v53[4] = v54[4];
  return a1;
}

unsigned char *assignWithCopy for AspireSimilaritySimilarityServerConfig(unsigned char *a1, unsigned char *a2, int *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2;
  uint64_t v5 = a1;
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v119 = *(void *)(v9 - 8);
  uint64_t v120 = v9;
  v115 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v119 + 24);
  ((void (*)(unsigned char *, unsigned char *))v115)(v7, v8);
  uint64_t v10 = v3[6];
  uint64_t v11 = (uint64_t)&v5[v10];
  uint64_t v12 = &v4[v10];
  uint64_t v13 = (int *)type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  uint64_t v14 = *((void *)v13 - 1);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15((uint64_t)v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      v111 = v4;
      v113 = v5;
      v116 = v3;
      *(void *)uint64_t v11 = *(void *)v12;
      *(_DWORD *)(v11 + 8) = *((_DWORD *)v12 + 2);
      *(void *)(v11 + 16) = *((void *)v12 + 2);
      uint64_t v18 = *((void *)v12 + 3);
      *(unsigned char *)(v11 + 32) = v12[32];
      *(void *)(v11 + 24) = v18;
      *(void *)(v11 + 40) = *((void *)v12 + 5);
      uint64_t v19 = v13[9];
      uint64_t v20 = (char *)(v11 + v19);
      uint64_t v21 = &v12[v19];
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v119 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v110 = v22;
      v22(v20, v21, v120);
      uint64_t v23 = v13[10];
      uint64_t v24 = (void *)(v11 + v23);
      uint64_t v25 = &v12[v23];
      uint64_t v26 = type metadata accessor for AspireHeEncryptionParameters(0);
      uint64_t v27 = *(void *)(v26 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
      {
        uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
        memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
      }
      else
      {
        *uint64_t v24 = *v25;
        v24[1] = v25[1];
        v24[2] = v25[2];
        uint64_t v47 = v25[3];
        *((unsigned char *)v24 + 32) = *((unsigned char *)v25 + 32);
        v24[3] = v47;
        uint64_t v48 = v25[5];
        *((unsigned char *)v24 + 48) = *((unsigned char *)v25 + 48);
        v24[5] = v48;
        uint64_t v49 = v25[7];
        *((unsigned char *)v24 + 64) = *((unsigned char *)v25 + 64);
        v24[7] = v49;
        uint64_t v50 = *(int *)(v26 + 40);
        v109 = (char *)v24 + v50;
        uint64_t v51 = (char *)v25 + v50;
        swift_bridgeObjectRetain();
        v110(v109, v51, v120);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
      }
      uint64_t v52 = v13[11];
      uint64_t v53 = (char *)(v11 + v52);
      uint64_t v54 = &v12[v52];
      uint64_t v55 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
      uint64_t v56 = *(void *)(v55 - 8);
      uint64_t v4 = v111;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v54, 1, v55))
      {
        uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
        memcpy(v53, v54, *(void *)(*(void *)(v57 - 8) + 64));
      }
      else
      {
        uint64_t v58 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
        uint64_t v59 = *(void *)(v58 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48))(v54, 1, v58))
        {
          uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
          memcpy(v53, v54, *(void *)(*(void *)(v60 - 8) + 64));
        }
        else
        {
          swift_getEnumCaseMultiPayload();
          v110(v53, v54, v120);
          swift_storeEnumTagMultiPayload();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v53, 0, 1, v58);
        }
        uint64_t v4 = v111;
        v110(&v53[*(int *)(v55 + 20)], &v54[*(int *)(v55 + 20)], v120);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v53, 0, 1, v55);
        uint64_t v5 = v113;
      }
      (*(void (**)(uint64_t, void, uint64_t, int *))(v14 + 56))(v11, 0, 1, v13);
      uint64_t v3 = v116;
      goto LABEL_30;
    }
    goto LABEL_7;
  }
  if (v17)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v11, type metadata accessor for AspireSimilaritySimilarityClientConfig);
LABEL_7:
    size_t v29 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?)
                                - 8)
                    + 64);
    uint64_t v30 = (void *)v11;
    uint64_t v31 = v12;
LABEL_8:
    memcpy(v30, v31, v29);
    goto LABEL_30;
  }
  v117 = v3;
  v112 = v4;
  *(void *)uint64_t v11 = *(void *)v12;
  *(_DWORD *)(v11 + 8) = *((_DWORD *)v12 + 2);
  *(void *)(v11 + 16) = *((void *)v12 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = *((void *)v12 + 3);
  *(unsigned char *)(v11 + 32) = v12[32];
  *(void *)(v11 + 24) = v32;
  *(void *)(v11 + 40) = *((void *)v12 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v115(v11 + v13[9], &v12[v13[9]], v120);
  uint64_t v33 = v13[10];
  uint64_t v34 = v11 + v33;
  uint64_t v35 = &v12[v33];
  uint64_t v36 = type metadata accessor for AspireHeEncryptionParameters(0);
  uint64_t v114 = *(void *)(v36 - 8);
  uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v114 + 48);
  int v38 = v37(v34, 1, v36);
  int v39 = v37((uint64_t)v35, 1, v36);
  if (v38)
  {
    if (!v39)
    {
      *(void *)uint64_t v34 = *(void *)v35;
      *(void *)(v34 + 8) = *((void *)v35 + 1);
      *(void *)(v34 + 16) = *((void *)v35 + 2);
      uint64_t v40 = *((void *)v35 + 3);
      *(unsigned char *)(v34 + 32) = v35[32];
      *(void *)(v34 + 24) = v40;
      uint64_t v41 = *((void *)v35 + 5);
      *(unsigned char *)(v34 + 48) = v35[48];
      *(void *)(v34 + 40) = v41;
      uint64_t v42 = *((void *)v35 + 7);
      *(unsigned char *)(v34 + 64) = v35[64];
      *(void *)(v34 + 56) = v42;
      uint64_t v43 = *(int *)(v36 + 40);
      uint64_t v44 = v34 + v43;
      uint64_t v45 = &v35[v43];
      uint64_t v46 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v119 + 16);
      swift_bridgeObjectRetain();
      v46(v44, v45, v120);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v114 + 56))(v34, 0, 1, v36);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v39)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v34, type metadata accessor for AspireHeEncryptionParameters);
LABEL_19:
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
    memcpy((void *)v34, v35, *(void *)(*(void *)(v61 - 8) + 64));
    goto LABEL_20;
  }
  *(void *)uint64_t v34 = *(void *)v35;
  *(void *)(v34 + 8) = *((void *)v35 + 1);
  *(void *)(v34 + 16) = *((void *)v35 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v98 = *((void *)v35 + 3);
  *(unsigned char *)(v34 + 32) = v35[32];
  *(void *)(v34 + 24) = v98;
  uint64_t v99 = *((void *)v35 + 5);
  *(unsigned char *)(v34 + 48) = v35[48];
  *(void *)(v34 + 40) = v99;
  uint64_t v100 = *((void *)v35 + 7);
  *(unsigned char *)(v34 + 64) = v35[64];
  *(void *)(v34 + 56) = v100;
  v115(v34 + *(int *)(v36 + 40), &v35[*(int *)(v36 + 40)], v120);
LABEL_20:
  uint64_t v4 = v112;
  uint64_t v62 = v13[11];
  uint64_t v63 = (char *)(v11 + v62);
  v64 = &v12[v62];
  uint64_t v65 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v66 = *(void *)(v65 - 8);
  uint64_t v67 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v66 + 48);
  int v68 = v67(v63, 1, v65);
  int v69 = v67(v64, 1, v65);
  uint64_t v3 = v117;
  if (!v68)
  {
    if (v69)
    {
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v63, type metadata accessor for AspireSimilarityPlaintextPacking);
      goto LABEL_26;
    }
    uint64_t v101 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v102 = *(void *)(v101 - 8);
    v103 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v102 + 48);
    int v104 = v103(v63, 1, v101);
    int v105 = v103(v64, 1, v101);
    if (v104)
    {
      uint64_t v106 = v120;
      if (!v105)
      {
        swift_getEnumCaseMultiPayload();
        (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v63, v64, v120);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v102 + 56))(v63, 0, 1, v101);
LABEL_58:
        uint64_t v3 = v117;
LABEL_59:
        v115((uint64_t)&v63[*(int *)(v65 + 20)], &v64[*(int *)(v65 + 20)], v106);
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v106 = v120;
      if (!v105)
      {
        uint64_t v3 = v117;
        if (v5 != v112)
        {
          outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v63, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
          swift_getEnumCaseMultiPayload();
          (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v63, v64, v120);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_59;
      }
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v63, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    }
    uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v63, v64, *(void *)(*(void *)(v108 - 8) + 64));
    goto LABEL_58;
  }
  if (v69)
  {
LABEL_26:
    size_t v29 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?)
                                - 8)
                    + 64);
    uint64_t v30 = v63;
    uint64_t v31 = v64;
    goto LABEL_8;
  }
  uint64_t v70 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v71 = *(void *)(v70 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48))(v64, 1, v70))
  {
    uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v63, v64, *(void *)(*(void *)(v72 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v119 + 16))(&v63[*(int *)(v65 + 20)], &v64[*(int *)(v65 + 20)], v120);
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    v107 = *(void (**)(char *, char *, uint64_t))(v119 + 16);
    v107(v63, v64, v120);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(v63, 0, 1, v70);
    v107(&v63[*(int *)(v65 + 20)], &v64[*(int *)(v65 + 20)], v120);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v66 + 56))(v63, 0, 1, v65);
  uint64_t v3 = v117;
LABEL_30:
  uint64_t v73 = v3[7];
  uint64_t v74 = &v5[v73];
  uint64_t v75 = &v4[v73];
  uint64_t v76 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v77 = *(void *)(v76 - 8);
  int v78 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v77 + 48);
  int v79 = v78(v74, 1, v76);
  int v80 = v78(v75, 1, v76);
  if (!v79)
  {
    if (v80)
    {
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v74, type metadata accessor for AspireSimilarityPlaintextPacking);
      goto LABEL_36;
    }
    uint64_t v85 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v86 = *(void *)(v85 - 8);
    v87 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v86 + 48);
    int v88 = v87(v74, 1, v85);
    int v89 = v87(v75, 1, v85);
    if (v88)
    {
      uint64_t v90 = v120;
      if (!v89)
      {
        swift_getEnumCaseMultiPayload();
        (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v74, v75, v120);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v86 + 56))(v74, 0, 1, v85);
LABEL_45:
        v115((uint64_t)&v74[*(int *)(v76 + 20)], &v75[*(int *)(v76 + 20)], v90);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v90 = v120;
      if (!v89)
      {
        if (v5 != v4)
        {
          outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v74, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
          swift_getEnumCaseMultiPayload();
          (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v74, v75, v120);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_45;
      }
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v74, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    }
    uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v74, v75, *(void *)(*(void *)(v92 - 8) + 64));
    goto LABEL_45;
  }
  if (v80)
  {
LABEL_36:
    uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v74, v75, *(void *)(*(void *)(v84 - 8) + 64));
    goto LABEL_46;
  }
  v118 = v3;
  uint64_t v81 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v82 = *(void *)(v81 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48))(v75, 1, v81))
  {
    uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v74, v75, *(void *)(*(void *)(v83 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v119 + 16))(&v74[*(int *)(v76 + 20)], &v75[*(int *)(v76 + 20)], v120);
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    v91 = *(void (**)(char *, char *, uint64_t))(v119 + 16);
    v91(v74, v75, v120);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v82 + 56))(v74, 0, 1, v81);
    v91(&v74[*(int *)(v76 + 20)], &v75[*(int *)(v76 + 20)], v120);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v77 + 56))(v74, 0, 1, v76);
  uint64_t v3 = v118;
LABEL_46:
  uint64_t v93 = v3[8];
  v94 = &v5[v93];
  v95 = &v4[v93];
  int v96 = *(_DWORD *)v95;
  v94[4] = v95[4];
  *(_DWORD *)v94 = v96;
  return v5;
}

unsigned char *initializeWithTake for AspireSimilaritySimilarityServerConfig(unsigned char *a1, unsigned char *a2, int *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2;
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = v3[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &v4[v11];
  uint64_t v14 = (int *)type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  uint64_t v15 = *((void *)v14 - 1);
  uint64_t v53 = v10;
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    uint64_t v49 = v15;
    uint64_t v50 = v3;
    uint64_t v51 = v4;
    *uint64_t v12 = *v13;
    *((_DWORD *)v12 + 2) = *((_DWORD *)v13 + 2);
    uint64_t v17 = v13[3];
    v12[2] = v13[2];
    v12[3] = v17;
    *((unsigned char *)v12 + 32) = *((unsigned char *)v13 + 32);
    v12[5] = v13[5];
    v10((char *)v12 + v14[9], (char *)v13 + v14[9], v9);
    uint64_t v18 = v14[10];
    uint64_t v19 = (_OWORD *)((char *)v12 + v18);
    uint64_t v20 = (_OWORD *)((char *)v13 + v18);
    uint64_t v21 = v9;
    uint64_t v22 = type metadata accessor for AspireHeEncryptionParameters(0);
    uint64_t v23 = *(void *)(v22 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v23 + 48))(v20, 1, v22))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
      memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      _OWORD *v19 = *v20;
      uint64_t v25 = *((void *)v20 + 3);
      *((void *)v19 + 2) = *((void *)v20 + 2);
      *((void *)v19 + 3) = v25;
      *((unsigned char *)v19 + 32) = *((unsigned char *)v20 + 32);
      *((void *)v19 + 5) = *((void *)v20 + 5);
      *((unsigned char *)v19 + 48) = *((unsigned char *)v20 + 48);
      *((void *)v19 + 7) = *((void *)v20 + 7);
      *((unsigned char *)v19 + 64) = *((unsigned char *)v20 + 64);
      v53((char *)v19 + *(int *)(v22 + 40), (char *)v20 + *(int *)(v22 + 40), v21);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v23 + 56))(v19, 0, 1, v22);
    }
    uint64_t v26 = v14[11];
    uint64_t v27 = (char *)v12 + v26;
    uint64_t v28 = (char *)v13 + v26;
    uint64_t v29 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    uint64_t v30 = *(void *)(v29 - 8);
    uint64_t v9 = v21;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      uint64_t v48 = v30;
      uint64_t v32 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
      uint64_t v33 = *(void *)(v32 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v28, 1, v32))
      {
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
        memcpy(v27, v28, *(void *)(*(void *)(v34 - 8) + 64));
      }
      else
      {
        swift_getEnumCaseMultiPayload();
        v53(v27, v28, v21);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v27, 0, 1, v32);
      }
      v53(&v27[*(int *)(v29 + 20)], &v28[*(int *)(v29 + 20)], v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v27, 0, 1, v29);
      uint64_t v9 = v21;
    }
    (*(void (**)(void *, void, uint64_t, int *))(v49 + 56))(v12, 0, 1, v14);
    uint64_t v3 = v50;
    uint64_t v4 = v51;
  }
  uint64_t v35 = v3[7];
  uint64_t v36 = &a1[v35];
  uint64_t v37 = &v4[v35];
  uint64_t v38 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v39 = *(void *)(v38 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
  {
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v36, v37, *(void *)(*(void *)(v40 - 8) + 64));
  }
  else
  {
    uint64_t v52 = v4;
    uint64_t v41 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v42 = *(void *)(v41 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v37, 1, v41))
    {
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
      memcpy(v36, v37, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      swift_getEnumCaseMultiPayload();
      v53(v36, v37, v9);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v36, 0, 1, v41);
    }
    v53(&v36[*(int *)(v38 + 20)], &v37[*(int *)(v38 + 20)], v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
    uint64_t v4 = v52;
  }
  uint64_t v44 = v3[8];
  uint64_t v45 = &a1[v44];
  uint64_t v46 = &v4[v44];
  *(_DWORD *)uint64_t v45 = *(_DWORD *)v46;
  v45[4] = v46[4];
  return a1;
}

unsigned char *assignWithTake for AspireSimilaritySimilarityServerConfig(unsigned char *a1, unsigned char *a2, int *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2;
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v97 = *(void *)(v9 - 8);
  uint64_t v98 = v9;
  v94 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v97 + 40);
  ((void (*)(unsigned char *, unsigned char *))v94)(v7, v8);
  uint64_t v10 = v3[6];
  uint64_t v99 = a1;
  uint64_t v11 = (uint64_t)&a1[v10];
  uint64_t v12 = &v4[v10];
  uint64_t v13 = (int *)type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  uint64_t v14 = *((void *)v13 - 1);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15((uint64_t)v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      v95 = v3;
      *(void *)uint64_t v11 = *(void *)v12;
      *(_DWORD *)(v11 + 8) = *((_DWORD *)v12 + 2);
      uint64_t v18 = *((void *)v12 + 3);
      *(void *)(v11 + 16) = *((void *)v12 + 2);
      *(void *)(v11 + 24) = v18;
      *(unsigned char *)(v11 + 32) = v12[32];
      *(void *)(v11 + 40) = *((void *)v12 + 5);
      v91 = *(void (**)(uint64_t, char *, uint64_t))(v97 + 32);
      uint64_t v92 = v4;
      v91(v11 + v13[9], &v12[v13[9]], v98);
      uint64_t v19 = v13[10];
      uint64_t v20 = (_OWORD *)(v11 + v19);
      uint64_t v21 = &v12[v19];
      uint64_t v22 = type metadata accessor for AspireHeEncryptionParameters(0);
      uint64_t v23 = *(void *)(v22 - 8);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
      {
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
        memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        *uint64_t v20 = *v21;
        uint64_t v37 = *((void *)v21 + 3);
        *((void *)v20 + 2) = *((void *)v21 + 2);
        *((void *)v20 + 3) = v37;
        *((unsigned char *)v20 + 32) = *((unsigned char *)v21 + 32);
        *((void *)v20 + 5) = *((void *)v21 + 5);
        *((unsigned char *)v20 + 48) = *((unsigned char *)v21 + 48);
        *((void *)v20 + 7) = *((void *)v21 + 7);
        *((unsigned char *)v20 + 64) = *((unsigned char *)v21 + 64);
        v91((uint64_t)v20 + *(int *)(v22 + 40), (char *)v21 + *(int *)(v22 + 40), v98);
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      }
      uint64_t v38 = v13[11];
      uint64_t v39 = (char *)(v11 + v38);
      uint64_t v40 = &v12[v38];
      uint64_t v41 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
      uint64_t v42 = *(void *)(v41 - 8);
      uint64_t v4 = v92;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41))
      {
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
        memcpy(v39, v40, *(void *)(*(void *)(v43 - 8) + 64));
      }
      else
      {
        uint64_t v44 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
        uint64_t v45 = *(void *)(v44 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v40, 1, v44))
        {
          uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
          memcpy(v39, v40, *(void *)(*(void *)(v46 - 8) + 64));
        }
        else
        {
          swift_getEnumCaseMultiPayload();
          v91((uint64_t)v39, v40, v98);
          swift_storeEnumTagMultiPayload();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v39, 0, 1, v44);
        }
        uint64_t v4 = v92;
        v91((uint64_t)&v39[*(int *)(v41 + 20)], &v40[*(int *)(v41 + 20)], v98);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
      }
      (*(void (**)(uint64_t, void, uint64_t, int *))(v14 + 56))(v11, 0, 1, v13);
LABEL_30:
      uint64_t v3 = v95;
      goto LABEL_31;
    }
    goto LABEL_7;
  }
  if (v17)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v11, type metadata accessor for AspireSimilaritySimilarityClientConfig);
LABEL_7:
    size_t v25 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?)
                                - 8)
                    + 64);
    uint64_t v26 = (void *)v11;
    uint64_t v27 = v12;
LABEL_8:
    memcpy(v26, v27, v25);
    goto LABEL_31;
  }
  v95 = v3;
  uint64_t v93 = v4;
  *(void *)uint64_t v11 = *(void *)v12;
  *(_DWORD *)(v11 + 8) = *((_DWORD *)v12 + 2);
  *(void *)(v11 + 16) = *((void *)v12 + 2);
  swift_bridgeObjectRelease();
  *(void *)(v11 + 24) = *((void *)v12 + 3);
  *(unsigned char *)(v11 + 32) = v12[32];
  *(void *)(v11 + 40) = *((void *)v12 + 5);
  swift_bridgeObjectRelease();
  v94(v11 + v13[9], &v12[v13[9]], v98);
  uint64_t v28 = v13[10];
  uint64_t v29 = v11 + v28;
  uint64_t v30 = &v12[v28];
  uint64_t v31 = type metadata accessor for AspireHeEncryptionParameters(0);
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 48);
  int v34 = v33(v29, 1, v31);
  int v35 = v33((uint64_t)v30, 1, v31);
  if (v34)
  {
    if (!v35)
    {
      *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
      uint64_t v36 = *((void *)v30 + 3);
      *(void *)(v29 + 16) = *((void *)v30 + 2);
      *(void *)(v29 + 24) = v36;
      *(unsigned char *)(v29 + 32) = v30[32];
      *(unsigned char *)(v29 + 48) = v30[48];
      *(void *)(v29 + 40) = *((void *)v30 + 5);
      *(void *)(v29 + 56) = *((void *)v30 + 7);
      *(unsigned char *)(v29 + 64) = v30[64];
      (*(void (**)(uint64_t, unsigned char *, uint64_t))(v97 + 32))(v29 + *(int *)(v31 + 40), &v30[*(int *)(v31 + 40)], v98);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v35)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v29, type metadata accessor for AspireHeEncryptionParameters);
LABEL_19:
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
    memcpy((void *)v29, v30, *(void *)(*(void *)(v47 - 8) + 64));
    goto LABEL_20;
  }
  *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
  *(void *)(v29 + 16) = *((void *)v30 + 2);
  swift_bridgeObjectRelease();
  *(void *)(v29 + 24) = *((void *)v30 + 3);
  *(unsigned char *)(v29 + 32) = v30[32];
  *(void *)(v29 + 40) = *((void *)v30 + 5);
  *(unsigned char *)(v29 + 48) = v30[48];
  *(void *)(v29 + 56) = *((void *)v30 + 7);
  *(unsigned char *)(v29 + 64) = v30[64];
  v94(v29 + *(int *)(v31 + 40), &v30[*(int *)(v31 + 40)], v98);
LABEL_20:
  uint64_t v4 = v93;
  uint64_t v48 = v13[11];
  uint64_t v49 = (char *)(v11 + v48);
  uint64_t v50 = &v12[v48];
  uint64_t v51 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v52 = *(void *)(v51 - 8);
  uint64_t v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 48);
  int v54 = v53(v49, 1, v51);
  int v55 = v53(v50, 1, v51);
  uint64_t v3 = v95;
  if (v54)
  {
    if (!v55)
    {
      uint64_t v56 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
      uint64_t v57 = *(void *)(v56 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v50, 1, v56))
      {
        uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
        memcpy(v49, v50, *(void *)(*(void *)(v58 - 8) + 64));
        (*(void (**)(char *, char *, uint64_t))(v97 + 32))(&v49[*(int *)(v51 + 20)], &v50[*(int *)(v51 + 20)], v98);
      }
      else
      {
        swift_getEnumCaseMultiPayload();
        int v89 = *(void (**)(char *, char *, uint64_t))(v97 + 32);
        v89(v49, v50, v98);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v57 + 56))(v49, 0, 1, v56);
        v89(&v49[*(int *)(v51 + 20)], &v50[*(int *)(v51 + 20)], v98);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56))(v49, 0, 1, v51);
      goto LABEL_30;
    }
    goto LABEL_26;
  }
  if (v55)
  {
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v49, type metadata accessor for AspireSimilarityPlaintextPacking);
LABEL_26:
    size_t v25 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?)
                                - 8)
                    + 64);
    uint64_t v26 = v49;
    uint64_t v27 = v50;
    goto LABEL_8;
  }
  uint64_t v83 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v84 = *(void *)(v83 - 8);
  uint64_t v85 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v84 + 48);
  int v86 = v85(v49, 1, v83);
  int v87 = v85(v50, 1, v83);
  if (!v86)
  {
    uint64_t v88 = v98;
    if (!v87)
    {
      uint64_t v3 = v95;
      if (v99 != v93)
      {
        outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v49, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
        swift_getEnumCaseMultiPayload();
        (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v49, v50, v98);
        swift_storeEnumTagMultiPayload();
      }
      goto LABEL_60;
    }
    outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v49, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    goto LABEL_58;
  }
  uint64_t v88 = v98;
  if (v87)
  {
LABEL_58:
    uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v49, v50, *(void *)(*(void *)(v90 - 8) + 64));
    goto LABEL_59;
  }
  swift_getEnumCaseMultiPayload();
  (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v49, v50, v98);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v84 + 56))(v49, 0, 1, v83);
LABEL_59:
  uint64_t v3 = v95;
LABEL_60:
  v94((uint64_t)&v49[*(int *)(v51 + 20)], &v50[*(int *)(v51 + 20)], v88);
LABEL_31:
  uint64_t v59 = v3[7];
  uint64_t v60 = &v99[v59];
  uint64_t v61 = &v4[v59];
  uint64_t v62 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v63 = *(void *)(v62 - 8);
  v64 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v63 + 48);
  int v65 = v64(v60, 1, v62);
  int v66 = v64(v61, 1, v62);
  if (!v65)
  {
    if (v66)
    {
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v60, type metadata accessor for AspireSimilarityPlaintextPacking);
      goto LABEL_37;
    }
    uint64_t v71 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v72 = *(void *)(v71 - 8);
    uint64_t v73 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48);
    int v74 = v73(v60, 1, v71);
    int v75 = v73(v61, 1, v71);
    if (v74)
    {
      uint64_t v76 = v98;
      if (!v75)
      {
        swift_getEnumCaseMultiPayload();
        (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v60, v61, v98);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v60, 0, 1, v71);
LABEL_46:
        v94((uint64_t)&v60[*(int *)(v62 + 20)], &v61[*(int *)(v62 + 20)], v76);
        goto LABEL_47;
      }
    }
    else
    {
      uint64_t v76 = v98;
      if (!v75)
      {
        if (v99 != v4)
        {
          outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v60, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
          swift_getEnumCaseMultiPayload();
          (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v60, v61, v98);
          swift_storeEnumTagMultiPayload();
        }
        goto LABEL_46;
      }
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v60, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
    }
    uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v60, v61, *(void *)(*(void *)(v78 - 8) + 64));
    goto LABEL_46;
  }
  if (v66)
  {
LABEL_37:
    uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v60, v61, *(void *)(*(void *)(v70 - 8) + 64));
    goto LABEL_47;
  }
  int v96 = v3;
  uint64_t v67 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
  uint64_t v68 = *(void *)(v67 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v68 + 48))(v61, 1, v67))
  {
    uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
    memcpy(v60, v61, *(void *)(*(void *)(v69 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v97 + 32))(&v60[*(int *)(v62 + 20)], &v61[*(int *)(v62 + 20)], v98);
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v77 = *(void (**)(char *, char *, uint64_t))(v97 + 32);
    v77(v60, v61, v98);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v68 + 56))(v60, 0, 1, v67);
    v77(&v60[*(int *)(v62 + 20)], &v61[*(int *)(v62 + 20)], v98);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v63 + 56))(v60, 0, 1, v62);
  uint64_t v3 = v96;
LABEL_47:
  uint64_t v79 = v3[8];
  uint64_t result = v99;
  uint64_t v81 = &v99[v79];
  uint64_t v82 = &v4[v79];
  *(_DWORD *)uint64_t v81 = *(_DWORD *)v82;
  v81[4] = v82[4];
  return result;
}

uint64_t getEnumTagSinglePayload for AspireSimilaritySimilarityServerConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249E77040);
}

uint64_t sub_249E77040(unsigned __int8 *a1, uint64_t a2, int *a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
  uint64_t v10 = type metadata accessor for UnknownStorage();
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)(v10 - 8);
    uint64_t v13 = a3[5];
LABEL_9:
    uint64_t v15 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v12 + 48);
    return v15(&a1[v13], a2, v11);
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v11 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_9;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  int v17 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  uint64_t v18 = v16;
  uint64_t v19 = &a1[a3[7]];
  return v17(v19, a2, v18);
}

uint64_t storeEnumTagSinglePayload for AspireSimilaritySimilarityServerConfig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249E771D4);
}

unsigned char *sub_249E771D4(unsigned char *result, uint64_t a2, int a3, int *a4)
{
  BOOL v5 = result;
  if (a3 == 254)
  {
    *uint64_t result = a2 + 1;
    return result;
  }
  uint64_t v8 = type metadata accessor for UnknownStorage();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (unsigned char *)v13(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_7;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
  uint64_t v15 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  int v17 = &v5[a4[7]];
  return (unsigned char *)v15(v17, a2, a2, v16);
}

void type metadata completion function for AspireSimilaritySimilarityServerConfig()
{
  type metadata accessor for UnknownStorage();
  if (v0 <= 0x3F)
  {
    type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?(319, &lazy cache variable for type metadata for AspireSimilaritySimilarityClientConfig?, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityClientConfig);
    if (v1 <= 0x3F)
    {
      type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?(319, &lazy cache variable for type metadata for AspireSimilarityPlaintextPacking?, (void (*)(uint64_t))type metadata accessor for AspireSimilarityPlaintextPacking);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for AspireSimilaritySerializedProcessedSimilarityDb(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2[2];
    a1[1] = a2[1];
    a1[2] = v8;
    uint64_t v9 = *(int *)(a3 + 28);
    uint64_t v73 = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = type metadata accessor for UnknownStorage();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = v73;
    uint64_t v74 = v11;
    uint64_t v14 = v12;
    v12(v13, v10, v11);
    uint64_t v15 = *(int *)(a3 + 32);
    uint64_t v16 = (char *)v7 + v15;
    int v17 = (char *)a2 + v15;
    uint64_t v18 = (int *)type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
    uint64_t v19 = *((void *)v18 - 1);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, int *))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      uint64_t v72 = v7;
      *uint64_t v16 = *v17;
      v12(&v16[v18[5]], &v17[v18[5]], v11);
      uint64_t v21 = v18[6];
      uint64_t v22 = &v16[v21];
      uint64_t v23 = &v17[v21];
      uint64_t v24 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
      uint64_t v25 = *(void *)(v24 - 8);
      uint64_t v71 = v14;
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
      {
        uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
        memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
      }
      else
      {
        int v66 = v16;
        uint64_t v67 = v25;
        uint64_t v69 = v19;
        *uint64_t v22 = *v23;
        *((_DWORD *)v22 + 2) = *((_DWORD *)v23 + 2);
        uint64_t v27 = v23[3];
        v22[2] = v23[2];
        v22[3] = v27;
        *((unsigned char *)v22 + 32) = *((unsigned char *)v23 + 32);
        v22[5] = v23[5];
        uint64_t v28 = *(int *)(v24 + 36);
        uint64_t v29 = (char *)v22 + v28;
        uint64_t v30 = (char *)v23 + v28;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v14(v29, v30, v74);
        uint64_t v68 = v24;
        uint64_t v31 = *(int *)(v24 + 40);
        uint64_t v32 = (_OWORD *)((char *)v22 + v31);
        uint64_t v33 = (_OWORD *)((char *)v23 + v31);
        uint64_t v34 = type metadata accessor for AspireHeEncryptionParameters(0);
        uint64_t v35 = *(void *)(v34 - 8);
        if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
        {
          uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
          memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
        }
        else
        {
          *uint64_t v32 = *v33;
          uint64_t v37 = *((void *)v33 + 3);
          *((void *)v32 + 2) = *((void *)v33 + 2);
          *((void *)v32 + 3) = v37;
          *((unsigned char *)v32 + 32) = *((unsigned char *)v33 + 32);
          *((void *)v32 + 5) = *((void *)v33 + 5);
          *((unsigned char *)v32 + 48) = *((unsigned char *)v33 + 48);
          *((void *)v32 + 7) = *((void *)v33 + 7);
          *((unsigned char *)v32 + 64) = *((unsigned char *)v33 + 64);
          uint64_t v38 = *(int *)(v34 + 40);
          v64 = (char *)v32 + v38;
          uint64_t v39 = (char *)v33 + v38;
          swift_bridgeObjectRetain();
          v14(v64, v39, v74);
          (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
        }
        uint64_t v40 = *(int *)(v68 + 44);
        uint64_t v41 = (char *)v22 + v40;
        uint64_t v42 = (char *)v23 + v40;
        uint64_t v43 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
        uint64_t v44 = *(void *)(v43 - 8);
        uint64_t v16 = v66;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v42, 1, v43))
        {
          uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
          memcpy(v41, v42, *(void *)(*(void *)(v45 - 8) + 64));
        }
        else
        {
          uint64_t v65 = v44;
          uint64_t v46 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
          uint64_t v47 = *(void *)(v46 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v42, 1, v46))
          {
            uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
            memcpy(v41, v42, *(void *)(*(void *)(v48 - 8) + 64));
            uint64_t v49 = v41;
          }
          else
          {
            swift_getEnumCaseMultiPayload();
            uint64_t v63 = v47;
            uint64_t v49 = v41;
            v71(v41, v42, v74);
            swift_storeEnumTagMultiPayload();
            (*(void (**)(char *, void, uint64_t, uint64_t))(v63 + 56))(v41, 0, 1, v46);
          }
          v71(&v49[*(int *)(v43 + 20)], &v42[*(int *)(v43 + 20)], v74);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v65 + 56))(v49, 0, 1, v43);
        }
        (*(void (**)(void *, void, uint64_t, uint64_t))(v67 + 56))(v22, 0, 1, v68);
        uint64_t v19 = v69;
      }
      uint64_t v50 = v18[7];
      uint64_t v51 = &v16[v50];
      uint64_t v52 = &v17[v50];
      uint64_t v53 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
      uint64_t v54 = *(void *)(v53 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48))(v52, 1, v53))
      {
        uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
        memcpy(v51, v52, *(void *)(*(void *)(v55 - 8) + 64));
      }
      else
      {
        uint64_t v70 = v19;
        uint64_t v56 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
        uint64_t v57 = *(void *)(v56 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v52, 1, v56))
        {
          uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
          memcpy(v51, v52, *(void *)(*(void *)(v58 - 8) + 64));
        }
        else
        {
          swift_getEnumCaseMultiPayload();
          v71(v51, v52, v74);
          swift_storeEnumTagMultiPayload();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v57 + 56))(v51, 0, 1, v56);
        }
        uint64_t v19 = v70;
        v71(&v51[*(int *)(v53 + 20)], &v52[*(int *)(v53 + 20)], v74);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
      }
      uint64_t v7 = v72;
      uint64_t v59 = v18[8];
      uint64_t v60 = &v16[v59];
      uint64_t v61 = &v17[v59];
      *(_DWORD *)uint64_t v60 = *(_DWORD *)v61;
      v60[4] = v61[4];
      (*(void (**)(unsigned char *, void, uint64_t, int *))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  return v7;
}

uint64_t destroy for AspireSimilaritySerializedProcessedSimilarityDb(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v20(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t v7 = (int *)type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, int *))(*((void *)v7 - 1) + 48))(v6, 1, v7);
  if (!result)
  {
    v20(v6 + v7[5], v5);
    uint64_t v9 = v6 + v7[6];
    uint64_t v10 = (int *)type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v10 - 1) + 48))(v9, 1, v10))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v20(v9 + v10[9], v5);
      uint64_t v11 = v9 + v10[10];
      uint64_t v12 = type metadata accessor for AspireHeEncryptionParameters(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v11, 1, v12))
      {
        swift_bridgeObjectRelease();
        v20(v11 + *(int *)(v12 + 40), v5);
      }
      uint64_t v13 = v9 + v10[11];
      uint64_t v14 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14))
      {
        uint64_t v15 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v13, 1, v15)
          && swift_getEnumCaseMultiPayload() <= 2)
        {
          v20(v13, v5);
        }
        v20(v13 + *(int *)(v14 + 20), v5);
      }
    }
    uint64_t v16 = v6 + v7[7];
    uint64_t v17 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v16, 1, v17);
    if (!result)
    {
      uint64_t v18 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v16, 1, v18)
        && swift_getEnumCaseMultiPayload() <= 2)
      {
        v20(v16, v5);
      }
      uint64_t v19 = v16 + *(int *)(v17 + 20);
      return ((uint64_t (*)(uint64_t, uint64_t))v20)(v19, v5);
    }
  }
  return result;
}

void *initializeWithCopy for AspireSimilaritySerializedProcessedSimilarityDb(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v71 = (char *)a1 + v7;
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v70 = v9;
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  v10(v71, v8, v11);
  uint64_t v13 = *(int *)(a3 + 32);
  uint64_t v72 = a1;
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = (int *)type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v17 = *((void *)v16 - 1);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, int *))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    unsigned char *v14 = *v15;
    v10(&v14[v16[5]], &v15[v16[5]], v70);
    uint64_t v19 = v16[6];
    uint64_t v20 = &v14[v19];
    uint64_t v21 = &v15[v19];
    uint64_t v22 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
    uint64_t v23 = *(void *)(v22 - 8);
    uint64_t v69 = v12;
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
      memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      uint64_t v65 = v23;
      uint64_t v67 = v17;
      *uint64_t v20 = *v21;
      *((_DWORD *)v20 + 2) = *((_DWORD *)v21 + 2);
      uint64_t v25 = v21[3];
      v20[2] = v21[2];
      v20[3] = v25;
      *((unsigned char *)v20 + 32) = *((unsigned char *)v21 + 32);
      v20[5] = v21[5];
      uint64_t v26 = *(int *)(v22 + 36);
      uint64_t v27 = (char *)v20 + v26;
      uint64_t v28 = (char *)v21 + v26;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12(v27, v28, v70);
      uint64_t v66 = v22;
      uint64_t v29 = *(int *)(v22 + 40);
      uint64_t v30 = v20;
      uint64_t v31 = (_OWORD *)((char *)v20 + v29);
      uint64_t v32 = (_OWORD *)((char *)v21 + v29);
      uint64_t v33 = type metadata accessor for AspireHeEncryptionParameters(0);
      uint64_t v34 = *(void *)(v33 - 8);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
      {
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
        memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
      }
      else
      {
        *uint64_t v31 = *v32;
        uint64_t v36 = *((void *)v32 + 3);
        *((void *)v31 + 2) = *((void *)v32 + 2);
        *((void *)v31 + 3) = v36;
        *((unsigned char *)v31 + 32) = *((unsigned char *)v32 + 32);
        *((void *)v31 + 5) = *((void *)v32 + 5);
        *((unsigned char *)v31 + 48) = *((unsigned char *)v32 + 48);
        *((void *)v31 + 7) = *((void *)v32 + 7);
        *((unsigned char *)v31 + 64) = *((unsigned char *)v32 + 64);
        uint64_t v37 = *(int *)(v33 + 40);
        uint64_t v63 = (char *)v31 + v37;
        uint64_t v38 = (char *)v32 + v37;
        swift_bridgeObjectRetain();
        v69(v63, v38, v70);
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
      }
      uint64_t v39 = *(int *)(v66 + 44);
      uint64_t v40 = (char *)v30 + v39;
      uint64_t v41 = (char *)v21 + v39;
      uint64_t v42 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
      uint64_t v43 = *(void *)(v42 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v41, 1, v42))
      {
        uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
        memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
      }
      else
      {
        uint64_t v64 = v43;
        uint64_t v45 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
        uint64_t v46 = *(void *)(v45 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v41, 1, v45))
        {
          uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
          memcpy(v40, v41, *(void *)(*(void *)(v47 - 8) + 64));
          uint64_t v48 = v40;
        }
        else
        {
          swift_getEnumCaseMultiPayload();
          uint64_t v62 = v46;
          uint64_t v48 = v40;
          v69(v40, v41, v70);
          swift_storeEnumTagMultiPayload();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v40, 0, 1, v45);
        }
        v69(&v48[*(int *)(v42 + 20)], &v41[*(int *)(v42 + 20)], v70);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v64 + 56))(v48, 0, 1, v42);
      }
      (*(void (**)(void *, void, uint64_t, uint64_t))(v65 + 56))(v30, 0, 1, v66);
      uint64_t v17 = v67;
    }
    uint64_t v49 = v16[7];
    uint64_t v50 = &v14[v49];
    uint64_t v51 = &v15[v49];
    uint64_t v52 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    uint64_t v53 = *(void *)(v52 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v51, 1, v52))
    {
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      memcpy(v50, v51, *(void *)(*(void *)(v54 - 8) + 64));
    }
    else
    {
      uint64_t v68 = v17;
      uint64_t v55 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
      uint64_t v56 = *(void *)(v55 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v51, 1, v55))
      {
        uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
        memcpy(v50, v51, *(void *)(*(void *)(v57 - 8) + 64));
      }
      else
      {
        swift_getEnumCaseMultiPayload();
        v69(v50, v51, v70);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v50, 0, 1, v55);
      }
      uint64_t v17 = v68;
      v69(&v50[*(int *)(v52 + 20)], &v51[*(int *)(v52 + 20)], v70);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v50, 0, 1, v52);
    }
    uint64_t v58 = v16[8];
    uint64_t v59 = &v14[v58];
    uint64_t v60 = &v15[v58];
    *(_DWORD *)uint64_t v59 = *(_DWORD *)v60;
    v59[4] = v60[4];
    (*(void (**)(unsigned char *, void, uint64_t, int *))(v17 + 56))(v14, 0, 1, v16);
  }
  return v72;
}

void *assignWithCopy for AspireSimilaritySerializedProcessedSimilarityDb(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)v5 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v190 = *(void *)(v9 - 8);
  uint64_t v10 = *(void (**)(char *, char *))(v190 + 24);
  uint64_t v189 = v9;
  v10(v7, v8);
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = v5;
  uint64_t v13 = (char *)v5 + v11;
  uint64_t v14 = (char *)a2 + v11;
  uint64_t v15 = (int *)type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v187 = *((void *)v15 - 1);
  uint64_t v16 = *(uint64_t (**)(unsigned char *, uint64_t, int *))(v187 + 48);
  LODWORD(v5) = v16(v13, 1, v15);
  int v17 = v16(v14, 1, v15);
  if (!v5)
  {
    v188 = v10;
    if (v17)
    {
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v13, type metadata accessor for AspireSimilaritySimilarityServerConfig);
      goto LABEL_7;
    }
    *uint64_t v13 = *v14;
    ((void (*)(unsigned char *, unsigned char *, uint64_t))v10)(&v13[v15[5]], &v14[v15[5]], v189);
    uint64_t v27 = v15[6];
    v180 = v13;
    uint64_t v28 = &v13[v27];
    uint64_t v29 = &v14[v27];
    uint64_t v30 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
    uint64_t v31 = *(void *)(v30 - 8);
    uint64_t v32 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v31 + 48);
    uint64_t v176 = (uint64_t)v28;
    LODWORD(v28) = v32(v28, 1, v30);
    uint64_t v171 = v30;
    int v33 = v32(v29, 1, v30);
    v173 = v12;
    v186 = v14;
    if (v28)
    {
      if (!v33)
      {
        v183 = v15;
        *(void *)uint64_t v176 = *(void *)v29;
        *(_DWORD *)(v176 + 8) = *((_DWORD *)v29 + 2);
        *(void *)(v176 + 16) = *((void *)v29 + 2);
        uint64_t v46 = *((void *)v29 + 3);
        *(unsigned char *)(v176 + 32) = v29[32];
        *(void *)(v176 + 24) = v46;
        *(void *)(v176 + 40) = *((void *)v29 + 5);
        uint64_t v47 = *(int *)(v30 + 36);
        uint64_t v48 = v176 + v47;
        uint64_t v49 = &v29[v47];
        uint64_t v50 = *(void (**)(uint64_t, char *, uint64_t))(v190 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v50(v48, v49, v189);
        uint64_t v51 = *(int *)(v30 + 40);
        uint64_t v52 = (void *)(v176 + v51);
        uint64_t v53 = &v29[v51];
        uint64_t v54 = type metadata accessor for AspireHeEncryptionParameters(0);
        uint64_t v55 = *(void *)(v54 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v55 + 48))(v53, 1, v54))
        {
          uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
          memcpy(v52, v53, *(void *)(*(void *)(v56 - 8) + 64));
        }
        else
        {
          void *v52 = *v53;
          v52[1] = v53[1];
          v52[2] = v53[2];
          uint64_t v87 = v53[3];
          *((unsigned char *)v52 + 32) = *((unsigned char *)v53 + 32);
          v52[3] = v87;
          uint64_t v88 = v53[5];
          *((unsigned char *)v52 + 48) = *((unsigned char *)v53 + 48);
          v52[5] = v88;
          uint64_t v89 = v53[7];
          *((unsigned char *)v52 + 64) = *((unsigned char *)v53 + 64);
          v52[7] = v89;
          uint64_t v90 = *(int *)(v54 + 40);
          uint64_t v170 = v54;
          v91 = (char *)v52 + v90;
          uint64_t v92 = (char *)v53 + v90;
          swift_bridgeObjectRetain();
          v50((uint64_t)v91, v92, v189);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v55 + 56))(v52, 0, 1, v170);
        }
        uint64_t v93 = *(int *)(v171 + 44);
        v94 = (char *)(v176 + v93);
        v95 = &v29[v93];
        uint64_t v96 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
        uint64_t v97 = *(void *)(v96 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v97 + 48))(v95, 1, v96))
        {
          uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
          memcpy(v94, v95, *(void *)(*(void *)(v98 - 8) + 64));
        }
        else
        {
          uint64_t v114 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
          uint64_t v115 = *(void *)(v114 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v115 + 48))(v95, 1, v114))
          {
            uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
            memcpy(v94, v95, *(void *)(*(void *)(v116 - 8) + 64));
            uint64_t v117 = v189;
          }
          else
          {
            swift_getEnumCaseMultiPayload();
            uint64_t v169 = v115;
            uint64_t v117 = v189;
            v50((uint64_t)v94, v95, v189);
            swift_storeEnumTagMultiPayload();
            (*(void (**)(char *, void, uint64_t, uint64_t))(v169 + 56))(v94, 0, 1, v114);
          }
          v50((uint64_t)&v94[*(int *)(v96 + 20)], &v95[*(int *)(v96 + 20)], v117);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v97 + 56))(v94, 0, 1, v96);
          uint64_t v15 = v183;
        }
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 56))(v176, 0, 1, v171);
        goto LABEL_54;
      }
      size_t v34 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?)
                                  - 8)
                      + 64);
      uint64_t v35 = (void *)v176;
LABEL_15:
      memcpy(v35, v29, v34);
LABEL_54:
      v131 = v180;
      uint64_t v25 = v173;
      goto LABEL_55;
    }
    if (v33)
    {
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v176, type metadata accessor for AspireSimilaritySimilarityClientConfig);
      size_t v34 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?)
                                  - 8)
                      + 64);
      uint64_t v35 = (void *)v176;
      goto LABEL_15;
    }
    *(void *)uint64_t v176 = *(void *)v29;
    *(_DWORD *)(v176 + 8) = *((_DWORD *)v29 + 2);
    *(void *)(v176 + 16) = *((void *)v29 + 2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v72 = *((void *)v29 + 3);
    *(unsigned char *)(v176 + 32) = v29[32];
    *(void *)(v176 + 24) = v72;
    *(void *)(v176 + 40) = *((void *)v29 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, unsigned char *, uint64_t))v188)(v176 + *(int *)(v30 + 36), &v29[*(int *)(v30 + 36)], v189);
    uint64_t v73 = *(int *)(v30 + 40);
    uint64_t v74 = (void *)(v176 + v73);
    int v75 = &v29[v73];
    uint64_t v76 = type metadata accessor for AspireHeEncryptionParameters(0);
    uint64_t v184 = *(void *)(v76 - 8);
    uint64_t v77 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v184 + 48);
    int v78 = v77(v74, 1, v76);
    int v79 = v77(v75, 1, v76);
    uint64_t v25 = v173;
    if (v78)
    {
      if (!v79)
      {
        void *v74 = *v75;
        v74[1] = v75[1];
        v74[2] = v75[2];
        uint64_t v80 = v75[3];
        *((unsigned char *)v74 + 32) = *((unsigned char *)v75 + 32);
        v74[3] = v80;
        uint64_t v81 = v75[5];
        *((unsigned char *)v74 + 48) = *((unsigned char *)v75 + 48);
        v74[5] = v81;
        uint64_t v82 = v75[7];
        *((unsigned char *)v74 + 64) = *((unsigned char *)v75 + 64);
        v74[7] = v82;
        uint64_t v83 = *(int *)(v76 + 40);
        uint64_t v84 = (char *)v74 + v83;
        uint64_t v85 = (char *)v75 + v83;
        int v86 = *(void (**)(char *, char *, uint64_t))(v190 + 16);
        swift_bridgeObjectRetain();
        v86(v84, v85, v189);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v184 + 56))(v74, 0, 1, v76);
        goto LABEL_44;
      }
    }
    else
    {
      if (!v79)
      {
        void *v74 = *v75;
        v74[1] = v75[1];
        v74[2] = v75[2];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v157 = v75[3];
        *((unsigned char *)v74 + 32) = *((unsigned char *)v75 + 32);
        v74[3] = v157;
        uint64_t v158 = v75[5];
        *((unsigned char *)v74 + 48) = *((unsigned char *)v75 + 48);
        v74[5] = v158;
        uint64_t v159 = v75[7];
        *((unsigned char *)v74 + 64) = *((unsigned char *)v75 + 64);
        v74[7] = v159;
        ((void (*)(char *, char *, uint64_t))v188)((char *)v74 + *(int *)(v76 + 40), (char *)v75 + *(int *)(v76 + 40), v189);
LABEL_44:
        uint64_t v119 = *(int *)(v171 + 44);
        uint64_t v120 = (char *)(v176 + v119);
        v121 = &v29[v119];
        uint64_t v122 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
        uint64_t v123 = *(void *)(v122 - 8);
        v124 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v123 + 48);
        int v125 = v124(v120, 1, v122);
        int v126 = v124(v121, 1, v122);
        if (v125)
        {
          if (!v126)
          {
            uint64_t v127 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
            uint64_t v128 = *(void *)(v127 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v128 + 48))(v121, 1, v127))
            {
              uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
              memcpy(v120, v121, *(void *)(*(void *)(v129 - 8) + 64));
              (*(void (**)(char *, char *, uint64_t))(v190 + 16))(&v120[*(int *)(v122 + 20)], &v121[*(int *)(v122 + 20)], v189);
            }
            else
            {
              swift_getEnumCaseMultiPayload();
              uint64_t v179 = v128;
              v166 = *(void (**)(char *, char *, uint64_t))(v190 + 16);
              v166(v120, v121, v189);
              swift_storeEnumTagMultiPayload();
              (*(void (**)(char *, void, uint64_t, uint64_t))(v179 + 56))(v120, 0, 1, v127);
              v166(&v120[*(int *)(v122 + 20)], &v121[*(int *)(v122 + 20)], v189);
            }
            (*(void (**)(char *, void, uint64_t, uint64_t))(v123 + 56))(v120, 0, 1, v122);
            v131 = v180;
            goto LABEL_55;
          }
        }
        else
        {
          if (!v126)
          {
            uint64_t v160 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
            uint64_t v178 = *(void *)(v160 - 8);
            v161 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v178 + 48);
            int v162 = v161(v120, 1, v160);
            int v163 = v161(v121, 1, v160);
            if (v162)
            {
              uint64_t v164 = v189;
              if (v163)
              {
                uint64_t v165 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
                memcpy(v120, v121, *(void *)(*(void *)(v165 - 8) + 64));
              }
              else
              {
                swift_getEnumCaseMultiPayload();
                (*(void (**)(char *, char *, uint64_t))(v190 + 16))(v120, v121, v189);
                swift_storeEnumTagMultiPayload();
                (*(void (**)(char *, void, uint64_t, uint64_t))(v178 + 56))(v120, 0, 1, v160);
              }
              v167 = (void (*)(char *, char *, uint64_t))v188;
            }
            else
            {
              v167 = (void (*)(char *, char *, uint64_t))v188;
              uint64_t v164 = v189;
              if (v163)
              {
                outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v120, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
                uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
                memcpy(v120, v121, *(void *)(*(void *)(v168 - 8) + 64));
              }
              else if (v173 != a2)
              {
                outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v120, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
                swift_getEnumCaseMultiPayload();
                (*(void (**)(char *, char *, uint64_t))(v190 + 16))(v120, v121, v189);
                swift_storeEnumTagMultiPayload();
              }
            }
            v167(&v120[*(int *)(v122 + 20)], &v121[*(int *)(v122 + 20)], v164);
            v131 = v180;
LABEL_55:
            uint64_t v132 = v15[7];
            v133 = &v131[v132];
            v134 = &v186[v132];
            uint64_t v135 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
            uint64_t v136 = *(void *)(v135 - 8);
            v137 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v136 + 48);
            int v138 = v137(v133, 1, v135);
            int v139 = v137(v134, 1, v135);
            if (v138)
            {
              if (!v139)
              {
                uint64_t v140 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
                uint64_t v141 = *(void *)(v140 - 8);
                if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v141 + 48))(v134, 1, v140))
                {
                  uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
                  memcpy(v133, v134, *(void *)(*(void *)(v142 - 8) + 64));
                  (*(void (**)(char *, char *, uint64_t))(v190 + 16))(&v133[*(int *)(v135 + 20)], &v134[*(int *)(v135 + 20)], v189);
                }
                else
                {
                  swift_getEnumCaseMultiPayload();
                  v149 = *(void (**)(char *, char *, uint64_t))(v190 + 16);
                  v149(v133, v134, v189);
                  swift_storeEnumTagMultiPayload();
                  (*(void (**)(char *, void, uint64_t, uint64_t))(v141 + 56))(v133, 0, 1, v140);
                  v149(&v133[*(int *)(v135 + 20)], &v134[*(int *)(v135 + 20)], v189);
                }
                (*(void (**)(char *, void, uint64_t, uint64_t))(v136 + 56))(v133, 0, 1, v135);
                goto LABEL_72;
              }
              goto LABEL_61;
            }
            if (v139)
            {
              outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v133, type metadata accessor for AspireSimilarityPlaintextPacking);
LABEL_61:
              uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
              memcpy(v133, v134, *(void *)(*(void *)(v143 - 8) + 64));
LABEL_72:
              uint64_t v152 = v15[8];
              v153 = &v180[v152];
              v154 = &v186[v152];
              int v155 = *(_DWORD *)v154;
              v153[4] = v154[4];
              *(_DWORD *)v153 = v155;
              return v25;
            }
            uint64_t v144 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
            uint64_t v177 = *(void *)(v144 - 8);
            v145 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v177 + 48);
            int v146 = v145(v133, 1, v144);
            int v147 = v145(v134, 1, v144);
            if (v146)
            {
              uint64_t v148 = v189;
              if (!v147)
              {
                swift_getEnumCaseMultiPayload();
                (*(void (**)(char *, char *, uint64_t))(v190 + 16))(v133, v134, v189);
                swift_storeEnumTagMultiPayload();
                (*(void (**)(char *, void, uint64_t, uint64_t))(v177 + 56))(v133, 0, 1, v144);
LABEL_70:
                v151 = (void (*)(char *, char *, uint64_t))v188;
LABEL_71:
                v151(&v133[*(int *)(v135 + 20)], &v134[*(int *)(v135 + 20)], v148);
                goto LABEL_72;
              }
            }
            else
            {
              uint64_t v148 = v189;
              if (!v147)
              {
                v151 = (void (*)(char *, char *, uint64_t))v188;
                if (v25 != a2)
                {
                  outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v133, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
                  swift_getEnumCaseMultiPayload();
                  (*(void (**)(char *, char *, uint64_t))(v190 + 16))(v133, v134, v189);
                  swift_storeEnumTagMultiPayload();
                }
                goto LABEL_71;
              }
              outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v133, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
            }
            uint64_t v150 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
            memcpy(v133, v134, *(void *)(*(void *)(v150 - 8) + 64));
            goto LABEL_70;
          }
          outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v120, type metadata accessor for AspireSimilarityPlaintextPacking);
        }
        uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
        memcpy(v120, v121, *(void *)(*(void *)(v130 - 8) + 64));
        v131 = v180;
        goto LABEL_55;
      }
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v74, type metadata accessor for AspireHeEncryptionParameters);
    }
    uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
    memcpy(v74, v75, *(void *)(*(void *)(v118 - 8) + 64));
    goto LABEL_44;
  }
  if (v17)
  {
LABEL_7:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
    memcpy(v13, v14, *(void *)(*(void *)(v26 - 8) + 64));
    return v12;
  }
  *uint64_t v13 = *v14;
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v190 + 16);
  v18(&v13[v15[5]], &v14[v15[5]], v189);
  v182 = v15;
  uint64_t v19 = v15[6];
  uint64_t v20 = &v13[v19];
  uint64_t v21 = &v14[v19];
  uint64_t v22 = (int *)type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  uint64_t v23 = *((void *)v22 - 1);
  v185 = v14;
  v175 = v18;
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v23 + 48))(v21, 1, v22))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    uint64_t v25 = v12;
  }
  else
  {
    uint64_t v174 = v23;
    v181 = v13;
    *uint64_t v20 = *v21;
    *((_DWORD *)v20 + 2) = *((_DWORD *)v21 + 2);
    v20[2] = v21[2];
    uint64_t v36 = v21[3];
    *((unsigned char *)v20 + 32) = *((unsigned char *)v21 + 32);
    v20[3] = v36;
    v20[5] = v21[5];
    uint64_t v37 = v22[9];
    uint64_t v38 = (char *)v20 + v37;
    uint64_t v39 = (char *)v21 + v37;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(v38, v39, v189);
    uint64_t v40 = v22[10];
    uint64_t v41 = (void *)((char *)v20 + v40);
    uint64_t v42 = (void *)((char *)v21 + v40);
    uint64_t v43 = type metadata accessor for AspireHeEncryptionParameters(0);
    uint64_t v44 = *(void *)(v43 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v44 + 48))(v42, 1, v43))
    {
      uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
      memcpy(v41, v42, *(void *)(*(void *)(v45 - 8) + 64));
    }
    else
    {
      *uint64_t v41 = *v42;
      v41[1] = v42[1];
      v41[2] = v42[2];
      uint64_t v57 = v42[3];
      *((unsigned char *)v41 + 32) = *((unsigned char *)v42 + 32);
      v41[3] = v57;
      uint64_t v58 = v42[5];
      *((unsigned char *)v41 + 48) = *((unsigned char *)v42 + 48);
      v41[5] = v58;
      uint64_t v59 = v42[7];
      *((unsigned char *)v41 + 64) = *((unsigned char *)v42 + 64);
      v41[7] = v59;
      uint64_t v60 = *(int *)(v43 + 40);
      v172 = (char *)v41 + v60;
      uint64_t v61 = (char *)v42 + v60;
      swift_bridgeObjectRetain();
      v18(v172, v61, v189);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
    }
    uint64_t v25 = v12;
    uint64_t v62 = v22[11];
    uint64_t v63 = (char *)v20 + v62;
    uint64_t v64 = (char *)v21 + v62;
    uint64_t v65 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    uint64_t v66 = *(void *)(v65 - 8);
    uint64_t v67 = v174;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48))(v64, 1, v65))
    {
      uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      memcpy(v63, v64, *(void *)(*(void *)(v68 - 8) + 64));
    }
    else
    {
      uint64_t v69 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
      uint64_t v70 = *(void *)(v69 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v70 + 48))(v64, 1, v69))
      {
        uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
        memcpy(v63, v64, *(void *)(*(void *)(v71 - 8) + 64));
      }
      else
      {
        swift_getEnumCaseMultiPayload();
        v175(v63, v64, v189);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v70 + 56))(v63, 0, 1, v69);
      }
      v175(&v63[*(int *)(v65 + 20)], &v64[*(int *)(v65 + 20)], v189);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v66 + 56))(v63, 0, 1, v65);
      uint64_t v67 = v174;
    }
    (*(void (**)(void *, void, uint64_t, int *))(v67 + 56))(v20, 0, 1, v22);
    uint64_t v13 = v181;
    uint64_t v14 = v185;
  }
  uint64_t v99 = v15[7];
  uint64_t v100 = &v13[v99];
  uint64_t v101 = &v14[v99];
  uint64_t v102 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v103 = *(void *)(v102 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v103 + 48))(v101, 1, v102))
  {
    uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v100, v101, *(void *)(*(void *)(v104 - 8) + 64));
    uint64_t v105 = v187;
  }
  else
  {
    uint64_t v106 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v107 = *(void *)(v106 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v107 + 48))(v101, 1, v106))
    {
      uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
      memcpy(v100, v101, *(void *)(*(void *)(v108 - 8) + 64));
      uint64_t v109 = v189;
    }
    else
    {
      swift_getEnumCaseMultiPayload();
      uint64_t v109 = v189;
      v175(v100, v101, v189);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v107 + 56))(v100, 0, 1, v106);
    }
    uint64_t v105 = v187;
    v175(&v100[*(int *)(v102 + 20)], &v101[*(int *)(v102 + 20)], v109);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v103 + 56))(v100, 0, 1, v102);
    uint64_t v15 = v182;
  }
  uint64_t v110 = v15[8];
  v111 = &v13[v110];
  v112 = &v185[v110];
  int v113 = *(_DWORD *)v112;
  v111[4] = v112[4];
  *(_DWORD *)v111 = v113;
  (*(void (**)(unsigned char *, void, uint64_t, int *))(v105 + 56))(v13, 0, 1, v15);
  return v25;
}

uint64_t initializeWithTake for AspireSimilaritySerializedProcessedSimilarityDb(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = (unsigned char *)(a1 + v11);
  uint64_t v13 = (unsigned char *)(a2 + v11);
  uint64_t v14 = (int *)type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v15 = *((void *)v14 - 1);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, int *))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    v10((uint64_t)&v12[v14[5]], (uint64_t)&v13[v14[5]], v9);
    uint64_t v17 = v14[6];
    uint64_t v73 = v12;
    uint64_t v18 = &v12[v17];
    uint64_t v19 = v13;
    uint64_t v20 = v9;
    uint64_t v71 = v19;
    uint64_t v21 = &v19[v17];
    uint64_t v22 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
    uint64_t v23 = *(void *)(v22 - 8);
    uint64_t v69 = v20;
    uint64_t v70 = (void (*)(char *, char *, uint64_t))v10;
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
      memcpy(v18, v21, *(void *)(*(void *)(v24 - 8) + 64));
      uint64_t v26 = v71;
      uint64_t v25 = v73;
    }
    else
    {
      uint64_t v65 = v23;
      uint64_t v67 = v15;
      *uint64_t v18 = *v21;
      *((_DWORD *)v18 + 2) = *((_DWORD *)v21 + 2);
      uint64_t v27 = v21[3];
      v18[2] = v21[2];
      v18[3] = v27;
      *((unsigned char *)v18 + 32) = *((unsigned char *)v21 + 32);
      v18[5] = v21[5];
      v10((uint64_t)v18 + *(int *)(v22 + 36), (uint64_t)v21 + *(int *)(v22 + 36), v20);
      uint64_t v66 = v22;
      uint64_t v28 = *(int *)(v22 + 40);
      uint64_t v29 = (_OWORD *)((char *)v18 + v28);
      uint64_t v30 = (_OWORD *)((char *)v21 + v28);
      uint64_t v31 = (void (*)(char *, char *, uint64_t))v10;
      uint64_t v32 = type metadata accessor for AspireHeEncryptionParameters(0);
      uint64_t v62 = *(void *)(v32 - 8);
      uint64_t v64 = v18;
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v62 + 48))(v30, 1, v32))
      {
        uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
        memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
      }
      else
      {
        *uint64_t v29 = *v30;
        uint64_t v34 = *((void *)v30 + 3);
        *((void *)v29 + 2) = *((void *)v30 + 2);
        *((void *)v29 + 3) = v34;
        *((unsigned char *)v29 + 32) = *((unsigned char *)v30 + 32);
        *((void *)v29 + 5) = *((void *)v30 + 5);
        *((unsigned char *)v29 + 48) = *((unsigned char *)v30 + 48);
        *((void *)v29 + 7) = *((void *)v30 + 7);
        *((unsigned char *)v29 + 64) = *((unsigned char *)v30 + 64);
        v31((char *)v29 + *(int *)(v32 + 40), (char *)v30 + *(int *)(v32 + 40), v20);
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v62 + 56))(v29, 0, 1, v32);
      }
      uint64_t v25 = v73;
      uint64_t v35 = v66;
      uint64_t v36 = *(int *)(v66 + 44);
      uint64_t v37 = v64;
      uint64_t v38 = (char *)v64 + v36;
      uint64_t v39 = (char *)v21 + v36;
      uint64_t v40 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
      uint64_t v41 = *(void *)(v40 - 8);
      uint64_t v42 = v65;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
      {
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
        memcpy(v38, v39, *(void *)(*(void *)(v43 - 8) + 64));
      }
      else
      {
        uint64_t v63 = v41;
        uint64_t v44 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
        uint64_t v45 = *(void *)(v44 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v39, 1, v44))
        {
          uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
          memcpy(v38, v39, *(void *)(*(void *)(v46 - 8) + 64));
          uint64_t v47 = v38;
        }
        else
        {
          swift_getEnumCaseMultiPayload();
          uint64_t v61 = v45;
          uint64_t v47 = v38;
          v70(v38, v39, v69);
          swift_storeEnumTagMultiPayload();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v61 + 56))(v38, 0, 1, v44);
        }
        v70(&v38[*(int *)(v40 + 20)], &v39[*(int *)(v40 + 20)], v69);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v63 + 56))(v47, 0, 1, v40);
        uint64_t v42 = v65;
        uint64_t v35 = v66;
        uint64_t v37 = v64;
      }
      uint64_t v26 = v71;
      (*(void (**)(void *, void, uint64_t, uint64_t))(v42 + 56))(v37, 0, 1, v35);
      uint64_t v15 = v67;
    }
    uint64_t v48 = v14[7];
    uint64_t v49 = &v25[v48];
    uint64_t v50 = &v26[v48];
    uint64_t v51 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    uint64_t v52 = *(void *)(v51 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v52 + 48))(v50, 1, v51))
    {
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      memcpy(v49, v50, *(void *)(*(void *)(v53 - 8) + 64));
    }
    else
    {
      uint64_t v72 = v52;
      uint64_t v68 = v15;
      uint64_t v54 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
      uint64_t v55 = *(void *)(v54 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48))(v50, 1, v54))
      {
        uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
        memcpy(v49, v50, *(void *)(*(void *)(v56 - 8) + 64));
      }
      else
      {
        swift_getEnumCaseMultiPayload();
        v70(v49, v50, v69);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v49, 0, 1, v54);
        uint64_t v25 = v73;
      }
      uint64_t v15 = v68;
      v70(&v49[*(int *)(v51 + 20)], &v50[*(int *)(v51 + 20)], v69);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v49, 0, 1, v51);
    }
    uint64_t v57 = v14[8];
    uint64_t v58 = &v25[v57];
    uint64_t v59 = &v26[v57];
    *(_DWORD *)uint64_t v58 = *(_DWORD *)v59;
    v58[4] = v59[4];
    (*(void (**)(unsigned char *, void, uint64_t, int *))(v15 + 56))(v25, 0, 1, v14);
  }
  return a1;
}

void *assignWithTake for AspireSimilaritySerializedProcessedSimilarityDb(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  *a1 = *a2;
  swift_bridgeObjectRelease();
  v5[1] = a2[1];
  swift_bridgeObjectRelease();
  v5[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)v5 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v164 = type metadata accessor for UnknownStorage();
  uint64_t v165 = *(void *)(v164 - 8);
  uint64_t v9 = *(void (**)(char *, char *))(v165 + 40);
  v9(v7, v8);
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = v5;
  uint64_t v12 = (char *)v5 + v10;
  uint64_t v13 = (char *)a2 + v10;
  uint64_t v14 = type metadata accessor for AspireSimilaritySimilarityServerConfig(0);
  uint64_t v162 = *(void *)(v14 - 8);
  uint64_t v15 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v162 + 48);
  LODWORD(v5) = v15(v12, 1, v14);
  uint64_t v166 = v14;
  int v16 = v15(v13, 1, v14);
  if (!v5)
  {
    int v163 = (void (*)(uint64_t, char *, uint64_t))v9;
    if (v16)
    {
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v12, type metadata accessor for AspireSimilaritySimilarityServerConfig);
      goto LABEL_7;
    }
    *uint64_t v12 = *v13;
    ((void (*)(unsigned char *, unsigned char *, uint64_t))v9)(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v164);
    uint64_t v27 = *(int *)(v14 + 24);
    uint64_t v158 = v12;
    uint64_t v28 = &v12[v27];
    uint64_t v29 = &v13[v27];
    uint64_t v30 = type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
    uint64_t v31 = *(void *)(v30 - 8);
    uint64_t v32 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v31 + 48);
    uint64_t v155 = (uint64_t)v28;
    int v33 = v32(v28, 1, v30);
    uint64_t v151 = v30;
    int v34 = v32(v29, 1, v30);
    uint64_t v26 = v11;
    v161 = v13;
    if (v33)
    {
      if (v34)
      {
        size_t v35 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?)
                                    - 8)
                        + 64);
        uint64_t v36 = (void *)v155;
LABEL_15:
        memcpy(v36, v29, v35);
LABEL_16:
        uint64_t v44 = v158;
        uint64_t v45 = v166;
        goto LABEL_56;
      }
      *(void *)uint64_t v155 = *v29;
      *(_DWORD *)(v155 + 8) = *((_DWORD *)v29 + 2);
      uint64_t v46 = v29[3];
      *(void *)(v155 + 16) = v29[2];
      *(void *)(v155 + 24) = v46;
      *(unsigned char *)(v155 + 32) = *((unsigned char *)v29 + 32);
      *(void *)(v155 + 40) = v29[5];
      v149 = *(void (**)(uint64_t, char *, uint64_t))(v165 + 32);
      v149(v155 + *(int *)(v30 + 36), (char *)v29 + *(int *)(v30 + 36), v164);
      uint64_t v47 = *(int *)(v30 + 40);
      uint64_t v48 = (_OWORD *)(v155 + v47);
      uint64_t v49 = (_OWORD *)((char *)v29 + v47);
      uint64_t v50 = type metadata accessor for AspireHeEncryptionParameters(0);
      uint64_t v51 = *(void *)(v50 - 8);
      uint64_t v52 = v50;
      if ((*(unsigned int (**)(_OWORD *, uint64_t))(v51 + 48))(v49, 1))
      {
        uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
        memcpy(v48, v49, *(void *)(*(void *)(v53 - 8) + 64));
        uint64_t v54 = (void (*)(char *, char *, uint64_t))v149;
      }
      else
      {
        *uint64_t v48 = *v49;
        uint64_t v75 = *((void *)v49 + 3);
        *((void *)v48 + 2) = *((void *)v49 + 2);
        *((void *)v48 + 3) = v75;
        *((unsigned char *)v48 + 32) = *((unsigned char *)v49 + 32);
        *((void *)v48 + 5) = *((void *)v49 + 5);
        *((unsigned char *)v48 + 48) = *((unsigned char *)v49 + 48);
        *((void *)v48 + 7) = *((void *)v49 + 7);
        *((unsigned char *)v48 + 64) = *((unsigned char *)v49 + 64);
        uint64_t v54 = (void (*)(char *, char *, uint64_t))v149;
        v149((uint64_t)v48 + *(int *)(v52 + 40), (char *)v49 + *(int *)(v52 + 40), v164);
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v51 + 56))(v48, 0, 1, v52);
      }
      uint64_t v76 = *(int *)(v151 + 44);
      uint64_t v77 = (char *)(v155 + v76);
      int v78 = (char *)v29 + v76;
      uint64_t v79 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
      uint64_t v80 = *(void *)(v79 - 8);
      uint64_t v45 = v166;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v80 + 48))(v78, 1, v79))
      {
        uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
        memcpy(v77, v78, *(void *)(*(void *)(v81 - 8) + 64));
      }
      else
      {
        uint64_t v98 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
        uint64_t v99 = *(void *)(v98 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v99 + 48))(v78, 1, v98))
        {
          uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
          memcpy(v77, v78, *(void *)(*(void *)(v100 - 8) + 64));
          uint64_t v101 = v164;
        }
        else
        {
          swift_getEnumCaseMultiPayload();
          uint64_t v148 = v99;
          uint64_t v101 = v164;
          v54(v77, v78, v164);
          swift_storeEnumTagMultiPayload();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v148 + 56))(v77, 0, 1, v98);
        }
        v54(&v77[*(int *)(v79 + 20)], &v78[*(int *)(v79 + 20)], v101);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v80 + 56))(v77, 0, 1, v79);
        uint64_t v45 = v166;
      }
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 56))(v155, 0, 1, v151);
      goto LABEL_55;
    }
    if (v34)
    {
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(v155, type metadata accessor for AspireSimilaritySimilarityClientConfig);
      size_t v35 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?)
                                  - 8)
                      + 64);
      uint64_t v36 = (void *)v155;
      goto LABEL_15;
    }
    *(void *)uint64_t v155 = *v29;
    *(_DWORD *)(v155 + 8) = *((_DWORD *)v29 + 2);
    *(void *)(v155 + 16) = v29[2];
    swift_bridgeObjectRelease();
    *(void *)(v155 + 24) = v29[3];
    *(unsigned char *)(v155 + 32) = *((unsigned char *)v29 + 32);
    *(void *)(v155 + 40) = v29[5];
    swift_bridgeObjectRelease();
    v163(v155 + *(int *)(v30 + 36), (char *)v29 + *(int *)(v30 + 36), v164);
    uint64_t v66 = *(int *)(v30 + 40);
    uint64_t v67 = (char *)(v155 + v66);
    uint64_t v68 = (char *)v29 + v66;
    uint64_t v69 = type metadata accessor for AspireHeEncryptionParameters(0);
    uint64_t v70 = *(void *)(v69 - 8);
    uint64_t v71 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v70 + 48);
    int v72 = v71(v67, 1, v69);
    uint64_t v150 = v69;
    int v73 = v71(v68, 1, v69);
    uint64_t v45 = v166;
    if (v72)
    {
      if (!v73)
      {
        *(_OWORD *)uint64_t v67 = *(_OWORD *)v68;
        uint64_t v74 = *((void *)v68 + 3);
        *((void *)v67 + 2) = *((void *)v68 + 2);
        *((void *)v67 + 3) = v74;
        v67[32] = v68[32];
        v67[48] = v68[48];
        *((void *)v67 + 5) = *((void *)v68 + 5);
        *((void *)v67 + 7) = *((void *)v68 + 7);
        v67[64] = v68[64];
        (*(void (**)(char *, char *, uint64_t))(v165 + 32))(&v67[*(int *)(v150 + 40)], &v68[*(int *)(v150 + 40)], v164);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v70 + 56))(v67, 0, 1, v150);
LABEL_45:
        uint64_t v103 = *(int *)(v151 + 44);
        uint64_t v104 = (char *)(v155 + v103);
        uint64_t v105 = (char *)v29 + v103;
        uint64_t v106 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
        uint64_t v107 = *(void *)(v106 - 8);
        uint64_t v108 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v107 + 48);
        int v109 = v108(v104, 1, v106);
        int v110 = v108(v105, 1, v106);
        if (v109)
        {
          if (!v110)
          {
            uint64_t v111 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
            uint64_t v112 = *(void *)(v111 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v112 + 48))(v105, 1, v111))
            {
              uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
              memcpy(v104, v105, *(void *)(*(void *)(v113 - 8) + 64));
              (*(void (**)(char *, char *, uint64_t))(v165 + 32))(&v104[*(int *)(v106 + 20)], &v105[*(int *)(v106 + 20)], v164);
            }
            else
            {
              swift_getEnumCaseMultiPayload();
              v145 = *(void (**)(char *, char *, uint64_t))(v165 + 32);
              v145(v104, v105, v164);
              swift_storeEnumTagMultiPayload();
              (*(void (**)(char *, void, uint64_t, uint64_t))(v112 + 56))(v104, 0, 1, v111);
              v145(&v104[*(int *)(v106 + 20)], &v105[*(int *)(v106 + 20)], v164);
            }
            (*(void (**)(char *, void, uint64_t, uint64_t))(v107 + 56))(v104, 0, 1, v106);
            goto LABEL_16;
          }
        }
        else
        {
          if (!v110)
          {
            uint64_t v139 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
            uint64_t v154 = *(void *)(v139 - 8);
            uint64_t v140 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v154 + 48);
            int v141 = v140(v104, 1, v139);
            int v142 = v140(v105, 1, v139);
            if (v141)
            {
              uint64_t v143 = v164;
              if (v142)
              {
                uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
                memcpy(v104, v105, *(void *)(*(void *)(v144 - 8) + 64));
              }
              else
              {
                swift_getEnumCaseMultiPayload();
                (*(void (**)(char *, char *, uint64_t))(v165 + 32))(v104, v105, v164);
                uint64_t v143 = v164;
                swift_storeEnumTagMultiPayload();
                (*(void (**)(char *, void, uint64_t, uint64_t))(v154 + 56))(v104, 0, 1, v139);
              }
              int v146 = (void (*)(char *, char *, uint64_t))v163;
            }
            else
            {
              int v146 = (void (*)(char *, char *, uint64_t))v163;
              uint64_t v143 = v164;
              if (v142)
              {
                outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v104, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
                uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
                memcpy(v104, v105, *(void *)(*(void *)(v147 - 8) + 64));
              }
              else if (v26 != a2)
              {
                outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v104, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
                swift_getEnumCaseMultiPayload();
                (*(void (**)(char *, char *, uint64_t))(v165 + 32))(v104, v105, v164);
                swift_storeEnumTagMultiPayload();
              }
            }
            v146(&v104[*(int *)(v106 + 20)], &v105[*(int *)(v106 + 20)], v143);
            goto LABEL_55;
          }
          outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v104, type metadata accessor for AspireSimilarityPlaintextPacking);
        }
        uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
        memcpy(v104, v105, *(void *)(*(void *)(v114 - 8) + 64));
LABEL_55:
        uint64_t v44 = v158;
LABEL_56:
        uint64_t v115 = *(int *)(v45 + 28);
        uint64_t v116 = &v44[v115];
        uint64_t v117 = &v161[v115];
        uint64_t v118 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
        uint64_t v119 = *(void *)(v118 - 8);
        uint64_t v120 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v119 + 48);
        int v121 = v120(v116, 1, v118);
        int v122 = v120(v117, 1, v118);
        if (v121)
        {
          if (!v122)
          {
            uint64_t v123 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
            uint64_t v124 = *(void *)(v123 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v124 + 48))(v117, 1, v123))
            {
              uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
              memcpy(v116, v117, *(void *)(*(void *)(v125 - 8) + 64));
              (*(void (**)(char *, char *, uint64_t))(v165 + 32))(&v116[*(int *)(v118 + 20)], &v117[*(int *)(v118 + 20)], v164);
            }
            else
            {
              swift_getEnumCaseMultiPayload();
              uint64_t v132 = *(void (**)(char *, char *, uint64_t))(v165 + 32);
              v132(v116, v117, v164);
              swift_storeEnumTagMultiPayload();
              (*(void (**)(char *, void, uint64_t, uint64_t))(v124 + 56))(v116, 0, 1, v123);
              v132(&v116[*(int *)(v118 + 20)], &v117[*(int *)(v118 + 20)], v164);
            }
            (*(void (**)(char *, void, uint64_t, uint64_t))(v119 + 56))(v116, 0, 1, v118);
            uint64_t v45 = v166;
            goto LABEL_73;
          }
          goto LABEL_62;
        }
        if (v122)
        {
          outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v116, type metadata accessor for AspireSimilarityPlaintextPacking);
LABEL_62:
          uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
          memcpy(v116, v117, *(void *)(*(void *)(v126 - 8) + 64));
LABEL_73:
          uint64_t v135 = *(int *)(v45 + 32);
          uint64_t v136 = &v158[v135];
          v137 = &v161[v135];
          *(_DWORD *)uint64_t v136 = *(_DWORD *)v137;
          v136[4] = v137[4];
          return v26;
        }
        uint64_t v127 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
        uint64_t v153 = *(void *)(v127 - 8);
        uint64_t v128 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v153 + 48);
        int v129 = v128(v116, 1, v127);
        int v130 = v128(v117, 1, v127);
        if (v129)
        {
          if (!v130)
          {
            swift_getEnumCaseMultiPayload();
            uint64_t v131 = v164;
            (*(void (**)(char *, char *, uint64_t))(v165 + 32))(v116, v117, v164);
            swift_storeEnumTagMultiPayload();
            (*(void (**)(char *, void, uint64_t, uint64_t))(v153 + 56))(v116, 0, 1, v127);
LABEL_71:
            v134 = (void (*)(char *, char *, uint64_t))v163;
LABEL_72:
            v134(&v116[*(int *)(v118 + 20)], &v117[*(int *)(v118 + 20)], v131);
            goto LABEL_73;
          }
        }
        else
        {
          if (!v130)
          {
            v134 = (void (*)(char *, char *, uint64_t))v163;
            uint64_t v131 = v164;
            if (v26 != a2)
            {
              outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v116, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
              swift_getEnumCaseMultiPayload();
              (*(void (**)(char *, char *, uint64_t))(v165 + 32))(v116, v117, v164);
              swift_storeEnumTagMultiPayload();
            }
            goto LABEL_72;
          }
          outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v116, type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType);
        }
        uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
        memcpy(v116, v117, *(void *)(*(void *)(v133 - 8) + 64));
        uint64_t v131 = v164;
        goto LABEL_71;
      }
    }
    else
    {
      if (!v73)
      {
        *(_OWORD *)uint64_t v67 = *(_OWORD *)v68;
        *((void *)v67 + 2) = *((void *)v68 + 2);
        swift_bridgeObjectRelease();
        *((void *)v67 + 3) = *((void *)v68 + 3);
        v67[32] = v68[32];
        *((void *)v67 + 5) = *((void *)v68 + 5);
        v67[48] = v68[48];
        *((void *)v67 + 7) = *((void *)v68 + 7);
        v67[64] = v68[64];
        v163((uint64_t)&v67[*(int *)(v150 + 40)], &v68[*(int *)(v150 + 40)], v164);
        goto LABEL_45;
      }
      outlined destroy of AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType((uint64_t)v67, type metadata accessor for AspireHeEncryptionParameters);
    }
    uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
    memcpy(v67, v68, *(void *)(*(void *)(v102 - 8) + 64));
    goto LABEL_45;
  }
  if (v16)
  {
LABEL_7:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
    memcpy(v12, v13, *(void *)(*(void *)(v25 - 8) + 64));
    return v11;
  }
  *uint64_t v12 = *v13;
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v165 + 32);
  v17(&v12[*(int *)(v166 + 20)], &v13[*(int *)(v166 + 20)], v164);
  uint64_t v18 = *(int *)(v166 + 24);
  uint64_t v19 = &v12[v18];
  uint64_t v20 = &v13[v18];
  uint64_t v21 = (int *)type metadata accessor for AspireSimilaritySimilarityClientConfig(0);
  uint64_t v22 = *((void *)v21 - 1);
  uint64_t v157 = v11;
  uint64_t v160 = v13;
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityClientConfig?);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    uint64_t v24 = v166;
  }
  else
  {
    uint64_t v156 = v22;
    uint64_t v159 = v12;
    void *v19 = *v20;
    *((_DWORD *)v19 + 2) = *((_DWORD *)v20 + 2);
    uint64_t v37 = v20[3];
    v19[2] = v20[2];
    v19[3] = v37;
    *((unsigned char *)v19 + 32) = *((unsigned char *)v20 + 32);
    v19[5] = v20[5];
    v17((char *)v19 + v21[9], (char *)v20 + v21[9], v164);
    uint64_t v38 = v21[10];
    uint64_t v39 = (_OWORD *)((char *)v19 + v38);
    uint64_t v40 = (_OWORD *)((char *)v20 + v38);
    uint64_t v41 = type metadata accessor for AspireHeEncryptionParameters(0);
    uint64_t v42 = *(void *)(v41 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41))
    {
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireHeEncryptionParameters?);
      memcpy(v39, v40, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      _OWORD *v39 = *v40;
      uint64_t v55 = *((void *)v40 + 3);
      *((void *)v39 + 2) = *((void *)v40 + 2);
      *((void *)v39 + 3) = v55;
      *((unsigned char *)v39 + 32) = *((unsigned char *)v40 + 32);
      *((void *)v39 + 5) = *((void *)v40 + 5);
      *((unsigned char *)v39 + 48) = *((unsigned char *)v40 + 48);
      *((void *)v39 + 7) = *((void *)v40 + 7);
      *((unsigned char *)v39 + 64) = *((unsigned char *)v40 + 64);
      v17((char *)v39 + *(int *)(v41 + 40), (char *)v40 + *(int *)(v41 + 40), v164);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
    }
    uint64_t v24 = v166;
    uint64_t v56 = v22;
    uint64_t v57 = v21[11];
    uint64_t v58 = (char *)v19 + v57;
    uint64_t v59 = (char *)v20 + v57;
    uint64_t v60 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
    uint64_t v61 = *(void *)(v60 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48))(v59, 1, v60))
    {
      uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
      memcpy(v58, v59, *(void *)(*(void *)(v62 - 8) + 64));
    }
    else
    {
      uint64_t v152 = v61;
      uint64_t v63 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
      uint64_t v64 = *(void *)(v63 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v59, 1, v63))
      {
        uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
        memcpy(v58, v59, *(void *)(*(void *)(v65 - 8) + 64));
      }
      else
      {
        swift_getEnumCaseMultiPayload();
        v17(v58, v59, v164);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v64 + 56))(v58, 0, 1, v63);
      }
      v17(&v58[*(int *)(v60 + 20)], &v59[*(int *)(v60 + 20)], v164);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v152 + 56))(v58, 0, 1, v60);
      uint64_t v56 = v156;
    }
    (*(void (**)(void *, void, uint64_t, int *))(v56 + 56))(v19, 0, 1, v21);
    uint64_t v12 = v159;
    uint64_t v13 = v160;
  }
  uint64_t v26 = v157;
  uint64_t v82 = *(int *)(v24 + 28);
  uint64_t v83 = &v12[v82];
  uint64_t v84 = &v13[v82];
  uint64_t v85 = type metadata accessor for AspireSimilarityPlaintextPacking(0);
  uint64_t v86 = *(void *)(v85 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v86 + 48))(v84, 1, v85))
  {
    uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking?);
    memcpy(v83, v84, *(void *)(*(void *)(v87 - 8) + 64));
    uint64_t v88 = v162;
  }
  else
  {
    uint64_t v89 = type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType(0);
    uint64_t v90 = *(void *)(v89 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48))(v84, 1, v89))
    {
      uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?);
      memcpy(v83, v84, *(void *)(*(void *)(v91 - 8) + 64));
      uint64_t v92 = v164;
    }
    else
    {
      swift_getEnumCaseMultiPayload();
      uint64_t v93 = v90;
      uint64_t v92 = v164;
      v17(v83, v84, v164);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v93 + 56))(v83, 0, 1, v89);
      uint64_t v26 = v157;
    }
    v94 = v17;
    uint64_t v88 = v162;
    v94(&v83[*(int *)(v85 + 20)], &v84[*(int *)(v85 + 20)], v92);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v86 + 56))(v83, 0, 1, v85);
    uint64_t v24 = v166;
  }
  uint64_t v95 = *(int *)(v24 + 32);
  uint64_t v96 = &v12[v95];
  uint64_t v97 = &v160[v95];
  *(_DWORD *)uint64_t v96 = *(_DWORD *)v97;
  v96[4] = v97[4];
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v88 + 56))(v12, 0, 1, v24);
  return v26;
}

uint64_t getEnumTagSinglePayload for AspireSimilaritySerializedProcessedSimilarityDb(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249E7C4BC);
}

uint64_t sub_249E7C4BC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 28);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      int v16 = (char *)a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for AspireSimilaritySerializedProcessedSimilarityDb(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249E7C600);
}

void *sub_249E7C600(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 28);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireSimilaritySimilarityServerConfig?);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      int v16 = (char *)v5 + *(int *)(a4 + 32);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void type metadata completion function for AspireSimilaritySerializedProcessedSimilarityDb(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void type metadata completion function for AspireSimilaritySerializedCiphertextMatrix(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, void (*a6)(uint64_t))
{
  type metadata accessor for UnknownStorage();
  if (v8 <= 0x3F)
  {
    type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?(319, a5, a6);
    if (v9 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for AspireSimilaritySimilarityDbRow(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    unint64_t v8 = a2[2];
    outlined copy of Data._Representation(v7, v8);
    v4[1] = v7;
    v4[2] = v8;
    v4[3] = a2[3];
    uint64_t v9 = *(int *)(a3 + 28);
    uint64_t v10 = (char *)v4 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for UnknownStorage();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
  }
  return v4;
}

uint64_t destroy for AspireSimilaritySimilarityDbRow(uint64_t a1, uint64_t a2)
{
  outlined consume of Data._Representation(*(void *)(a1 + 8), *(void *)(a1 + 16));
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for AspireSimilaritySimilarityDbRow(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  unint64_t v7 = a2[2];
  outlined copy of Data._Representation(v6, v7);
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = a2[3];
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  return a1;
}

void *assignWithCopy for AspireSimilaritySimilarityDbRow(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[1];
  unint64_t v7 = a2[2];
  outlined copy of Data._Representation(v6, v7);
  uint64_t v8 = a1[1];
  unint64_t v9 = a1[2];
  a1[1] = v6;
  a1[2] = v7;
  outlined consume of Data._Representation(v8, v9);
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t initializeWithTake for AspireSimilaritySimilarityDbRow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for AspireSimilaritySimilarityDbRow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a1 + 8);
  unint64_t v8 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v6;
  outlined consume of Data._Representation(v7, v8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for AspireSimilaritySimilarityDbRow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249E7CCA4);
}

uint64_t sub_249E7CCA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AspireSimilaritySimilarityDbRow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249E7CD68);
}

uint64_t sub_249E7CD68(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for AspireSimilaritySimilarityDbRow()
{
  uint64_t result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AspireSimilaritySimilarityDb(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249E7CED8);
}

uint64_t sub_249E7CED8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AspireSimilaritySimilarityDb(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249E7CF9C);
}

void *sub_249E7CF9C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AspireSimilarityPecPreprocessDbArgs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249E7D058);
}

uint64_t sub_249E7D058(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UnknownStorage();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for AspireSimilarityPecPreprocessDbArgs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249E7D12C);
}

uint64_t sub_249E7D12C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UnknownStorage();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t ObjC metadata update function for AspireSimilarityPecPreprocessDbArgs._StorageClass()
{
  return type metadata accessor for AspireSimilarityPecPreprocessDbArgs._StorageClass(0);
}

void type metadata completion function for AspireSimilarityPecPreprocessDbArgs._StorageClass()
{
  type metadata accessor for AspireSimilarityPlaintextPacking.OneOf_PlaintextPackingType?(319, &lazy cache variable for type metadata for AspireSimilaritySimilarityServerConfig?, (void (*)(uint64_t))type metadata accessor for AspireSimilaritySimilarityServerConfig);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t AspireSimilarityPlaintextPackingDiagonal.traverse<A>(visitor:)()
{
  return AspireSimilarityPlaintextPackingDenseRow.traverse<A>(visitor:)();
}

uint64_t AspireSimilarityPlaintextPackingDenseColumn.traverse<A>(visitor:)()
{
  return AspireSimilarityPlaintextPackingDenseRow.traverse<A>(visitor:)();
}

void *CacheCleaner.__allocating_init(allowListLock:getCurrentDate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

uint64_t CacheCleaner.allowListLock.getter()
{
  return swift_retain();
}

uint64_t CacheCleaner.currentDate.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_retain();
  return v1;
}

uint64_t (*default argument 1 of CacheCleaner.init(allowListLock:getCurrentDate:)())()
{
  return closure #1 in default argument 4 of RequestsManager.init(configCache:keyStorage:activeUseCaseTracker:allowList:currentTime:);
}

void *CacheCleaner.init(allowListLock:getCurrentDate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return v3;
}

uint64_t CacheCleaner.run()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](CacheCleaner.run(), 0, 0);
}

{
  void *v0;
  os_unfair_lock_s *v1;
  uint64_t *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  void *v7;
  uint64_t v8;

  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v1 = *(os_unfair_lock_s **)(static TokenCache.shared + OBJC_IVAR____TtC8CipherML10TokenCache_tokensForUserLock);
  unint64_t v2 = (uint64_t *)&v1[4];
  int v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  partial apply for closure #1 in TokenCache.pruneCache()(v2);
  os_unfair_lock_unlock(v3);
  TokenCache.save()();
  if (v4)
  {
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  else
  {
    uint64_t v7 = (void *)swift_task_alloc();
    v0[3] = v7;
    *uint64_t v7 = v0;
    v7[1] = TokenFetcher.backgroundTokenFetch();
    v7[2] = v0[2];
    return MEMORY[0x270FA2498](CacheCleaner.cleanPirCaches(), 0, 0);
  }
}

uint64_t CacheCleaner.cleanPirCaches()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](CacheCleaner.cleanPirCaches(), 0, 0);
}

{
  uint64_t v0;
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(void);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  uint64_t v38 = v0;
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)(v0 + 16) + 16);
  unint64_t v2 = v1 + 4;
  int v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  closure #1 in OSAllocatedUnfairLock<A>.current.getter(v2, &v37);
  os_unfair_lock_unlock(v3);
  uint64_t v4 = *(void *)(v37 + 40);
  uint64_t v32 = v4 + 64;
  uint64_t v31 = *(void *)(v0 + 16);
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  uint64_t v7 = v5 & *(void *)(v4 + 64);
  int v33 = (unint64_t)(63 - v6) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  uint64_t v30 = v4;
  while (1)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      uint64_t v11 = v10 | (v9 << 6);
      goto LABEL_17;
    }
    if (__OFADD__(v9++, 1))
    {
      __break(1u);
LABEL_32:
      __break(1u);
      return result;
    }
    if (v9 >= v33) {
      goto LABEL_28;
    }
    uint64_t v13 = *(void *)(v32 + 8 * v9);
    if (!v13) {
      break;
    }
LABEL_16:
    uint64_t v7 = (v13 - 1) & v13;
    uint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_17:
    uint64_t v15 = *(void *)(v4 + 56) + (v11 << 6);
    if (*(unsigned char *)(v15 + 56) == 1)
    {
      int v16 = *(void *)(v15 + 16);
      if ((v16 & 1) == 0)
      {
        int v34 = v7;
        size_t v35 = v9;
        uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v11);
        uint64_t v18 = (void *)v17[1];
        uint64_t v36 = *v17;
        uint64_t v20 = *(void *)v15;
        uint64_t v19 = *(void *)(v15 + 8);
        uint64_t v21 = *(void *)(v15 + 24);
        uint64_t v22 = *(void *)(v15 + 32);
        uint64_t v24 = *(void *)(v15 + 40);
        uint64_t v23 = *(void *)(v15 + 48);
        swift_bridgeObjectRetain();
        if (v22)
        {
          outlined copy of UseCase(v20, v19, v16, v21, v22, v24, v23, 1);
          if (one-time initialization token for defaultCacheEntryMinutesToLive != -1) {
            swift_once();
          }
          uint64_t v25 = static StaticPIRParameters.defaultCacheEntryMinutesToLive;
          outlined consume of UseCase(v20, v19, v16, v21, v22, v24, v23, 1);
          uint64_t v21 = v25;
          uint64_t v4 = v30;
        }
        uint64_t v26 = *(void (**)(uint64_t))(v31 + 24);
        uint64_t v27 = *(void *)(v31 + 32);
        type metadata accessor for SqliteCache();
        swift_allocObject();
        swift_bridgeObjectRetain();
        swift_retain();
        uint64_t v28 = SqliteCache.init(useCase:cacheElementCount:cacheEntryMinutesToLive:getCurrentDate:)(v36, v18, v19, v21, v26, v27);
        (*(void (**)(uint64_t))(*(void *)v28 + 144))(v28);
        swift_bridgeObjectRelease();
        uint64_t result = swift_release();
        uint64_t v7 = v34;
        uint64_t v9 = v35;
      }
    }
  }
  uint64_t v14 = v9 + 1;
  if (v9 + 1 >= v33) {
    goto LABEL_28;
  }
  uint64_t v13 = *(void *)(v32 + 8 * v14);
  if (v13) {
    goto LABEL_15;
  }
  uint64_t v14 = v9 + 2;
  if (v9 + 2 >= v33) {
    goto LABEL_28;
  }
  uint64_t v13 = *(void *)(v32 + 8 * v14);
  if (v13)
  {
LABEL_15:
    uint64_t v9 = v14;
    goto LABEL_16;
  }
  uint64_t v14 = v9 + 3;
  if (v9 + 3 < v33)
  {
    uint64_t v13 = *(void *)(v32 + 8 * v14);
    if (!v13)
    {
      while (1)
      {
        uint64_t v9 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_32;
        }
        if (v9 >= v33) {
          goto LABEL_28;
        }
        uint64_t v13 = *(void *)(v32 + 8 * v9);
        ++v14;
        if (v13) {
          goto LABEL_16;
        }
      }
    }
    goto LABEL_15;
  }
LABEL_28:
  swift_release();
  swift_release();
  uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
  return v29();
}

uint64_t CacheCleaner.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t CacheCleaner.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for ScheduledActivityHandler.run@Sendable () in conformance CacheCleaner()
{
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](CacheCleaner.run(), 0, 0);
}

uint64_t type metadata accessor for CacheCleaner()
{
  return self;
}

uint64_t method lookup function for CacheCleaner(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CacheCleaner);
}

uint64_t dispatch thunk of CacheCleaner.__allocating_init(allowListLock:getCurrentDate:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t ConfigCache.__allocating_init(cacheFile:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  ConfigCache.init(cacheFile:)(a1);
  return v2;
}

uint64_t key path getter for ConfigCache.StoredConfig.usecase : ConfigCache.StoredConfig@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 136))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t key path setter for ConfigCache.StoredConfig.usecase : ConfigCache.StoredConfig(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 144);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t ConfigCache.StoredConfig.usecase.init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  outlined init with copy of NetworkManager(a3, (uint64_t)v4);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v4);
}

uint64_t ConfigCache.StoredConfig.usecase.getter()
{
  swift_getKeyPath();
  lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t ConfigCache.StoredConfig.usecase.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in ConfigCache.StoredConfig.usecase.setter()
{
  return swift_release();
}

void (*ConfigCache.StoredConfig.usecase.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtCC8CipherML11ConfigCache12StoredConfig___observationRegistrar;
  v3[4] = v1;
  v3[5] = v4;
  v3[2] = v1;
  swift_getKeyPath();
  v3[6] = lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  uint64_t v5 = v3[3];
  void *v3 = v3[2];
  v3[1] = v5;
  return ConfigCache.StoredConfig.usecase.modify;
}

void ConfigCache.StoredConfig.usecase.modify(uint64_t a1, char a2)
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

uint64_t key path getter for ConfigCache.StoredConfig.serializedConfig : ConfigCache.StoredConfig@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 184))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t key path setter for ConfigCache.StoredConfig.serializedConfig : ConfigCache.StoredConfig(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, unint64_t))(**(void **)a2 + 192);
  outlined copy of Data._Representation(*a1, v3);
  return v4(v2, v3);
}

uint64_t ConfigCache.StoredConfig.serializedConfig.init(uint64_t a1, unint64_t a2, uint64_t a3)
{
  outlined init with copy of NetworkManager(a3, (uint64_t)v6);
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  swift_getKeyPath();
  lazy protocol witness table accessor for type Data and conformance Data();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  outlined consume of Data._Representation(a1, a2);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
}

uint64_t ConfigCache.StoredConfig.serializedConfig.getter()
{
  swift_getKeyPath();
  lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  lazy protocol witness table accessor for type Data and conformance Data();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t ConfigCache.StoredConfig.serializedConfig.setter(uint64_t a1, unint64_t a2)
{
  return swift_release();
}

uint64_t closure #1 in ConfigCache.StoredConfig.serializedConfig.setter()
{
  return swift_release();
}

void (*ConfigCache.StoredConfig.serializedConfig.modify(void *a1))(uint64_t **a1, char a2)
{
  unint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtCC8CipherML11ConfigCache12StoredConfig___observationRegistrar;
  v3[4] = v1;
  v3[5] = v4;
  v3[2] = v1;
  swift_getKeyPath();
  v3[6] = lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  lazy protocol witness table accessor for type Data and conformance Data();
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  *(_OWORD *)unint64_t v3 = *((_OWORD *)v3 + 1);
  return ConfigCache.StoredConfig.serializedConfig.modify;
}

void ConfigCache.StoredConfig.serializedConfig.modify(uint64_t **a1, char a2)
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

uint64_t ConfigCache.StoredConfig.__allocating_init(usecase:config:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  ConfigCache.StoredConfig.init(usecase:config:)(a1, a2, a3);
  return v6;
}

uint64_t *ConfigCache.StoredConfig.init(usecase:config:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t)(v3 + 2);
  uint64_t v5 = type metadata accessor for ConfigCache.StoredConfig();
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of static PersistentModel.createBackingData<A>()>>.0);
  v15[0] = v5;
  v15[1] = v5;
  uint64_t v16 = lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  uint64_t v17 = v16;
  v3[6] = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(v3 + 2);
  static PersistentModel.createBackingData<A>()();
  uint64_t v6 = (char *)v3 + OBJC_IVAR____TtCC8CipherML11ConfigCache12StoredConfig___observationRegistrar;
  ObservationRegistrar.init()();
  outlined init with copy of NetworkManager((uint64_t)(v3 + 2), (uint64_t)v15);
  __swift_project_boxed_opaque_existential_1(v15, v17);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  type metadata accessor for AspireApiConfig(0);
  lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type AspireApiConfig and conformance AspireApiConfig, (void (*)(uint64_t))type metadata accessor for AspireApiConfig);
  uint64_t v7 = v18;
  uint64_t v8 = Message.serializedData(partial:)();
  if (v7)
  {
    outlined destroy of AspireApiConfig(a3);
    __swift_destroy_boxed_opaque_existential_1Tm(v4);
    uint64_t v10 = type metadata accessor for ObservationRegistrar();
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v6, v10);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v11 = v8;
    unint64_t v12 = v9;
    outlined init with copy of NetworkManager(v4, (uint64_t)v15);
    __swift_project_boxed_opaque_existential_1(v15, v17);
    swift_getKeyPath();
    lazy protocol witness table accessor for type Data and conformance Data();
    dispatch thunk of BackingData.setValue<A>(forKey:to:)();
    swift_release();
    outlined consume of Data._Representation(v11, v12);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
    outlined destroy of AspireApiConfig(a3);
  }
  return v3;
}

uint64_t ConfigCache.StoredConfig.persistentBackingData.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return outlined init with copy of NetworkManager(v1 + 16, a1);
}

uint64_t ConfigCache.StoredConfig.persistentBackingData.setter(long long *a1)
{
  uint64_t v3 = v1 + 16;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1Tm(v3);
  outlined init with take of _HasContiguousBytes(a1, v3);
  return swift_endAccess();
}

void (*ConfigCache.StoredConfig.persistentBackingData.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[16] = v1;
  swift_beginAccess();
  outlined init with copy of NetworkManager(v1 + 16, (uint64_t)v3);
  return ConfigCache.StoredConfig.persistentBackingData.modify;
}

void ConfigCache.StoredConfig.persistentBackingData.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (long long *)(*a1 + 40);
  if (a2)
  {
    uint64_t v4 = *(void *)(v2 + 128) + 16;
    outlined init with copy of NetworkManager(*a1, (uint64_t)v3);
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_1Tm(v4);
    outlined init with take of _HasContiguousBytes(v3, v4);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_1Tm(v2);
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 128) + 16;
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_1Tm(v5);
    outlined init with take of _HasContiguousBytes((long long *)v2, v5);
    swift_endAccess();
  }
  free((void *)v2);
}

uint64_t *ConfigCache.StoredConfig.__allocating_init(backingData:)(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)swift_allocObject();
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of static PersistentModel.createBackingData<A>()>>.0);
  *(void *)&long long v5 = v1;
  *((void *)&v5 + 1) = v1;
  uint64_t v6 = lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  uint64_t v7 = v6;
  v3[6] = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(v3 + 2);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  outlined init with copy of NetworkManager(a1, (uint64_t)&v5);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v3 + 2));
  outlined init with take of _HasContiguousBytes(&v5, (uint64_t)(v3 + 2));
  swift_endAccess();
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v3;
}

uint64_t *ConfigCache.StoredConfig.init(backingData:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ConfigCache.StoredConfig();
  v1[5] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of static PersistentModel.createBackingData<A>()>>.0);
  v5[0] = v3;
  v5[1] = v3;
  uint64_t v6 = lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  uint64_t v7 = v6;
  v1[6] = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(v1 + 2);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  outlined init with copy of NetworkManager(a1, (uint64_t)v5);
  (*(void (**)(void *))(*v1 + 248))(v5);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v1;
}

uint64_t ConfigCache.StoredConfig.access<A>(keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ConfigCache.StoredConfig.withMutation<A, B>(keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ConfigCache.StoredConfig.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtCC8CipherML11ConfigCache12StoredConfig___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ConfigCache.StoredConfig.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtCC8CipherML11ConfigCache12StoredConfig___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t ConfigCache.context.getter()
{
  return swift_retain();
}

uint64_t ConfigCache.init(cacheFile:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ModelConfiguration.CloudKitDatabase();
  MEMORY[0x270FA5388](v3 - 8);
  v35[0] = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v35 - v13;
  uint64_t v37 = type metadata accessor for ModelConfiguration();
  uint64_t v15 = *(void *)(v37 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v37);
  uint64_t v18 = (char *)v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v38 = (char *)v35 - v19;
  *(void *)&long long v36 = v1;
  swift_defaultActor_initialize();
  uint64_t v20 = a1;
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a1, (uint64_t)v7, &demangling cache variable for type metadata for URL?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v7, &demangling cache variable for type metadata for URL?);
    ModelConfiguration.init(isStoredInMemoryOnly:)();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
    uint64_t v21 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    MEMORY[0x24C5B3230](v21);
    ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  uint64_t v22 = v35[1];
  uint64_t v23 = v36;
  uint64_t v24 = v20;
  uint64_t v25 = v18;
  uint64_t v26 = v37;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v38, v25, v37);
  type metadata accessor for ModelContainer();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<PersistentModel.Type>);
  uint64_t v27 = swift_allocObject();
  long long v36 = xmmword_249E85E40;
  *(_OWORD *)(v27 + 16) = xmmword_249E85E40;
  uint64_t v28 = type metadata accessor for ConfigCache.StoredConfig();
  uint64_t v29 = lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  *(void *)(v27 + 32) = v28;
  *(void *)(v27 + 40) = v29;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DataStoreConfiguration>);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = v36;
  *(void *)(v30 + 56) = v26;
  *(void *)(v30 + 64) = lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ModelConfiguration and conformance ModelConfiguration, MEMORY[0x263F18138]);
  uint64_t v31 = v38;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v30 + 32));
  (*(void (**)(uint64_t *, char *, uint64_t))(v15 + 16))(boxed_opaque_existential_1, v31, v26);
  ModelContainer.__allocating_init(for:configurations:)();
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v31, v26);
    type metadata accessor for ConfigCache();
    swift_defaultActor_destroy();
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v20, &demangling cache variable for type metadata for URL?);
    swift_deallocPartialClassInstance();
  }
  else
  {
    type metadata accessor for ModelContext();
    swift_allocObject();
    uint64_t v33 = ModelContext.init(_:)();
    outlined destroy of AMDPbHEConfig.OneOf_Config?(v24, &demangling cache variable for type metadata for URL?);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v31, v26);
    *(void *)(v23 + 112) = v33;
  }
  return v23;
}

uint64_t sub_249E7F8C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 136))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_249E7F914(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 144);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t type metadata accessor for ConfigCache.StoredConfig()
{
  uint64_t result = type metadata singleton initialization cache for ConfigCache.StoredConfig;
  if (!type metadata singleton initialization cache for ConfigCache.StoredConfig) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t partial apply for closure #1 in ConfigCache.StoredConfig.usecase.setter()
{
  return closure #1 in ConfigCache.StoredConfig.usecase.setter();
}

uint64_t sub_249E7F9E8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 184))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_249E7FA34(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, unint64_t))(**(void **)a2 + 192);
  outlined copy of Data._Representation(*a1, v3);
  return v4(v2, v3);
}

uint64_t partial apply for closure #1 in ConfigCache.StoredConfig.serializedConfig.setter()
{
  return closure #1 in ConfigCache.StoredConfig.serializedConfig.setter();
}

uint64_t outlined destroy of AspireApiConfig(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AspireApiConfig(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t closure #2 in ConfigCache.predicate(for:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Value<String>);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v20 = v4;
  uint64_t v21 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Variable<ConfigCache.StoredConfig>);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String>);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type Expression<Double> and conformance Expression<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Variable<ConfigCache.StoredConfig> and conformance PredicateExpressions.Variable<A>, &demangling cache variable for type metadata for PredicateExpressions.Variable<ConfigCache.StoredConfig>);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v22 = v18;
  uint64_t v23 = v19;
  static PredicateExpressions.build_Arg<A>(_:)();
  a3[3] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String>, PredicateExpressions.Value<String>>);
  a3[4] = lazy protocol witness table accessor for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String>, PredicateExpressions.Value<String>> and conformance <> PredicateExpressions.Equal<A, B>();
  __swift_allocate_boxed_opaque_existential_1(a3);
  lazy protocol witness table accessor for type Expression<Double> and conformance Expression<A>(&lazy protocol witness table cache variable for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String> and conformance PredicateExpressions.KeyPath<A, B>, &demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String>);
  lazy protocol witness table accessor for type Expression<Double> and conformance Expression<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Value<String> and conformance PredicateExpressions.Value<A>, &demangling cache variable for type metadata for PredicateExpressions.Value<String>);
  uint64_t v16 = v20;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ConfigCache.update(configs:)(Swift::OpaquePointer configs)
{
  uint64_t v2 = swift_bridgeObjectRetain();
  v3._rawValue = (void *)specialized _copyCollectionToContiguousArray<A>(_:)(v2);
  swift_bridgeObjectRelease();
  ConfigCache.update(keys:with:)(v3, configs);
  swift_release();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ConfigCache.update(keys:with:)(Swift::OpaquePointer keys, Swift::OpaquePointer with)
{
  uint64_t v4 = v3;
  rawValue = with._rawValue;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireApiConfig?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AspireApiConfig(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v37 = (uint64_t)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v40 = (char *)v36 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{ConfigCache.StoredConfig}>?);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v46 = (char *)v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FetchDescriptor<ConfigCache.StoredConfig>);
  MEMORY[0x270FA5388](v45);
  uint64_t v18 = (char *)v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *((void *)keys._rawValue + 2);
  if (!v19)
  {
LABEL_31:
    dispatch thunk of ModelContext.save()();
    return;
  }
  v36[1] = v2;
  v36[2] = keys._rawValue;
  uint64_t v47 = *(void *)(v2 + 112);
  uint64_t v20 = (uint64_t *)((char *)keys._rawValue + 40);
  uint64_t v42 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  uint64_t v43 = (void (**)(char *, uint64_t))(v16 + 8);
  uint64_t v38 = v10;
  uint64_t v39 = (unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  uint64_t v21 = swift_bridgeObjectRetain();
  uint64_t v49 = v19 - 1;
  uint64_t v41 = v18;
  while (1)
  {
    uint64_t v50 = v20;
    uint64_t v51 = v36;
    uint64_t v22 = *v20;
    MEMORY[0x270FA5388](v21);
    uint64_t v48 = v23;
    v36[-2] = v23;
    v36[-1] = v22;
    swift_bridgeObjectRetain();
    uint64_t v52 = type metadata accessor for ConfigCache.StoredConfig();
    uint64_t v24 = v46;
    Predicate.init(_:)();
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{ConfigCache.StoredConfig}>);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 0, 1, v25);
    lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
    FetchDescriptor.init(predicate:sortBy:)();
    uint64_t v26 = dispatch thunk of ModelContext.fetch<A>(_:)();
    if (v4)
    {
      swift_bridgeObjectRelease();
      (*v43)(v18, v45);
      swift_bridgeObjectRelease();
      return;
    }
    unint64_t v27 = v26;
    (*v43)(v18, v45);
    if (!(v27 >> 62)) {
      break;
    }
    swift_bridgeObjectRetain();
    uint64_t v28 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v28) {
      goto LABEL_6;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v29 = rawValue;
    if (!rawValue[2])
    {
      (*v42)(v8, 1, 1, v9);
LABEL_15:
      swift_bridgeObjectRelease();
      uint64_t v21 = outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v8, &demangling cache variable for type metadata for AspireApiConfig?);
      if (!v28) {
        goto LABEL_24;
      }
      swift_retain();
      dispatch thunk of ModelContext.delete<A>(_:)();
LABEL_17:
      uint64_t v21 = swift_release_n();
      goto LABEL_24;
    }
    swift_bridgeObjectRetain();
    uint64_t v30 = specialized __RawDictionaryStorage.find<A>(_:)(v48, v22);
    if (v31)
    {
      outlined init with copy of AspireApiConfig(v29[7] + *(void *)(v38 + 72) * v30, (uint64_t)v8);
      uint64_t v32 = 0;
    }
    else
    {
      uint64_t v32 = 1;
    }
    uint64_t v4 = 0;
    uint64_t v33 = (uint64_t)v40;
    (*v42)(v8, v32, 1, v9);
    swift_bridgeObjectRelease();
    if ((*v39)(v8, 1, v9) == 1) {
      goto LABEL_15;
    }
    outlined init with take of AspireApiConfig((uint64_t)v8, v33);
    if (v28)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(v33 + *(int *)(v9 + 24)))
      {
        outlined destroy of AspireApiConfig(v33);
        goto LABEL_17;
      }
      lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type AspireApiConfig and conformance AspireApiConfig, (void (*)(uint64_t))type metadata accessor for AspireApiConfig);
      uint64_t v35 = Message.serializedData(partial:)();
      (*(void (**)(uint64_t))(*(void *)v28 + 192))(v35);
      swift_release_n();
    }
    else
    {
      uint64_t v34 = v37;
      outlined init with copy of AspireApiConfig(v33, v37);
      swift_allocObject();
      ConfigCache.StoredConfig.init(usecase:config:)(v48, v22, v34);
      dispatch thunk of ModelContext.insert<A>(_:)();
      swift_release();
    }
    uint64_t v21 = outlined destroy of AspireApiConfig(v33);
LABEL_24:
    uint64_t v18 = v41;
    if (!v49)
    {
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
    uint64_t v20 = v50 + 2;
    --v49;
  }
  uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v28) {
    goto LABEL_9;
  }
LABEL_6:
  if ((v27 & 0xC000000000000001) != 0)
  {
    uint64_t v28 = MEMORY[0x24C5B3860](0, v27);
    goto LABEL_9;
  }
  if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v28 = *(void *)(v27 + 32);
    swift_retain();
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t ConfigCache.set(name:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AspireApiConfig?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AspireApiConfig(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AMDPbHEConfig.OneOf_Config?(a3, (uint64_t)v8, &demangling cache variable for type metadata for AspireApiConfig?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    outlined destroy of AMDPbHEConfig.OneOf_Config?((uint64_t)v8, &demangling cache variable for type metadata for AspireApiConfig?);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_249E85E40;
    *(void *)(inited + 32) = a1;
    *(void *)(inited + 40) = a2;
    swift_bridgeObjectRetain();
    unint64_t v14 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
    ConfigCache.update(keys:with:)((Swift::OpaquePointer)inited, (Swift::OpaquePointer)v14);
  }
  else
  {
    outlined init with take of AspireApiConfig((uint64_t)v8, (uint64_t)v12);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v15 = swift_initStackObject();
    long long v23 = xmmword_249E85E40;
    *(_OWORD *)(v15 + 16) = xmmword_249E85E40;
    *(void *)(v15 + 32) = a1;
    *(void *)(v15 + 40) = a2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, AspireApiConfig)>);
    uint64_t v16 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, AspireApiConfig))
                - 8);
    unint64_t v17 = (*(unsigned __int8 *)(*(void *)v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v16 + 80);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = v23;
    uint64_t v19 = (void *)(v18 + v17);
    uint64_t v20 = v18 + v17 + v16[14];
    void *v19 = a1;
    v19[1] = a2;
    outlined init with copy of AspireApiConfig((uint64_t)v12, v20);
    swift_bridgeObjectRetain_n();
    unint64_t v21 = specialized Dictionary.init(dictionaryLiteral:)(v18);
    ConfigCache.update(keys:with:)((Swift::OpaquePointer)v15, (Swift::OpaquePointer)v21);
    outlined destroy of AspireApiConfig((uint64_t)v12);
  }
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  return swift_arrayDestroy();
}

uint64_t ConfigCache.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{ConfigCache.StoredConfig}>?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FetchDescriptor<ConfigCache.StoredConfig>);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[1] = a1;
  v23[4] = a1;
  v23[5] = a2;
  uint64_t v29 = type metadata accessor for ConfigCache.StoredConfig();
  Predicate.init(_:)();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Predicate<Pack{ConfigCache.StoredConfig}>);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 0, 1, v14);
  lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  FetchDescriptor.init(predicate:sortBy:)();
  unint64_t v15 = dispatch thunk of ModelContext.fetch<A>(_:)();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v17 = a3;
    if (v21) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v22 = type metadata accessor for AspireApiConfig(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v17, 1, 1, v22);
  }
  uint64_t v17 = a3;
  if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v15 & 0xC000000000000001) != 0)
  {
    uint64_t v18 = MEMORY[0x24C5B3860](0, v15);
    goto LABEL_6;
  }
  if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v18 = *(void *)(v15 + 32);
    swift_retain();
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v19 = type metadata accessor for AspireApiConfig(0);
    uint64_t v27 = (*(uint64_t (**)(void))(*(void *)v18 + 184))();
    uint64_t v28 = v20;
    uint64_t v26 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    BinaryDecodingOptions.init()();
    lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type AspireApiConfig and conformance AspireApiConfig, (void (*)(uint64_t))type metadata accessor for AspireApiConfig);
    Message.init<A>(serializedBytes:extensions:partial:options:)();
    swift_release();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 0, 1, v19);
  }
  __break(1u);
  return result;
}

uint64_t ConfigCache.deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t ConfigCache.__deallocating_deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t ConfigCache.unownedExecutor.getter()
{
  return v0;
}

Swift::Int ConfigCache.StoredConfig.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for PersistentModel.init(backingData:) in conformance ConfigCache.StoredConfig()
{
  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t protocol witness for PersistentModel.persistentBackingData.getter in conformance ConfigCache.StoredConfig()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t protocol witness for PersistentModel.persistentBackingData.setter in conformance ConfigCache.StoredConfig()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

void (*protocol witness for PersistentModel.persistentBackingData.modify in conformance ConfigCache.StoredConfig(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(*(void *)v1 + 256))();
  return protocol witness for LRUCache.subscript.modify in conformance SqliteCache;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ConfigCache.StoredConfig()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ConfigCache.StoredConfig()
{
  return PersistentModel.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ConfigCache.StoredConfig()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Identifiable.id.getter in conformance ConfigCache.StoredConfig()
{
  uint64_t v0 = type metadata accessor for ConfigCache.StoredConfig();
  uint64_t v1 = lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
  return MEMORY[0x24C5B31F0](v0, v1);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ConfigCache.StoredConfig(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270EFE8F0](v4, v5, a3, WitnessTable);
}

uint64_t specialized static ConfigCache.StoredConfig.schemaMetadata.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Schema.PropertyMetadata>);
  type metadata accessor for Schema.PropertyMetadata();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_249E85E00;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Schema.Attribute.Option>);
  type metadata accessor for Schema.Attribute.Option();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_249E85E40;
  static Schema.Attribute.Option.unique.getter();
  type metadata accessor for Schema.Attribute();
  swift_allocObject();
  Schema.Attribute.init(_:originalName:hashModifier:)();
  lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type Schema.Attribute and conformance Schema.Attribute, MEMORY[0x263F181D0]);
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_249E85E40;
  static Schema.Attribute.Option.externalStorage.getter();
  swift_allocObject();
  Schema.Attribute.init(_:originalName:hashModifier:)();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  return v0;
}

uint64_t type metadata accessor for ConfigCache()
{
  return self;
}

uint64_t partial apply for closure #2 in ConfigCache.predicate(for:)@<X0>(uint64_t *a1@<X8>)
{
  return closure #2 in ConfigCache.predicate(for:)(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t outlined init with take of AspireApiConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AspireApiConfig(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of AspireApiConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AspireApiConfig(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t base witness table accessor for Observable in ConfigCache.StoredConfig()
{
  return lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
}

uint64_t base witness table accessor for Hashable in ConfigCache.StoredConfig()
{
  return lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
}

uint64_t base witness table accessor for Identifiable in ConfigCache.StoredConfig()
{
  return lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
}

uint64_t base witness table accessor for Equatable in ConfigCache.StoredConfig()
{
  return lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig, (void (*)(uint64_t))type metadata accessor for ConfigCache.StoredConfig);
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in ConfigCache.StoredConfig()
{
  return lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(&lazy protocol witness table cache variable for type PersistentIdentifier and conformance PersistentIdentifier, MEMORY[0x263F18140]);
}

uint64_t sub_249E8186C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 240))();
}

uint64_t sub_249E818B0(uint64_t a1, uint64_t a2)
{
  outlined init with copy of NetworkManager(a1, (uint64_t)v4);
  return (*(uint64_t (**)(unsigned char *))(**(void **)a2 + 248))(v4);
}

uint64_t method lookup function for ConfigCache(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConfigCache);
}

uint64_t dispatch thunk of ConfigCache.__allocating_init(cacheFile:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ConfigCache.update(configs:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of ConfigCache.update(keys:with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of ConfigCache.set(name:value:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of ConfigCache.subscript.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t ObjC metadata update function for ConfigCache.StoredConfig()
{
  return type metadata accessor for ConfigCache.StoredConfig();
}

uint64_t type metadata completion function for ConfigCache.StoredConfig()
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

uint64_t method lookup function for ConfigCache.StoredConfig(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConfigCache.StoredConfig);
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.usecase.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.usecase.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.usecase.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.serializedConfig.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.serializedConfig.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.serializedConfig.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.__allocating_init(usecase:config:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.persistentBackingData.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.persistentBackingData.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.persistentBackingData.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.__allocating_init(backingData:)()
{
  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.access<A>(keyPath:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of ConfigCache.StoredConfig.withMutation<A, B>(keyPath:_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

ValueMetadata *type metadata accessor for ConfigCache.StoredConfig._SwiftDataNoType()
{
  return &type metadata for ConfigCache.StoredConfig._SwiftDataNoType;
}

unint64_t lazy protocol witness table accessor for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String>, PredicateExpressions.Value<String>> and conformance <> PredicateExpressions.Equal<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String>, PredicateExpressions.Value<String>> and conformance <> PredicateExpressions.Equal<A, B>;
  if (!lazy protocol witness table cache variable for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String>, PredicateExpressions.Value<String>> and conformance <> PredicateExpressions.Equal<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String>, PredicateExpressions.Value<String>>);
    lazy protocol witness table accessor for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String> and conformance <> PredicateExpressions.KeyPath<A, B>();
    lazy protocol witness table accessor for type PredicateExpressions.Value<String> and conformance <A> PredicateExpressions.Value<A>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PredicateExpressions.Equal<PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String>, PredicateExpressions.Value<String>> and conformance <> PredicateExpressions.Equal<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String> and conformance <> PredicateExpressions.KeyPath<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String> and conformance <> PredicateExpressions.KeyPath<A, B>;
  if (!lazy protocol witness table cache variable for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String> and conformance <> PredicateExpressions.KeyPath<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String>);
    lazy protocol witness table accessor for type Expression<Double> and conformance Expression<A>(&lazy protocol witness table cache variable for type PredicateExpressions.Variable<ConfigCache.StoredConfig> and conformance PredicateExpressions.Variable<A>, &demangling cache variable for type metadata for PredicateExpressions.Variable<ConfigCache.StoredConfig>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PredicateExpressions.KeyPath<PredicateExpressions.Variable<ConfigCache.StoredConfig>, String> and conformance <> PredicateExpressions.KeyPath<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PredicateExpressions.Value<String> and conformance <A> PredicateExpressions.Value<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type PredicateExpressions.Value<String> and conformance <A> PredicateExpressions.Value<A>;
  if (!lazy protocol witness table cache variable for type PredicateExpressions.Value<String> and conformance <A> PredicateExpressions.Value<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for PredicateExpressions.Value<String>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PredicateExpressions.Value<String> and conformance <A> PredicateExpressions.Value<A>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ConfigCache.StoredConfig and conformance ConfigCache.StoredConfig(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t closure #1 in ConfigCache.StoredConfig.usecase.setterpartial apply()
{
  return partial apply for closure #1 in ConfigCache.StoredConfig.usecase.setter();
}

uint64_t closure #1 in ConfigCache.StoredConfig.serializedConfig.setterpartial apply()
{
  return partial apply for closure #1 in ConfigCache.StoredConfig.serializedConfig.setter();
}

uint64_t dispatch thunk of KeyStorage.get(group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 8) + **(int **)(a5 + 8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = protocol witness for NetworkManager.uploadKeys(evaluationKeys:userId:) in conformance AspireNetworkManager;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of KeyStorage.set(group:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 16) + **(int **)(a5 + 16));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = protocol witness for NetworkManager.fetchConfigs(useCases:userId:) in conformance AspireNetworkManager;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of KeyStorage.synchronize()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = protocol witness for NetworkManager.uploadKeys(evaluationKeys:userId:) in conformance AspireNetworkManager;
  return v7(a1, a2);
}

uint64_t __getAMDClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __38__CMLXPC_syncProxyToConnection_error___block_invoke_cold_1(v0);
}

uint64_t URLRequest.httpMethod.setter()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t static URLRequest._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEDC48]();
}

uint64_t URLRequest.init(url:cachePolicy:timeoutInterval:)()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t URLRequest.httpBody.setter()
{
  return MEMORY[0x270EEDC90]();
}

Swift::Void __swiftcall URLRequest.setValue(_:forHTTPHeaderField:)(Swift::String_optional _, Swift::String forHTTPHeaderField)
{
}

uint64_t type metadata accessor for URLRequest()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t DataProtocol.copyBytes(to:)()
{
  return MEMORY[0x270EEE298]();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return MEMORY[0x270EEE410]();
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

uint64_t __DataStorage.init(capacity:)()
{
  return MEMORY[0x270EEE680]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x270EEE688]();
}

uint64_t dispatch thunk of LocalizedError.errorDescription.getter()
{
  return MEMORY[0x270EEE908]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEF238]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x270EEF250]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x270EEF268]();
}

uint64_t dispatch thunk of PropertyListEncoder.outputFormat.setter()
{
  return MEMORY[0x270EEF278]();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEF288]();
}

uint64_t PropertyListEncoder.init()()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)()
{
  return MEMORY[0x270EEF518]();
}

uint64_t static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)()
{
  return MEMORY[0x270EEF548]();
}

uint64_t static PredicateExpressions.build_Arg<A>(_:)()
{
  return MEMORY[0x270EEF740]();
}

{
  return MEMORY[0x270EEF750]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x270EEFCB0]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEFE20]();
}

Swift::String_optional __swiftcall URL.host(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = MEMORY[0x270EEFE50](percentEncoded);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.init(string:relativeTo:)()
{
  return MEMORY[0x270EEFEF0]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t URL.appending(queryItems:)()
{
  return MEMORY[0x270EEFF38]();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x270EEFFC8]();
}

Swift::Void __swiftcall Data.InlineSlice.ensureUniqueReference()()
{
}

uint64_t Data.datatypeValue.getter()
{
  return MEMORY[0x270F792F8]();
}

uint64_t Data._copyContents(initializing:)()
{
  return MEMORY[0x270EF0048]();
}

uint64_t Data.init(base64Encoded:options:)()
{
  return MEMORY[0x270EF0060]();
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

uint64_t Data._Representation.subscript.getter()
{
  return MEMORY[0x270EF00D0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = MEMORY[0x270EF0130](options);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Data.hash(into:)()
{
  return MEMORY[0x270EF0190]();
}

uint64_t Data.write(to:options:)()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t Data.append(_:)()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return MEMORY[0x270EF0238]();
}

uint64_t Data.Iterator.init(_:at:)()
{
  return MEMORY[0x270EF0248]();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t Date.ISO8601Format(_:)()
{
  return MEMORY[0x270EF0790]();
}

uint64_t type metadata accessor for Date.ISO8601FormatStyle.DateTimeSeparator()
{
  return MEMORY[0x270EF07E8]();
}

uint64_t type metadata accessor for Date.ISO8601FormatStyle.DateSeparator()
{
  return MEMORY[0x270EF07F8]();
}

uint64_t type metadata accessor for Date.ISO8601FormatStyle.TimeSeparator()
{
  return MEMORY[0x270EF0808]();
}

uint64_t Date.ISO8601FormatStyle.init(dateSeparator:dateTimeSeparator:timeSeparator:timeZoneSeparator:includingFractionalSeconds:timeZone:)()
{
  return MEMORY[0x270EF0820]();
}

uint64_t type metadata accessor for Date.ISO8601FormatStyle.TimeZoneSeparator()
{
  return MEMORY[0x270EF0840]();
}

uint64_t type metadata accessor for Date.ISO8601FormatStyle()
{
  return MEMORY[0x270EF0890]();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return MEMORY[0x270EF0898]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t static Date.> infix(_:_:)()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t static Date.== infix(_:_:)()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t Date.advanced(by:)()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t TimeZone.init(secondsFromGMT:)()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t type metadata accessor for TimeZone()
{
  return MEMORY[0x270EF1608]();
}

uint64_t Predicate.init(_:)()
{
  return MEMORY[0x270EF1778]();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return MEMORY[0x270FA1208]();
}

uint64_t ObservationRegistrar.init()()
{
  return MEMORY[0x270FA1238]();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return MEMORY[0x270FA1250]();
}

uint64_t Connection.run(_:_:)()
{
  return MEMORY[0x270F79310]();
}

uint64_t Connection.run(_:)()
{
  return MEMORY[0x270F79318]();
}

{
  return MEMORY[0x270F79320]();
}

uint64_t Connection.scalar(_:_:)()
{
  return MEMORY[0x270F79330]();
}

uint64_t Connection.scalar<A>(_:)()
{
  return MEMORY[0x270F79338]();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Connection.execute(_:)(Swift::String a1)
{
}

uint64_t Connection.prepare(_:_:)()
{
  return MEMORY[0x270F79348]();
}

uint64_t type metadata accessor for Connection()
{
  return MEMORY[0x270F79368]();
}

uint64_t Connection.__allocating_init(_:readonly:)()
{
  return MEMORY[0x270F79378]();
}

uint64_t SchemaType.count.getter()
{
  return MEMORY[0x270F79388]();
}

Swift::String __swiftcall Expressible.asSQL()()
{
  uint64_t v0 = MEMORY[0x270F793A0]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t TableBuilder.column<A>(_:primaryKey:check:defaultValue:)()
{
  return MEMORY[0x270F793A8]();
}

uint64_t TableBuilder.column<A>(_:unique:check:defaultValue:)()
{
  return MEMORY[0x270F793B0]();
}

{
  return MEMORY[0x270F793B8]();
}

uint64_t ExpressionType.init(_:)()
{
  return MEMORY[0x270F793C8]();
}

uint64_t < infix<A>(_:_:)()
{
  return MEMORY[0x270F793D0]();
}

uint64_t <- infix<A>(_:_:)()
{
  return MEMORY[0x270F793E8]();
}

{
  return MEMORY[0x270F793F0]();
}

uint64_t Blob.bytes.getter()
{
  return MEMORY[0x270F79408]();
}

uint64_t type metadata accessor for Blob()
{
  return MEMORY[0x270F79410]();
}

uint64_t Table.createIndex(_:unique:ifNotExists:)()
{
  return MEMORY[0x270F79418]();
}

uint64_t Table.create(temporary:ifNotExists:withoutRowid:block:)()
{
  return MEMORY[0x270F79420]();
}

uint64_t Table.addColumn<A>(_:check:defaultValue:)()
{
  return MEMORY[0x270F79428]();
}

uint64_t type metadata accessor for Table()
{
  return MEMORY[0x270F79430]();
}

uint64_t Table.init(_:database:)()
{
  return MEMORY[0x270F79438]();
}

uint64_t type metadata accessor for Cursor()
{
  return MEMORY[0x270F79448]();
}

uint64_t Cursor.subscript.getter()
{
  return MEMORY[0x270F79450]();
}

uint64_t type metadata accessor for Delete()
{
  return MEMORY[0x270F79458]();
}

uint64_t type metadata accessor for Insert()
{
  return MEMORY[0x270F79460]();
}

uint64_t type metadata accessor for Setter()
{
  return MEMORY[0x270F79468]();
}

uint64_t QueryType.limit(_:)()
{
  return MEMORY[0x270F79470]();
}

uint64_t QueryType.order(_:)()
{
  return MEMORY[0x270F79478]();
}

uint64_t QueryType.delete()()
{
  return MEMORY[0x270F79480]();
}

uint64_t QueryType.filter(_:)()
{
  return MEMORY[0x270F79488]();
}

uint64_t QueryType.upsert(_:onConflictOf:set:)()
{
  return MEMORY[0x270F79498]();
}

uint64_t Statement.row.getter()
{
  return MEMORY[0x270F794A0]();
}

uint64_t Statement.run(_:)()
{
  return MEMORY[0x270F794A8]();
}

uint64_t Statement.bind(_:)()
{
  return MEMORY[0x270F794B0]();
}

Swift::Bool __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Statement.step()()
{
  return MEMORY[0x270F794B8]();
}

uint64_t type metadata accessor for Statement()
{
  return MEMORY[0x270F794C0]();
}

uint64_t HE.RlweParams.securityLevel.getter()
{
  return MEMORY[0x270F24BF0]();
}

uint64_t HE.RlweParams.plaintextModulus.getter()
{
  return MEMORY[0x270F24BF8]();
}

uint64_t HE.RlweParams.polynomialDegree.getter()
{
  return MEMORY[0x270F24C00]();
}

uint64_t HE.RlweParams.coefficientModuli.getter()
{
  return MEMORY[0x270F24C08]();
}

uint64_t static HE.RlweParams.allCases.getter()
{
  return MEMORY[0x270F24C10]();
}

uint64_t type metadata accessor for HE.RlweParams()
{
  return MEMORY[0x270F24C18]();
}

uint64_t HE.SecurityLevel.rawValue.getter()
{
  return MEMORY[0x270F24C20]();
}

uint64_t type metadata accessor for HE.SecurityLevel()
{
  return MEMORY[0x270F24C28]();
}

uint64_t HE.EncryptionParams.init(rlweParams:scheme:)()
{
  return MEMORY[0x270F24C30]();
}

uint64_t HE.EncryptionParams.rlweParams.getter()
{
  return MEMORY[0x270F24C38]();
}

uint64_t HE.EncryptionParams.scheme.getter()
{
  return MEMORY[0x270F24C40]();
}

uint64_t type metadata accessor for HE.EncryptionParams()
{
  return MEMORY[0x270F24C48]();
}

uint64_t HE.SerializedRelinKey.relinKey.getter()
{
  return MEMORY[0x270F24C50]();
}

uint64_t type metadata accessor for HE.SerializedRelinKey()
{
  return MEMORY[0x270F24C58]();
}

uint64_t HE.EvaluationKeyConfig.init(encryptionParams:galoisElements:hasRelinKey:)()
{
  return MEMORY[0x270F24C60]();
}

uint64_t type metadata accessor for HE.EvaluationKeyConfig()
{
  return MEMORY[0x270F24C68]();
}

uint64_t HE.SerializedGaloisKey.galoisKey.getter()
{
  return MEMORY[0x270F24C70]();
}

uint64_t type metadata accessor for HE.SerializedGaloisKey()
{
  return MEMORY[0x270F24C78]();
}

uint64_t HE.SerializedSecretKey.seed.getter()
{
  return MEMORY[0x270F24C80]();
}

uint64_t HE.SerializedSecretKey.init(seed:)()
{
  return MEMORY[0x270F24C88]();
}

uint64_t HE.SerializedSecretKey.init()()
{
  return MEMORY[0x270F24C90]();
}

uint64_t type metadata accessor for HE.SerializedSecretKey()
{
  return MEMORY[0x270F24C98]();
}

uint64_t type metadata accessor for HE.SerializedCiphertext()
{
  return MEMORY[0x270F24CA0]();
}

uint64_t HE.SerializedEvaluationKey.relinKey.getter()
{
  return MEMORY[0x270F24CA8]();
}

uint64_t HE.SerializedEvaluationKey.galoisKey.getter()
{
  return MEMORY[0x270F24CB0]();
}

uint64_t HE.SerializedEvaluationKey.init(config:secretKey:scheme:)()
{
  return MEMORY[0x270F24CB8]();
}

uint64_t type metadata accessor for HE.SerializedEvaluationKey()
{
  return MEMORY[0x270F24CC0]();
}

uint64_t type metadata accessor for HE.Scheme()
{
  return MEMORY[0x270F24CC8]();
}

uint64_t type metadata accessor for PEC.PlaintextPacking()
{
  return MEMORY[0x270F24CD0]();
}

uint64_t PEC.SimilarityClient.decryptCrt(reply:)()
{
  return MEMORY[0x270F24CD8]();
}

uint64_t PEC.SimilarityClient.similarityConfig.getter()
{
  return MEMORY[0x270F24CE0]();
}

uint64_t PEC.SimilarityClient.init(config:secretKey:)()
{
  return MEMORY[0x270F24CE8]();
}

uint64_t PEC.SimilarityClient.queryCrt(values:)()
{
  return MEMORY[0x270F24CF0]();
}

uint64_t type metadata accessor for PEC.SimilarityClient()
{
  return MEMORY[0x270F24CF8]();
}

uint64_t type metadata accessor for PEC.SimilarityMetric()
{
  return MEMORY[0x270F24D00]();
}

uint64_t PEC.PlaintextMatrixDims.init(rowCount:colCount:)()
{
  return MEMORY[0x270F24D08]();
}

uint64_t type metadata accessor for PEC.PlaintextMatrixDims()
{
  return MEMORY[0x270F24D10]();
}

uint64_t PEC.SimilarityClientConfig.init(encryptionParams:scalingFactor:plaintextPacking:embeddingDimension:galoisElements:similarityMetric:extraPlaintextModuli:)()
{
  return MEMORY[0x270F24D18]();
}

uint64_t PEC.SimilarityClientConfig.encryptionParams.getter()
{
  return MEMORY[0x270F24D20]();
}

uint64_t PEC.SimilarityClientConfig.embeddingDimension.getter()
{
  return MEMORY[0x270F24D28]();
}

uint64_t type metadata accessor for PEC.SimilarityClientConfig()
{
  return MEMORY[0x270F24D30]();
}

uint64_t PEC.SerializedCiphertextCoeffMatrix.ciphertexts.getter()
{
  return MEMORY[0x270F24D38]();
}

uint64_t PEC.SerializedCiphertextCoeffMatrix.init(encryptionParams:dimensions:packing:ciphertexts:)()
{
  return MEMORY[0x270F24D40]();
}

uint64_t PEC.SerializedCiphertextCoeffMatrix.packing.getter()
{
  return MEMORY[0x270F24D48]();
}

uint64_t PEC.SerializedCiphertextCoeffMatrix.colCount.getter()
{
  return MEMORY[0x270F24D50]();
}

uint64_t PEC.SerializedCiphertextCoeffMatrix.rowCount.getter()
{
  return MEMORY[0x270F24D58]();
}

uint64_t type metadata accessor for PEC.SerializedCiphertextCoeffMatrix()
{
  return MEMORY[0x270F24D60]();
}

uint64_t type metadata accessor for PIR.PirAlgorithm()
{
  return MEMORY[0x270F24D68]();
}

uint64_t PIR.BlindedKeyword.blindedElement.getter()
{
  return MEMORY[0x270F24D70]();
}

uint64_t type metadata accessor for PIR.BlindedKeyword()
{
  return MEMORY[0x270F24D78]();
}

uint64_t PIR.IndexPirClient.query(indices:)()
{
  return MEMORY[0x270F24D80]();
}

uint64_t PIR.IndexPirClient.decrypt(reply:index:)()
{
  return MEMORY[0x270F24D88]();
}

uint64_t PIR.IndexPirClient.init(pirParams:secretKey:)()
{
  return MEMORY[0x270F24D90]();
}

uint64_t type metadata accessor for PIR.IndexPirClient()
{
  return MEMORY[0x270F24D98]();
}

uint64_t PIR.KeywordPirClient.query(keyword:)()
{
  return MEMORY[0x270F24DA0]();
}

uint64_t PIR.KeywordPirClient.decrypt(replies:keyword:)()
{
  return MEMORY[0x270F24DA8]();
}

uint64_t PIR.KeywordPirClient.init(pirParams:hashFunctionCount:secretKey:)()
{
  return MEMORY[0x270F24DB0]();
}

uint64_t type metadata accessor for PIR.KeywordPirClient()
{
  return MEMORY[0x270F24DB8]();
}

uint64_t PIR.SymmetricPIRClient.blindKeyword(keyword:blind:)()
{
  return MEMORY[0x270F24DC0]();
}

uint64_t PIR.SymmetricPIRClient.init(serverPublicKey:)()
{
  return MEMORY[0x270F24DC8]();
}

uint64_t PIR.SymmetricPIRClient.validateThenHash(blindedKeyword:evaluatedElement:proof:)()
{
  return MEMORY[0x270F24DD0]();
}

uint64_t type metadata accessor for PIR.SymmetricPIRClient()
{
  return MEMORY[0x270F24DD8]();
}

uint64_t PIR.PirParams.init(encryptionParams:algorithm:entriesCount:entrySize:dimensions:batchSize:internalBatchSize:compressResponse:)()
{
  return MEMORY[0x270F24DE0]();
}

uint64_t PIR.PirParams.encryptionParams.getter()
{
  return MEMORY[0x270F24DE8]();
}

uint64_t PIR.PirParams.dimensions.getter()
{
  return MEMORY[0x270F24DF0]();
}

uint64_t PIR.PirParams.entriesCount.getter()
{
  return MEMORY[0x270F24DF8]();
}

uint64_t PIR.PirParams.algorithm.getter()
{
  return MEMORY[0x270F24E00]();
}

uint64_t PIR.PirParams.entrySize.getter()
{
  return MEMORY[0x270F24E08]();
}

uint64_t type metadata accessor for PIR.PirParams()
{
  return MEMORY[0x270F24E10]();
}

uint64_t type metadata accessor for ProtobufString()
{
  return MEMORY[0x270F44A00]();
}

uint64_t type metadata accessor for ProtobufUInt64()
{
  return MEMORY[0x270F44A10]();
}

uint64_t UnknownStorage.traverse<A>(visitor:)()
{
  return MEMORY[0x270F44A18]();
}

uint64_t UnknownStorage.init()()
{
  return MEMORY[0x270F44A20]();
}

uint64_t type metadata accessor for UnknownStorage()
{
  return MEMORY[0x270F44A28]();
}

uint64_t BinaryDecodingOptions.init()()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t dispatch thunk of Decoder.decodeMapField<A, B>(fieldType:value:)()
{
  return MEMORY[0x270F44B00]();
}

uint64_t dispatch thunk of Decoder.nextFieldNumber()()
{
  return MEMORY[0x270F44B10]();
}

uint64_t dispatch thunk of Decoder.handleConflictingOneOf()()
{
  return MEMORY[0x270F44B20]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedEnumField<A>(value:)()
{
  return MEMORY[0x270F44B30]();
}

uint64_t dispatch thunk of Decoder.decodeSingularBoolField(value:)()
{
  return MEMORY[0x270F44B38]();
}

{
  return MEMORY[0x270F44B40]();
}

uint64_t dispatch thunk of Decoder.decodeSingularEnumField<A>(value:)()
{
  return MEMORY[0x270F44B48]();
}

{
  return MEMORY[0x270F44B50]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedBytesField(value:)()
{
  return MEMORY[0x270F44B58]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedFloatField(value:)()
{
  return MEMORY[0x270F44B60]();
}

uint64_t dispatch thunk of Decoder.decodeSingularBytesField(value:)()
{
  return MEMORY[0x270F44B80]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedStringField(value:)()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedUInt32Field(value:)()
{
  return MEMORY[0x270F44BC8]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedUInt64Field(value:)()
{
  return MEMORY[0x270F44BD0]();
}

uint64_t dispatch thunk of Decoder.decodeSingularDoubleField(value:)()
{
  return MEMORY[0x270F44BE0]();
}

uint64_t dispatch thunk of Decoder.decodeSingularStringField(value:)()
{
  return MEMORY[0x270F44BF0]();
}

{
  return MEMORY[0x270F44BF8]();
}

uint64_t dispatch thunk of Decoder.decodeSingularUInt32Field(value:)()
{
  return MEMORY[0x270F44C00]();
}

{
  return MEMORY[0x270F44C08]();
}

uint64_t dispatch thunk of Decoder.decodeSingularUInt64Field(value:)()
{
  return MEMORY[0x270F44C10]();
}

{
  return MEMORY[0x270F44C18]();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)()
{
  return MEMORY[0x270F44C20]();
}

uint64_t dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)()
{
  return MEMORY[0x270F44C38]();
}

uint64_t dispatch thunk of Message.unknownFields.getter()
{
  return MEMORY[0x270F44C50]();
}

uint64_t dispatch thunk of Message.unknownFields.setter()
{
  return MEMORY[0x270F44C58]();
}

uint64_t dispatch thunk of Message.isEqualTo(message:)()
{
  return MEMORY[0x270F44C68]();
}

uint64_t Message.isInitialized.getter()
{
  return MEMORY[0x270F44C98]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t Message.init<A>(serializedBytes:extensions:partial:options:)()
{
  return MEMORY[0x270F44CB8]();
}

Swift::String __swiftcall Message.textFormatString()()
{
  uint64_t v0 = MEMORY[0x270F44CD0]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t static Message.with(_:)()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t dispatch thunk of Visitor.visitMapField<A, B>(fieldType:value:fieldNumber:)()
{
  return MEMORY[0x270F44D00]();
}

uint64_t dispatch thunk of Visitor.visitPackedEnumField<A>(value:fieldNumber:)()
{
  return MEMORY[0x270F44D20]();
}

uint64_t dispatch thunk of Visitor.visitPackedFloatField(value:fieldNumber:)()
{
  return MEMORY[0x270F44D28]();
}

uint64_t dispatch thunk of Visitor.visitPackedUInt32Field(value:fieldNumber:)()
{
  return MEMORY[0x270F44D48]();
}

uint64_t dispatch thunk of Visitor.visitPackedUInt64Field(value:fieldNumber:)()
{
  return MEMORY[0x270F44D50]();
}

uint64_t dispatch thunk of Visitor.visitSingularBoolField(value:fieldNumber:)()
{
  return MEMORY[0x270F44D60]();
}

uint64_t dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)()
{
  return MEMORY[0x270F44D68]();
}

uint64_t dispatch thunk of Visitor.visitRepeatedBytesField(value:fieldNumber:)()
{
  return MEMORY[0x270F44D70]();
}

uint64_t dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)()
{
  return MEMORY[0x270F44D88]();
}

uint64_t dispatch thunk of Visitor.visitRepeatedStringField(value:fieldNumber:)()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t dispatch thunk of Visitor.visitSingularDoubleField(value:fieldNumber:)()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t dispatch thunk of Visitor.visitSingularUInt32Field(value:fieldNumber:)()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t dispatch thunk of Visitor.visitSingularUInt64Field(value:fieldNumber:)()
{
  return MEMORY[0x270F44DE8]();
}

uint64_t dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)()
{
  return MEMORY[0x270F44E00]();
}

uint64_t type metadata accessor for _NameMap.NameDescription()
{
  return MEMORY[0x270F44E10]();
}

uint64_t _NameMap.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F44E18]();
}

uint64_t _NameMap.init()()
{
  return MEMORY[0x270F44E20]();
}

uint64_t type metadata accessor for _NameMap()
{
  return MEMORY[0x270F44E28]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t OSSignposter.init(logger:)()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x270FA2D88]();
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

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t SHA256Digest.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270EEAAA0]();
}

uint64_t type metadata accessor for SHA256Digest()
{
  return MEMORY[0x270EEAAA8]();
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

uint64_t AES.GCM.Nonce.init<A>(data:)()
{
  return MEMORY[0x270EEAC70]();
}

uint64_t type metadata accessor for AES.GCM.Nonce()
{
  return MEMORY[0x270EEAC88]();
}

uint64_t AES.GCM.SealedBox.init<A, B>(nonce:ciphertext:tag:)()
{
  return MEMORY[0x270EEACA8]();
}

uint64_t type metadata accessor for AES.GCM.SealedBox()
{
  return MEMORY[0x270EEACD8]();
}

uint64_t type metadata accessor for SHA256()
{
  return MEMORY[0x270EEB090]();
}

uint64_t dispatch thunk of BackingData.setValue<A>(forKey:to:)()
{
  return MEMORY[0x270EFE750]();
}

uint64_t dispatch thunk of ModelContext.save()()
{
  return MEMORY[0x270EFE7D0]();
}

uint64_t dispatch thunk of ModelContext.fetch<A>(_:)()
{
  return MEMORY[0x270EFE7D8]();
}

uint64_t dispatch thunk of ModelContext.delete<A>(_:)()
{
  return MEMORY[0x270EFE7F8]();
}

uint64_t dispatch thunk of ModelContext.insert<A>(_:)()
{
  return MEMORY[0x270EFE800]();
}

uint64_t type metadata accessor for ModelContext()
{
  return MEMORY[0x270EFE818]();
}

uint64_t ModelContext.init(_:)()
{
  return MEMORY[0x270EFE828]();
}

uint64_t ModelContainer.__allocating_init(for:configurations:)()
{
  return MEMORY[0x270EFE860]();
}

uint64_t type metadata accessor for ModelContainer()
{
  return MEMORY[0x270EFE878]();
}

uint64_t FetchDescriptor.init(predicate:sortBy:)()
{
  return MEMORY[0x270EFE8B8]();
}

uint64_t static PersistentModel.createBackingData<A>()()
{
  return MEMORY[0x270EFE8D0]();
}

uint64_t PersistentModel.id.getter()
{
  return MEMORY[0x270EFE8F8]();
}

uint64_t PersistentModel.hash(into:)()
{
  return MEMORY[0x270EFE900]();
}

uint64_t PersistentModel.getValue<A>(forKey:)()
{
  return MEMORY[0x270EFE918]();
}

uint64_t PersistentModel.setValue<A>(forKey:to:)()
{
  return MEMORY[0x270EFE928]();
}

uint64_t static ModelConfiguration.CloudKitDatabase.none.getter()
{
  return MEMORY[0x270EFE958]();
}

uint64_t type metadata accessor for ModelConfiguration.CloudKitDatabase()
{
  return MEMORY[0x270EFE970]();
}

uint64_t ModelConfiguration.init(isStoredInMemoryOnly:)()
{
  return MEMORY[0x270EFE978]();
}

uint64_t type metadata accessor for ModelConfiguration()
{
  return MEMORY[0x270EFE988]();
}

uint64_t ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)()
{
  return MEMORY[0x270EFE9A0]();
}

uint64_t Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)()
{
  return MEMORY[0x270EFEA50]();
}

uint64_t type metadata accessor for Schema.PropertyMetadata()
{
  return MEMORY[0x270EFEA58]();
}

uint64_t static Schema.Attribute.Option.externalStorage.getter()
{
  return MEMORY[0x270EFEA88]();
}

uint64_t static Schema.Attribute.Option.unique.getter()
{
  return MEMORY[0x270EFEA90]();
}

uint64_t type metadata accessor for Schema.Attribute.Option()
{
  return MEMORY[0x270EFEA98]();
}

uint64_t type metadata accessor for Schema.Attribute()
{
  return MEMORY[0x270EFEAA0]();
}

uint64_t Schema.Attribute.init(_:originalName:hashModifier:)()
{
  return MEMORY[0x270EFEAA8]();
}

uint64_t static BinaryFloatingPoint<>.random<A>(in:using:)()
{
  return MEMORY[0x270F9D018]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x270F9D060]();
}

uint64_t Dictionary.init(minimumCapacity:)()
{
  return MEMORY[0x270F9D088]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t Dictionary.count.getter()
{
  return MEMORY[0x270F9D120]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x270F9D208]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x270F9D210]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x270F9D488]();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return MEMORY[0x270F9D490]();
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

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.append<A>(contentsOf:)()
{
  return MEMORY[0x270F9D788]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x270F9D7C0]();
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

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x270F9DA70]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t type metadata accessor for CancellationError()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t static TaskPriority.background.getter()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t type metadata accessor for Task()
{
  return MEMORY[0x270FA1FC0]();
}

uint64_t static Task<>.checkCancellation()()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t Set.description.getter()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x270F9DEF0]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1CE0]();
}

uint64_t dispatch thunk of static Numeric.* infix(_:_:)()
{
  return MEMORY[0x270F9E018]();
}

uint64_t Collection<>.contains(_:)()
{
  return MEMORY[0x270F794C8]();
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

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x270F9E518]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t dispatch thunk of static BinaryInteger./ infix(_:_:)()
{
  return MEMORY[0x270F9E5C8]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x270F9E640]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x270F9E648]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x270F9E650]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
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

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
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

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)()
{
  return MEMORY[0x270F9F010]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.- infix(_:_:)()
{
  return MEMORY[0x270F9F018]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x270F9F098]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270F9F0D8]();
}

uint64_t dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter()
{
  return MEMORY[0x270F9F0E0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F250]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F258]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F270]();
}

{
  return MEMORY[0x270F9F278]();
}

{
  return MEMORY[0x270F9F2E0]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

{
  return MEMORY[0x270F9F2F0]();
}

{
  return MEMORY[0x270F9F2F8]();
}

{
  return MEMORY[0x270F9F308]();
}

{
  return MEMORY[0x270F9F348]();
}

{
  return MEMORY[0x270F9F358]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x270F9F360]();
}

uint64_t KeyedDecodingContainer.contains(_:)()
{
  return MEMORY[0x270F9F368]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F390]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3B0]();
}

{
  return MEMORY[0x270F9F3D0]();
}

{
  return MEMORY[0x270F9F418]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

{
  return MEMORY[0x270F9F430]();
}

{
  return MEMORY[0x270F9F438]();
}

{
  return MEMORY[0x270F9F448]();
}

{
  return MEMORY[0x270F9F488]();
}

{
  return MEMORY[0x270F9F498]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x270F9F4C8](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x270F9FC40]();
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

NSNumber __swiftcall UInt64._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF27A0]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x270ED8F88]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x270ED8FD0]();
}

uint64_t container_get_path()
{
  return MEMORY[0x270ED9008]();
}

uint64_t container_query_create()
{
  return MEMORY[0x270ED9060]();
}

uint64_t container_query_free()
{
  return MEMORY[0x270ED9068]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x270ED9070]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x270ED9078]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x270ED9090]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x270ED90A0]();
}

uint64_t container_query_set_group_identifiers()
{
  return MEMORY[0x270ED90A8]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x270ED90C0]();
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x270FA0408]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}