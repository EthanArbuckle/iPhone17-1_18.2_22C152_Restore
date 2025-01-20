BOOL static EXFDRDecodeClient.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t EXFDRDecodeClient.hash(into:)()
{
  return sub_24D2A7DD0();
}

uint64_t EXFDRDecodeClient.hashValue.getter()
{
  return sub_24D2A7DE0();
}

BOOL sub_24D2A3C70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24D2A3C88()
{
  return sub_24D2A7DE0();
}

uint64_t sub_24D2A3CD0()
{
  return sub_24D2A7DD0();
}

uint64_t sub_24D2A3CFC()
{
  return sub_24D2A7DE0();
}

uint64_t EXFDRDecodeOption.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t sub_24D2A3D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_24D2A3D68@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_24D2A3D80(a1, a2);
}

uint64_t sub_24D2A3D80@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t EXFDRDecodeError.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t EXFDRDecodeError.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorNone.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorBadParameter.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorRawDataNotFound.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorRawDataMalformed.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorInvalidTrustObject.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorInvalidSealingManifest.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorRawDataNotTrusted.getter(void *a1@<X8>)
{
  *a1 = 32;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorGeneric.getter(void *a1@<X8>)
{
  *a1 = 0x8000000000000000;
}

void *sub_24D2A3E44@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24D2A3E54(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_24D2A427C();
  unint64_t v5 = sub_24D2A4D78();

  return MEMORY[0x270F9FB50](a1, a2, v4, v5);
}

void sub_24D2A3EB4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_24D2A3EBC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_24D2A3ED0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_24D2A3EE4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_24D2A3EF8(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_24D2A3F28@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_24D2A3F54@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_24D2A3F78(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_24D2A3F8C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_24D2A3FA0(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_24D2A3FB4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_24D2A3FC8(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_24D2A3FDC(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_24D2A3FF0(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_24D2A4004()
{
  return *v0 == 0;
}

void *sub_24D2A4014(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_24D2A4028@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_24D2A4038(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_24D2A4044(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t EXFDRDecodeDataCtx.init(dataClass:uniqueID:uniqueIDLength:subCC:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(_DWORD *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = a4;
  return result;
}

uint64_t EXFDRDecodeTransferRawDataCtx.init(data:dataLength:clientExclave:)@<X0>(uint64_t result@<X0>, int a2@<W1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v4 = *a3;
  *(void *)a4 = result;
  *(_DWORD *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 12) = v4;
  return result;
}

__n128 EXFDRDecodeGetTrustedDataCtx.init(clientExclave:dataCtx:decodeOptions:)@<Q0>(unsigned char *a1@<X0>, __n128 *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unsigned __int32 v4 = a2[1].n128_u32[0];
  unint64_t v5 = a2[1].n128_u64[1];
  uint64_t v6 = *a3;
  *(unsigned char *)a4 = *a1;
  __n128 result = *a2;
  *(__n128 *)(a4 + 8) = *a2;
  *(_DWORD *)(a4 + 24) = v4;
  *(void *)(a4 + 32) = v5;
  *(void *)(a4 + 40) = v6;
  return result;
}

void EXFDRDecodeGetTrustedDataResponseCtx.decodeError.getter(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t EXFDRDecodeGetTrustedDataResponseCtx.trustedData.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EXFDRDecodeGetTrustedDataResponseCtx.trustedDataLength.getter()
{
  return *(unsigned int *)(v0 + 16);
}

unint64_t sub_24D2A40C4()
{
  unint64_t result = qword_26985F250;
  if (!qword_26985F250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F250);
  }
  return result;
}

unint64_t sub_24D2A411C()
{
  unint64_t result = qword_26985F258;
  if (!qword_26985F258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F258);
  }
  return result;
}

unint64_t sub_24D2A4174()
{
  unint64_t result = qword_26985F260;
  if (!qword_26985F260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F260);
  }
  return result;
}

unint64_t sub_24D2A41CC()
{
  unint64_t result = qword_26985F268;
  if (!qword_26985F268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F268);
  }
  return result;
}

unint64_t sub_24D2A4224()
{
  unint64_t result = qword_26985F270;
  if (!qword_26985F270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F270);
  }
  return result;
}

unint64_t sub_24D2A427C()
{
  unint64_t result = qword_26985F278;
  if (!qword_26985F278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F278);
  }
  return result;
}

unint64_t sub_24D2A42D4()
{
  unint64_t result = qword_26985F280;
  if (!qword_26985F280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F280);
  }
  return result;
}

unint64_t sub_24D2A432C()
{
  unint64_t result = qword_26985F288;
  if (!qword_26985F288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F288);
  }
  return result;
}

unint64_t sub_24D2A4384()
{
  unint64_t result = qword_26985F290;
  if (!qword_26985F290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F290);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EXFDRDecodeClient(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for EXFDRDecodeClient(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24D2A4544);
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

uint64_t sub_24D2A456C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24D2A4578(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for EXFDRDecodeClient()
{
  return &type metadata for EXFDRDecodeClient;
}

ValueMetadata *type metadata accessor for EXFDRDecodeOption()
{
  return &type metadata for EXFDRDecodeOption;
}

ValueMetadata *type metadata accessor for EXFDRDecodeError()
{
  return &type metadata for EXFDRDecodeError;
}

uint64_t initializeBufferWithCopyOfBuffer for EXFDRDecodeDataCtx(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for EXFDRDecodeDataCtx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EXFDRDecodeDataCtx(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EXFDRDecodeDataCtx(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
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

uint64_t assignWithTake for EXFDRDecodeDataCtx(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EXFDRDecodeDataCtx(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EXFDRDecodeDataCtx(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for EXFDRDecodeDataCtx()
{
  return &type metadata for EXFDRDecodeDataCtx;
}

uint64_t destroy for EXFDRDecodeTransferRawDataCtx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s16ExclaveFDRDecode29EXFDRDecodeTransferRawDataCtxVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EXFDRDecodeTransferRawDataCtx(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  return a1;
}

void *__swift_memcpy13_8(void *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(void *)((char *)result + 5) = *(uint64_t *)((char *)a2 + 5);
  *__n128 result = v2;
  return result;
}

uint64_t assignWithTake for EXFDRDecodeTransferRawDataCtx(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  return a1;
}

uint64_t getEnumTagSinglePayload for EXFDRDecodeTransferRawDataCtx(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 13)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EXFDRDecodeTransferRawDataCtx(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 13) = 1;
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
    *(unsigned char *)(result + 13) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EXFDRDecodeTransferRawDataCtx()
{
  return &type metadata for EXFDRDecodeTransferRawDataCtx;
}

uint64_t destroy for EXFDRDecodeGetTrustedDataCtx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EXFDRDecodeGetTrustedDataCtx(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EXFDRDecodeGetTrustedDataCtx(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
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

uint64_t assignWithTake for EXFDRDecodeGetTrustedDataCtx(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for EXFDRDecodeGetTrustedDataCtx(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EXFDRDecodeGetTrustedDataCtx(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EXFDRDecodeGetTrustedDataCtx()
{
  return &type metadata for EXFDRDecodeGetTrustedDataCtx;
}

uint64_t destroy for EXFDRDecodeGetTrustedDataResponseCtx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s16ExclaveFDRDecode36EXFDRDecodeGetTrustedDataResponseCtxVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EXFDRDecodeGetTrustedDataResponseCtx(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy20_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for EXFDRDecodeGetTrustedDataResponseCtx(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for EXFDRDecodeGetTrustedDataResponseCtx(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 20)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EXFDRDecodeGetTrustedDataResponseCtx(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 20) = 1;
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
    *(unsigned char *)(result + 20) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EXFDRDecodeGetTrustedDataResponseCtx()
{
  return &type metadata for EXFDRDecodeGetTrustedDataResponseCtx;
}

unint64_t sub_24D2A4D78()
{
  unint64_t result = qword_26985F298;
  if (!qword_26985F298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F298);
  }
  return result;
}

uint64_t sub_24D2A4DCC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_24D2A4E64()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985F2B0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24D2A8450;
  sub_24D2A7D40();
  swift_bridgeObjectRelease();
  sub_24D2A7D20();
  *(void *)(v0 + 56) = MEMORY[0x263F8D310];
  *(void *)(v0 + 32) = 0xD000000000000028;
  *(void *)(v0 + 40) = 0x800000024D2A95F0;
  sub_24D2A7DB0();

  return swift_bridgeObjectRelease();
}

uint64_t ExclaveFDRDecodeRawDataStoreKitClient.__allocating_init(conclaveID:)()
{
  uint64_t v1 = swift_allocObject();
  type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService.Service();
  sub_24D2A519C();
  sub_24D2A7D00();
  swift_bridgeObjectRelease();
  if (v0)
  {
    MEMORY[0x2533242C0](v0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985F2A8);
    sub_24D2A7D10();
    sub_24D2A7D20();
    swift_bridgeObjectRelease();
    sub_24D2A4E64();
    swift_bridgeObjectRelease();
    swift_willThrow();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)(v1 + 16) = v3;
  }
  return v1;
}

uint64_t ExclaveFDRDecodeRawDataStoreKitClient.init(conclaveID:)()
{
  type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService.Service();
  sub_24D2A519C();
  sub_24D2A7D00();
  swift_bridgeObjectRelease();
  if (v1)
  {
    MEMORY[0x2533242C0](v1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985F2A8);
    sub_24D2A7D10();
    sub_24D2A7D20();
    swift_bridgeObjectRelease();
    sub_24D2A4E64();
    swift_bridgeObjectRelease();
    swift_willThrow();
    type metadata accessor for ExclaveFDRDecodeRawDataStoreKitClient();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)(v0 + 16) = v3;
  }
  return v0;
}

unint64_t sub_24D2A519C()
{
  unint64_t result = qword_26985F2A0;
  if (!qword_26985F2A0)
  {
    type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService.Service();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F2A0);
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

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreKitClient()
{
  return self;
}

uint64_t sub_24D2A525C()
{
  swift_retain();
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_24D2A53A0(v0);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t ExclaveFDRDecodeRawDataStoreKitClient.deinit()
{
  swift_release();
  return v0;
}

uint64_t ExclaveFDRDecodeRawDataStoreKitClient.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t method lookup function for ExclaveFDRDecodeRawDataStoreKitClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ExclaveFDRDecodeRawDataStoreKitClient);
}

uint64_t dispatch thunk of ExclaveFDRDecodeRawDataStoreKitClient.__allocating_init(conclaveID:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ExclaveFDRDecodeRawDataStoreKitClient.transferRawData(ctx:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t sub_24D2A53A0(uint64_t a1)
{
  uint64_t v3 = sub_24D2A7C40();
  uint64_t v19 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24D2A7C90();
  MEMORY[0x270FA5388]();
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 16);
  if (__OFADD__(v10, 8))
  {
    __break(1u);
    goto LABEL_17;
  }
  if (__OFADD__(v10 + 8, 4))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v10 + 12, 8))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v10 + 20, 8))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v18 = v3;
  uint64_t v20 = v7;
  uint64_t result = sub_24D2A7CC0();
  if (v1) {
    return result;
  }
  v17[1] = result;
  sub_24D2A7CA0();
  sub_24D2A7C70();
  sub_24D2A7C70();
  if (v10)
  {
    v17[0] = v6;
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v10; ++i)
      sub_24D2A7C50();
    swift_bridgeObjectRelease();
    uint64_t v6 = v17[0];
  }
  sub_24D2A7C60();
  sub_24D2A7C70();
  sub_24D2A7C80();
  sub_24D2A7CD0();
  swift_release();
  swift_retain();
  sub_24D2A7C30();
  int v13 = sub_24D2A7BF0();
  if (v13)
  {
    uint64_t v14 = v18;
    if (v13 == 1)
    {
      uint64_t v15 = sub_24D2A72B8();
      sub_24D2A7A28();
      swift_allocError();
      uint64_t *v16 = v15;
      swift_willThrow();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v14);
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v9, v6);
    }
LABEL_20:
    uint64_t result = sub_24D2A7D50();
    __break(1u);
    return result;
  }
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v9, v6);
}

uint64_t sub_24D2A5768(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_24D2A7B40();
  unint64_t v5 = sub_24D2A4D78();

  return MEMORY[0x270F9FB50](a1, a2, v4, v5);
}

uint64_t sub_24D2A57C0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_24D2A4DCC(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_24D2A5808(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_24D2A7C90();
  uint64_t v6 = *(void *)(v5 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v34 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985F2D0);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v37 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v34 - v10;
  uint64_t v12 = sub_24D2A7C40();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = v16;
  uint64_t v39 = v15;
  (*(void (**)(char *, uint64_t))(v16 + 16))(v14, a1);
  uint64_t v36 = v6;
  v17 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56);
  v40 = v11;
  uint64_t v41 = v5;
  v35 = v17;
  v17((uint64_t)v11, 1, 1, v5);
  sub_24D2A7398();
  sub_24D2A78E4(v3 + 24, (uint64_t)v43);
  uint64_t v19 = v44;
  uint64_t v18 = v45;
  __swift_project_boxed_opaque_existential_1(v43, v44);
  unint64_t v20 = sub_24D2A7C10();
  unint64_t v21 = sub_24D2A6EB8(0, v20);
  unsigned int v22 = sub_24D2A7C00();
  char v23 = sub_24D2A74C4();
  if (v2)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    v43[0] = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985F2A8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      MEMORY[0x2533242B0](v43[0]);
      uint64_t result = sub_24D2A7D50();
      __break(1u);
      return result;
    }
    uint64_t v28 = v42;
    MEMORY[0x2533242B0](v43[0]);
    int v29 = 0;
  }
  else
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v18 + 8))(v21, v22 | ((unint64_t)(v23 & 1) << 32), v19, v18);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    uint64_t v28 = 0;
    int v29 = 1;
  }
  uint64_t v25 = (uint64_t)v40;
  uint64_t v24 = v41;
  uint64_t v26 = (uint64_t)v37;
  sub_24D2A7C20();
  v35(v26, 0, 1, v24);
  sub_24D2A7684(v26, v25);
  v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48);
  if (!v27(v25, 1, v24))
  {
    sub_24D2A7C50();
    if (!v29) {
      sub_24D2A70CC(v28);
    }
  }
  if (v27(v25, 1, v24))
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v39);
    uint64_t v30 = 0;
  }
  else
  {
    uint64_t v31 = v36;
    v32 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v34, v25, v24);
    uint64_t v30 = sub_24D2A7C80();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v24);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v39);
  }
  sub_24D2A7624(v25);
  return v30;
}

uint64_t sub_24D2A5CF0(uint64_t a1)
{
  return sub_24D2A5808(a1);
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService()
{
  return self;
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService.Service()
{
  return self;
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService.Server()
{
  return self;
}

uint64_t sub_24D2A5D80(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_24D2A7C90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v67 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985F2D0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v63 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v63 - v15;
  uint64_t v17 = sub_24D2A7C40();
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = v20;
  uint64_t v72 = v21;
  (*(void (**)(char *, uint64_t))(v21 + 16))(v19, a1);
  uint64_t v69 = v5;
  uint64_t v70 = v6;
  unsigned int v22 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56);
  v73 = v16;
  v68 = v22;
  v22((uint64_t)v16, 1, 1, v5);
  char v23 = sub_24D2A76F0();
  uint64_t v24 = v3 + 24;
  if ((v23 & 1) == 0)
  {
    v64 = v11;
    sub_24D2A78E4(v24, (uint64_t)v75);
    uint64_t v25 = v76;
    v66 = v77;
    v65 = __swift_project_boxed_opaque_existential_1(v75, v76);
    uint64_t v26 = sub_24D2A6FD4(0, 4);
    unint64_t v27 = sub_24D2A7C10();
    unint64_t v28 = sub_24D2A6EB8(0, v27);
    uint64_t v29 = sub_24D2A7C00();
    uint64_t v30 = (uint64_t)sub_24D2A6FD4(0, 4);
    char v31 = sub_24D2A74C4();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v72 + 8))(v19, v71);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v75);
      uint64_t v32 = (uint64_t)v73;
LABEL_23:
      sub_24D2A7624(v32);
      return v30;
    }
    uint64_t v39 = ((uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, void, uint64_t))v66[2])(v26, v28, v29, v30, v31 & 1, v25);
    uint64_t v41 = v40;
    int v43 = v42;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v75);
    uint64_t v44 = *(void *)(v41 + 16);
    BOOL v45 = __OFADD__(v44, 8);
    uint64_t v46 = v44 + 8;
    if (v45)
    {
      __break(1u);
    }
    else
    {
      BOOL v45 = __OFADD__(v46, 8);
      uint64_t v47 = v46 + 8;
      uint64_t v32 = (uint64_t)v73;
      uint64_t v48 = (uint64_t)v64;
      if (!v45)
      {
        LODWORD(v66) = v43;
        if (!__OFADD__(v47, 4))
        {
          sub_24D2A7C20();
          uint64_t v55 = v69;
          v68(v48, 0, 1, v69);
          sub_24D2A7684(v48, v32);
          v51 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48);
          if (!v51(v32, 1, v55))
          {
            sub_24D2A70CC(v39);
            uint64_t v61 = *(void *)(v41 + 16);
            sub_24D2A7C70();
            if (v61)
            {
              swift_bridgeObjectRetain();
              for (uint64_t i = 0; i != v61; ++i)
                sub_24D2A7C50();
              swift_bridgeObjectRelease();
            }
            sub_24D2A7C60();
          }
          swift_bridgeObjectRelease();
          uint64_t v49 = v69;
          goto LABEL_19;
        }
        goto LABEL_32;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  sub_24D2A78E4(v24, (uint64_t)v75);
  uint64_t v33 = v76;
  v34 = v77;
  v66 = __swift_project_boxed_opaque_existential_1(v75, v76);
  unint64_t v35 = sub_24D2A7C10();
  unint64_t v36 = sub_24D2A6EB8(0, v35);
  unsigned int v37 = sub_24D2A7C00();
  char v38 = sub_24D2A74C4();
  if (!v2)
  {
    ((void (*)(unint64_t, unint64_t, uint64_t, void *))v34[1])(v36, v37 | ((unint64_t)(v38 & 1) << 32), v33, v34);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v75);
    uint64_t v52 = 0;
    int v53 = 1;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v75);
  v75[0] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985F2A8);
  if (swift_dynamicCast())
  {
    uint64_t v52 = v74;
    MEMORY[0x2533242B0](v75[0]);
    int v53 = 0;
LABEL_8:
    sub_24D2A7C20();
    uint64_t v49 = v69;
    v68((uint64_t)v14, 0, 1, v69);
    uint64_t v50 = (uint64_t)v73;
    sub_24D2A7684((uint64_t)v14, (uint64_t)v73);
    v51 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48);
    if (!v51(v50, 1, v49))
    {
      uint64_t v54 = v72;
      if (v53)
      {
        uint64_t v32 = (uint64_t)v73;
        sub_24D2A7C50();
      }
      else
      {
        uint64_t v59 = (uint64_t)v73;
        sub_24D2A7C50();
        uint64_t v60 = v52;
        uint64_t v32 = v59;
        sub_24D2A70CC(v60);
      }
      goto LABEL_20;
    }
    uint64_t v32 = (uint64_t)v73;
LABEL_19:
    uint64_t v54 = v72;
LABEL_20:
    if (v51(v32, 1, v49))
    {
      (*(void (**)(char *, uint64_t))(v54 + 8))(v19, v71);
      uint64_t v30 = 0;
    }
    else
    {
      uint64_t v56 = v70;
      v57 = v67;
      (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v67, v32, v49);
      uint64_t v30 = sub_24D2A7C80();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v49);
      (*(void (**)(char *, uint64_t))(v54 + 8))(v19, v71);
    }
    goto LABEL_23;
  }
LABEL_33:
  MEMORY[0x2533242B0](v75[0]);
  uint64_t result = sub_24D2A7D50();
  __break(1u);
  return result;
}

uint64_t sub_24D2A6540(uint64_t a1)
{
  return sub_24D2A5D80(a1);
}

uint64_t sub_24D2A6564()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreService()
{
  return self;
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreService.Service()
{
  return self;
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreService.Server()
{
  return self;
}

uint64_t sub_24D2A65E0()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_24D2A6618@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_24D2A7CB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_24D2A7CF0();
  swift_allocObject();
  uint64_t v9 = sub_24D2A7CE0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(void *)(v8 + 16) = v9;
  *a2 = v8;
  return result;
}

uint64_t sub_24D2A6748(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24D2A7C90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v56 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985F2D0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  v58 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v50 - v10;
  uint64_t v12 = sub_24D2A7C40();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = v16;
  uint64_t v60 = v15;
  (*(void (**)(char *, uint64_t))(v16 + 16))(v14, a1);
  uint64_t v57 = v5;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v17(v11, 1, 1, v4);
  sub_24D2A77FC();
  sub_24D2A78E4(v2 + 24, (uint64_t)v62);
  uint64_t v18 = v63;
  uint64_t v19 = v64;
  uint64_t v20 = __swift_project_boxed_opaque_existential_1(v62, v63);
  uint64_t v21 = v61;
  int v22 = sub_24D2A74C4();
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v59 + 8))(v14, v60);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
    sub_24D2A7624((uint64_t)v11);
    return (uint64_t)v11;
  }
  int v52 = v22;
  int v53 = v20;
  uint64_t v54 = v19;
  uint64_t v55 = v18;
  v51 = v17;
  uint64_t v61 = v11;
  char v23 = sub_24D2A6FD4(0, 4);
  unint64_t v24 = sub_24D2A7C10();
  unint64_t v25 = sub_24D2A6EB8(0, v24);
  int v26 = sub_24D2A7C00();
  unint64_t v27 = sub_24D2A6FD4(0, 4);
  uint64_t v28 = sub_24D2A7948();
  uint64_t v29 = v14;
  v65[0] = v52 & 1;
  v66 = v23;
  unint64_t v67 = v25;
  int v68 = v26;
  uint64_t v69 = v27;
  uint64_t v70 = v28;
  uint64_t v55 = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v65, v55);
  uint64_t v32 = v31;
  int v34 = v33;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  uint64_t v35 = *(void *)(v32 + 16);
  BOOL v36 = __OFADD__(v35, 8);
  uint64_t v37 = v35 + 8;
  if (v36)
  {
    __break(1u);
    goto LABEL_19;
  }
  BOOL v36 = __OFADD__(v37, 8);
  uint64_t v38 = v37 + 8;
  uint64_t v39 = (uint64_t)v61;
  uint64_t v40 = (uint64_t)v58;
  if (v36)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  LODWORD(v54) = v34;
  uint64_t result = v38 + 4;
  if (!__OFADD__(v38, 4))
  {
    sub_24D2A7C20();
    uint64_t v41 = v4;
    v51((char *)v40, 0, 1, v4);
    sub_24D2A7684(v40, v39);
    int v42 = *(char **)(v57 + 48);
    if (!((unsigned int (*)(uint64_t, uint64_t, uint64_t))v42)(v39, 1, v4))
    {
      sub_24D2A70CC(v55);
      uint64_t v47 = *(void *)(v32 + 16);
      sub_24D2A7C70();
      if (v47)
      {
        v58 = v42;
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v47; ++i)
          sub_24D2A7C50();
        swift_bridgeObjectRelease();
        int v42 = v58;
      }
      uint64_t v39 = (uint64_t)v61;
      sub_24D2A7C60();
      uint64_t v41 = v4;
    }
    swift_bridgeObjectRelease();
    unsigned int v43 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v42)(v39, 1, v41);
    BOOL v45 = v56;
    uint64_t v44 = v57;
    if (v43)
    {
      (*(void (**)(char *, uint64_t))(v59 + 8))(v29, v60);
      uint64_t v46 = v39;
      uint64_t v11 = 0;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v56, v39, v41);
      uint64_t v49 = v41;
      uint64_t v46 = v39;
      uint64_t v11 = (char *)sub_24D2A7C80();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v49);
      (*(void (**)(char *, uint64_t))(v59 + 8))(v29, v60);
    }
    sub_24D2A7624(v46);
    return (uint64_t)v11;
  }
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_24D2A6CCC()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t sub_24D2A6D0C(uint64_t a1)
{
  return sub_24D2A6748(a1);
}

uint64_t type metadata accessor for ExclaveFDRDecodeTrustEvaluationService()
{
  return self;
}

uint64_t type metadata accessor for ExclaveFDRDecodeTrustEvaluationService.Service()
{
  return self;
}

uint64_t type metadata accessor for ExclaveFDRDecodeTrustEvaluationService.Server()
{
  return self;
}

uint64_t sub_24D2A6D9C()
{
  return sub_24D2A6E74(&qword_26985F2B8, (void (*)(void))type metadata accessor for ExclaveFDRDecodeTrustEvaluationService.Server);
}

uint64_t sub_24D2A6DE4()
{
  return sub_24D2A6E74(&qword_26985F2C0, (void (*)(void))type metadata accessor for ExclaveFDRDecodeRawDataStoreService.Server);
}

uint64_t sub_24D2A6E2C()
{
  return sub_24D2A6E74(&qword_26985F2C8, (void (*)(void))type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService.Server);
}

uint64_t sub_24D2A6E74(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24D2A6EB8(unint64_t result, unint64_t a2)
{
  unint64_t v3 = result;
  uint64_t v4 = a2 - result;
  if (a2 < result)
  {
    if ((uint64_t)(result - a2) < 0)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    uint64_t v4 = a2 - result;
LABEL_5:
    uint64_t v5 = MEMORY[0x263F8EE78];
    if (!v4) {
      return v5;
    }
    uint64_t v10 = MEMORY[0x263F8EE78];
    uint64_t result = (unint64_t)sub_24D2A71AC(0, v4 & ~(v4 >> 63), 0);
    uint64_t v6 = a2 - v3;
    if (a2 >= v3 && (v4 & 0x8000000000000000) == 0)
    {
      uint64_t v5 = v10;
      while (1)
      {
        uint64_t result = sub_24D2A7BF0();
        char v7 = result;
        unint64_t v9 = *(void *)(v10 + 16);
        unint64_t v8 = *(void *)(v10 + 24);
        if (v9 >= v8 >> 1) {
          uint64_t result = (unint64_t)sub_24D2A71AC((char *)(v8 > 1), v9 + 1, 1);
        }
        *(void *)(v10 + 16) = v9 + 1;
        *(unsigned char *)(v10 + v9 + 32) = v7;
        if (!v6) {
          break;
        }
        --v6;
        if (!--v4) {
          return v5;
        }
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  if ((uint64_t)(a2 - result) >= 0) {
    goto LABEL_5;
  }
LABEL_17:
  __break(1u);
  return result;
}

char *sub_24D2A6FD4(char *result, uint64_t a2)
{
  uint64_t v2 = a2 - (void)result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (!v2) {
      return (char *)v3;
    }
    uint64_t v5 = result;
    uint64_t v9 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24D2A71AC(0, v2 & ~(v2 >> 63), 0);
    if (a2 >= (uint64_t)v5 && (v2 & 0x8000000000000000) == 0)
    {
      uint64_t v3 = v9;
      do
      {
        char v6 = sub_24D2A7BF0();
        unint64_t v8 = *(void *)(v9 + 16);
        unint64_t v7 = *(void *)(v9 + 24);
        if (v8 >= v7 >> 1) {
          sub_24D2A71AC((char *)(v7 > 1), v8 + 1, 1);
        }
        *(void *)(v9 + 16) = v8 + 1;
        *(unsigned char *)(v9 + v8 + 32) = v6;
        --v2;
      }
      while (v2);
      return (char *)v3;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24D2A70CC(uint64_t a1)
{
  if ((a1 & 0x7FFFFFFFFFFFFFC0) == 0) {
    return sub_24D2A7C70();
  }
  sub_24D2A7D40();
  sub_24D2A7D20();
  sub_24D2A7D60();
  sub_24D2A7D20();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24D2A7D50();
  __break(1u);
  return result;
}

char *sub_24D2A71AC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24D2A71CC(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_24D2A71CC(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985F2D8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_24D2A72B8()
{
  uint64_t result = sub_24D2A7C10();
  if ((result & 0x7FFFFFFFFFFFFFC0) != 0)
  {
    sub_24D2A7D40();
    sub_24D2A7D20();
    sub_24D2A7D60();
    sub_24D2A7D20();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24D2A7D50();
    __break(1u);
  }
  return result;
}

uint64_t sub_24D2A7398()
{
  uint64_t result = sub_24D2A7C10();
  if (result != 0xD1E1F592CBAABCE3)
  {
    sub_24D2A7D40();
    sub_24D2A7D20();
    sub_24D2A7D60();
    sub_24D2A7D20();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24D2A7D50();
    __break(1u);
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

uint64_t sub_24D2A74C4()
{
  uint64_t v0 = sub_24D2A7C10();
  if (v0 == 0xBE6B44F35C5CA9B9) {
    return 1;
  }
  if (v0 == 0xE6C698D5A150ECB8) {
    return 0;
  }
  sub_24D2A7D40();
  swift_bridgeObjectRelease();
  sub_24D2A7D60();
  sub_24D2A7D20();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24D2A7D50();
  __break(1u);
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

uint64_t sub_24D2A7624(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985F2D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24D2A7684(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985F2D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D2A76F0()
{
  uint64_t v0 = sub_24D2A7C10();
  if (v0 == 0xF8BE6A6F727628E8) {
    return 0;
  }
  if (v0 == 0x85CCB4C7D58863A4) {
    return 1;
  }
  sub_24D2A7D40();
  sub_24D2A7D20();
  sub_24D2A7D60();
  sub_24D2A7D20();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24D2A7D50();
  __break(1u);
  return result;
}

uint64_t sub_24D2A77FC()
{
  uint64_t result = sub_24D2A7C10();
  if (result != 0x3CABAAF6E5F14886)
  {
    sub_24D2A7D40();
    sub_24D2A7D20();
    sub_24D2A7D60();
    sub_24D2A7D20();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24D2A7D50();
    __break(1u);
  }
  return result;
}

uint64_t sub_24D2A78E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24D2A7948()
{
  uint64_t result = sub_24D2A7C10();
  if ((result & 0xFFFFFFFFFFFFFFF0) != 0)
  {
    sub_24D2A7D40();
    sub_24D2A7D20();
    sub_24D2A7D60();
    sub_24D2A7D20();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24D2A7D50();
    __break(1u);
  }
  return result;
}

unint64_t sub_24D2A7A28()
{
  unint64_t result = qword_26985F2E0;
  if (!qword_26985F2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F2E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExclaveFDRDecodeError()
{
  return &type metadata for ExclaveFDRDecodeError;
}

unint64_t sub_24D2A7A90()
{
  unint64_t result = qword_26985F2E8;
  if (!qword_26985F2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F2E8);
  }
  return result;
}

unint64_t sub_24D2A7AE8()
{
  unint64_t result = qword_26985F2F0;
  if (!qword_26985F2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F2F0);
  }
  return result;
}

unint64_t sub_24D2A7B40()
{
  unint64_t result = qword_26985F2F8;
  if (!qword_26985F2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F2F8);
  }
  return result;
}

unint64_t sub_24D2A7B98()
{
  unint64_t result = qword_26985F300;
  if (!qword_26985F300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985F300);
  }
  return result;
}

uint64_t sub_24D2A7BF0()
{
  return MEMORY[0x270F7DF88]();
}

uint64_t sub_24D2A7C00()
{
  return MEMORY[0x270F7DFA0]();
}

uint64_t sub_24D2A7C10()
{
  return MEMORY[0x270F7DFB0]();
}

uint64_t sub_24D2A7C20()
{
  return MEMORY[0x270F7DFC0]();
}

uint64_t sub_24D2A7C30()
{
  return MEMORY[0x270F7DFC8]();
}

uint64_t sub_24D2A7C40()
{
  return MEMORY[0x270F7DFD0]();
}

uint64_t sub_24D2A7C50()
{
  return MEMORY[0x270F7E000]();
}

uint64_t sub_24D2A7C60()
{
  return MEMORY[0x270F7E010]();
}

uint64_t sub_24D2A7C70()
{
  return MEMORY[0x270F7E018]();
}

uint64_t sub_24D2A7C80()
{
  return MEMORY[0x270F7E028]();
}

uint64_t sub_24D2A7C90()
{
  return MEMORY[0x270F7E038]();
}

uint64_t sub_24D2A7CA0()
{
  return MEMORY[0x270F7E048]();
}

uint64_t sub_24D2A7CB0()
{
  return MEMORY[0x270F7E058]();
}

uint64_t sub_24D2A7CC0()
{
  return MEMORY[0x270F7E060]();
}

uint64_t sub_24D2A7CD0()
{
  return MEMORY[0x270F7E068]();
}

uint64_t sub_24D2A7CE0()
{
  return MEMORY[0x270F7E070]();
}

uint64_t sub_24D2A7CF0()
{
  return MEMORY[0x270F7E088]();
}

uint64_t sub_24D2A7D00()
{
  return MEMORY[0x270F7E0A8]();
}

uint64_t sub_24D2A7D10()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24D2A7D20()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24D2A7D40()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24D2A7D50()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24D2A7D60()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24D2A7D70()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24D2A7D80()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24D2A7D90()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24D2A7DB0()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_24D2A7DC0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24D2A7DD0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24D2A7DE0()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}