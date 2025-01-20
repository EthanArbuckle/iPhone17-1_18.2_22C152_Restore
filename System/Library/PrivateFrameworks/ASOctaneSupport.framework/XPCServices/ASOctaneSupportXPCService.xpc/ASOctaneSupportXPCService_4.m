uint64_t sub_1002048A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(void *)(a1 + 24);
  v3 = *(void *)(a1 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10008C7E4(v2, v3);
  return a1;
}

ValueMetadata *type metadata accessor for OctaneSimulatedError.CurrentError.CodingKeys()
{
  return &type metadata for OctaneSimulatedError.CurrentError.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for OctaneSimulatedError.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *result = a2 + 2;
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
        JUMPOUT(0x1002049E8);
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
          *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OctaneSimulatedError.CodingKeys()
{
  return &type metadata for OctaneSimulatedError.CodingKeys;
}

ValueMetadata *type metadata accessor for OctaneSimulatedErrorData()
{
  return &type metadata for OctaneSimulatedErrorData;
}

uint64_t _s25ASOctaneSupportXPCService24OctaneSimulatedErrorDataVwca_0(void *a1, void *a2)
{
  sub_100205088(a1, a2);
  *(void *)(v3 + 8) = *(void *)(v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 16) = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _s25ASOctaneSupportXPCService24OctaneSimulatedErrorDataVwta_0(void *a1, void *a2)
{
  sub_100205088(a1, a2);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v2 + 8);
  swift_bridgeObjectRelease();
  return v3;
}

ValueMetadata *type metadata accessor for OctaneSimulatedErrorType()
{
  return &type metadata for OctaneSimulatedErrorType;
}

unint64_t sub_100204AEC()
{
  unint64_t result = qword_100319368;
  if (!qword_100319368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319368);
  }
  return result;
}

unint64_t sub_100204B3C()
{
  unint64_t result = qword_100319370;
  if (!qword_100319370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319370);
  }
  return result;
}

unint64_t sub_100204B8C()
{
  unint64_t result = qword_100319378;
  if (!qword_100319378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319378);
  }
  return result;
}

unint64_t sub_100204BDC()
{
  unint64_t result = qword_100319380;
  if (!qword_100319380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319380);
  }
  return result;
}

unint64_t sub_100204C2C()
{
  unint64_t result = qword_100319388;
  if (!qword_100319388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319388);
  }
  return result;
}

unint64_t sub_100204C7C()
{
  unint64_t result = qword_100319390;
  if (!qword_100319390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319390);
  }
  return result;
}

unint64_t sub_100204CC8()
{
  unint64_t result = qword_1003193A0;
  if (!qword_1003193A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003193A0);
  }
  return result;
}

unint64_t sub_100204D14()
{
  unint64_t result = qword_1003193B0;
  if (!qword_1003193B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003193B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for OctaneSimulatedErrorType.CodingKeys()
{
  return &type metadata for OctaneSimulatedErrorType.CodingKeys;
}

unsigned char *_s25ASOctaneSupportXPCService20OctaneSimulatedErrorV12CurrentErrorV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100204E3CLL);
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

ValueMetadata *type metadata accessor for OctaneSimulatedErrorData.CodingKeys()
{
  return &type metadata for OctaneSimulatedErrorData.CodingKeys;
}

unint64_t sub_100204E78()
{
  unint64_t result = qword_1003193C0;
  if (!qword_1003193C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003193C0);
  }
  return result;
}

unint64_t sub_100204EC8()
{
  unint64_t result = qword_1003193C8;
  if (!qword_1003193C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003193C8);
  }
  return result;
}

unint64_t sub_100204F18()
{
  unint64_t result = qword_1003193D0;
  if (!qword_1003193D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003193D0);
  }
  return result;
}

unint64_t sub_100204F68()
{
  unint64_t result = qword_1003193D8;
  if (!qword_1003193D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003193D8);
  }
  return result;
}

unint64_t sub_100204FB8()
{
  unint64_t result = qword_1003193E0;
  if (!qword_1003193E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003193E0);
  }
  return result;
}

unint64_t sub_100205008()
{
  unint64_t result = qword_1003193E8;
  if (!qword_1003193E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003193E8);
  }
  return result;
}

uint64_t sub_100205054()
{
  return 0;
}

uint64_t sub_100205068()
{
  return sub_10008C7E4(v0, v1);
}

void *sub_100205088(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_10020509C()
{
  return sub_10024F940();
}

uint64_t static NSJSONSerialization.jsonObject(with:options:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  v7 = self;
  uint64_t v8 = swift_retain();
  uint64_t v9 = Data.init(buffer:byteTransferStrategy:)(v8, a2, a3 & 0xFFFFFFFFFFFFFFLL, 2);
  unint64_t v11 = v10;
  Class isa = sub_10024DEF0().super.isa;
  sub_10003F808(v9, v11);
  id v17 = 0;
  id v13 = [v7 JSONObjectWithData:isa options:a4 error:&v17];

  id v14 = v17;
  if (v13)
  {
    sub_10024F250();
    return swift_unknownObjectRelease();
  }
  else
  {
    v16 = v14;
    sub_10024DCE0();

    return swift_willThrow();
  }
}

BOOL static _UInt24.== infix(_:_:)(int a1, int a2)
{
  return (a1 & 0xFFFFFF) == (a2 & 0xFFFFFF);
}

Swift::UInt32 __swiftcall UInt32.init(_:)(ASOctaneSupportXPCService::_UInt24 a1)
{
  return v1 | (a1._backing._0 << 8);
}

void *_UInt24.max.unsafeMutableAddressor()
{
  return &static _UInt24.max;
}

uint64_t _UInt24._backing.getter(int a1)
{
  return a1 & 0xFFFFFF;
}

uint64_t _UInt24._backing.setter(uint64_t result, char a2)
{
  *(_WORD *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 2) = a2;
  return result;
}

uint64_t static _UInt24.max.getter()
{
  return 0xFFFFFFLL;
}

void *_UInt24.min.unsafeMutableAddressor()
{
  return &static _UInt24.min;
}

BOOL sub_10020524C(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return static _UInt24.== infix(_:_:)(*a1 | (*((unsigned __int8 *)a1 + 2) << 16), *a2 | (*((unsigned __int8 *)a2 + 2) << 16));
}

uint64_t _UInt24.description.getter()
{
  return sub_10024F230();
}

unint64_t sub_1002052B0()
{
  unint64_t result = qword_1003193F0;
  if (!qword_1003193F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003193F0);
  }
  return result;
}

uint64_t sub_1002052FC()
{
  return _UInt24.description.getter();
}

uint64_t initializeBufferWithCopyOfBuffer for _UInt24(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(unsigned char *)(result + 2) = *((unsigned char *)a2 + 2);
  *(_WORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for _UInt24(unsigned __int16 *a1, int a2)
{
  if (a2)
  {
    if ((a2 + 0x1FFFFFF) >> 24)
    {
      int v2 = *((unsigned __int8 *)a1 + 3);
      if (*((unsigned char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 0xFFFFFF;
      }
    }
    else
    {
      int v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 0xFFFFFF;
      }
    }
  }
  return 0;
}

uint64_t storeEnumTagSinglePayload for _UInt24(uint64_t result, int a2, int a3)
{
  if ((a3 + 0x1FFFFFF) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (!a3) {
    int v3 = 0;
  }
  if (a2)
  {
    *(_WORD *)unint64_t result = a2 - 1;
    *(unsigned char *)(result + 2) = (a2 - 1) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 1) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(unsigned char *)(result + 3) = v4;
      }
    }
  }
  else if (v3)
  {
    if (v3 == 2) {
      *(_WORD *)(result + 3) = 0;
    }
    else {
      *(unsigned char *)(result + 3) = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _UInt24()
{
  return &type metadata for _UInt24;
}

ValueMetadata *type metadata accessor for _UInt56()
{
  return &type metadata for _UInt56;
}

uint64_t sub_1002053FC()
{
  return sub_10024F230();
}

uint64_t sub_100205440()
{
  return sub_1002053FC();
}

uint64_t sub_100205458(uint64_t *a1)
{
  uint64_t v2 = a1[12];
  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_10011ED00(), (v4 & 1) != 0))
  {
    uint64_t v5 = *(void *)(*(void *)(v2 + 56) + 16 * v3);
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100212134();
    sub_100161540(6580578, 0xE300000000000000, v6);
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    sub_1000457A8(a1);
    if (!v8)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {
    sub_1000457A8(a1);
    return 0;
  }
  return v5;
}

_UNKNOWN **sub_100205540()
{
  return &off_1002F1460;
}

uint64_t sub_10020554C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_10003B908((_OWORD *)a1, v6);
    sub_10020C68C(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_100051BB4(a1, (uint64_t *)&unk_100319510);
    sub_10020BFC8(v6);
    swift_bridgeObjectRelease();
    return sub_100051BB4((uint64_t)v6, (uint64_t *)&unk_100319510);
  }
}

uint64_t sub_1002055E0(uint64_t a1, char a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_10003B908((_OWORD *)a1, v4);
    return sub_10020C6D8(v4, a2);
  }
  else
  {
    sub_100051BB4(a1, (uint64_t *)&unk_100319510);
    sub_10020C100(a2, v4);
    return sub_100051BB4((uint64_t)v4, (uint64_t *)&unk_100319510);
  }
}

uint64_t sub_100205658(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_10002F754((long long *)a1, (uint64_t)v6);
    sub_10020CA68(v6, a2, a3);
    return sub_10006B3E8(a2, a3);
  }
  else
  {
    sub_100051BB4(a1, &qword_1003195B0);
    sub_10020C544((uint64_t)v6);
    sub_10006B3E8(a2, a3);
    return sub_100051BB4((uint64_t)v6, &qword_1003195B0);
  }
}

void sub_1002056F4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100019524((uint64_t *)&unk_100319530);
    uint64_t v2 = (void *)sub_10024F720();
  }
  else
  {
    uint64_t v2 = _swiftEmptyDictionarySingleton;
  }
  uint64_t v32 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 8;
  swift_bridgeObjectRetain();
  swift_retain();
  int64_t v7 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v7 << 6);
  while (1)
  {
    v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_1000318C8(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v44);
    *(void *)&long long v43 = v20;
    *((void *)&v43 + 1) = v19;
    v41[2] = v43;
    v42[0] = v44[0];
    v42[1] = v44[1];
    *(void *)&v41[0] = v20;
    *((void *)&v41[0] + 1) = v19;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10003B908(v42, v36);
    long long v37 = v33;
    long long v38 = v34;
    uint64_t v39 = v35;
    sub_10003B908(v36, v40);
    long long v33 = v37;
    long long v34 = v38;
    uint64_t v35 = v39;
    sub_10003B908(v40, v41);
    sub_10003B908(v41, &v37);
    Swift::Int v21 = sub_10024F2C0(v2[5]);
    uint64_t v22 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v23 = v21 & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~v6[v23 >> 6]) == 0)
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0;
        }
        v26 |= v28;
        uint64_t v29 = v6[v24];
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_38;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    unint64_t v25 = __clz(__rbit64((-1 << v23) & ~v6[v23 >> 6])) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_38:
    *(void *)((char *)v6 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    uint64_t v30 = v2[6] + 40 * v25;
    *(_OWORD *)uint64_t v30 = v33;
    *(_OWORD *)(v30 + 16) = v34;
    *(void *)(v30 + 32) = v35;
    sub_10003B908(&v37, (_OWORD *)(v2[7] + 32 * v25));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v10 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_42;
    }
    if (v10 >= v31) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v32 + 8 * v10);
    int64_t v12 = v7 + 1;
    if (!v11)
    {
      sub_10020E608();
      if (v13 == v14) {
        goto LABEL_40;
      }
      sub_10020E740();
      if (!v11)
      {
        sub_10020E608();
        if (v13 == v14) {
          goto LABEL_40;
        }
        sub_10020E740();
        if (!v11)
        {
          sub_10020E608();
          if (v13 == v14) {
            goto LABEL_40;
          }
          sub_10020E740();
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_28:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v7 = v12;
  }
  int64_t v16 = v15 + 4;
  if (v16 >= v31)
  {
LABEL_40:
    swift_release();
    sub_10001B070();
    return;
  }
  unint64_t v11 = *(void *)(v32 + 8 * v16);
  if (v11)
  {
    int64_t v12 = v16;
    goto LABEL_28;
  }
  while (!__OFADD__(v16, 1))
  {
    sub_10020E608();
    if (v13 == v14) {
      goto LABEL_40;
    }
    sub_10020E740();
    int64_t v16 = v17 + 1;
    if (v11) {
      goto LABEL_28;
    }
  }
LABEL_43:
  __break(1u);
}

uint64_t sub_100205A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

void sub_100205AC0()
{
  sub_100141AF0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  int64_t v7 = *(void (**)(void *, void *, uint64_t))(v6 + 32);
  v4;
  id v8 = v3;
  v7(v5, v3, v1);

  sub_10008F248();
}

uint64_t sub_100205B38(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_100205B60()
{
  sub_100141AF0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  unint64_t v5 = *(void (**)(void *, void *))(v4 + 32);
  v2;
  id v6 = v1;
  v5(v3, v1);

  sub_10008F248();
}

uint64_t sub_100205BD0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_100205BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_100205C4C(char a1)
{
  return qword_10026D488[a1];
}

uint64_t sub_100205C60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100205C4C(*v1);
  *a1 = result;
  return result;
}

void sub_100205C8C()
{
  id v0 = [self persistedDataPath];
  if (v0)
  {
    NSString v1 = sub_10024E6A0();
    id v2 = [v0 stringByAppendingPathComponent:v1];

    id v0 = (id)sub_10024E6B0();
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = 0;
  }
  qword_100319400 = (uint64_t)v0;
  qword_100319408 = v4;
}

uint64_t sub_100205D44()
{
  uint64_t v0 = sub_10024E030();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [self persistedDataPath];
  if (!v5) {
    return (uint64_t)v5;
  }
  v12[0] = 0;
  v12[1] = 0xE000000000000000;
  sub_10024F330(19);
  swift_bridgeObjectRelease();
  strcpy((char *)v12, "store-corrupt-");
  HIBYTE(v12[1]) = -18;
  sub_10024E010();
  sub_10024DF70();
  double v7 = v6;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  if ((~*(void *)&v7 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v7 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v7 < 9.22337204e18)
  {
    v11[1] = (uint64_t)v7;
    v13._countAndFlagsBits = sub_10024F9E0();
    sub_10024E800(v13);
    swift_bridgeObjectRelease();
    v14._countAndFlagsBits = 6448174;
    v14._object = (void *)0xE300000000000000;
    sub_10024E800(v14);
    NSString v9 = sub_10024E6A0();
    swift_bridgeObjectRelease();
    id v10 = [v5 stringByAppendingPathComponent:v9];

    id v5 = (id)sub_10024E6B0();
    return (uint64_t)v5;
  }
LABEL_9:
  __break(1u);
  return result;
}

void sub_100205F70()
{
  id v0 = sub_100205FC0();
  id v1 = [objc_allocWithZone((Class)SQLiteDatabase) initWithConnectionOptions:v0];

  qword_100319410 = (uint64_t)v1;
}

id sub_100205FC0()
{
  if (qword_100308E10 != -1) {
    swift_once();
  }
  if (!qword_100319408)
  {
    if (qword_100308DE0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_10024E1F0();
    sub_10001B0E8(v1, (uint64_t)qword_10034C0E0);
    uint64_t v2 = sub_10024E1D0();
    os_log_type_t v3 = sub_10024EE20();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "StoreKit Testing in Xcode is unavailable. Please file a bug and attach a sysdiagnose.", v4, 2u);
      swift_slowDealloc();
    }

    exit(1);
  }
  sub_10020DC5C();
  swift_bridgeObjectRetain();
  return sub_100206108();
}

id sub_100206108()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_10024E6A0();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithDatabasePath:v1];

  return v2;
}

void sub_10020617C()
{
  if (qword_100308E18 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_100319410;
  id v1 = objc_allocWithZone((Class)type metadata accessor for DatabaseStore());
  id v2 = v0;
  id v3 = [v1 initWithDatabase:v2];

  qword_10034C110 = (uint64_t)v3;
}

void sub_100206208()
{
  sub_10024F330(417);
  v4._countAndFlagsBits = 0xD00000000000001BLL;
  v4._object = (void *)0x8000000100284A80;
  sub_10024E800(v4);
  id v0 = [(id)type metadata accessor for TransactionEntity() databaseTable];
  uint64_t v1 = sub_10024E6B0();
  id v3 = v2;

  v5._countAndFlagsBits = v1;
  v5._object = v3;
  sub_10024E800(v5);
  swift_bridgeObjectRelease();
  v6._object = (void *)0x8000000100284AA0;
  v6._countAndFlagsBits = 0xD000000000000010;
  sub_10024E800(v6);
  v7._countAndFlagsBits = 0x6E6F69746361;
  v7._object = (void *)0xE600000000000000;
  sub_10024E800(v7);
  v8._countAndFlagsBits = 0xD000000000000010;
  v8._object = (void *)0x8000000100284AC0;
  sub_10024E800(v8);
  v9._object = (void *)0xEA00000000007375;
  v9._countAndFlagsBits = 0x746174735F627461;
  sub_10024E800(v9);
  v10._countAndFlagsBits = 0x52454745544E4920;
  v10._object = (void *)0xEA00000000000A2CLL;
  sub_10024E800(v10);
  v11._countAndFlagsBits = 0x695F656C646E7562;
  v11._object = (void *)0xE900000000000064;
  sub_10024E800(v11);
  v12._countAndFlagsBits = 0xD000000000000010;
  v12._object = (void *)0x8000000100284AC0;
  sub_10024E800(v12);
  v13._countAndFlagsBits = 0x645F6C65636E6163;
  v13._object = (void *)0xEB00000000657461;
  sub_10024E800(v13);
  v14._countAndFlagsBits = 0xA2C4C41455220;
  v14._object = (void *)0xE700000000000000;
  sub_10024E800(v14);
  v15._countAndFlagsBits = 0x6974617269707865;
  v15._object = (void *)0xEF657461645F6E6FLL;
  sub_10024E800(v15);
  v16._countAndFlagsBits = 0xA2C4C41455220;
  v16._object = (void *)0xE700000000000000;
  sub_10024E800(v16);
  v17._countAndFlagsBits = 0x64656873696E6966;
  v17._object = (void *)0xE800000000000000;
  sub_10024E800(v17);
  v18._countAndFlagsBits = 0xD00000000000001DLL;
  v18._object = (void *)0x8000000100284AE0;
  sub_10024E800(v18);
  v19._countAndFlagsBits = 0xD000000000000012;
  v19._object = (void *)0x8000000100278D90;
  sub_10024E800(v19);
  v20._countAndFlagsBits = 0xD00000000000001DLL;
  v20._object = (void *)0x8000000100284AE0;
  sub_10024E800(v20);
  v21._countAndFlagsBits = 25705;
  v21._object = (void *)0xE200000000000000;
  sub_10024E800(v21);
  v22._countAndFlagsBits = 0xD000000000000013;
  v22._object = (void *)0x8000000100284B00;
  sub_10024E800(v22);
  v23._countAndFlagsBits = 0x6C616E696769726FLL;
  v23._object = (void *)0xEB0000000064695FLL;
  sub_10024E800(v23);
  v24._countAndFlagsBits = 0x52454745544E4920;
  v24._object = (void *)0xEA00000000000A2CLL;
  sub_10024E800(v24);
  v25._countAndFlagsBits = 0xD000000000000016;
  v25._object = (void *)0x8000000100278DE0;
  sub_10024E800(v25);
  v26._countAndFlagsBits = 0xA2C4C41455220;
  v26._object = (void *)0xE700000000000000;
  sub_10024E800(v26);
  v27._countAndFlagsBits = 0x5F746375646F7270;
  v27._object = (void *)0xEA00000000006469;
  sub_10024E800(v27);
  v28._countAndFlagsBits = 0xD000000000000010;
  v28._object = (void *)0x8000000100284AC0;
  sub_10024E800(v28);
  v29._countAndFlagsBits = 0xD000000000000011;
  v29._object = (void *)0x8000000100278DC0;
  sub_10024E800(v29);
  v30._countAndFlagsBits = 0xA2C5458455420;
  v30._object = (void *)0xE700000000000000;
  sub_10024E800(v30);
  v31._countAndFlagsBits = 0x6573616863727570;
  v31._object = (void *)0xED0000657461645FLL;
  sub_10024E800(v31);
  v32._object = (void *)0x8000000100284B20;
  v32._countAndFlagsBits = 0xD000000000000010;
  sub_10024E800(v32);
  v33._countAndFlagsBits = 0x797469746E617571;
  v33._object = (void *)0xE800000000000000;
  sub_10024E800(v33);
  v34._object = (void *)0x8000000100284B40;
  v34._countAndFlagsBits = 0xD00000000000001DLL;
  sub_10024E800(v34);
  v35._countAndFlagsBits = 0x6574617473;
  v35._object = (void *)0xE500000000000000;
  sub_10024E800(v35);
  v36._countAndFlagsBits = 0xD00000000000001DLL;
  v36._object = (void *)0x8000000100284AE0;
  sub_10024E800(v36);
  v37._countAndFlagsBits = 0xD000000000000015;
  v37._object = (void *)0x8000000100278E10;
  sub_10024E800(v37);
  v38._countAndFlagsBits = 0xA2C5458455420;
  v38._object = (void *)0xE700000000000000;
  sub_10024E800(v38);
  v39._countAndFlagsBits = 1701869940;
  v39._object = (void *)0xE400000000000000;
  sub_10024E800(v39);
  v40._countAndFlagsBits = 0xD000000000000010;
  v40._object = (void *)0x8000000100284AC0;
  sub_10024E800(v40);
  v41._object = (void *)0xEA0000000000646ELL;
  v41._countAndFlagsBits = 0x756665725F646964;
  sub_10024E800(v41);
  v42._countAndFlagsBits = 0xD00000000000001DLL;
  v42._object = (void *)0x8000000100284AE0;
  sub_10024E800(v42);
  v43._countAndFlagsBits = 0x64695F726566666FLL;
  v43._object = (void *)0xE800000000000000;
  sub_10024E800(v43);
  v44._countAndFlagsBits = 0xA2C5458455420;
  v44._object = (void *)0xE700000000000000;
  sub_10024E800(v44);
  v45._object = (void *)0x8000000100278E40;
  v45._countAndFlagsBits = 0xD000000000000010;
  sub_10024E800(v45);
  v46._countAndFlagsBits = 0xD00000000000001ALL;
  v46._object = (void *)0x8000000100284B60;
  sub_10024E800(v46);
  qword_10034C118 = 0;
  unk_10034C120 = 0xE000000000000000;
}

unint64_t sub_100206764()
{
  if (qword_100308E10 != -1) {
    swift_once();
  }
  if (qword_100319408) {
    unint64_t v0 = qword_100319400;
  }
  else {
    unint64_t v0 = 0xD000000000000012;
  }
  swift_bridgeObjectRetain();
  return v0;
}

id sub_100206814()
{
  id v0 = [objc_allocWithZone((Class)SQLiteDatabaseStoreDescriptor) init];
  NSString v1 = sub_10024E6A0();
  [v0 setSchemaName:v1];

  type metadata accessor for DatabaseSession();
  [v0 setSessionClass:swift_getObjCClassFromMetadata()];
  type metadata accessor for DatabaseTransaction();
  [v0 setTransactionClass:swift_getObjCClassFromMetadata()];
  return v0;
}

uint64_t sub_1002068C0()
{
  sub_10020E654();
  uint64_t v2 = sub_10004F2C8();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0;
  uint64_t v3 = sub_10004F2C8();
  *(void *)(v3 + 16) = sub_10020B900;
  *(void *)(v3 + 24) = v2;
  v7[4] = sub_10020B914;
  v7[5] = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_100206A6C;
  v7[3] = &unk_1002F1558;
  Swift::String v4 = _Block_copy(v7);
  swift_retain();
  swift_release();
  [v0 readUsingSession:v4];
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_100206A04(void *a1, void (*a2)(void *))
{
  v6[3] = type metadata accessor for DatabaseSession();
  v6[4] = &off_1002E36F8;
  v6[0] = a1;
  id v4 = a1;
  a2(v6);
  return sub_10001C2EC((uint64_t)v6);
}

void sub_100206A6C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_100206AB8()
{
  sub_10020E654();
  uint64_t v2 = sub_10004F2C8();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0;
  uint64_t v3 = sub_10004F2C8();
  *(void *)(v3 + 16) = sub_10020B89C;
  *(void *)(v3 + 24) = v2;
  v7[4] = sub_10020B8B0;
  v7[5] = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_100206C6C;
  v7[3] = &unk_1002F14E0;
  id v4 = _Block_copy(v7);
  swift_retain();
  swift_release();
  [v0 modifyUsingTransaction:v4];
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_100206BFC(void *a1, uint64_t (*a2)(void *))
{
  v6[3] = type metadata accessor for DatabaseTransaction();
  v6[4] = &off_1002F06C0;
  v6[0] = a1;
  id v4 = a1;
  LOBYTE(a2) = a2(v6);
  sub_10001C2EC((uint64_t)v6);
  return a2 & 1;
}

uint64_t sub_100206C6C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(uint64_t (**)(void))(a1 + 32);
  id v3 = a2;
  char v4 = v2();

  return v4 & 1;
}

uint64_t sub_100206CB0(id a1)
{
  uint64_t v2 = v1;
  uint64_t v162 = sub_10024DDC0();
  sub_10001B550();
  uint64_t v38 = v4;
  __chkstk_darwin(v5, v6);
  v158 = (char *)&v132 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000AC774();
  __chkstk_darwin(v8, v9);
  sub_1000ACA68();
  v161 = v10;
  sub_1000AC774();
  __chkstk_darwin(v11, v12);
  sub_1000ACA68();
  v149 = v13;
  sub_1000AC774();
  __chkstk_darwin(v14, v15);
  sub_1000ACA68();
  uint64_t v153 = v16;
  sub_1000AC774();
  __chkstk_darwin(v17, v18);
  v163 = (char *)&v132 - v19;
  uint64_t v20 = sub_100019524((uint64_t *)&unk_1003194E0);
  __chkstk_darwin(v20 - 8, v21);
  sub_1000589AC();
  v166 = v22;
  uint64_t v147 = sub_10024DCF0();
  sub_10001B550();
  Swift::String v24 = v23;
  __chkstk_darwin(v25, v26);
  sub_1000589AC();
  uint64_t v136 = v27;
  uint64_t v28 = sub_100019524(&qword_100309778);
  __chkstk_darwin(v28 - 8, v29);
  Swift::String v31 = (char *)&v132 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32, v33);
  sub_1000ACA68();
  v156 = v34;
  sub_1000AC774();
  __chkstk_darwin(v35, v36);
  uint64_t v135 = (uint64_t)&v132 - v37;
  v146 = (void (**)(uint64_t, void, uint64_t))(v24 + 104);
  unsigned int v151 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v164 = (void (**)(void))(v38 + 16);
  v165 = (void (**)(void))(v38 + 32);
  uint64_t v137 = v38;
  v154 = (void (**)(char *, uint64_t))(v38 + 8);
  LOBYTE(v38) = 1;
  Swift::String v39 = (SEL *)&unk_100306000;
  *((void *)&v40 + 1) = 6;
  long long v145 = xmmword_10025EED0;
  *(void *)&long long v40 = 136315394;
  long long v144 = v40;
  v143 = (char *)&type metadata for Any + 8;
  id v134 = a1;
  uint64_t v133 = v2;
  v155 = v31;
  v132 = &v169;
  while (1)
  {
    id v41 = objc_msgSend(a1, v39[279], v132);
    if (!v43 & v42) {
      break;
    }
    switch((unint64_t)v41)
    {
      case 0x3A98uLL:
        uint64_t v44 = sub_100043C1C();
        *(void *)(v44 + 16) = v2;
        v171 = (uint64_t (*)())sub_10020BEE0;
        uint64_t v172 = v44;
        uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
        uint64_t v168 = 1107296256;
        v169 = sub_100208324;
        v170 = &unk_1002F18C8;
        _Block_copy(&aBlock);
        sub_10020DF58();
        unsigned __int8 v115 = [a1 migrateToVersion:15001 usingBlock:v24];
        break;
      case 0x3A99uLL:
        uint64_t v121 = sub_100043C1C();
        *(void *)(v121 + 16) = v2;
        v171 = (uint64_t (*)())sub_10020BEBC;
        uint64_t v172 = v121;
        uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
        uint64_t v168 = 1107296256;
        v169 = sub_100208324;
        v170 = &unk_1002F1878;
        _Block_copy(&aBlock);
        sub_10020DF58();
        unsigned __int8 v115 = [a1 migrateToVersion:15002 usingBlock:v24];
        break;
      case 0x3A9AuLL:
        uint64_t v122 = sub_100043C1C();
        *(void *)(v122 + 16) = v2;
        v171 = (uint64_t (*)())sub_10020BE80;
        uint64_t v172 = v122;
        uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
        uint64_t v168 = 1107296256;
        v169 = sub_100208324;
        v170 = &unk_1002F1828;
        _Block_copy(&aBlock);
        sub_10020DF58();
        unsigned __int8 v115 = [a1 migrateToVersion:15003 usingBlock:v24];
        break;
      case 0x3A9BuLL:
        uint64_t v123 = sub_100043C1C();
        *(void *)(v123 + 16) = v2;
        v171 = (uint64_t (*)())sub_10020BE5C;
        uint64_t v172 = v123;
        uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
        uint64_t v168 = 1107296256;
        v169 = sub_100208324;
        v170 = &unk_1002F17D8;
        _Block_copy(&aBlock);
        sub_10020DF58();
        unsigned __int8 v115 = [a1 migrateToVersion:15004 usingBlock:v24];
        break;
      case 0x3A9CuLL:
        uint64_t v124 = sub_100043C1C();
        *(void *)(v124 + 16) = v2;
        v171 = (uint64_t (*)())sub_10020BE20;
        uint64_t v172 = v124;
        uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
        uint64_t v168 = 1107296256;
        v169 = sub_100208324;
        v170 = &unk_1002F1788;
        _Block_copy(&aBlock);
        sub_10020DF58();
        unsigned __int8 v115 = [a1 migrateToVersion:15200 usingBlock:v24];
        break;
      default:
        JUMPOUT(0);
    }
LABEL_57:
    unsigned __int8 v125 = v115;
    _Block_release(v24);
    if (v125)
    {
LABEL_58:
      uint64_t v38 = 1;
      goto LABEL_59;
    }
LABEL_24:
    if (qword_100308DE0 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_10024E1F0();
    uint64_t v152 = sub_10001B0E8(v45, (uint64_t)qword_10034C0E0);
    Swift::String v46 = sub_10024E1D0();
    os_log_type_t v47 = sub_10024EE20();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Failed to perform migration; retrying with new, empty database…",
        v48,
        2u);
      sub_10003FBCC();
    }

    if (qword_100308E10 != -1) {
      swift_once();
    }
    uint64_t v49 = qword_100319408;
    if (!qword_100319408) {
      return 0;
    }
    uint64_t v50 = qword_100319400;
    uint64_t v51 = sub_100205D44();
    if (!v52) {
      return 0;
    }
    uint64_t v150 = v51;
    uint64_t v140 = v52;
    uint64_t v159 = sub_100019524(&qword_1003194F0);
    uint64_t v53 = *(unsigned __int8 *)(v137 + 80);
    uint64_t v54 = (v53 + 32) & ~v53;
    uint64_t v55 = *(void *)(v137 + 72);
    uint64_t v142 = v54 + 3 * v55;
    uint64_t v141 = v53 | 7;
    uint64_t v56 = swift_allocObject();
    uint64_t v160 = v56;
    *(_OWORD *)(v56 + 16) = v145;
    uint64_t v57 = v56 + v54;
    uint64_t v58 = v135;
    sub_1000195B4(v135, 1, 1, v162);
    v148 = *v146;
    uint64_t v59 = v136;
    uint64_t v60 = v151;
    uint64_t v61 = v147;
    v148(v136, v151, v147);
    swift_bridgeObjectRetain();
    uint64_t v139 = v57;
    sub_10020E444();
    uint64_t v157 = v55;
    uint64_t v138 = v57 + v55;
    uint64_t aBlock = v50;
    uint64_t v168 = v49;
    swift_bridgeObjectRetain();
    sub_10020E6EC();
    sub_1000195B4(v58, 1, 1, v162);
    uint64_t v62 = v61;
    v63 = v148;
    v148(v59, v60, v62);
    sub_10020E444();
    v139 += 2 * v55;
    uint64_t aBlock = v50;
    uint64_t v168 = v49;
    swift_bridgeObjectRetain();
    sub_10020E70C();
    uint64_t v64 = v162;
    sub_1000195B4(v58, 1, 1, v162);
    uint64_t v65 = v151;
    uint64_t v66 = v147;
    v63(v59, v151, v147);
    sub_10020E444();
    uint64_t v67 = swift_allocObject();
    *(_OWORD *)(v67 + 16) = v145;
    uint64_t v159 = v67;
    uint64_t v68 = v67 + v54;
    sub_1000195B4(v58, 1, 1, v64);
    v69 = (void (*)(uint64_t))v148;
    v148(v59, v65, v66);
    uint64_t v70 = v140;
    swift_bridgeObjectRetain();
    uint64_t v142 = v68;
    uint64_t v71 = v150;
    sub_10020E444();
    uint64_t v141 = v68 + v157;
    uint64_t aBlock = v71;
    uint64_t v168 = v70;
    swift_bridgeObjectRetain();
    sub_10020E6EC();
    uint64_t v72 = sub_10020E180();
    v69(v72);
    uint64_t v73 = v160;
    sub_10020E444();
    uint64_t aBlock = v150;
    uint64_t v168 = v70;
    swift_bridgeObjectRetain();
    sub_10020E70C();
    swift_bridgeObjectRelease();
    v74 = (void (*)(void))v168;
    uint64_t v75 = sub_10020E180();
    v69(v75);
    sub_10020E444();
    unint64_t v76 = 0;
    v77 = v149;
    v78 = v165;
    Swift::String v24 = v166;
    v79 = v156;
    do
    {
      if (v76 >= *(void *)(v73 + 16))
      {
        __break(1u);
LABEL_72:
        __break(1u);
        goto LABEL_73;
      }
      uint64_t v80 = v73 + v54;
      v81 = *v164;
      uint64_t v82 = v162;
      ((void (*)(NSObject *, uint64_t, uint64_t))*v164)(v79, v80, v162);
      sub_1000195B4((uint64_t)v79, 0, 1, v82);
      int v83 = sub_10001FA0C((uint64_t)v79, 1, v82);
      uint64_t v84 = (uint64_t)v155;
      if (v83 == 1) {
        goto LABEL_45;
      }
      v74 = *v78;
      sub_10020E2C0();
      v74();
      if (v76 >= *(void *)(v159 + 16)) {
        goto LABEL_72;
      }
      sub_10020E628();
      v81();
      sub_1000195B4(v84, 0, 1, v82);
      if (sub_10001FA0C(v84, 1, v82) == 1)
      {
        (*v154)(v163, v82);
        uint64_t v107 = v84;
        goto LABEL_47;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t))v74)(v153, v84, v82);
      Swift::String v24 = (char *)sub_100019524(&qword_1003194F8);
      ((void (*)(char *, char *, uint64_t))v74)(v166, v163, v82);
      uint64_t v85 = (uint64_t)v166;
      sub_10020E2C0();
      v74();
      sub_1000195B4(v85, 0, 1, (uint64_t)v24);
      if (sub_10001FA0C(v85, 1, (uint64_t)v24) == 1) {
        goto LABEL_48;
      }
      sub_10020E2C0();
      v74();
      v86 = v161;
      sub_10020E2C0();
      v74();
      id v87 = [self defaultManager];
      sub_10024DD50(v88);
      v90 = v89;
      sub_10024DD50(v91);
      v93 = v92;
      uint64_t aBlock = 0;
      v94 = v77;
      unsigned int v95 = [v87 copyItemAtURL:v90 toURL:v92 error:&aBlock];

      if (v95)
      {
        v74 = (void (*)(void))v154;
        v96 = *v154;
        id v97 = (id)aBlock;
        v96(v86, v82);
        v96(v94, v82);
        v77 = v94;
      }
      else
      {
        id v98 = (id)aBlock;
        sub_10024DCE0();

        swift_willThrow();
        sub_10020E628();
        v81();
        swift_errorRetain();
        swift_errorRetain();
        v74 = (void (*)(void))sub_10024E1D0();
        os_log_type_t v99 = sub_10024EE10();
        if (os_log_type_enabled((os_log_t)v74, v99))
        {
          uint64_t v100 = swift_slowAlloc();
          v101 = (void *)swift_slowAlloc();
          uint64_t v150 = swift_slowAlloc();
          uint64_t aBlock = v150;
          *(_DWORD *)uint64_t v100 = v144;
          sub_10020DC9C((unint64_t *)&qword_100319500, (void (*)(uint64_t))&type metadata accessor for URL);
          uint64_t v102 = sub_10024F9E0();
          *(void *)(v100 + 4) = sub_1000F3F3C(v102, v103, &aBlock);
          swift_bridgeObjectRelease();
          v104 = (void (*)(void))*v154;
          sub_10020E5CC();
          v104();
          *(_WORD *)(v100 + 12) = 2112;
          swift_errorRetain();
          uint64_t v105 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v100 + 14) = v105;
          void *v101 = v105;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v74, v99, "Error backing up corrupted database file (%s): %@", (uint8_t *)v100, 0x16u);
          sub_100019524(&qword_1003170F0);
          swift_arrayDestroy();
          v77 = v149;
          sub_10003FBCC();
          swift_arrayDestroy();
          sub_10003FBCC();
          sub_10003FBCC();

          swift_errorRelease();
          sub_10020E5CC();
          v104();
          sub_10020E5CC();
          v104();
        }
        else
        {
          v77 = v94;

          swift_errorRelease();
          swift_errorRelease();
          v106 = *v154;
          (*v154)(v158, v82);
          swift_errorRelease();
          v106(v161, v82);
          v106(v94, v82);
        }
      }
      v78 = v165;
      Swift::String v24 = v166;
      v79 = v156;
      uint64_t v73 = v160;
      ++v76;
      v54 += v157;
    }
    while (v76 != 3);
    sub_1000195B4((uint64_t)v156, 1, 1, v162);
LABEL_45:
    uint64_t v107 = (uint64_t)v79;
LABEL_47:
    sub_100051BB4(v107, &qword_100309778);
    uint64_t v108 = sub_100019524(&qword_1003194F8);
    sub_1000195B4((uint64_t)v24, 1, 1, v108);
LABEL_48:
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_10020BBBC();
    uint64_t v109 = sub_100043C1C();
    uint64_t v2 = v133;
    *(void *)(v109 + 16) = v133;
    v171 = (uint64_t (*)())sub_10020BD24;
    uint64_t v172 = v109;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v168 = 1107296256;
    v169 = sub_100208324;
    v170 = &unk_1002F15A8;
    _Block_copy(&aBlock);
    sub_10020DF58();
    a1 = v134;
    unsigned __int8 v110 = [v134 migrateToVersion:0 usingBlock:v24];
    _Block_release(v24);
    v79 = sub_10024E1D0();
    if ((v110 & 1) == 0)
    {
      os_log_type_t v126 = sub_10024EE20();
      if (!sub_1001A3B84(v126)) {
        goto LABEL_64;
      }
      v127 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v127 = 0;
      _os_log_impl((void *)&_mh_execute_header, v79, (os_log_type_t)v24, "Couldn’t reset to schema version 0; something is very wrong!",
        v127,
        2u);
      goto LABEL_63;
    }
    os_log_type_t v111 = sub_10024EE00();
    if (sub_1001A3B84(v111))
    {
      v112 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v112 = 0;
      _os_log_impl((void *)&_mh_execute_header, v79, (os_log_type_t)v24, "Successfully reset database to schema version 0; retrying migration to current version…",
        v112,
        2u);
      sub_10003FBCC();
    }

    uint64_t v38 = 0;
    Swift::String v39 = (SEL *)&unk_100306000;
LABEL_59:
    if ((uint64_t)[a1 v39[279]] >= 18000) {
      return v38;
    }
  }
  if (v41 == (id)18000)
  {
    if (v38) {
      goto LABEL_58;
    }
    goto LABEL_24;
  }
  if (v41 == (id)14000)
  {
    uint64_t v113 = sub_100043C1C();
    *(void *)(v113 + 16) = v2;
    v171 = (uint64_t (*)())sub_10020BF28;
    uint64_t v172 = v113;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v168 = 1107296256;
    v169 = sub_100208324;
    v170 = &unk_1002F1968;
    _Block_copy(&aBlock);
    sub_10020DF58();
LABEL_52:
    unsigned __int8 v115 = [a1 migrateToVersion:14001 usingBlock:v24];
    goto LABEL_57;
  }
  if (v41 == (id)14001)
  {
    uint64_t v114 = sub_100043C1C();
    *(void *)(v114 + 16) = v2;
    v171 = sub_10020BF04;
    uint64_t v172 = v114;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v168 = 1107296256;
    v169 = sub_100208324;
    v170 = &unk_1002F1918;
    _Block_copy(&aBlock);
    sub_10020DF58();
    unsigned __int8 v115 = [a1 migrateToVersion:15000 usingBlock:v24];
    goto LABEL_57;
  }
  if (v41 == (id)15200)
  {
    uint64_t v116 = sub_100043C1C();
    *(void *)(v116 + 16) = v2;
    v171 = sub_10020BDFC;
    uint64_t v172 = v116;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v168 = 1107296256;
    v169 = sub_100208324;
    v170 = &unk_1002F1738;
    _Block_copy(&aBlock);
    sub_10020DF58();
    unsigned __int8 v115 = [a1 migrateToVersion:15400 usingBlock:v24];
    goto LABEL_57;
  }
  if (v41 == (id)15400)
  {
    uint64_t v117 = sub_100043C1C();
    *(void *)(v117 + 16) = v2;
    v171 = (uint64_t (*)())sub_10020BDCC;
    uint64_t v172 = v117;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v168 = 1107296256;
    v169 = sub_100208324;
    v170 = &unk_1002F16E8;
    _Block_copy(&aBlock);
    sub_10020DF58();
    unsigned __int8 v115 = [a1 migrateToVersion:16000 usingBlock:v24];
    goto LABEL_57;
  }
  if (v41 == (id)16000)
  {
    uint64_t v118 = sub_100043C1C();
    *(void *)(v118 + 16) = v2;
    v171 = (uint64_t (*)())sub_10020BD90;
    uint64_t v172 = v118;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v168 = 1107296256;
    v169 = sub_100208324;
    v170 = &unk_1002F1698;
    _Block_copy(&aBlock);
    sub_10020DF58();
    unsigned __int8 v115 = [a1 migrateToVersion:16400 usingBlock:v24];
    goto LABEL_57;
  }
  if (v41 == (id)16400)
  {
    uint64_t v119 = sub_100043C1C();
    *(void *)(v119 + 16) = v2;
    v171 = (uint64_t (*)())sub_10020BD6C;
    uint64_t v172 = v119;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v168 = 1107296256;
    v169 = sub_100208324;
    v170 = &unk_1002F1648;
    _Block_copy(&aBlock);
    sub_10020DF58();
    unsigned __int8 v115 = [a1 migrateToVersion:17200 usingBlock:v24];
    goto LABEL_57;
  }
  if (v41 == (id)17200)
  {
    uint64_t v120 = sub_100043C1C();
    *(void *)(v120 + 16) = v2;
    v171 = sub_10020BD48;
    uint64_t v172 = v120;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v168 = 1107296256;
    v169 = sub_100208324;
    v170 = &unk_1002F15F8;
    _Block_copy(&aBlock);
    sub_10020DF58();
    unsigned __int8 v115 = [a1 migrateToVersion:18000 usingBlock:v24];
    goto LABEL_57;
  }
  if (!v41)
  {
    v171 = (uint64_t (*)())sub_100208290;
    uint64_t v172 = 0;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v168 = 1107296256;
    v169 = sub_100208324;
    v170 = &unk_1002F1990;
    Swift::String v24 = (char *)_Block_copy(&aBlock);
    goto LABEL_52;
  }
  if (qword_100308DE0 != -1) {
    swift_once();
  }
  uint64_t v129 = sub_10024E1F0();
  sub_10001B0E8(v129, (uint64_t)qword_10034C0E0);
  v74 = (void (*)(void))a1;
  v79 = sub_10024E1D0();
  os_log_type_t v130 = sub_10024EE10();
  if (sub_1001A3B84(v130))
  {
    uint64_t v131 = swift_slowAlloc();
    *(_DWORD *)uint64_t v131 = 134218240;
    uint64_t aBlock = (uint64_t)[v74 v39[279]];
    sub_10024F100();

    *(_WORD *)(v131 + 12) = 2048;
    uint64_t aBlock = 18000;
    sub_10024F100();
    _os_log_impl((void *)&_mh_execute_header, v79, (os_log_type_t)v24, "Error: No database migration for %lld to %lld", (uint8_t *)v131, 0x16u);
LABEL_63:
    sub_10003FBCC();
    goto LABEL_64;
  }
LABEL_73:

  v79 = v74;
LABEL_64:

  return 0;
}

void sub_100208290(void *a1)
{
  if (qword_100308E28 != -1) {
    swift_once();
  }
  id v2 = sub_10024E6A0();
  [a1 executeStatement:v2];
}

void sub_100208324(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10020838C(void *a1)
{
  id v98 = [a1 connection];
  uint64_t v120 = _swiftEmptyArrayStorage;
  char v119 = 0;
  sub_10024F330(16);
  swift_bridgeObjectRelease();
  sub_10020E264();
  id v4 = (void *)type metadata accessor for TransactionEntity();
  id v5 = [v4 databaseTable];
  sub_10024E6B0();
  sub_10020E11C();
  v121._countAndFlagsBits = v1;
  v121._uint64_t object = v2;
  sub_10024E800(v121);
  swift_bridgeObjectRelease();
  NSString v6 = sub_10024E6A0();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_10004F2C8();
  *(void *)(v7 + 16) = &v119;
  *(void *)(v7 + 24) = &v120;
  uint64_t v8 = sub_10004F2C8();
  *(void *)(v8 + 16) = sub_10020BF4C;
  *(void *)(v8 + 24) = v7;
  uint64_t v117 = sub_10020BF60;
  uint64_t v118 = v8;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v116 = sub_100205B60;
  *((void *)&v116 + 1) = &unk_1002F1A08;
  uint64_t v9 = (SEL *)_Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [a1 executeOptionalQuery:v6 withResults:v9];

  _Block_release(v9);
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v6)
  {
    __break(1u);
LABEL_55:
    swift_once();
    goto LABEL_4;
  }
  if (v119)
  {
LABEL_52:

    goto LABEL_53;
  }
  sub_10020E3D4();
  *(void *)&long long aBlock = v10;
  *((void *)&aBlock + 1) = v11;
  id v12 = [v4 databaseTable];
  sub_10024E6B0();
  sub_10020E11C();
  v122._countAndFlagsBits = v8;
  v122._uint64_t object = v9;
  sub_10024E800(v122);
  swift_bridgeObjectRelease();
  NSString v13 = sub_10024E6A0();
  swift_bridgeObjectRelease();
  uint64_t v9 = (SEL *)&selRef_endTransporationAndRemoveDatabase;
  [a1 executeStatement:v13];

  if (qword_100308E28 != -1) {
    goto LABEL_55;
  }
LABEL_4:
  NSString v14 = sub_10024E6A0();
  objc_msgSend(a1, v9[161], v14);

  uint64_t v15 = v120;
  uint64_t v16 = v98;
  uint64_t v111 = v120[2];
  if (!v111) {
    goto LABEL_52;
  }
  uint64_t v95 = v7;
  swift_bridgeObjectRetain();
  uint64_t v17 = 0;
  uint64_t v106 = 0;
  v104 = (char *)&type metadata for Any + 8;
  unsigned __int8 v110 = "subscription_period";
  uint64_t v102 = "up_id";
  uint64_t v96 = 0x8000000100278E40;
  uint64_t v108 = 0x800000010027FA60;
  uint64_t v109 = 0x800000010027FA80;
  unint64_t v103 = "ion_date";
  uint64_t v107 = 0x8000000100278D90;
  long long v101 = xmmword_100255FB0;
  uint64_t v100 = "NonRenewingSubscription";
  uint64_t v99 = 0x8000000100278130;
  uint64_t v105 = (uint64_t)v15;
  do
  {
    uint64_t v114 = v15[v17 + 4];
    *((void *)&v116 + 1) = &type metadata for Bool;
    LOBYTE(aBlock) = 0;
    swift_bridgeObjectRetain();
    sub_10020E0B8();
    sub_100161884(1701869940, 0xE400000000000000, v114);
    if (*((void *)&v116 + 1))
    {
      if (sub_10020E4E8())
      {
        if (v113 == __PAIR128__(v99, 0xD000000000000015))
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v78 = sub_10024FA60();
          swift_bridgeObjectRelease();
          if ((v78 & 1) == 0)
          {
            uint64_t v79 = sub_10020E3F4();
            sub_100161884(v79, v80, v114);
            uint64_t v81 = *((void *)&v116 + 1);
            sub_10020DFB0();
            if (v81)
            {
              *((void *)&v116 + 1) = &type metadata for Bool;
              LOBYTE(aBlock) = 1;
              sub_10020E0B8();
            }
          }
        }
      }
    }
    else
    {
      sub_10020DFB0();
    }
    sub_10020E490(0x6D6F7270u);
    if (*((void *)&v116 + 1))
    {
      sub_10020E2B0(v18, v19, v20, v21, v22, v23, v24, v25, v95, v96, object, (uint64_t)v98, v99, (uint64_t)v100, v101, *((uint64_t *)&v101 + 1), (uint64_t)v102, (uint64_t)v103, (uint64_t)v104,
        v105,
        v106,
        v107,
        v108,
        v109,
        (uint64_t)v110,
        v111,
        v112,
        v113._countAndFlagsBits);
      if (swift_dynamicCast())
      {
        uint64_t v26 = v4;
        sub_10024D980();
        swift_allocObject();
        sub_10024D970();
        _s10AdHocOfferCMa();
        sub_10020DC9C(&qword_100309D60, (void (*)(uint64_t))_s10AdHocOfferCMa);
        sub_10024D960();
        if (v106)
        {
          sub_10020E63C();
          swift_errorRelease();
          swift_release();
          uint64_t v106 = 0;
        }
        else
        {
          swift_release();
          uint64_t v82 = aBlock;
          sub_10020DEE0();
          uint64_t v106 = 0;
          if (*((void *)&v116 + 1))
          {
            sub_10020E2B0(v83, v84, v85, v86, v87, v88, v89, v90, v95, v96, object, (uint64_t)v98, v99, (uint64_t)v100, v101, *((uint64_t *)&v101 + 1), (uint64_t)v102, (uint64_t)v103, (uint64_t)v104,
              v105,
              0,
              v107,
              v108,
              v109,
              (uint64_t)v110,
              v111,
              v112,
              v113._countAndFlagsBits);
            if (swift_dynamicCast())
            {
              uint64_t object = (uint64_t)v113._object;
              uint64_t v92 = *(void *)(v82 + 96);
              uint64_t v91 = *(void *)(v82 + 104);
              *((void *)&v116 + 1) = &type metadata for Transaction.RenewalType;
              uint64_t v93 = swift_allocObject();
              *(void *)&long long aBlock = v93;
              *(Swift::String *)(v93 + 16) = v113;
              uint64_t v16 = v98;
              *(void *)(v93 + 32) = v92;
              *(void *)(v93 + 40) = v91;
              *(unsigned char *)(v93 + 48) = 1;
              swift_bridgeObjectRetain();
              sub_10020E340();
              sub_10020E63C();
              swift_release();
              id v4 = v26;
              uint64_t v15 = (void *)v105;
              goto LABEL_22;
            }
            sub_10020E63C();
            swift_release();
          }
          else
          {
            sub_10020E63C();
            swift_release();
            sub_10020DFB0();
          }
        }
        id v4 = v26;
        uint64_t v15 = (void *)v105;
      }
    }
    else
    {
      sub_10020DFB0();
    }
    sub_10020E490(0x72746E69u);
    uint64_t v27 = *((void *)&v116 + 1);
    sub_10020DFB0();
    if (v27)
    {
      sub_10020DEE0();
      if (*((void *)&v116 + 1))
      {
        if (swift_dynamicCast())
        {
          *(void *)&long long aBlock = 0x3A6F72746E69;
          *((void *)&aBlock + 1) = 0xE600000000000000;
          sub_10024E800(v113);
          swift_bridgeObjectRelease();
          *((void *)&v116 + 1) = &type metadata for String;
          sub_10020E340();
        }
      }
      else
      {
        sub_10020DFB0();
      }
    }
LABEL_22:
    long long aBlock = 0u;
    long long v116 = 0u;
    uint64_t v28 = sub_10020E158();
    sub_10020E5A8(v28, 0x6D6F7270u);
    long long aBlock = 0u;
    long long v116 = 0u;
    uint64_t v29 = sub_10020E158();
    sub_10020E5A8(v29, 0x72746E69u);
    sub_100161884(0xD000000000000017, v109, v114);
    if (*((void *)&v116 + 1))
    {
      if (sub_10020E4E8())
      {
        sub_100019524(&qword_10030A360);
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = v101;
        *(Swift::String *)(v30 + 32) = v113;
        uint64_t v15 = (void *)v105;
        *(void *)(v30 + 48) = 0;
        *(void *)(v30 + 56) = 0;
        *(unsigned char *)(v30 + 64) = 4;
        *((void *)&v116 + 1) = sub_100019524((uint64_t *)&unk_100319520);
        *(void *)&long long aBlock = v30;
        uint64_t v31 = sub_10020E6A0();
LABEL_25:
        sub_10020554C(v31, v32, v33);
        goto LABEL_34;
      }
    }
    else
    {
      sub_10020DFB0();
    }
    sub_100161884(0x6E65725F6F747561, 0xEB00000000737765, v114);
    if (!*((void *)&v116 + 1))
    {
LABEL_33:
      sub_10020DFB0();
      goto LABEL_34;
    }
    sub_10020E2B0(v34, v35, v36, v37, v38, v39, v40, v41, v95, v96, object, (uint64_t)v98, v99, (uint64_t)v100, v101, *((uint64_t *)&v101 + 1), (uint64_t)v102, (uint64_t)v103, (uint64_t)v104,
      v105,
      v106,
      v107,
      v108,
      v109,
      (uint64_t)v110,
      v111,
      v112,
      v113._countAndFlagsBits);
    if ((swift_dynamicCast() & 1) != 0 && v113._countAndFlagsBits >= 1)
    {
      sub_10020DEE0();
      if (!*((void *)&v116 + 1)) {
        goto LABEL_33;
      }
      sub_10020E2B0(v42, v43, v44, v45, v46, v47, v48, v49, v95, v96, object, (uint64_t)v98, v99, (uint64_t)v100, v101, *((uint64_t *)&v101 + 1), (uint64_t)v102, (uint64_t)v103, (uint64_t)v104,
        v105,
        v106,
        v107,
        v108,
        v109,
        (uint64_t)v110,
        v111,
        v112,
        v113._countAndFlagsBits);
      if (swift_dynamicCast())
      {
        *((void *)&v116 + 1) = &type metadata for Transaction.RenewalType;
        uint64_t v50 = swift_allocObject();
        *(void *)&long long aBlock = v50;
        *(Swift::String *)(v50 + 16) = v113;
        *(void *)(v50 + 32) = 0;
        *(void *)(v50 + 40) = 0;
        *(unsigned char *)(v50 + 48) = 4;
        uint64_t v31 = sub_10020E6A0();
        uint64_t v33 = v96;
        goto LABEL_25;
      }
    }
LABEL_34:
    long long aBlock = 0u;
    long long v116 = 0u;
    uint64_t v51 = sub_10020E158();
    sub_10020554C(v51, v52, v53);
    long long aBlock = 0u;
    long long v116 = 0u;
    uint64_t v54 = sub_10020E158();
    sub_10020554C(v54, 0x6E65725F6F747561, 0xEB00000000737765);
    long long aBlock = 0u;
    long long v116 = 0u;
    uint64_t v55 = sub_10020E158();
    sub_10020554C(v55, v56, v108);
    uint64_t v57 = v114;
    uint64_t v58 = sub_10020E50C();
    sub_100161884(v58, v59, v114);
    uint64_t v60 = *((void *)&v116 + 1);
    sub_10020DFB0();
    if (!v60)
    {
      *((void *)&v116 + 1) = &type metadata for Int;
      *(void *)&long long aBlock = 0;
      uint64_t v61 = sub_10020E158();
      sub_10020554C(v61, 0x64656873696E6966, 0xE800000000000000);
      uint64_t v57 = v114;
    }
    sub_100161884(0xD000000000000012, v107, v57);
    uint64_t v62 = *((void *)&v116 + 1);
    sub_10020DFB0();
    if (!v62)
    {
      *((void *)&v116 + 1) = &type metadata for Int;
      *(void *)&long long aBlock = 0;
      uint64_t v63 = sub_10020E158();
      sub_10020554C(v63, 0xD000000000000012, v64);
      uint64_t v57 = v114;
    }
    uint64_t v65 = sub_10020E4B8();
    sub_100161884(v65, v66, v57);
    uint64_t v67 = *((void *)&v116 + 1);
    sub_10020DFB0();
    if (!v67)
    {
      *((void *)&v116 + 1) = &type metadata for Int;
      *(void *)&long long aBlock = 0;
      uint64_t v68 = sub_10020E158();
      sub_10020554C(v68, 0x797469746E617571, 0xE800000000000000);
    }
    uint64_t v69 = sub_10020E72C();
    sub_100161884(v69, v70, v114);
    uint64_t v71 = *((void *)&v116 + 1);
    sub_10020DFB0();
    if (!v71)
    {
      *((void *)&v116 + 1) = &type metadata for Int;
      *(void *)&long long aBlock = 0;
      uint64_t v72 = sub_10020E158();
      sub_10020554C(v72, 0x6574617473, 0xE500000000000000);
    }
    ++v17;
    uint64_t v73 = swift_bridgeObjectRetain();
    sub_1002056F4(v73);
    uint64_t v75 = v74;
    swift_bridgeObjectRelease();
    id v76 = v16;
    id v77 = sub_100153604(v75, v76);
    swift_bridgeObjectRelease();
  }
  while (v111 != v17);

  swift_bridgeObjectRelease();
LABEL_53:
  swift_release();
  return swift_bridgeObjectRelease();
}

#error "100208F28: call analysis failed (funcsize=69)"

void sub_100208F54()
{
  sub_10020E53C();
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)sub_10020DE4C();
  id v2 = [v1 databaseTable];
  sub_10024E6B0();
  sub_10020E414();
  sub_10020DEC4();
  swift_bridgeObjectRelease();
  sub_10020DD90();
  v17._uint64_t object = (void *)0x8000000100278E60;
  v17._countAndFlagsBits = 0xD000000000000014;
  sub_10024E800(v17);
  sub_10020DE80();
  sub_10020DF40();
  uint64_t v3 = sub_10020E42C();
  sub_10020E45C(v3, "executeStatement:");

  sub_10024F330(52);
  sub_10020DE14();
  id v4 = [v1 databaseTable];
  sub_10024E6B0();
  sub_10020E11C();
  sub_10020DEA8();
  swift_bridgeObjectRelease();
  sub_10020DD90();
  sub_10020E1EC();
  v5._countAndFlagsBits = 0xD000000000000018;
  sub_100152894(v5, (uint64_t)" REAL DEFAULT 0 NOT NULL");
  sub_10020DF40();
  int v6 = sub_10020E288();
  sub_10020E24C(v6, "executeStatement:", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
}

void sub_100209094()
{
  sub_10020E018();
  sub_10024F330(55);
  sub_10020DE14();
  id v0 = [(id)type metadata accessor for TransactionEntity() databaseTable];
  sub_10024E6B0();
  sub_10020E11C();
  sub_10020DEA8();
  swift_bridgeObjectRelease();
  sub_10020DD90();
  sub_10020E1BC();
  sub_10020E2D0();
  v12._countAndFlagsBits = 0xD00000000000001BLL;
  sub_10024E800(v12);
  sub_10020DF40();
  int v1 = sub_10020E288();
  sub_10020E24C(v1, "executeStatement:", v2, v3, v4, v5, v6, v7, v8, (uint64_t)v9);
}

void sub_100209150(uint64_t a1)
{
}

void sub_100209168()
{
  sub_10020E018();
  sub_10024F330(58);
  sub_10020DE14();
  id v0 = [(id)type metadata accessor for TransactionEntity() databaseTable];
  sub_10024E6B0();
  sub_10020E11C();
  sub_10020DEA8();
  swift_bridgeObjectRelease();
  sub_10020DD90();
  v13._uint64_t object = (void *)0x8000000100278EB0;
  v13._countAndFlagsBits = 0xD000000000000015;
  sub_10024E800(v13);
  v1._countAndFlagsBits = 0xD00000000000001ELL;
  sub_100152894(v1, (uint64_t)" STRING DEFAULT '1.0' NOT NULL");
  sub_10020DF40();
  int v2 = sub_10020E288();
  sub_10020E24C(v2, "executeStatement:", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v10);
}

void sub_100209240(uint64_t a1)
{
}

#error "10020953C: call analysis failed (funcsize=171)"

uint64_t sub_100209568(void *a1)
{
  uint64_t v2 = v1;
  sub_10024F330(33);
  swift_bridgeObjectRelease();
  strcpy((char *)v18, "ALTER TABLE ");
  BYTE5(v18[1]) = 0;
  HIWORD(v18[1]) = -5120;
  int v4 = (void *)type metadata accessor for TransactionEntity();
  id v5 = objc_msgSend(v4, "databaseTable", v18[0], v18[1]);
  uint64_t v6 = sub_10024E6B0();
  int v8 = v7;

  v19._countAndFlagsBits = v6;
  v19._uint64_t object = v8;
  sub_10024E800(v19);
  swift_bridgeObjectRelease();
  v20._countAndFlagsBits = 0x4C4F432044444120;
  v20._uint64_t object = (void *)0xEC000000204E4D55;
  sub_10024E800(v20);
  v21._uint64_t object = (void *)0x8000000100278F90;
  v21._countAndFlagsBits = 0xD00000000000001ELL;
  sub_10024E800(v21);
  sub_10020E028();
  NSString v9 = sub_10024E6A0();
  swift_bridgeObjectRelease();
  [a1 executeStatement:v9];

  sub_10024F330(16);
  swift_bridgeObjectRelease();
  sub_10020E264();
  id v12 = objc_msgSend(v4, "databaseTable", v10, v11);
  sub_10024E6B0();
  sub_10020E414();
  v22._countAndFlagsBits = (uint64_t)v4;
  v22._uint64_t object = v9;
  sub_10024E800(v22);
  swift_bridgeObjectRelease();
  sub_10024E6A0();
  sub_10020E42C();
  uint64_t v13 = sub_10004F2C8();
  *(void *)(v13 + 16) = v2;
  *(void *)(v13 + 24) = a1;
  uint64_t v14 = sub_10004F2C8();
  *(void *)(v14 + 16) = sub_10020D90C;
  *(void *)(v14 + 24) = v13;
  v18[4] = sub_10020DD88;
  v18[5] = v14;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_100205B60;
  v18[3] = &unk_1002F1B20;
  id v15 = _Block_copy(v18);
  id v16 = a1;
  swift_retain();
  swift_release();
  [v16 executeOptionalQuery:v4 withResults:v15];

  _Block_release(v15);
  LOBYTE(v16) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v16) {
    __break(1u);
  }
  return result;
}

void sub_100209830(uint64_t a1)
{
}

void sub_100209848(uint64_t a1, uint64_t a2, void *a3)
{
  sub_10020E018();
  sub_10024F330(36);
  swift_bridgeObjectRelease();
  id v5 = [(id)sub_10020DE4C() databaseTable];
  sub_10024E6B0();

  sub_10020E38C();
  swift_bridgeObjectRelease();
  sub_10020DD90();
  v17._countAndFlagsBits = a2;
  v17._uint64_t object = a3;
  sub_10024E800(v17);
  sub_10020DFF0();
  sub_10020DF40();
  int v6 = sub_10020E288();
  sub_10020E24C(v6, "executeStatement:", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
}

void sub_100209914()
{
  sub_10020E018();
  sub_10024F330(35);
  swift_bridgeObjectRelease();
  id v0 = [(id)sub_10020DE4C() databaseTable];
  sub_10024E6B0();
  sub_10020E11C();
  sub_10020DEA8();
  swift_bridgeObjectRelease();
  sub_10020DD90();
  sub_10020E2D0();
  v12._countAndFlagsBits = 0xD000000000000012;
  sub_10024E800(v12);
  sub_10020DE80();
  sub_10020DF40();
  int v1 = sub_10020E288();
  sub_10020E24C(v1, "executeStatement:", v2, v3, v4, v5, v6, v7, v8, (uint64_t)v9);
}

void sub_1002099D0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1000B784C();
  id v38 = v24;
  sub_10020E018();
  sub_10024F330(655);
  v25._countAndFlagsBits = 0xD00000000000001FLL;
  sub_100152894(v25, (uint64_t)"CREATE TABLE IF NOT EXISTS new_");
  id v39 = (id)type metadata accessor for TransactionEntity();
  id v26 = [v39 databaseTable];
  sub_10024E6B0();

  sub_10020DEC4();
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = 0xD00000000000001CLL;
  sub_100152894(v27, (uint64_t)" (\npid INTEGER PRIMARY KEY,\n");
  v41._countAndFlagsBits = 0x6E6F69746361;
  v41._uint64_t object = (void *)0xE600000000000000;
  sub_10024E800(v41);
  sub_10020E070();
  v42._uint64_t object = (void *)0xEA00000000007375;
  v42._countAndFlagsBits = 0x746174735F627461;
  sub_10024E800(v42);
  sub_10020DDC0();
  v43._uint64_t object = (void *)0xE900000000000064;
  v43._countAndFlagsBits = 0x695F656C646E7562;
  sub_10024E800(v43);
  sub_10020E070();
  v44._countAndFlagsBits = sub_10020E3F4();
  sub_10024E800(v44);
  sub_10020DDEC();
  v45._countAndFlagsBits = 0x6974617269707865;
  v45._uint64_t object = (void *)0xEF657461645F6E6FLL;
  sub_10024E800(v45);
  sub_10020DDEC();
  v46._countAndFlagsBits = sub_10020E50C();
  sub_10024E800(v46);
  sub_10020E164();
  sub_10020E320((uint64_t)"has_purchase_issue");
  sub_10020E164();
  v47._countAndFlagsBits = 25705;
  v47._uint64_t object = (void *)0xE200000000000000;
  sub_10024E800(v47);
  sub_10020E048((uint64_t)" INTEGER UNIQUE NOT NULL,\n");
  v48._uint64_t object = (void *)0xEB0000000064695FLL;
  v48._countAndFlagsBits = 0x6C616E696769726FLL;
  sub_10024E800(v48);
  sub_10020DDC0();
  sub_10020E2E0((uint64_t)"original_purchase_date");
  sub_10020DDEC();
  v49._countAndFlagsBits = 0x5F746375646F7270;
  v49._uint64_t object = (void *)0xEA00000000006469;
  sub_10024E800(v49);
  sub_10020E070();
  sub_10020E680((uint64_t)"promo_offer_error");
  sub_10020DFC8();
  v50._countAndFlagsBits = 0x6573616863727570;
  v50._uint64_t object = (void *)0xED0000657461645FLL;
  sub_10024E800(v50);
  sub_10020E134((uint64_t)" REAL NOT NULL,\n");
  v51._countAndFlagsBits = sub_10020E4B8();
  sub_10024E800(v51);
  sub_10020E2D0();
  v52._countAndFlagsBits = 0xD00000000000001DLL;
  sub_10024E800(v52);
  v53._countAndFlagsBits = sub_10020E72C();
  sub_10024E800(v53);
  sub_10020E164();
  sub_10020E300((uint64_t)"subscription_group_id");
  sub_10020DFC8();
  v54._countAndFlagsBits = 1701869940;
  v54._uint64_t object = (void *)0xE400000000000000;
  sub_10024E800(v54);
  sub_10020E070();
  v55._uint64_t object = (void *)0xEA0000000000646ELL;
  v55._countAndFlagsBits = 0x756665725F646964;
  sub_10024E800(v55);
  sub_10020E164();
  v56._countAndFlagsBits = 0x64695F726566666FLL;
  v56._uint64_t object = (void *)0xE800000000000000;
  sub_10024E800(v56);
  sub_10020DFC8();
  sub_10020E134((uint64_t)"next_renewal_ids");
  v57._countAndFlagsBits = 0xA2C4E4F534A20;
  v57._uint64_t object = (void *)0xE700000000000000;
  sub_10024E800(v57);
  sub_10020E3A8();
  sub_10020DF70();
  sub_10020E584();
  sub_10020DDEC();
  sub_10020E660((uint64_t)"application_username");
  sub_10020DF70();
  sub_10020E1EC();
  sub_10020E048((uint64_t)" REAL DEFAULT 0 NOT NULL,\n");
  sub_10020E1BC();
  sub_10020E164();
  sub_10020E2E0((uint64_t)"web_order_line_item_id");
  sub_10020DDC0();
  sub_10020E300((uint64_t)"initiated_api_version");
  v28._countAndFlagsBits = 0xD000000000000020;
  sub_100152894(v28, (uint64_t)" STRING DEFAULT '1.0' NOT NULL,\n");
  sub_10020E680((uint64_t)"revocation_reason");
  sub_10020DDC0();
  sub_10020E048((uint64_t)"offer_for_codes_reference_name");
  sub_10020DF70();
  sub_10020E2E0((uint64_t)"billing_retry_end_date");
  sub_10020DDEC();
  v29._countAndFlagsBits = 0xD000000000000024;
  sub_100152894(v29, (uint64_t)"billing_grace_period_expiration_date");
  sub_10020DDEC();
  sub_10020E21C();
  sub_10020DDC0();
  sub_10020E300((uint64_t)"price_increase_status");
  sub_10020DDC0();
  sub_10020E048((uint64_t)"recent_subscription_start_date");
  sub_10020DDEC();
  sub_10020E660((uint64_t)"recent_renewal_count");
  sub_10020DDC0();
  sub_10020E320((uint64_t)"offer_payment_mode");
  v58._countAndFlagsBits = 0xA474E4952545320;
  v58._uint64_t object = (void *)0xEA00000000003B29;
  sub_10024E800(v58);
  NSString v30 = sub_10024E6A0();
  swift_bridgeObjectRelease();
  [v38 executeStatement:v30];

  sub_10020E018();
  sub_10024F330(84);
  sub_10020E134((uint64_t)"INSERT INTO new_");
  id v31 = [v39 databaseTable];
  sub_10024E6B0();

  sub_10020E38C();
  swift_bridgeObjectRelease();
  v59._countAndFlagsBits = 0x205443454C455320;
  v59._uint64_t object = (void *)0xEF204D4F5246202ALL;
  sub_10024E800(v59);
  id v32 = sub_10020E524();
  sub_10024E6B0();

  sub_10020E38C();
  swift_bridgeObjectRelease();
  v60._countAndFlagsBits = 0x5420504F52440A3BLL;
  v60._uint64_t object = (void *)0xED000020454C4241;
  sub_10024E800(v60);
  id v33 = sub_10020E524();
  sub_10024E6B0();

  sub_10020E38C();
  swift_bridgeObjectRelease();
  sub_10020E320((uint64_t)";\nALTER TABLE new_");
  id v34 = sub_10020E524();
  sub_10024E6B0();

  sub_10020DEC4();
  swift_bridgeObjectRelease();
  v61._countAndFlagsBits = 0x20454D414E455220;
  v61._uint64_t object = (void *)0xEB00000000204F54;
  sub_10024E800(v61);
  id v35 = sub_10020E524();
  sub_10024E6B0();

  sub_10020DEA8();
  swift_bridgeObjectRelease();
  v62._countAndFlagsBits = 59;
  v62._uint64_t object = (void *)0xE100000000000000;
  sub_10024E800(v62);
  id v40 = sub_10024E6A0();
  swift_bridgeObjectRelease();
  [v38 executeStatement:v40];
  sub_10002FD48();
}

void sub_10020A030()
{
  sub_10020E3D4();
  id v0 = [(id)type metadata accessor for TransactionEntity() databaseTable];
  sub_10024E6B0();
  sub_10020E11C();
  sub_10020DEA8();
  swift_bridgeObjectRelease();
  sub_10020DF40();
  int v1 = sub_10020E288();
  sub_10020E24C(v1, "executeStatement:", v2, v3, v4, v5, v6, v7, v8, (uint64_t)v9);
}

void sub_10020A104(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
  {
    if (!a1) {
      goto LABEL_10;
    }
    a3 = swift_allocObject();
    *(void *)(a3 + 16) = a4;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_10020D8A0;
    *(void *)(v13 + 24) = a3;
    aBlock[4] = (uint64_t)sub_10020D8B4;
    aBlock[5] = v13;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100205AC0;
    aBlock[3] = (uint64_t)&unk_1002F1AA8;
    id v14 = _Block_copy(aBlock);
    int v6 = a1;
    swift_retain();
    swift_release();
    [v6 enumerateRowsUsingBlock:v14];

    _Block_release(v14);
    LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((v14 & 1) == 0) {
      return;
    }
    __break(1u);
LABEL_9:
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    goto LABEL_10;
  }
  swift_errorRetain();
  if (qword_100308DE0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10024E1F0();
  sub_10001B0E8(v5, (uint64_t)qword_10034C0E0);
  swift_errorRetain();
  swift_errorRetain();
  int v6 = sub_10024E1D0();
  os_log_type_t v7 = sub_10024EE10();
  if (!os_log_type_enabled(v6, v7)) {
    goto LABEL_9;
  }
  uint64_t v8 = (uint8_t *)swift_slowAlloc();
  aBlock[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v8 = 136446210;
  swift_getErrorValue();
  uint64_t v9 = sub_10024FB80();
  sub_1000F3F3C(v9, v10, aBlock);
  sub_10024F100();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  swift_errorRelease();
  _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to read from current table: %{public}s", v8, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  swift_errorRelease();
LABEL_10:
  *(unsigned char *)a3 = 1;
}

void sub_10020A42C(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a1)
  {
    id v9 = a1;
    id v5 = [v9 dictionaryWithValuesForColumns];
    uint64_t v6 = sub_10024E4F0();

    sub_100034634();
    uint64_t v7 = *(void *)(*a4 + 16);
    sub_10003494C();
    uint64_t v8 = *a4;
    *(void *)(v8 + 16) = v7 + 1;
    *(void *)(v8 + 8 * v7 + 32) = v6;
  }
}

void sub_10020A4E8(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_100308DE0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10024E1F0();
    sub_10001B0E8(v4, (uint64_t)qword_10034C0E0);
    swift_errorRetain();
    swift_errorRetain();
    oslog = sub_10024E1D0();
    os_log_type_t v5 = sub_10024EE10();
    if (os_log_type_enabled(oslog, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136446210;
      swift_getErrorValue();
      uint64_t v7 = sub_10024FB80();
      sub_1000F3F3C(v7, v8, &v15);
      sub_10024F100();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v5, "[DatabaseStore.self migrate15400To16000(migrator:)] Failed to read from current table: %{public}s", v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  else if (a1)
  {
    id v10 = a4;
    oslog = a1;
    sub_10020AB40((uint64_t)oslog, v10);
  }
  else
  {
    if (qword_100308DE0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10024E1F0();
    sub_10001B0E8(v11, (uint64_t)qword_10034C0E0);
    oslog = sub_10024E1D0();
    os_log_type_t v12 = sub_10024EE10();
    if (os_log_type_enabled(oslog, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v12, "[DatabaseStore.self migrate15400To16000(migrator:)] No results found for SQL query desipte not encountering an explicit error", v13, 2u);
      swift_slowDealloc();
    }
  }
}

id sub_10020A7D0(uint64_t a1, id a2, double a3)
{
  id v5 = [a2 connection];
  sub_10024F330(59);
  v19._countAndFlagsBits = 0x20455441445055;
  v19._uint64_t object = (void *)0xE700000000000000;
  sub_10024E800(v19);
  id v6 = [(id)type metadata accessor for TransactionEntity() databaseTable];
  uint64_t v7 = sub_10024E6B0();
  id v9 = v8;

  v20._countAndFlagsBits = v7;
  v20._uint64_t object = v9;
  sub_10024E800(v20);
  swift_bridgeObjectRelease();
  v21._uint64_t object = (void *)0x8000000100284BE0;
  v21._countAndFlagsBits = 0xD00000000000002CLL;
  sub_10024E800(v21);
  v22._countAndFlagsBits = 25705;
  v22._uint64_t object = (void *)0xE200000000000000;
  sub_10024E800(v22);
  v23._countAndFlagsBits = 1059077408;
  v23._uint64_t object = (void *)0xE400000000000000;
  sub_10024E800(v23);
  NSString v10 = sub_10024E6A0();
  swift_bridgeObjectRelease();
  uint64_t v11 = swift_allocObject();
  *(double *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = a1;
  os_log_type_t v12 = (void *)swift_allocObject();
  void v12[2] = sub_10020DC38;
  v12[3] = v11;
  aBlock[4] = sub_10020DD8C;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_100205BF8;
  aBlock[3] = &unk_1002F1B98;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  unsigned int v14 = [v5 executeStatement:v10 error:aBlock bindings:v13];
  _Block_release(v13);

  id result = aBlock[0];
  if (v14)
  {
    swift_release();
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    id result = (id)swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return result;
    }
    __break(1u);
  }
  uint64_t v17 = (uint64_t)result;
  sub_10024DCE0();

  swift_willThrow();
  swift_release();
  LOBYTE(v17) = swift_isEscapingClosureAtFileLocation();
  id result = (id)swift_release();
  if (v17) {
    __break(1u);
  }
  return result;
}

id sub_10020AAE0(void *a1, uint64_t a2)
{
  id result = objc_msgSend(a1, "bindDouble:atPosition:", 1);
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    return [a1 bindInt64:a2 atPosition:2];
  }
  return result;
}

uint64_t sub_10020AB40(uint64_t a1, void *a2)
{
  uint64_t v15 = sub_10024E510();
  uint64_t v13 = _swiftEmptyArrayStorage;
  uint64_t v14 = sub_10024E510();
  NSString v10 = &v14;
  uint64_t v11 = &v15;
  os_log_type_t v12 = &v13;
  uint64_t v7 = sub_10020DBE8;
  unint64_t v8 = &v9;
  sub_10020B93C((uint64_t)sub_10020DBF4, (uint64_t)v6);
  uint64_t v3 = v13[2];
  if (v3)
  {
    uint64_t v4 = (double *)(swift_bridgeObjectRetain() + 40);
    do
    {
      sub_10020A7D0(*((void *)v4 - 1), a2, *v4);
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_10020AE38(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t *a6)
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_100308DE0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_10024E1F0();
    sub_10001B0E8(v6, (uint64_t)qword_10034C0E0);
    swift_errorRetain();
    swift_errorRetain();
    oslog = sub_10024E1D0();
    os_log_type_t v7 = sub_10024EE10();
    if (os_log_type_enabled(oslog, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      v43[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v8 = 136446210;
      swift_getErrorValue();
      uint64_t v9 = sub_10024FB80();
      sub_1000F3F3C(v9, v10, v43);
      sub_10024F100();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v7, "[DatabaseStore.self executeRSSDMigrationLogic(results:updateHandler:)] Error while enumerating table rows: %{public}s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
    goto LABEL_21;
  }
  if (a1)
  {
    id v14 = a1;
    uint64_t v15 = sub_10020BA50((uint64_t)&off_1002DA100);
    sub_100161884(0xD000000000000015, 0x8000000100278E10, v15);
    if (!v43[3])
    {
      swift_bridgeObjectRelease();
      sub_100051BB4((uint64_t)v43, (uint64_t *)&unk_100319510);
      goto LABEL_29;
    }
    if ((swift_dynamicCast() & 1) == 0)
    {

      swift_bridgeObjectRelease();
      return;
    }
    sub_100161884(25705, 0xE200000000000000, v15);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_100308DE0 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_10024E1F0();
      sub_10001B0E8(v30, (uint64_t)qword_10034C0E0);
      Swift::String v23 = sub_10024E1D0();
      os_log_type_t v24 = sub_10024EE10();
      if (!os_log_type_enabled(v23, v24)) {
        goto LABEL_44;
      }
      Swift::String v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v25 = 0;
      id v26 = "[DatabaseStore.self executeRSSDMigrationLogic(results:updateHandler:)] Old transaction unexpectedly doesn’t "
      goto LABEL_43;
    }
    sub_100161884(0x6573616863727570, 0xED0000657461645FLL, v15);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_100308DE0 != -1) {
        swift_once();
      }
      uint64_t v31 = sub_10024E1F0();
      sub_10001B0E8(v31, (uint64_t)qword_10034C0E0);
      Swift::String v23 = sub_10024E1D0();
      os_log_type_t v24 = sub_10024EE10();
      if (!os_log_type_enabled(v23, v24)) {
        goto LABEL_44;
      }
      Swift::String v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v25 = 0;
      id v26 = "[DatabaseStore.self executeRSSDMigrationLogic(results:updateHandler:)] Old transaction unexpectedly doesn’t "
      goto LABEL_43;
    }
    double v16 = *(double *)&v41;
    sub_100161884(0x6974617269707865, 0xEF657461645F6E6FLL, v15);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_100308DE0 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_10024E1F0();
      sub_10001B0E8(v32, (uint64_t)qword_10034C0E0);
      Swift::String v23 = sub_10024E1D0();
      os_log_type_t v24 = sub_10024EE10();
      if (!os_log_type_enabled(v23, v24)) {
        goto LABEL_44;
      }
      Swift::String v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v25 = 0;
      id v26 = "[DatabaseStore.self executeRSSDMigrationLogic(results:updateHandler:)] Old transaction unexpectedly doesn’t "
      goto LABEL_43;
    }
    uint64_t v17 = *a4;
    swift_bridgeObjectRetain();
    double v39 = COERCE_DOUBLE(sub_100161840(v41, v42, v17));
    LOBYTE(v17) = v18;
    swift_bridgeObjectRelease();
    if (v17)
    {
      sub_100161884(0xD000000000000016, 0x8000000100278DE0, v15);
      swift_bridgeObjectRelease();
      uint64_t v19 = v41;
      if (swift_dynamicCast()) {
        double v16 = *(double *)&v41;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v19 = v41;
      if (*(double *)&v41 - v39 < 5184000.0)
      {
        if (!*(void *)(*a5 + 16)
          || (swift_bridgeObjectRetain(), sub_10011ED00(), char v21 = v20, swift_bridgeObjectRelease(), (v21 & 1) == 0))
        {
          swift_bridgeObjectRelease();
          if (qword_100308DE0 != -1) {
            swift_once();
          }
          uint64_t v22 = sub_10024E1F0();
          sub_10001B0E8(v22, (uint64_t)qword_10034C0E0);
          Swift::String v23 = sub_10024E1D0();
          os_log_type_t v24 = sub_10024EE10();
          if (!os_log_type_enabled(v23, v24)) {
            goto LABEL_44;
          }
          Swift::String v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)Swift::String v25 = 0;
          id v26 = "[DatabaseStore.self executeRSSDMigrationLogic(results:updateHandler:)] Unexpectedly didn’t find a cached"
                " RSSD for a group ID that already has an associated cached ED";
LABEL_43:
          _os_log_impl((void *)&_mh_execute_header, v23, v24, v26, v25, 2u);
          swift_slowDealloc();
LABEL_44:

          return;
        }
        goto LABEL_48;
      }
    }
    swift_bridgeObjectRetain();
    sub_10020CAF8(v41, v42, v16);
    swift_bridgeObjectRelease();
LABEL_48:
    swift_bridgeObjectRetain();
    sub_10020CAF8(v41, v42, *(double *)&v41);
    swift_bridgeObjectRelease();
    uint64_t v33 = sub_100161840(v41, v42, *a5);
    char v35 = v34;
    swift_bridgeObjectRelease();
    if (v35)
    {
      __break(1u);
      return;
    }
    sub_1000347D4();
    uint64_t v36 = *(void *)(*a6 + 16);
    sub_100034ABC();
    uint64_t v37 = *a6;
    *(void *)(v37 + 16) = v36 + 1;
    uint64_t v38 = v37 + 16 * v36;
    *(void *)(v38 + 32) = v19;
    *(void *)(v38 + 40) = v33;
    *a6 = v37;
LABEL_29:

    return;
  }
  if (qword_100308DE0 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_10024E1F0();
  sub_10001B0E8(v27, (uint64_t)qword_10034C0E0);
  oslog = sub_10024E1D0();
  os_log_type_t v28 = sub_10024EE10();
  if (os_log_type_enabled(oslog, v28))
  {
    Swift::String v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v29 = 0;
    swift_slowDealloc();
  }
LABEL_21:
}

id sub_10020B764(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DatabaseStore();
  id v3 = objc_msgSendSuper2(&v5, "initWithDatabase:", a1);

  return v3;
}

id sub_10020B7DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DatabaseStore();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10020B834()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DatabaseStore();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DatabaseStore()
{
  return self;
}

uint64_t sub_10020B890()
{
  return sub_1000E223C(v0, 32);
}

uint64_t sub_10020B89C(void *a1)
{
  return sub_100206BFC(a1, *(uint64_t (**)(void *))(v1 + 16));
}

uint64_t sub_10020B8A4()
{
  return sub_1000E223C(v0, 32);
}

uint64_t sub_10020B8B0()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_10020B8DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10020B8EC()
{
  return swift_release();
}

uint64_t sub_10020B8F4()
{
  return sub_1000E223C(v0, 32);
}

uint64_t sub_10020B900(void *a1)
{
  return sub_100206A04(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t sub_10020B908()
{
  return sub_1000E223C(v0, 32);
}

uint64_t sub_10020B914()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10020B93C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v9[4] = sub_10020DD34;
  v9[5] = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_100205AC0;
  v9[3] = &unk_1002F1BE8;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  [v2 enumerateRowsUsingBlock:v6];
  _Block_release(v6);
  swift_release();
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_10020BA50(uint64_t a1)
{
  if (a1) {
    v2.super.Class isa = sub_10024EA80().super.isa;
  }
  else {
    v2.super.Class isa = 0;
  }
  id v3 = [v1 dictionaryWithValuesForColumnNames:v2.super.isa];

  uint64_t v4 = sub_10024E4F0();
  return v4;
}

uint64_t sub_10020BADC(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_10020BB14()
{
  return sub_10020BB68(&qword_1003195B0);
}

uint64_t sub_10020BB20()
{
  swift_arrayDestroy();
  uint64_t v0 = sub_1001414C8();
  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10020BB5C()
{
  return sub_10020BB68(&qword_100319600);
}

uint64_t sub_10020BB68(uint64_t *a1)
{
  sub_100019524(a1);
  swift_arrayDestroy();
  uint64_t v1 = sub_1001414C8();
  return _swift_deallocClassInstance(v1, v2, v3);
}

uint64_t sub_10020BBBC()
{
  sub_10024DDC0();
  swift_arrayDestroy();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_10020BC38()
{
  return sub_10024F100();
}

void sub_10020BC60(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_10024F100();
  *a1 = v7;
  unint64_t v8 = *a2;
  if (*a2)
  {
    *unint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_10020BD18()
{
  return sub_1000E223C(v0, 24);
}

void sub_10020BD24()
{
}

uint64_t sub_10020BD3C()
{
  return sub_1000E223C(v0, 24);
}

#error "10020BD54: call analysis failed (funcsize=6)"

uint64_t sub_10020BD60()
{
  return sub_1000E223C(v0, 24);
}

void sub_10020BD6C()
{
}

uint64_t sub_10020BD84()
{
  return sub_1000E223C(v0, 24);
}

void sub_10020BD90(uint64_t a1)
{
}

uint64_t sub_10020BDC0()
{
  return sub_1000E223C(v0, 24);
}

uint64_t sub_10020BDCC(void *a1)
{
  return sub_100209568(a1);
}

uint64_t sub_10020BDF0()
{
  return sub_1000E223C(v0, 24);
}

uint64_t sub_10020BDFC()
{
  return sub_100209258();
}

uint64_t sub_10020BE14()
{
  return sub_1000E223C(v0, 24);
}

void sub_10020BE20(uint64_t a1)
{
}

uint64_t sub_10020BE50()
{
  return sub_1000E223C(v0, 24);
}

void sub_10020BE5C()
{
}

uint64_t sub_10020BE74()
{
  return sub_1000E223C(v0, 24);
}

void sub_10020BE80(uint64_t a1)
{
}

uint64_t sub_10020BEB0()
{
  return sub_1000E223C(v0, 24);
}

void sub_10020BEBC()
{
}

uint64_t sub_10020BED4()
{
  return sub_1000E223C(v0, 24);
}

void sub_10020BEE0()
{
}

uint64_t sub_10020BEF8()
{
  return sub_1000E223C(v0, 24);
}

uint64_t sub_10020BF04()
{
  return sub_100208E2C();
}

uint64_t sub_10020BF1C()
{
  return sub_1000E223C(v0, 24);
}

uint64_t sub_10020BF28(void *a1)
{
  return sub_10020838C(a1);
}

uint64_t sub_10020BF40()
{
  return sub_1000E223C(v0, 32);
}

void sub_10020BF4C(void *a1, uint64_t a2)
{
  sub_10020A104(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_10020BF54()
{
  return sub_1000E223C(v0, 32);
}

uint64_t sub_10020BF60()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10020BF88()
{
  sub_1000AC2FC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48));
  return _swift_deallocObject(v0, 49, 7);
}

double sub_10020BFC8@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_10011ED00();
  char v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v2;
    uint64_t v8 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    Swift::Int v9 = *(void *)(v8 + 24);
    sub_100019524(&qword_100313718);
    sub_10024F630(isUniquelyReferenced_nonNull_native, v9);
    swift_bridgeObjectRelease();
    sub_10003B908((_OWORD *)(*(void *)(v11 + 56) + 32 * v4), a1);
    sub_10024F650();
    *uint64_t v2 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

double sub_10020C100@<D0>(char a1@<W0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10011ED60(a1);
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v8)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v3;
    uint64_t v10 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    Swift::Int v11 = *(void *)(v10 + 24);
    sub_100019524(&qword_100319608);
    sub_10024F630(isUniquelyReferenced_nonNull_native, v11);
    sub_10003B908((_OWORD *)(*(void *)(v13 + 56) + 32 * v6), a2);
    sub_1000AC21C();
    sub_10024F650();
    *uint64_t v3 = v13;
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

void sub_10020C220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_100141AF0();
  Swift::Int v11 = v10;
  swift_bridgeObjectRetain();
  sub_10011ED00();
  char v13 = v12;
  swift_bridgeObjectRelease();
  if (v13)
  {
    swift_isUniquelyReferenced_nonNull_native();
    sub_10020E474();
    sub_100019524(&qword_10030AA40);
    sub_10020E6B4();
    swift_bridgeObjectRelease();
    sub_10024F650();
    *Swift::Int v11 = a10;
    swift_bridgeObjectRelease();
  }
  sub_10008F248();
}

void sub_10020C304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_100141AF0();
  sub_10011EF34();
  if (v11)
  {
    swift_isUniquelyReferenced_nonNull_native();
    sub_10020E474();
    sub_100019524(&qword_100319628);
    sub_10020E6B4();
    type metadata accessor for ASDOctaneValueIdentifier(0);
    sub_10020DC9C((unint64_t *)&qword_100319630, type metadata accessor for ASDOctaneValueIdentifier);
    sub_10024F650();
    *uint64_t v10 = a10;
    swift_bridgeObjectRelease();
  }
  sub_10008F248();
}

uint64_t sub_10020C3EC(uint64_t a1, uint64_t a2)
{
  return sub_10020C42C(a1, a2, &qword_1003195C8, (void (*)(void))type metadata accessor for OctaneConfigurationOverrides);
}

uint64_t sub_10020C40C(uint64_t a1, uint64_t a2)
{
  return sub_10020C42C(a1, a2, (uint64_t *)&unk_1003195D0, (void (*)(void))type metadata accessor for OctaneConfiguration);
}

uint64_t sub_10020C42C(uint64_t a1, uint64_t a2, uint64_t *a3, void (*a4)(void))
{
  char v7 = v4;
  sub_10020E654();
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_10011ED00();
  char v10 = v9;
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *v7;
  uint64_t v12 = *v7;
  uint64_t *v7 = 0x8000000000000000;
  Swift::Int v13 = *(void *)(v12 + 24);
  sub_100019524(a3);
  sub_10024F630(isUniquelyReferenced_nonNull_native, v13);
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(*(void *)(v16 + 56) + 8 * v8);
  a4(0);
  sub_10024F650();
  uint64_t *v7 = v16;
  swift_bridgeObjectRelease();
  return v14;
}

double sub_10020C544@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_10011EE18();
  char v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v2;
    uint64_t v8 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    Swift::Int v9 = *(void *)(v8 + 24);
    sub_100019524((uint64_t *)&unk_1003195E0);
    sub_10024F630(isUniquelyReferenced_nonNull_native, v9);
    sub_10006B3E8(*(void *)(*(void *)(v11 + 48) + 16 * v4), *(void *)(*(void *)(v11 + 48) + 16 * v4 + 8));
    sub_10002F754((long long *)(*(void *)(v11 + 56) + 40 * v4), a1);
    sub_100019524(&qword_10030A3E0);
    sub_10015B110();
    sub_10024F650();
    *uint64_t v2 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

#error "10020C6B0: call analysis failed (funcsize=19)"

uint64_t sub_10020C6D8(_OWORD *a1, char a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_10020CC80(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v7;
  return swift_bridgeObjectRelease();
}

#error "10020C7A8: call analysis failed (funcsize=30)"

uint64_t sub_10020C7D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10020E654();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v17 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  unint64_t v7 = sub_10020CEC4(v4, (unint64_t)v3 & 0xFFFFFFFF0000FFFFLL, a3, isUniquelyReferenced_nonNull_native);
  sub_10020E2A0(v7, v8, v9, v10, v11, v12, v13, v14, v16, v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10020C84C()
{
  return sub_10020C87C();
}

uint64_t sub_10020C864()
{
  return sub_10020C87C();
}

uint64_t sub_10020C87C()
{
  sub_100141AF0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v0;
  *uint64_t v0 = 0x8000000000000000;
  v2(v6, v4, isUniquelyReferenced_nonNull_native);
  *uint64_t v0 = v10;
  sub_10008F248();
  return swift_bridgeObjectRelease();
}

#error "10020C928: call analysis failed (funcsize=19)"

uint64_t sub_10020C950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10020C9D0(a1, a2, a3, (uint64_t)&qword_1003195C8, (void (*)(uint64_t, uint64_t, uint64_t))sub_10020D32C);
}

uint64_t sub_10020C970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10020C9D0(a1, a2, a3, (uint64_t)&unk_1003195D0, (void (*)(uint64_t, uint64_t, uint64_t))sub_10020D32C);
}

uint64_t sub_10020C990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10020C9D0(a1, a2, a3, (uint64_t)&unk_100319620, (void (*)(uint64_t, uint64_t, uint64_t))sub_10020D510);
}

uint64_t sub_10020C9B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10020C9D0(a1, a2, a3, (uint64_t)&unk_1003195F8, (void (*)(uint64_t, uint64_t, uint64_t))sub_10020D32C);
}

uint64_t sub_10020C9D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  swift_isUniquelyReferenced_nonNull_native();
  sub_10020E4D0();
  a5(a1, a2, a3);
  *uint64_t v5 = v11;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10020CA68(long long *a1, uint64_t a2, unint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_10020D5E4(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10020CAF8(uint64_t a1, uint64_t a2, double a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_10020D72C(a1, a2, isUniquelyReferenced_nonNull_native, a3);
  *uint64_t v3 = v9;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_10020CB88()
{
  sub_10020DF10();
  sub_10020DF9C();
  if (v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v7 = v4;
  char v8 = v5;
  sub_100019524(&qword_100313718);
  if (!sub_10020E36C()) {
    goto LABEL_5;
  }
  unint64_t v9 = sub_10020E5EC();
  if ((v8 & 1) != (v10 & 1))
  {
LABEL_13:
    double result = (_OWORD *)sub_10024FB70();
    __break(1u);
    return result;
  }
  unint64_t v7 = v9;
LABEL_5:
  uint64_t v11 = *v3;
  if (v8)
  {
    uint64_t v12 = (_OWORD *)(*(void *)(v11 + 56) + 32 * v7);
    sub_10001C2EC((uint64_t)v12);
    return sub_10003B908(v0, v12);
  }
  else
  {
    sub_10020D850(v7, v2, v1, (uint64_t)v0, v11);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

_OWORD *sub_10020CC80(_OWORD *a1, char a2, char a3)
{
  unint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  unint64_t v9 = sub_10011ED60(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v14 = v9;
  char v15 = v10;
  sub_100019524(&qword_100319608);
  if (!sub_10024F630(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_10011ED60(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_13:
    double result = (_OWORD *)sub_10024FB70();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  char v18 = *v4;
  if (v15)
  {
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v14);
    sub_10001C2EC((uint64_t)v19);
    return sub_10003B908(a1, v19);
  }
  else
  {
    return sub_10020D920(v14, a2, a1, v18);
  }
}

void sub_10020CDA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char v6 = v5;
  Swift::Int v12 = *v5;
  sub_10011ED00();
  sub_10020DF9C();
  if (v15)
  {
    __break(1u);
LABEL_12:
    sub_10024FB70();
    __break(1u);
    return;
  }
  unint64_t v16 = v13;
  char v17 = v14;
  sub_100019524(&qword_10030AA40);
  if (sub_10024F630(a5 & 1, v12))
  {
    sub_10011ED00();
    sub_10020E5DC();
    if (!v19) {
      goto LABEL_12;
    }
    unint64_t v16 = v18;
  }
  char v20 = (void *)*v6;
  if (v17)
  {
    char v21 = (uint64_t *)(v20[7] + 16 * v16);
    swift_bridgeObjectRelease();
    *char v21 = a1;
    v21[1] = a2;
    sub_10003C8C8();
  }
  else
  {
    sub_10020D988(v16, a3, a4, a1, a2, v20);
    sub_10003C8C8();
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_10020CEC4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = (void **)v4;
  char v10 = (void *)*v4;
  unint64_t v11 = sub_10011EDD4(a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100019524(&qword_100316FC0);
  if (!sub_10024F630(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_10011EDD4(a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    unint64_t result = sub_10024FB70();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  char v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7] + 16 * v16;
    unint64_t result = j__swift_release(*(void *)v21, *(unsigned __int8 *)(v21 + 8));
    *(void *)uint64_t v21 = a1;
    *(_WORD *)(v21 + 8) = a2;
    *(_DWORD *)(v21 + 12) = HIDWORD(a2);
  }
  else
  {
    return sub_10020D9D4(v16, a3, a1, a2 & 0xFFFFFFFF0000FFFFLL, v20);
  }
  return result;
}

unint64_t sub_10020CFF8(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  uint64_t v9 = sub_10011EF34(a2);
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
  sub_100019524((uint64_t *)&unk_100319640);
  if (!sub_10024F630(a3 & 1, v13)) {
    goto LABEL_5;
  }
  uint64_t v16 = sub_10011EF34(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    type metadata accessor for ASDOctaneEventType(0);
    unint64_t result = sub_10024FB70();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  unint64_t v18 = *v4;
  if (v15)
  {
    uint64_t v19 = v18[7];
    unint64_t result = swift_bridgeObjectRelease();
    *(void *)(v19 + 8 * v14) = a1;
  }
  else
  {
    return sub_10020DA30(v14, a2, a1, v18);
  }
  return result;
}

unint64_t sub_10020D108(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  uint64_t v9 = sub_10011EF34(a2);
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
  sub_100019524(&qword_10030B488);
  unint64_t result = sub_10024F630(a3 & 1, v13);
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t result = sub_10011EF34(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    type metadata accessor for ASDOctaneValueIdentifier(0);
    unint64_t result = sub_10024FB70();
    __break(1u);
    return result;
  }
  unint64_t v14 = result;
LABEL_5:
  unint64_t v18 = *v4;
  if (v15)
  {
    *(void *)(v18[7] + 8 * v14) = a1;
  }
  else
  {
    return sub_10020DA30(v14, a2, a1, v18);
  }
  return result;
}

unint64_t sub_10020D210(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = (void **)v4;
  char v10 = (void *)*v4;
  uint64_t v11 = sub_10011EF34(a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100019524(&qword_100319628);
  if (!sub_10024F630(a4 & 1, v15)) {
    goto LABEL_5;
  }
  uint64_t v18 = sub_10011EF34(a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    type metadata accessor for ASDOctaneValueIdentifier(0);
    unint64_t result = sub_10024FB70();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  char v20 = *v5;
  if (v17)
  {
    uint64_t v21 = (uint64_t *)(v20[7] + 16 * v16);
    unint64_t result = swift_bridgeObjectRelease();
    *uint64_t v21 = a1;
    v21[1] = a2;
  }
  else
  {
    return sub_10020DA74(v16, a3, a1, a2, v20);
  }
  return result;
}

void sub_10020D32C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  sub_10020DF10();
  sub_10020DF9C();
  if (v12)
  {
    __break(1u);
LABEL_12:
    sub_10024FB70();
    __break(1u);
    return;
  }
  unint64_t v13 = v10;
  char v14 = v11;
  sub_100019524(a5);
  if (sub_10020E36C())
  {
    sub_10020E5EC();
    sub_10020E5DC();
    if (!v16) {
      goto LABEL_12;
    }
    unint64_t v13 = v15;
  }
  uint64_t v17 = *v8;
  if (v14)
  {
    uint64_t v18 = *(void *)(v17 + 56);
    swift_release();
    *(void *)(v18 + 8 * v13) = v5;
    sub_10003C8C8();
  }
  else
  {
    sub_10020DB00(v13, v7, v6, v5, v17);
    sub_10003C8C8();
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_10020D400(uint64_t a1, char a2, char a3)
{
  unint64_t v4 = v3;
  Swift::Int v8 = *v3;
  sub_10011ED60(a2);
  sub_10020DF9C();
  if (v11)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v12 = v9;
  char v13 = v10;
  sub_100019524(&qword_100319618);
  if (!sub_10024F630(a3 & 1, v8)) {
    goto LABEL_5;
  }
  unint64_t v14 = sub_10011ED60(a2);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_11:
    unint64_t result = sub_10024FB70();
    __break(1u);
    return result;
  }
  unint64_t v12 = v14;
LABEL_5:
  char v16 = (void *)*v4;
  if (v13)
  {
    uint64_t v17 = v16[7];
    unint64_t result = swift_bridgeObjectRelease();
    *(void *)(v17 + 8 * v12) = a1;
  }
  else
  {
    return sub_10020DABC(v12, a2, a1, v16);
  }
  return result;
}

void sub_10020D504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_10020D510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  sub_10020DF10();
  sub_10020DF9C();
  if (v12)
  {
    __break(1u);
LABEL_12:
    sub_10024FB70();
    __break(1u);
    return;
  }
  unint64_t v13 = v10;
  char v14 = v11;
  sub_100019524(a5);
  if (sub_10020E36C())
  {
    sub_10020E5EC();
    sub_10020E5DC();
    if (!v16) {
      goto LABEL_12;
    }
    unint64_t v13 = v15;
  }
  uint64_t v17 = *v8;
  if (v14)
  {
    uint64_t v18 = *(void *)(v17 + 56);

    *(void *)(v18 + 8 * v13) = v5;
    sub_10003C8C8();
  }
  else
  {
    sub_10020DB00(v13, v7, v6, v5, v17);
    sub_10003C8C8();
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_10020D5E4(long long *a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_10011EE18();
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100019524((uint64_t *)&unk_1003195E0);
  if (!sub_10024F630(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_10011EE18();
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    uint64_t result = sub_10024FB70();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  char v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7] + 40 * v16;
    sub_10001C2EC(v21);
    return sub_10002F754(a1, v21);
  }
  else
  {
    sub_10020DB28(v16, a2, a3, a1, v20);
    return sub_10006B3D4(a2, a3);
  }
}

uint64_t sub_10020D72C(uint64_t a1, uint64_t a2, char a3, double a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_10011ED00();
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100019524((uint64_t *)&unk_1003195A0);
  uint64_t result = sub_10024F630(a3 & 1, v15);
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = sub_10011ED00();
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    uint64_t result = sub_10024FB70();
    __break(1u);
    return result;
  }
  unint64_t v16 = result;
LABEL_5:
  char v20 = *v5;
  if (v17)
  {
    *(double *)(v20[7] + 8 * v16) = a4;
  }
  else
  {
    sub_10020DB98(v16, a1, a2, v20, a4);
    return swift_bridgeObjectRetain();
  }
  return result;
}

_OWORD *sub_10020D850(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = sub_10020E0EC(a1, a2, a3, a4, a5);
  uint64_t result = sub_10003B908(v8, (_OWORD *)(v7 + 32 * v6));
  uint64_t v10 = *(void *)(a5 + 16);
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    *(void *)(a5 + 16) = v12;
  }
  return result;
}

uint64_t sub_10020D894()
{
  return sub_1000E223C(v0, 24);
}

void sub_10020D8A0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_10020A42C(a1, a2, a3, *(uint64_t **)(v3 + 16));
}

uint64_t sub_10020D8A8()
{
  return sub_1000E223C(v0, 32);
}

uint64_t sub_10020D8B4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10020D8DC()
{
  uint64_t v1 = sub_1001414C8();
  return _swift_deallocObject(v1, v2, v3);
}

void sub_10020D90C(void *a1, uint64_t a2)
{
  sub_10020A4E8(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_10020D914()
{
  return sub_1000E223C(v0, 32);
}

_OWORD *sub_10020D920(unint64_t a1, char a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2;
  uint64_t result = sub_10003B908(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

unint64_t sub_10020D988(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  BOOL v7 = (void *)(a6[7] + 16 * result);
  void *v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

unint64_t sub_10020D9D4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  *(void *)(a5[6] + 8 * result) = a2;
  uint64_t v5 = a5[7] + 16 * result;
  *(void *)uint64_t v5 = a3;
  *(_WORD *)(v5 + 8) = a4;
  *(_DWORD *)(v5 + 12) = HIDWORD(a4);
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_10020DA30(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
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

unint64_t sub_10020DA74(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  *(void *)(a5[6] + 8 * result) = a2;
  BOOL v5 = (void *)(a5[7] + 16 * result);
  *BOOL v5 = a3;
  v5[1] = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_10020DABC(unint64_t result, char a2, uint64_t a3, void *a4)
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

unint64_t sub_10020DB00(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result = sub_10020E0EC(a1, a2, a3, a4, a5);
  *(void *)(v8 + 8 * result) = v7;
  uint64_t v9 = *(void *)(v6 + 16);
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    *(void *)(v6 + 16) = v11;
  }
  return result;
}

uint64_t sub_10020DB28(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10002F754(a4, a5[7] + 40 * a1);
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_10020DB98(unint64_t result, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  a4[(result >> 6) + 8] |= 1 << result;
  BOOL v5 = (void *)(a4[6] + 16 * result);
  *BOOL v5 = a2;
  v5[1] = a3;
  *(double *)(a4[7] + 8 * result) = a5;
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

void sub_10020DBE0(void **a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t *a6)
{
}

void sub_10020DBE8(void **a1, uint64_t a2, uint64_t a3)
{
  sub_10020DBE0(a1, a2, a3, v3[2], v3[3], v3[4]);
}

uint64_t sub_10020DBF4(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_10020DC2C()
{
  return sub_1000E223C(v0, 32);
}

id sub_10020DC38(void *a1)
{
  return sub_10020AAE0(a1, *(void *)(v1 + 24));
}

uint64_t sub_10020DC44()
{
  return sub_1000E223C(v0, 32);
}

uint64_t sub_10020DC50()
{
  return sub_1000E223C(v0, 32);
}

unint64_t sub_10020DC5C()
{
  unint64_t result = qword_1003195B8;
  if (!qword_1003195B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1003195B8);
  }
  return result;
}

uint64_t sub_10020DC9C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_10020DD90()
{
  v1._countAndFlagsBits = 0x4C4F432044444120;
  v1._uint64_t object = (void *)0xEC000000204E4D55;
  sub_10024E800(v1);
}

void sub_10020DDC0()
{
  v1._countAndFlagsBits = 0x52454745544E4920;
  v1._uint64_t object = (void *)0xEA00000000000A2CLL;
  sub_10024E800(v1);
}

void sub_10020DDEC()
{
  v1._countAndFlagsBits = 0xA2C4C41455220;
  v1._uint64_t object = (void *)0xE700000000000000;
  sub_10024E800(v1);
}

void sub_10020DE14()
{
  v1._countAndFlagsBits = 0x4154205245544C41;
  v1._uint64_t object = (void *)0xEC00000020454C42;
  sub_10024E800(v1);
}

uint64_t sub_10020DE4C()
{
  return type metadata accessor for TransactionEntity();
}

void sub_10020DE80()
{
  v1._countAndFlagsBits = 0x474E4952545320;
  v1._uint64_t object = (void *)0xE700000000000000;
  sub_10024E800(v1);
}

void sub_10020DEA8()
{
  v3._countAndFlagsBits = v0;
  v3._uint64_t object = v1;
  sub_10024E800(v3);
}

void sub_10020DEC4()
{
  v3._countAndFlagsBits = v0;
  v3._uint64_t object = v1;
  sub_10024E800(v3);
}

double sub_10020DEE0()
{
  return sub_100161884(0x5F746375646F7270, 0xEA00000000006469, v0);
}

unint64_t sub_10020DF10()
{
  return sub_10011ED00();
}

NSString sub_10020DF40()
{
  return sub_10024E6A0();
}

uint64_t sub_10020DF58()
{
  return swift_release();
}

void sub_10020DF70()
{
  v1._countAndFlagsBits = 0x2C474E4952545320;
  v1._uint64_t object = (void *)0xE90000000000000ALL;
  sub_10024E800(v1);
}

uint64_t sub_10020DFB0()
{
  return sub_100051BB4(v1 - 160, v0);
}

void sub_10020DFC8()
{
  v1._countAndFlagsBits = 0xA2C5458455420;
  v1._uint64_t object = (void *)0xE700000000000000;
  sub_10024E800(v1);
}

void sub_10020DFF0()
{
  v1._countAndFlagsBits = 0x52454745544E4920;
  v1._uint64_t object = (void *)0xE800000000000000;
  sub_10024E800(v1);
}

void sub_10020E028()
{
  v1._countAndFlagsBits = 0x4C41455220;
  v1._uint64_t object = (void *)0xE500000000000000;
  sub_10024E800(v1);
}

void sub_10020E048(uint64_t a1@<X8>)
{
  v3._countAndFlagsBits = v1;
  v3._uint64_t object = (void *)((a1 - 32) | 0x8000000000000000);
  sub_10024E800(v3);
}

void sub_10020E068(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_10020E070()
{
  v2._countAndFlagsBits = 0xD000000000000010;
  v2._uint64_t object = v0;
  sub_10024E800(v2);
}

uint64_t sub_10020E090()
{
  *uint64_t v0 = 0x8000000000000000;
  return v1;
}

uint64_t sub_10020E0B8()
{
  return sub_10020554C(v0 - 160, 0x756665725F646964, 0xEA0000000000646ELL);
}

unint64_t sub_10020E0EC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(a5 + 8 * (result >> 6) + 64) |= 1 << result;
  BOOL v5 = (void *)(*(void *)(a5 + 48) + 16 * result);
  *BOOL v5 = a2;
  v5[1] = a3;
  return result;
}

void sub_10020E11C()
{
}

void sub_10020E134(uint64_t a1@<X8>)
{
  v2._countAndFlagsBits = 0xD000000000000010;
  v2._uint64_t object = (void *)((a1 - 32) | 0x8000000000000000);
  sub_10024E800(v2);
}

uint64_t sub_10020E158()
{
  return v0 - 160;
}

void sub_10020E164()
{
  v3._countAndFlagsBits = v0;
  v3._uint64_t object = v1;
  sub_10024E800(v3);
}

uint64_t sub_10020E180()
{
  sub_1000195B4(v0, 1, 1, *(void *)(v2 - 208));
  return v1;
}

void sub_10020E1BC()
{
  v1._countAndFlagsBits = 0x61726770755F7369;
  v1._uint64_t object = (void *)0xEB00000000646564;
  sub_10024E800(v1);
}

void sub_10020E1EC()
{
  v1._countAndFlagsBits = 0x6470755F7473616CLL;
  v1._uint64_t object = (void *)0xEC00000064657461;
  sub_10024E800(v1);
}

void sub_10020E21C()
{
  v1._countAndFlagsBits = 0x735F736568737570;
  v1._uint64_t object = (void *)0xEB00000000746E65;
  sub_10024E800(v1);
}

id sub_10020E24C(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  return objc_msgSend(v10, a2, a10);
}

uint64_t sub_10020E288()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10020E2A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t result = *v10;
  *uint64_t v10 = a10;
  return result;
}

char *sub_10020E2B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  return &a28;
}

void sub_10020E2E0(uint64_t a1@<X8>)
{
  v3._countAndFlagsBits = v1;
  v3._uint64_t object = (void *)((a1 - 32) | 0x8000000000000000);
  sub_10024E800(v3);
}

void sub_10020E300(uint64_t a1@<X8>)
{
  v3._countAndFlagsBits = v1;
  v3._uint64_t object = (void *)((a1 - 32) | 0x8000000000000000);
  sub_10024E800(v3);
}

void sub_10020E320(uint64_t a1@<X8>)
{
  v3._countAndFlagsBits = v1;
  v3._uint64_t object = (void *)((a1 - 32) | 0x8000000000000000);
  sub_10024E800(v3);
}

uint64_t sub_10020E340()
{
  return sub_10020554C(v0 - 160, 0x64695F726566666FLL, 0xE800000000000000);
}

BOOL sub_10020E36C()
{
  return sub_10024F630(v1 & 1, v0);
}

void sub_10020E38C()
{
  v3._countAndFlagsBits = v0;
  v3._uint64_t object = v1;
  sub_10024E800(v3);
}

void sub_10020E3A8()
{
  v1._countAndFlagsBits = 0x6F726665726F7473;
  v1._uint64_t object = (void *)0xEA0000000000746ELL;
  sub_10024E800(v1);
}

uint64_t sub_10020E3F4()
{
  return 0x645F6C65636E6163;
}

void sub_10020E414()
{
}

uint64_t sub_10020E42C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10020E444()
{
  return sub_10024DDA0();
}

id sub_10020E45C(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

void sub_10020E474()
{
  *uint64_t v0 = 0x8000000000000000;
}

double sub_10020E490(unsigned int a1)
{
  uint64_t v3 = a1 | 0x666F5F6F00000000;
  return sub_100161884(v3, 0xEB00000000726566, v1);
}

uint64_t sub_10020E4B8()
{
  return 0x797469746E617571;
}

void sub_10020E4D0()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t sub_10020E4E8()
{
  return swift_dynamicCast();
}

uint64_t sub_10020E50C()
{
  return 0x64656873696E6966;
}

id sub_10020E524()
{
  uint64_t v3 = *(const char **)(v1 + 2296);
  return [v0 v3];
}

void sub_10020E53C()
{
  sub_10024F330(35);
}

uint64_t sub_10020E560()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

void sub_10020E584()
{
  v1._countAndFlagsBits = 0x6563697270;
  v1._uint64_t object = (void *)0xE500000000000000;
  sub_10024E800(v1);
}

uint64_t sub_10020E5A8(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = a2 | 0x666F5F6F00000000;
  return sub_10020554C(a1, v3, 0xEB00000000726566);
}

unint64_t sub_10020E5EC()
{
  return sub_10011ED00();
}

uint64_t sub_10020E63C()
{
  return sub_10003F808(v1, v0);
}

void sub_10020E660(uint64_t a1@<X8>)
{
  v3._countAndFlagsBits = v1;
  v3._uint64_t object = (void *)((a1 - 32) | 0x8000000000000000);
  sub_10024E800(v3);
}

void sub_10020E680(uint64_t a1@<X8>)
{
  v3._countAndFlagsBits = v1;
  v3._uint64_t object = (void *)((a1 - 32) | 0x8000000000000000);
  sub_10024E800(v3);
}

uint64_t sub_10020E6A0()
{
  return v0 - 160;
}

BOOL sub_10020E6B4()
{
  return sub_10024F630(v0, v1);
}

id sub_10020E6D4()
{
  Swift::String v3 = *(const char **)(v1 + 2296);
  return [v0 v3];
}

void sub_10020E6EC()
{
  v1._countAndFlagsBits = 1835561773;
  v1._uint64_t object = (void *)0xE400000000000000;
  sub_10024E800(v1);
}

void sub_10020E70C()
{
  v1._countAndFlagsBits = 1818326829;
  v1._uint64_t object = (void *)0xE400000000000000;
  sub_10024E800(v1);
}

uint64_t sub_10020E72C()
{
  return 0x6574617473;
}

uint64_t NIOCloseOnErrorHandler.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t NIOCloseOnErrorHandler.errorCaught(context:error:)()
{
  return ChannelHandlerContext.close(mode:promise:)(2, 0);
}

uint64_t sub_10020E790()
{
  return NIOCloseOnErrorHandler.errorCaught(context:error:)();
}

uint64_t type metadata accessor for NIOCloseOnErrorHandler()
{
  return self;
}

ValueMetadata *type metadata accessor for OctaneKeyPair()
{
  return &type metadata for OctaneKeyPair;
}

uint64_t sub_10020E7DC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x4B65746176697270 && a2 == 0xEA00000000007965;
    if (v6 || (sub_10024FA60() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x654B63696C627570 && a2 == 0xE900000000000079)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_10024FA60();
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

uint64_t sub_10020E92C(char a1)
{
  if (!a1) {
    return 25705;
  }
  if (a1 == 1) {
    return 0x4B65746176697270;
  }
  return 0x654B63696C627570;
}

uint64_t sub_10020E980(void *a1)
{
  uint64_t v3 = sub_100019524(&qword_100319748);
  sub_10001B550();
  uint64_t v5 = v4;
  __chkstk_darwin(v6, v7);
  BOOL v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_10020EE30();
  sub_10024FD40();
  v11[15] = 0;
  sub_10024F940();
  if (!v1)
  {
    v11[14] = 1;
    sub_10024F940();
    v11[13] = 2;
    sub_10024F8D0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_10020EAE0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100019524(&qword_100319738);
  sub_10001B550();
  __chkstk_darwin(v5, v6);
  sub_10001C2A8(a1, a1[3]);
  sub_10020EE30();
  sub_10024FD20();
  if (v2) {
    return sub_10001C2EC((uint64_t)a1);
  }
  uint64_t v7 = sub_10024F830();
  uint64_t v9 = v8;
  uint64_t v22 = v7;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_10024F830();
  uint64_t v12 = v11;
  uint64_t v20 = v10;
  swift_bridgeObjectRetain();
  uint64_t v21 = v12;
  uint64_t v13 = sub_10024F7C0();
  uint64_t v15 = v14;
  uint64_t v16 = v13;
  uint64_t v17 = sub_10020F070();
  v18(v17);
  swift_bridgeObjectRetain();
  sub_10001C2EC((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v22;
  a2[1] = v9;
  a2[2] = v20;
  a2[3] = v21;
  a2[4] = v16;
  a2[5] = v15;
  return result;
}

uint64_t sub_10020ED2C()
{
  return sub_10020E92C(*v0);
}

uint64_t sub_10020ED34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10020E7DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10020ED5C(uint64_t a1)
{
  unint64_t v2 = sub_10020EE30();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10020ED98(uint64_t a1)
{
  unint64_t v2 = sub_10020EE30();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10020EDD4@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_10020EAE0(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_10020EE18(void *a1)
{
  return sub_10020E980(a1);
}

unint64_t sub_10020EE30()
{
  unint64_t result = qword_100319740;
  if (!qword_100319740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319740);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for OctaneKeyPair.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10020EF48);
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

ValueMetadata *type metadata accessor for OctaneKeyPair.CodingKeys()
{
  return &type metadata for OctaneKeyPair.CodingKeys;
}

unint64_t sub_10020EF84()
{
  unint64_t result = qword_100319750;
  if (!qword_100319750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319750);
  }
  return result;
}

unint64_t sub_10020EFD4()
{
  unint64_t result = qword_100319758;
  if (!qword_100319758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319758);
  }
  return result;
}

unint64_t sub_10020F024()
{
  unint64_t result = qword_100319760;
  if (!qword_100319760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319760);
  }
  return result;
}

uint64_t sub_10020F070()
{
  return v0;
}

uint64_t sub_10020F084(void *a1)
{
  uint64_t v3 = v1;
  sub_100019524(&qword_100319968);
  sub_10001B550();
  __chkstk_darwin(v5, v6);
  sub_10002059C();
  *(void *)(v1 + 64) = 1363432531;
  *(void *)(v1 + 72) = 0xE400000000000000;
  *(void *)(v1 + 96) = 0;
  *(void *)(v1 + 104) = 0;
  *(void *)(v1 + 120) = 0;
  *(void *)(v1 + 128) = 0;
  sub_10001C2A8(a1, a1[3]);
  sub_100210278();
  sub_10024FD20();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for OctaneIAP();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)(v1 + 16) = sub_1002105A4();
    *(void *)(v1 + 24) = v8;
    *(unsigned char *)(v1 + 32) = sub_10024F840() & 1;
    LOBYTE(v17) = 2;
    *(void *)(v1 + 40) = sub_1002105A4();
    *(void *)(v1 + 48) = v9;
    sub_100019524(&qword_1003146E0);
    sub_1002102C4(&qword_1003146E8, &qword_1003146F0);
    sub_10024F870();
    *(void *)(v1 + 56) = v17;
    *(void *)(v1 + 80) = sub_1002105A4();
    *(void *)(v1 + 88) = v10;
    *(void *)(v1 + 96) = sub_1002105C4(5);
    *(void *)(v1 + 104) = v11;
    swift_bridgeObjectRelease();
    sub_1000895C4();
    sub_10024F870();
    *(unsigned char *)(v1 + 112) = 4;
    uint64_t v12 = sub_1002105C4(7);
    uint64_t v14 = v13;
    uint64_t v15 = sub_100027AC4();
    v16(v15);
    *(void *)(v3 + 120) = v12;
    *(void *)(v3 + 128) = v14;
    swift_bridgeObjectRelease();
  }
  sub_10001C2EC((uint64_t)a1);
  return v3;
}

uint64_t sub_10020F404(void *a1)
{
  uint64_t v2 = v1;
  sub_100019524(&qword_100319978);
  sub_10001B550();
  __chkstk_darwin(v4, v5);
  sub_10002059C();
  sub_10001C2A8(a1, a1[3]);
  sub_100210278();
  sub_10024FD40();
  uint64_t v6 = v2[2];
  swift_bridgeObjectRetain();
  sub_10021057C();
  if (v6) {
    goto LABEL_2;
  }
  swift_bridgeObjectRelease();
  sub_10024F950();
  uint64_t v10 = v2[5];
  swift_bridgeObjectRetain();
  sub_10021057C();
  if (v10
    || (swift_bridgeObjectRelease(),
        sub_100019524(&qword_1003146E0),
        sub_1002102C4(&qword_100314718, &qword_100314720),
        sub_10024F980(),
        uint64_t v11 = v2[10],
        swift_bridgeObjectRetain(),
        sub_10021057C(),
        v11))
  {
LABEL_2:
    uint64_t v7 = sub_1002105E8();
    v8(v7);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_10024F8D0();
    swift_bridgeObjectRelease();
    sub_100089878();
    sub_10024F980();
    swift_bridgeObjectRetain();
    sub_10024F8D0();
    uint64_t v12 = sub_1002105E8();
    v13(v12);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_10020F6E4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10020F734()
{
  unint64_t v1 = v0[13];
  if (!v1) {
    goto LABEL_5;
  }
  uint64_t v2 = v0[12];
  uint64_t v3 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v3 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3) {
LABEL_5:
  }
    uint64_t v2 = v0[10];
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_10020F78C()
{
  uint64_t v0 = sub_100019524(&qword_10030B090);
  __chkstk_darwin(v0 - 8, v1);
  sub_10002059C();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = sub_10024E0F0();
  sub_1000195B4(v4, 1, 1, v5);
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_10024EFC0();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  sub_100097FE4(v4);
  if ((v8 & 0x100000000) != 0)
  {
    sub_10024EF80(v9, 0.0);
    return v10;
  }
  return v6;
}

uint64_t sub_10020F874()
{
  uint64_t result = sub_100210600();
  switch(v1)
  {
    case 1:
      uint64_t result = 0x75736E6F436E6F4ELL;
      break;
    case 2:
      uint64_t result = 0xD000000000000017;
      break;
    case 3:
      uint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10020F910(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1002D5838;
  v6._uint64_t object = a2;
  unint64_t v4 = sub_10024F790(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_10020F95C(unsigned __int8 *a1, char *a2)
{
  return sub_1000F8360(*a1, *a2);
}

Swift::Int sub_10020F968()
{
  return sub_1001D3C94(*v0);
}

uint64_t sub_10020F970(uint64_t a1)
{
  return sub_1000D20B8(a1, *v1);
}

Swift::Int sub_10020F978(uint64_t a1)
{
  return sub_1000D381C(a1, *v1);
}

uint64_t sub_10020F980@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10020F910(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10020F9B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10020F874();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10020F9DC()
{
  return sub_10024EA50();
}

uint64_t sub_10020FA3C()
{
  return sub_10024EA00();
}

uint64_t sub_10020FA8C()
{
  uint64_t result = sub_100210600();
  switch(v1)
  {
    case 1:
      uint64_t result = 0x736E6F432D6E6F4ELL;
      break;
    case 2:
      uint64_t result = 0xD000000000000019;
      break;
    case 3:
      uint64_t result = 0xD00000000000001BLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10020FB28()
{
  return sub_10020FA8C();
}

uint64_t sub_10020FB30()
{
  sub_10020F6E4();
  return _swift_deallocClassInstance(v0, 136, 7);
}

uint64_t type metadata accessor for OctaneIAP()
{
  return self;
}

uint64_t sub_10020FB88(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_10020F084(a1);
  return v2;
}

unsigned char *storeEnumTagSinglePayload for OctaneIAPType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10020FCA4);
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

ValueMetadata *type metadata accessor for OctaneIAPType()
{
  return &type metadata for OctaneIAPType;
}

unint64_t sub_10020FCE0()
{
  unint64_t result = qword_100319958;
  if (!qword_100319958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319958);
  }
  return result;
}

uint64_t sub_10020FD2C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1002DA170;
  v6._uint64_t object = a2;
  unint64_t v4 = sub_10024F790(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 8) {
    return 8;
  }
  else {
    return v4;
  }
}

unint64_t sub_10020FD7C(char a1)
{
  unint64_t result = 0x5079616C70736964;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6853796C696D6166;
      break;
    case 2:
      unint64_t result = 0x6C616E7265746E69;
      break;
    case 3:
      unint64_t result = 0x617A696C61636F6CLL;
      break;
    case 4:
      unint64_t result = 0x49746375646F7270;
      break;
    case 5:
      unint64_t result = 0x636E657265666572;
      break;
    case 6:
      unint64_t result = 1701869940;
      break;
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10020FEB0(char a1)
{
  unint64_t result = 0x5079616C70736964;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6853796C696D6166;
      break;
    case 2:
      unint64_t result = 0x6C616E7265746E69;
      break;
    case 3:
      unint64_t result = 0x617A696C61636F6CLL;
      break;
    case 4:
      unint64_t result = 0x49746375646F7270;
      break;
    case 5:
      unint64_t result = 0x636E657265666572;
      break;
    case 6:
      unint64_t result = 1701869940;
      break;
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10020FFE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 424))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_100210020()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 416))();
}

uint64_t sub_10021006C(unsigned __int8 *a1, char *a2)
{
  return sub_1000F84F4(*a1, *a2);
}

Swift::Int sub_100210078()
{
  return sub_1001D3CAC(*v0);
}

uint64_t sub_100210080(uint64_t a1)
{
  return sub_1000D058C(a1, *v1);
}

Swift::Int sub_100210088(uint64_t a1)
{
  return sub_1000D2A68(a1, *v1);
}

uint64_t sub_100210090@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10020FD2C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1002100C0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10020FD7C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1002100EC()
{
  return sub_10020FEB0(*v0);
}

uint64_t sub_1002100F4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10020FD78();
  *a1 = result;
  return result;
}

uint64_t sub_10021011C(uint64_t a1)
{
  unint64_t v2 = sub_100210278();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100210158(uint64_t a1)
{
  unint64_t v2 = sub_100210278();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100210194(uint64_t a1, uint64_t a2)
{
  if ((sub_1000F8360(*(unsigned char *)(a1 + 112), *(unsigned char *)(a2 + 112)) & 1) == 0) {
    return 0;
  }
  if (*(void *)(a1 + 40) == *(void *)(a2 + 40) && *(void *)(a1 + 48) == *(void *)(a2 + 48)) {
    return 1;
  }
  return sub_10024FA60();
}

uint64_t sub_100210208(uint64_t *a1, uint64_t *a2)
{
  return sub_100210194(*a1, *a2) & 1;
}

unint64_t sub_10021022C()
{
  unint64_t result = qword_100319960;
  if (!qword_100319960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319960);
  }
  return result;
}

unint64_t sub_100210278()
{
  unint64_t result = qword_100319970;
  if (!qword_100319970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319970);
  }
  return result;
}

uint64_t sub_1002102C4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001B028(&qword_1003146E0);
    sub_100210344(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100210344(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for OctaneLocalization();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for OctaneIAP.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x100210454);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OctaneIAP.CodingKeys()
{
  return &type metadata for OctaneIAP.CodingKeys;
}

unint64_t sub_100210490()
{
  unint64_t result = qword_100319980;
  if (!qword_100319980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319980);
  }
  return result;
}

unint64_t sub_1002104E0()
{
  unint64_t result = qword_100319988;
  if (!qword_100319988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319988);
  }
  return result;
}

unint64_t sub_100210530()
{
  unint64_t result = qword_100319990;
  if (!qword_100319990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319990);
  }
  return result;
}

uint64_t sub_10021057C()
{
  return sub_10024F940();
}

uint64_t sub_1002105A4()
{
  return sub_10024F830();
}

uint64_t sub_1002105C4@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
  return sub_10024F7C0();
}

uint64_t sub_1002105E8()
{
  return v0;
}

uint64_t sub_100210600()
{
  return 0x62616D75736E6F43;
}

void sub_100210624()
{
  sub_100056270(v0, (uint64_t)v18);
  sub_100056270((uint64_t)v18, (uint64_t)v19);
  uint64_t v1 = v20;
  if (!v20) {
    return;
  }
  sub_1001A6188();
  if (!v3) {
    return;
  }
  if ((v1 & 0x1000000000000000) != 0)
  {
    sub_1000562D8((uint64_t)v18);
    sub_1001A4F88(v0, v1, 10);
    sub_1001A4FA0((uint64_t)v18);
    return;
  }
  if ((v1 & 0x2000000000000000) == 0)
  {
    if ((v0 & 0x1000000000000000) != 0) {
      unsigned int v4 = (unsigned __int8 *)((v1 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      unsigned int v4 = (unsigned __int8 *)sub_10024F3E0();
    }
    sub_1001A4F58(v4, v2);
    return;
  }
  sub_1001B4684();
  if (v7)
  {
    if (!v5) {
      goto LABEL_58;
    }
    if (v5 != 1)
    {
      sub_1001B45E0();
      if (!(!v7 & v9) && v10 != 2)
      {
        sub_1001A6038();
        if (!(!v7 & v9))
        {
          sub_1001A6108();
          if (!v7)
          {
            sub_1001A6074();
            do
            {
              sub_100028C7C();
              if (!v7 & v9) {
                break;
              }
              sub_1001A6024();
              if (!v7) {
                break;
              }
              if (__OFADD__(v12, v11)) {
                break;
              }
              sub_100067DE4();
            }
            while (!v7);
          }
        }
      }
    }
  }
  else
  {
    if (v6 == 45)
    {
      if (v5)
      {
        if (v5 != 1)
        {
          sub_1001B45E0();
          if (!(!v7 & v9) && v8 != 2)
          {
            sub_1001A60F4();
            if (!(!v7 & v9))
            {
              sub_1001A60DC();
              if (!v7)
              {
                sub_1001A6074();
                do
                {
                  sub_100028C7C();
                  if (!v7 & v9) {
                    break;
                  }
                  sub_1001A6024();
                  if (!v7) {
                    break;
                  }
                  if (__OFSUB__(v17, v16)) {
                    break;
                  }
                  sub_100067DE4();
                }
                while (!v7);
              }
            }
          }
        }
        return;
      }
      __break(1u);
LABEL_58:
      __break(1u);
      return;
    }
    if (v5)
    {
      sub_1001A6038();
      if (!(!v7 & v9) && v13 != 1)
      {
        sub_1001B45E0();
        if (!(!v7 & v9))
        {
          sub_1001A611C();
          while (!v7)
          {
            sub_100028C7C();
            if (!v7 & v9) {
              break;
            }
            sub_1001A6024();
            if (!v7) {
              break;
            }
            if (__OFADD__(v15, v14)) {
              break;
            }
            sub_100067DE4();
          }
        }
      }
    }
  }
}

void sub_100210840()
{
  sub_100056270(v0 + 16, (uint64_t)v18);
  sub_100056270((uint64_t)v18, (uint64_t)v19);
  uint64_t v1 = v20;
  if (!v20) {
    return;
  }
  sub_1001A6188();
  if (!v3) {
    return;
  }
  if ((v1 & 0x1000000000000000) != 0)
  {
    sub_1000562D8((uint64_t)v18);
    sub_1001A4F88(v0, v1, 10);
    sub_1001A4FA0((uint64_t)v18);
    return;
  }
  if ((v1 & 0x2000000000000000) == 0)
  {
    if ((v0 & 0x1000000000000000) != 0) {
      unsigned int v4 = (unsigned __int8 *)((v1 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      unsigned int v4 = (unsigned __int8 *)sub_10024F3E0();
    }
    sub_1001A4F58(v4, v2);
    return;
  }
  sub_1001B4684();
  if (v7)
  {
    if (!v5) {
      goto LABEL_58;
    }
    if (v5 != 1)
    {
      sub_1001B45E0();
      if (!(!v7 & v9) && v10 != 2)
      {
        sub_1001A6038();
        if (!(!v7 & v9))
        {
          sub_1001A6108();
          if (!v7)
          {
            sub_1001A6074();
            do
            {
              sub_100028C7C();
              if (!v7 & v9) {
                break;
              }
              sub_1001A6024();
              if (!v7) {
                break;
              }
              if (__OFADD__(v12, v11)) {
                break;
              }
              sub_100067DE4();
            }
            while (!v7);
          }
        }
      }
    }
  }
  else
  {
    if (v6 == 45)
    {
      if (v5)
      {
        if (v5 != 1)
        {
          sub_1001B45E0();
          if (!(!v7 & v9) && v8 != 2)
          {
            sub_1001A60F4();
            if (!(!v7 & v9))
            {
              sub_1001A60DC();
              if (!v7)
              {
                sub_1001A6074();
                do
                {
                  sub_100028C7C();
                  if (!v7 & v9) {
                    break;
                  }
                  sub_1001A6024();
                  if (!v7) {
                    break;
                  }
                  if (__OFSUB__(v17, v16)) {
                    break;
                  }
                  sub_100067DE4();
                }
                while (!v7);
              }
            }
          }
        }
        return;
      }
      __break(1u);
LABEL_58:
      __break(1u);
      return;
    }
    if (v5)
    {
      sub_1001A6038();
      if (!(!v7 & v9) && v13 != 1)
      {
        sub_1001B45E0();
        if (!(!v7 & v9))
        {
          sub_1001A611C();
          while (!v7)
          {
            sub_100028C7C();
            if (!v7 & v9) {
              break;
            }
            sub_1001A6024();
            if (!v7) {
              break;
            }
            if (__OFADD__(v15, v14)) {
              break;
            }
            sub_100067DE4();
          }
        }
      }
    }
  }
}

uint64_t sub_100210A5C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1002DA250;
  v6._uint64_t object = a2;
  unint64_t v4 = sub_10024F790(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_100210AAC(char a1)
{
  uint64_t result = 1684632420;
  switch(a1)
  {
    case 1:
      uint64_t result = sub_10006211C();
      break;
    case 2:
      uint64_t result = sub_100062138();
      break;
    case 3:
      uint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100210B14(char a1)
{
  uint64_t result = 1684632420;
  switch(a1)
  {
    case 1:
      uint64_t result = sub_10006211C();
      break;
    case 2:
      uint64_t result = sub_100062138();
      break;
    case 3:
      uint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100210B7C(void *a1)
{
  uint64_t v3 = sub_100019524(&qword_1003199A8);
  sub_10001B550();
  uint64_t v5 = v4;
  __chkstk_darwin(v6, v7);
  char v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_100211218();
  sub_10024FD40();
  v11[15] = 0;
  sub_10024F8D0();
  if (!v1)
  {
    v11[14] = 1;
    sub_10024F8D0();
    v11[13] = 2;
    sub_10024F940();
    v11[12] = 3;
    sub_10024F940();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_100210D04@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100019524(&qword_100319998);
  sub_10001B550();
  __chkstk_darwin(v5, v6);
  sub_10001C2A8(a1, a1[3]);
  sub_100211218();
  sub_10024FD20();
  if (v2) {
    return sub_10001C2EC((uint64_t)a1);
  }
  uint64_t v7 = sub_10024F7C0();
  uint64_t v9 = v8;
  uint64_t v23 = v7;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_10024F7C0();
  uint64_t v24 = v11;
  uint64_t v22 = v10;
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_10024F830();
  uint64_t v21 = v12;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_10024F830();
  uint64_t v15 = v14;
  uint64_t v19 = v13;
  uint64_t v16 = sub_1001882BC();
  v17(v16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001C2EC((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v23;
  a2[1] = v9;
  a2[2] = v22;
  a2[3] = v24;
  a2[4] = v20;
  a2[5] = v21;
  a2[6] = v19;
  a2[7] = v15;
  return result;
}

uint64_t sub_100210FF4()
{
  return sub_1000FB1F8();
}

Swift::Int sub_100211000()
{
  return sub_1001D3CC4(*v0);
}

uint64_t sub_100211008()
{
  return sub_1000D2030();
}

Swift::Int sub_100211010(uint64_t a1)
{
  return sub_1000D3804(a1, *v1);
}

uint64_t sub_100211018@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100210A5C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100211048@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100210AAC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100211074()
{
  return sub_100210B14(*v0);
}

uint64_t sub_10021107C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100210AA8();
  *a1 = result;
  return result;
}

uint64_t sub_1002110A4(uint64_t a1)
{
  unint64_t v2 = sub_100211218();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002110E0(uint64_t a1)
{
  unint64_t v2 = sub_100211218();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10021111C@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_100210D04(a1, (uint64_t *)v7);
  if (!v2)
  {
    long long v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    long long v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t sub_100211160(void *a1)
{
  return sub_100210B7C(a1);
}

uint64_t getEnumTagSinglePayload for StatusRequest(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
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

uint64_t storeEnumTagSinglePayload for StatusRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusRequest()
{
  return &type metadata for StatusRequest;
}

unint64_t sub_100211218()
{
  unint64_t result = qword_1003199A0;
  if (!qword_1003199A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003199A0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for StatusRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100211330);
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

ValueMetadata *type metadata accessor for StatusRequest.CodingKeys()
{
  return &type metadata for StatusRequest.CodingKeys;
}

unint64_t sub_10021136C()
{
  unint64_t result = qword_1003199B0;
  if (!qword_1003199B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003199B0);
  }
  return result;
}

unint64_t sub_1002113BC()
{
  unint64_t result = qword_1003199B8;
  if (!qword_1003199B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003199B8);
  }
  return result;
}

unint64_t sub_10021140C()
{
  unint64_t result = qword_1003199C0;
  if (!qword_1003199C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1003199C0);
  }
  return result;
}

uint64_t sub_100211458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(*(void *)v4 + 88) + 72))(a1, a2, a3, a4, *(void *)(*(void *)v4 + 80));
}

uint64_t sub_1002114CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(*(void *)v3 + 88) + 80))(a1, a2, a3, *(void *)(*(void *)v3 + 80));
}

uint64_t sub_100211544(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDWORD(v35) = a1;
  uint64_t v8 = *v4;
  sub_10002F9C8();
  uint64_t v10 = v9;
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v13, v14);
  sub_10002A0B0();
  uint64_t v16 = v15;
  uint64_t ObjectType = swift_getObjectType();
  LOBYTE(v16) = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(ObjectType, v16);
  swift_unknownObjectRelease();
  sub_10002A0B0();
  if (v16)
  {
    uint64_t v19 = v18;
    uint64_t v20 = swift_getObjectType();
    uint64_t v21 = EventLoop.makePromise<A>(of:file:line:)((uint64_t)&type metadata for ()[8], (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StoreKit/ASOctaneSupportXPCService/Octane Server/SwiftNIO/BaseSocketChannel+SocketOptionProvider.swift", 140, 2, 24, v20, (uint64_t)&type metadata for ()[8], v19);
    swift_unknownObjectRelease();
    swift_retain();
    sub_100211458(HIDWORD(v35), a2, a3, a4);
    sub_1000B44D0(0, 0, v21, v27, v28, v29, v30, v31, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43,
      v44,
      v45,
      v46);
  }
  else
  {
    uint64_t v33 = v18;
    uint64_t v34 = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a3, a4);
    int v22 = a2;
    unint64_t v23 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = *(void *)(v8 + 80);
    *(void *)(v24 + 24) = a4;
    *(void *)(v24 + 32) = *(void *)(v8 + 88);
    *(void *)(v24 + 40) = v4;
    *(_DWORD *)(v24 + 48) = HIDWORD(v35);
    *(_DWORD *)(v24 + 52) = v22;
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v24 + v23, (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
    uint64_t v25 = v33;
    id v26 = *(uint64_t (**)(uint64_t (*)(), uint64_t, char *, uint64_t, uint64_t))(v33 + 32);
    swift_retain();
    uint64_t v21 = v26(sub_100211B50, v24, &type metadata for ()[8], v34, v25);
    swift_unknownObjectRelease();
  }
  swift_release();
  return v21;
}

uint64_t sub_1002117F8(int a1, int a2, uint64_t a3)
{
  sub_10002A0B0();
  uint64_t v8 = v7;
  uint64_t ObjectType = swift_getObjectType();
  char v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(ObjectType, v8);
  swift_unknownObjectRelease();
  sub_10002A0B0();
  uint64_t v12 = v11;
  uint64_t v13 = swift_getObjectType();
  if (v10)
  {
    uint64_t v14 = EventLoop.makePromise<A>(of:file:line:)(a3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StoreKit/ASOctaneSupportXPCService/Octane Server/SwiftNIO/BaseSocketChannel+SocketOptionProvider.swift", 140, 2, 44, v13, a3, v12);
    uint64_t v15 = swift_unknownObjectRelease();
    __chkstk_darwin(v15, v16);
    uint64_t v17 = swift_retain();
    sub_10002B4D4(v17);
    swift_release();
    return v14;
  }
  else
  {
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = a3;
    *(void *)(v19 + 24) = v3;
    *(_DWORD *)(v19 + 32) = a1;
    *(_DWORD *)(v19 + 36) = a2;
    uint64_t v20 = *(uint64_t (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 32);
    swift_retain();
    uint64_t v21 = v20(sub_100211A6C, v19, a3, v13, v12);
    swift_unknownObjectRelease();
    swift_release();
    return v21;
  }
}

uint64_t sub_1002119A4()
{
  return sub_100211540();
}

uint64_t sub_1002119C8(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100211544(a1, a2, a3, a4);
}

uint64_t sub_1002119EC()
{
  return sub_1002117F4();
}

uint64_t sub_100211A10(int a1, int a2, uint64_t a3)
{
  return sub_1002117F8(a1, a2, a3);
}

uint64_t sub_100211A34()
{
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100211A6C()
{
  return sub_100211A84();
}

uint64_t sub_100211A84()
{
  return sub_1002114CC(*(unsigned int *)(v0 + 32), *(unsigned int *)(v0 + 36), *(void *)(v0 + 16));
}

uint64_t sub_100211AB0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_10002F9C8();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 56) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return _swift_deallocObject(v0, v8, v9);
}

uint64_t sub_100211B50()
{
  return sub_100211458(*(unsigned int *)(v0 + 48), *(unsigned int *)(v0 + 52), v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 24) - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 24) - 8) + 80)), *(void *)(v0 + 24));
}

uint64_t destroy for HTTPRequest(uint64_t a1)
{
  if (*(void *)(a1 + 8) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 72))
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HTTPRequest(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 >= 2)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 72);
  swift_unknownObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v6)
  {
    uint64_t v7 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v7;
    *(void *)(a1 + 72) = v6;
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
    *(_DWORD *)(a1 + 91) = *(_DWORD *)(a2 + 91);
    swift_bridgeObjectRetain();
    swift_retain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v8;
    *(void *)(a1 + 87) = *(void *)(a2 + 87);
  }
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTTPRequest(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 8) < 2uLL)
  {
    if (v4 >= 2)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v4 < 2)
  {
    sub_100211F10(a1);
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = (_OWORD *)(a1 + 56);
  uint64_t v7 = (_OWORD *)(a2 + 56);
  uint64_t v8 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72))
  {
    if (v8)
    {
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      swift_retain();
      swift_release();
      *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
      *(_DWORD *)(a1 + 84) = *(_DWORD *)(a2 + 84);
      *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
      *(_WORD *)(a1 + 92) = *(_WORD *)(a2 + 92);
      *(unsigned char *)(a1 + 94) = *(unsigned char *)(a2 + 94);
    }
    else
    {
      sub_100162B60(a1 + 56);
      uint64_t v10 = *(void *)(a2 + 87);
      long long v11 = *(_OWORD *)(a2 + 72);
      *uint64_t v6 = *v7;
      *(_OWORD *)(a1 + 72) = v11;
      *(void *)(a1 + 87) = v10;
    }
  }
  else if (v8)
  {
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
    *(_DWORD *)(a1 + 84) = *(_DWORD *)(a2 + 84);
    int v9 = *(_DWORD *)(a2 + 88);
    *(_DWORD *)(a1 + 91) = *(_DWORD *)(a2 + 91);
    *(_DWORD *)(a1 + 88) = v9;
    swift_bridgeObjectRetain();
    swift_retain();
  }
  else
  {
    long long v12 = *v7;
    long long v13 = *(_OWORD *)(a2 + 72);
    *(void *)(a1 + 87) = *(void *)(a2 + 87);
    *uint64_t v6 = v12;
    *(_OWORD *)(a1 + 72) = v13;
  }
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100211F10(uint64_t a1)
{
  return a1;
}

uint64_t assignWithTake for HTTPRequest(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 2uLL) {
    goto LABEL_4;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 2)
  {
    sub_100211F10(a1);
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_6;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
LABEL_6:
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  if (!*(void *)(a1 + 72))
  {
LABEL_10:
    long long v7 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v7;
    *(void *)(a1 + 87) = *(void *)(a2 + 87);
    goto LABEL_11;
  }
  uint64_t v5 = *(void *)(a2 + 72);
  if (!v5)
  {
    sub_100162B60(a1 + 56);
    goto LABEL_10;
  }
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = v5;
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_WORD *)(a1 + 92) = *(_WORD *)(a2 + 92);
  *(unsigned char *)(a1 + 94) = *(unsigned char *)(a2 + 94);
LABEL_11:
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPRequest(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 104))
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

uint64_t storeEnumTagSinglePayload for HTTPRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPRequest()
{
  return &type metadata for HTTPRequest;
}

uint64_t sub_100212134()
{
  uint64_t v0 = sub_10024DB00();
  sub_10002F9C8();
  uint64_t v2 = v1;
  __chkstk_darwin(v3, v4);
  Swift::String v57 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100019524(&qword_100313A28);
  uint64_t v8 = __chkstk_darwin(v6 - 8, v7);
  uint64_t v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  long long v13 = (char *)&v54 - v12;
  swift_bridgeObjectRetain();
  sub_10024DB40();
  swift_bridgeObjectRelease();
  sub_1001E620C((uint64_t)v13, (uint64_t)v10);
  uint64_t v14 = sub_10024DB50();
  if (sub_10001FA0C((uint64_t)v10, 1, v14) == 1)
  {
    sub_1001E6274((uint64_t)v10);
LABEL_22:
    uint64_t v16 = (void *)sub_10024E510();
    sub_1001E6274((uint64_t)v13);
    return (uint64_t)v16;
  }
  uint64_t v15 = sub_10024DB10();
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v10, v14);
  if (!v15) {
    goto LABEL_22;
  }
  uint64_t v16 = (void *)sub_10024E510();
  uint64_t v17 = *(void *)(v15 + 16);
  if (!v17)
  {
LABEL_21:
    sub_1001E6274((uint64_t)v13);
    swift_bridgeObjectRelease();
    return (uint64_t)v16;
  }
  uint64_t v54 = v15;
  Swift::String v55 = v13;
  uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
  uint64_t v18 = v2 + 16;
  unint64_t v20 = v15 + ((*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64));
  Swift::String v59 = (void (**)(char *, uint64_t))(v18 - 8);
  Swift::String v60 = v19;
  uint64_t v61 = v18;
  uint64_t v58 = *(void *)(v18 + 56);
  swift_bridgeObjectRetain();
  uint64_t v56 = v0;
  uint64_t v21 = v57;
  while (1)
  {
    v60(v21, v20, v0);
    uint64_t v22 = sub_10024DAE0();
    uint64_t v24 = v23;
    uint64_t v25 = sub_10024DAF0();
    if (!v26)
    {
      swift_bridgeObjectRetain();
      sub_10011ED00();
      char v43 = v42;
      swift_bridgeObjectRelease();
      if (v43)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v63 = v16;
        Swift::Int v45 = v16[3];
        sub_100019524(&qword_10030AA40);
        Swift::Bool v46 = isUniquelyReferenced_nonNull_native;
        Swift::Int v47 = v45;
        uint64_t v0 = v56;
        uint64_t v21 = v57;
        sub_10024F630(v46, v47);
        uint64_t v16 = v63;
        swift_bridgeObjectRelease();
        sub_10024F650();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    uint64_t v27 = v26;
    uint64_t v62 = v17;
    uint64_t v28 = v25;
    char v29 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v63 = v16;
    uint64_t v30 = v24;
    unint64_t v31 = sub_10011ED00();
    uint64_t v33 = v16[2];
    BOOL v34 = (v32 & 1) == 0;
    Swift::Int v35 = v33 + v34;
    if (__OFADD__(v33, v34)) {
      break;
    }
    unint64_t v36 = v31;
    char v37 = v32;
    sub_100019524(&qword_10030AA40);
    BOOL v38 = sub_10024F630(v29, v35);
    uint64_t v0 = v56;
    if (v38)
    {
      unint64_t v39 = sub_10011ED00();
      if ((v37 & 1) != (v40 & 1)) {
        goto LABEL_26;
      }
      unint64_t v36 = v39;
    }
    uint64_t v16 = v63;
    if (v37)
    {
      uint64_t v41 = (uint64_t *)(v63[7] + 16 * v36);
      swift_bridgeObjectRelease();
      *uint64_t v41 = v28;
      v41[1] = v27;
    }
    else
    {
      v63[(v36 >> 6) + 8] |= 1 << v36;
      Swift::String v48 = (uint64_t *)(v16[6] + 16 * v36);
      uint64_t *v48 = v22;
      v48[1] = v30;
      Swift::String v49 = (uint64_t *)(v16[7] + 16 * v36);
      *Swift::String v49 = v28;
      v49[1] = v27;
      uint64_t v50 = v16[2];
      BOOL v51 = __OFADD__(v50, 1);
      uint64_t v52 = v50 + 1;
      if (v51) {
        goto LABEL_25;
      }
      v16[2] = v52;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = v57;
    uint64_t v17 = v62;
LABEL_19:
    (*v59)(v21, v0);
    v20 += v58;
    if (!--v17)
    {
      swift_bridgeObjectRelease();
      long long v13 = v55;
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  uint64_t result = sub_10024FB70();
  __break(1u);
  return result;
}

uint64_t sub_1002125F8()
{
  v0._uint64_t object = (void *)0x800000010027E0F0;
  v0._countAndFlagsBits = 0xD00000000000001FLL;
  Swift::String_optional v2 = HTTPHeaders.first(name:)(v0);
  uint64_t result = v2.value._countAndFlagsBits;
  if (!v2.value._object) {
    return 3157553;
  }
  return result;
}

uint64_t sub_100212648@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v17 = sub_10024E510();
  if (a6) {
    uint64_t v18 = a7;
  }
  else {
    uint64_t v18 = 0;
  }
  if (a6) {
    uint64_t v19 = a8;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v26 = v17;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100212D1C();
  swift_retain();
  v20._countAndFlagsBits = 0x2D746E65746E6F43;
  v20._uint64_t object = (void *)0xEC00000065707954;
  if ((unint64_t)HTTPHeaders.first(name:)(v20).value._object)
  {
    uint64_t v21 = sub_100212828();
    unint64_t v23 = v22;
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v21 = 0;
    unint64_t v23 = 1;
  }
  sub_100065924(v21, v23);
  sub_100065924(v21, v23);
  swift_unknownObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100212D1C();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100212D40();
  sub_100045854(v21, v23);
  sub_100045854(v21, v23);
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  sub_100212D40();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a9 = v21;
  *(void *)(a9 + 8) = v23;
  *(void *)(a9 + 16) = a1;
  *(void *)(a9 + 24) = a2;
  *(void *)(a9 + 32) = a3;
  *(void *)(a9 + 40) = a4;
  *(unsigned char *)(a9 + 48) = a5;
  *(void *)(a9 + 56) = 0;
  *(void *)(a9 + 64) = 0;
  *(void *)(a9 + 72) = a6;
  *(void *)(a9 + 80) = v18;
  *(unsigned char *)(a9 + 94) = BYTE6(v19);
  *(_WORD *)(a9 + 92) = WORD2(v19);
  *(_DWORD *)(a9 + 88) = v19;
  *(void *)(a9 + 96) = v26;
  return result;
}

uint64_t sub_100212828()
{
  uint64_t v0 = sub_10024E710();
  swift_bridgeObjectRelease();
  v2._uint64_t object = (void *)0x8000000100278C80;
  v2._countAndFlagsBits = 0xD000000000000010;
  if (sub_10024E8B0(v2)
    || (v3._countAndFlagsBits = 0xD000000000000019, v3._uint64_t object = (void *)0x8000000100284E30, sub_10024E8B0(v3)))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v0;
}

uint64_t sub_1002128E4(uint64_t a1, uint64_t a2)
{
  return sub_10021298C(a1, a2, (void (*)(void))&type metadata accessor for JSONEncoder, (void (*)(void))&JSONEncoder.init(), (uint64_t (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of JSONEncoder.encode<A>(_:));
}

uint64_t sub_100212938(uint64_t a1, uint64_t a2)
{
  return sub_10021298C(a1, a2, (void (*)(void))&type metadata accessor for PropertyListEncoder, (void (*)(void))&PropertyListEncoder.init(), (uint64_t (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of PropertyListEncoder.encode<A>(_:));
}

uint64_t sub_10021298C(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  a3(0);
  swift_allocObject();
  a4();
  uint64_t v10 = a5(v5, a1, a2);
  swift_release();
  return v10;
}

double sub_100212A38@<D0>(__n128 *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  sub_10002F9C8();
  uint64_t v9 = v8;
  __chkstk_darwin(v10, v11);
  long long v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v13);
  sub_1001C1594(a1, &v26);
  sub_1001C1594(&v26, &v27);
  if (v27.n128_u64[1])
  {
    sub_10021298C(a2, a3, (void (*)(void))&type metadata accessor for PropertyListEncoder, (void (*)(void))&PropertyListEncoder.init(), (uint64_t (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of PropertyListEncoder.encode<A>(_:));
    sub_100212D64();
  }
  else
  {
    sub_10021298C(a2, a3, (void (*)(void))&type metadata accessor for JSONEncoder, (void (*)(void))&JSONEncoder.init(), (uint64_t (*)(uint64_t, uint64_t, uint64_t))&dispatch thunk of JSONEncoder.encode<A>(_:));
    sub_100212D64();
    uint64_t v16 = 0xD000000000000010;
  }
  sub_1000CBAF8(v14, v15, v16, v17, v18);
  uint64_t v19 = MEMORY[0x10];
  int v20 = MEMORY[0x20];
  __int16 v21 = MEMORY[0x24];
  char v22 = MEMORY[0x26];
  *(_OWORD *)uint64_t v25 = MEMORY[0];
  uint64_t v23 = MEMORY[0x18];
  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, a2);
  double result = v25[0];
  *(_OWORD *)a4 = *(_OWORD *)v25;
  *(void *)(a4 + 16) = v19;
  *(void *)(a4 + 24) = v23;
  *(_DWORD *)(a4 + 32) = v20;
  *(_WORD *)(a4 + 36) = v21;
  *(unsigned char *)(a4 + 38) = v22;
  return result;
}

uint64_t getEnumTagSinglePayload for HTTPContentType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HTTPContentType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)double result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)double result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPContentType()
{
  return &type metadata for HTTPContentType;
}

uint64_t sub_100212D1C()
{
  return sub_100065938(0, 0, v0);
}

uint64_t sub_100212D40()
{
  return sub_100045868(0, 0, v0);
}

uint64_t sub_100212D78(uint64_t a1)
{
  char v3 = 23;
  sub_1000AC21C();
  return sub_100212E84(a1, (uint64_t)&v3);
}

uint64_t sub_100212DDC(uint64_t a1)
{
  sub_10024F2E0();
  uint64_t v2 = sub_100212E84(a1, (uint64_t)v4);
  sub_10003F6F4((uint64_t)v4);
  return v2;
}

uint64_t sub_100212E84(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = __chkstk_darwin(a1, a2);
  (*(void (**)(char *))(v3 + 16))((char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_bridgeObjectRetain();
  sub_10024DF80();
  v6[4] = &type metadata for Double;
  v6[1] = v4;
  sub_10024E530();
  sub_10024E540();
  return v7;
}

uint64_t getEnumTagSinglePayload for OctaneSubscriptionPeriod(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFA && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 249;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      BOOL v4 = v3 >= 7;
      int v2 = v3 - 7;
      if (!v4) {
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

uint64_t storeEnumTagSinglePayload for OctaneSubscriptionPeriod(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)double result = a2 - 250;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 6;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OctaneSubscriptionPeriod()
{
  return &type metadata for OctaneSubscriptionPeriod;
}

uint64_t sub_100213024(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_10024DA50();
  sub_10001B550();
  uint64_t v6 = v5;
  uint64_t v9 = __chkstk_darwin(v7, v8);
  uint64_t v11 = (char *)v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v12);
  uint64_t v14 = (char *)v80 - v13;
  uint64_t v81 = a1;
  uint64_t v82 = a2;
  v80[2] = 32;
  v80[3] = 0xE100000000000000;
  sub_10001DAC0();
  uint64_t v15 = sub_10024F190();
  if (v15)
  {
    uint64_t v81 = 32;
    uint64_t v82 = 0xE100000000000000;
    __chkstk_darwin(v15, v16);
    v80[-2] = &v81;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1001DCA88(0x7FFFFFFFFFFFFFFFLL, 1u, sub_100081864, (uint64_t)&v80[-4], a1, a2);
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void *)(v17 + 16);
    if (v18)
    {
      uint64_t v81 = (uint64_t)_swiftEmptyArrayStorage;
      sub_1000389BC();
      uint64_t v19 = (void *)v81;
      uint64_t v20 = v17 + 56;
      do
      {
        swift_bridgeObjectRetain();
        uint64_t v21 = sub_10024E740();
        uint64_t v23 = v22;
        swift_bridgeObjectRelease();
        uint64_t v81 = (uint64_t)v19;
        unint64_t v24 = v19[2];
        if (v24 >= v19[3] >> 1)
        {
          sub_1000389BC();
          uint64_t v19 = (void *)v81;
        }
        v19[2] = v24 + 1;
        uint64_t v25 = &v19[2 * v24];
        v25[4] = v21;
        v25[5] = v23;
        v20 += 32;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v19 = _swiftEmptyArrayStorage;
    }
    if (v19[2] == 2)
    {
      uint64_t v40 = v19[4];
      uint64_t v41 = v19[5];
      swift_bridgeObjectRetain();
      uint64_t result = sub_1001A3CE4(v40, v41);
      if ((v42 & 1) == 0)
      {
        if (v19[2] >= 2uLL)
        {
          uint64_t v35 = result;
          uint64_t v44 = v19[6];
          uint64_t v43 = v19[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v81 = v44;
          uint64_t v82 = v43;
          swift_bridgeObjectRetain();
          v83._countAndFlagsBits = 115;
          v83._uint64_t object = (void *)0xE100000000000000;
          BOOL v45 = sub_10024E8C0(v83);
          uint64_t v46 = swift_bridgeObjectRelease();
          if (v45)
          {
            sub_1001FB29C(v46);
            swift_bridgeObjectRelease();
          }
          uint64_t v47 = sub_10024E710();
          Swift::String v49 = v48;
          swift_bridgeObjectRelease();
          if (sub_100214640(v47, v49) != 7) {
            return v35;
          }
          return 0;
        }
        __break(1u);
        goto LABEL_93;
      }
    }
    goto LABEL_77;
  }
  uint64_t v81 = a1;
  uint64_t v82 = a2;
  sub_10024DA10();
  sub_10024DA40();
  __n128 v26 = *(void (**)(char *, uint64_t))(v6 + 8);
  v26(v14, v4);
  uint64_t v27 = sub_10024F160();
  unint64_t v29 = v28;
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v26)(v11, v4);
  uint64_t v31 = HIBYTE(v29) & 0xF;
  uint64_t v32 = v27 & 0xFFFFFFFFFFFFLL;
  if ((v29 & 0x2000000000000000) != 0) {
    uint64_t v33 = HIBYTE(v29) & 0xF;
  }
  else {
    uint64_t v33 = v27 & 0xFFFFFFFFFFFFLL;
  }
  if (!v33)
  {
    swift_bridgeObjectRelease();
    goto LABEL_77;
  }
  if ((v29 & 0x1000000000000000) != 0)
  {
    uint64_t v77 = sub_1001BECD0();
    uint64_t v35 = sub_1001A4F88(v77, v78, 10);
    LOBYTE(v27) = v79;
LABEL_61:
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_77;
    }
    if (sub_10024E790() < 3) {
      goto LABEL_77;
    }
    swift_bridgeObjectRetain();
    uint64_t v60 = sub_10009A148(a1, a2);
    uint64_t v62 = v61;
    swift_bridgeObjectRelease();
    if (!v62) {
      goto LABEL_77;
    }
    BOOL v63 = v60 == 80 && v62 == 0xE100000000000000;
    if (v63)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1001BECD0();
      char v64 = sub_10024FA60();
      swift_bridgeObjectRelease();
      if ((v64 & 1) == 0) {
        goto LABEL_77;
      }
    }
    swift_bridgeObjectRetain();
    sub_1000D86B0(a1, a2);
    uint64_t v66 = v65;
    swift_bridgeObjectRelease();
    if (v66)
    {
      sub_10024E7D0();
      uint64_t v67 = sub_10024E8F0();
      uint64_t v69 = v68;
      swift_bridgeObjectRelease();
      if (v67 != 84 || v69 != 0xE100000000000000) {
        sub_10024FA60();
      }
      swift_bridgeObjectRelease();
      uint64_t v71 = sub_1001BECD0();
      int v74 = sub_1002144CC(v71, v72, v73);
      swift_bridgeObjectRelease();
      if (v74 != 7) {
        return v35;
      }
      return 0;
    }
LABEL_77:
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((v29 & 0x2000000000000000) == 0)
  {
    if ((v27 & 0x1000000000000000) != 0)
    {
      BOOL v34 = (unsigned __int8 *)((v29 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      sub_1001BECD0();
      BOOL v34 = (unsigned __int8 *)sub_10024F3E0();
    }
    uint64_t v35 = (uint64_t)sub_1001A4F58(v34, v32);
    LOBYTE(v27) = v36 & 1;
    goto LABEL_61;
  }
  uint64_t v81 = v27;
  uint64_t v82 = v29 & 0xFFFFFFFFFFFFFFLL;
  if (v27 != 43)
  {
    if (v27 == 45)
    {
      if (!v31)
      {
LABEL_93:
        __break(1u);
        goto LABEL_94;
      }
      if (v31 != 1)
      {
        sub_100067DD4();
        if (!(!v63 & v39))
        {
          if (v37 == 2)
          {
            LOBYTE(v27) = 0;
            uint64_t v35 = -(uint64_t)v38;
            goto LABEL_61;
          }
          if ((BYTE2(v27) - 48) <= 9u)
          {
            uint64_t v35 = -10 * v38 - (BYTE2(v27) - 48);
            if (v37 == 3) {
              goto LABEL_60;
            }
            while (1)
            {
              sub_100028C7C();
              if (!v63 & v39) {
                break;
              }
              sub_1001B9904();
              if (!v63) {
                break;
              }
              uint64_t v35 = v76 - v75;
              if (__OFSUB__(v76, v75)) {
                break;
              }
              sub_10021498C();
              if (v63) {
                goto LABEL_61;
              }
            }
          }
        }
      }
LABEL_47:
      uint64_t v35 = 0;
      LOBYTE(v27) = 1;
      goto LABEL_61;
    }
    if (!v31 || (v27 - 48) > 9u) {
      goto LABEL_47;
    }
    uint64_t v35 = (v27 - 48);
    if (v31 != 1)
    {
      sub_100067DD4();
      if (!v63 & v39) {
        goto LABEL_47;
      }
      uint64_t v35 = 10 * (v27 - 48) + v57;
      if (v56 != 2)
      {
        while (1)
        {
          sub_100028C7C();
          if (!v63 & v39) {
            goto LABEL_47;
          }
          sub_1001B9904();
          if (!v63) {
            goto LABEL_47;
          }
          uint64_t v35 = v59 + v58;
          if (__OFADD__(v59, v58)) {
            goto LABEL_47;
          }
          sub_10021498C();
          if (v63) {
            goto LABEL_61;
          }
        }
      }
    }
    goto LABEL_60;
  }
  if (v31)
  {
    if (v31 == 1) {
      goto LABEL_47;
    }
    sub_100067DD4();
    if (!v63 & v39) {
      goto LABEL_47;
    }
    uint64_t v35 = v51;
    if (v50 != 2)
    {
      sub_100067DD4();
      if (!v63 & v39) {
        goto LABEL_47;
      }
      uint64_t v35 = 10 * v35 + v53;
      if (v52 != 3)
      {
        while (1)
        {
          sub_100028C7C();
          if (!v63 & v39) {
            goto LABEL_47;
          }
          sub_1001B9904();
          if (!v63) {
            goto LABEL_47;
          }
          uint64_t v35 = v55 + v54;
          if (__OFADD__(v55, v54)) {
            goto LABEL_47;
          }
          sub_10021498C();
          if (v63) {
            goto LABEL_61;
          }
        }
      }
    }
LABEL_60:
    LOBYTE(v27) = 0;
    goto LABEL_61;
  }
LABEL_94:
  __break(1u);
  return result;
}

uint64_t sub_100213730(uint64_t a1, char a2)
{
  char v3 = sub_100213E58(a2, (uint64_t)&off_1002D6040);
  BOOL v4 = (v3 & 1) == 0;
  if (v3) {
    v5._countAndFlagsBits = 84;
  }
  else {
    v5._countAndFlagsBits = 0;
  }
  if (v4) {
    uint64_t v6 = (void *)0xE000000000000000;
  }
  else {
    uint64_t v6 = (void *)0xE100000000000000;
  }
  v5._uint64_t object = v6;
  sub_10024E800(v5);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = sub_10024F9E0();
  sub_10024E800(v15);
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_100213DA0(a2);
  sub_10009A148(v7, v8);
  uint64_t v10 = v9;
  uint64_t result = swift_bridgeObjectRelease();
  if (v10)
  {
    uint64_t v12 = sub_10024E580();
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = v12;
    v16._uint64_t object = v14;
    sub_10024E800(v16);
    swift_bridgeObjectRelease();
    return 80;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100213838(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if (a1 == a3)
  {
    uint64_t v4 = 0x646E6F636573;
    unint64_t v5 = 0xE600000000000000;
    uint64_t v6 = 0x646E6F636573;
    switch(a2)
    {
      case 1:
        uint64_t v6 = 0x6574756E696DLL;
        break;
      case 2:
        unint64_t v5 = 0xE400000000000000;
        uint64_t v6 = 1920298856;
        break;
      case 3:
        unint64_t v5 = 0xE300000000000000;
        uint64_t v6 = 7954788;
        break;
      case 4:
        unint64_t v5 = 0xE400000000000000;
        uint64_t v6 = 1801807223;
        break;
      case 5:
        unint64_t v5 = 0xE500000000000000;
        uint64_t v6 = 0x68746E6F6DLL;
        break;
      case 6:
        unint64_t v5 = 0xE400000000000000;
        uint64_t v6 = 1918985593;
        break;
      default:
        break;
    }
    unint64_t v8 = 0xE600000000000000;
    switch(a4)
    {
      case 1:
        uint64_t v4 = 0x6574756E696DLL;
        break;
      case 2:
        unint64_t v8 = 0xE400000000000000;
        uint64_t v4 = 1920298856;
        break;
      case 3:
        unint64_t v8 = 0xE300000000000000;
        uint64_t v4 = 7954788;
        break;
      case 4:
        unint64_t v8 = 0xE400000000000000;
        uint64_t v4 = 1801807223;
        break;
      case 5:
        unint64_t v8 = 0xE500000000000000;
        uint64_t v4 = 0x68746E6F6DLL;
        break;
      case 6:
        unint64_t v8 = 0xE400000000000000;
        uint64_t v4 = 1918985593;
        break;
      default:
        break;
    }
    if (v6 == v4 && v5 == v8) {
      char v7 = 1;
    }
    else {
      char v7 = sub_10024FA60();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

uint64_t sub_100213A0C(uint64_t a1, char a2)
{
  uint64_t v3 = sub_100019524(&qword_1003199C8);
  __chkstk_darwin(v3 - 8, v4);
  sub_10002059C();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_100019524(&qword_1003199D0);
  __chkstk_darwin(v8 - 8, v9);
  sub_10002059C();
  switch(a2)
  {
    case 1:
    case 4:
      uint64_t v12 = sub_10024E150();
      uint64_t v13 = sub_100214878(v12);
      sub_1000195B4(v7, 1, 1, v13);
      sub_100214948();
      break;
    case 5:
    case 6:
      uint64_t v15 = sub_10024E150();
      uint64_t v16 = sub_100214878(v15);
      sub_1000195B4(v7, 1, 1, v16);
      sub_1002148B4();
      break;
    default:
      uint64_t v10 = sub_10024E150();
      uint64_t v11 = sub_100214878(v10);
      sub_1000195B4(v7, 1, 1, v11);
      break;
  }
  return sub_10024DBE0();
}

uint64_t sub_100213DA0(char a1)
{
  uint64_t result = 0x646E6F636573;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6574756E696DLL;
      break;
    case 2:
      uint64_t result = 1920298856;
      break;
    case 3:
      uint64_t result = 7954788;
      break;
    case 4:
      uint64_t result = 1801807223;
      break;
    case 5:
      uint64_t result = 0x68746E6F6DLL;
      break;
    case 6:
      uint64_t result = 1918985593;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100213E58(char a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = a2 + v5++;
    unint64_t v7 = 0xE600000000000000;
    uint64_t v8 = 0x646E6F636573;
    switch(*(unsigned char *)(v6 + 32))
    {
      case 1:
        uint64_t v8 = 0x6574756E696DLL;
        break;
      case 2:
        unint64_t v7 = 0xE400000000000000;
        uint64_t v8 = 1920298856;
        break;
      case 3:
        unint64_t v7 = 0xE300000000000000;
        uint64_t v8 = 7954788;
        break;
      case 4:
        unint64_t v7 = 0xE400000000000000;
        uint64_t v8 = 1801807223;
        break;
      case 5:
        unint64_t v7 = 0xE500000000000000;
        uint64_t v8 = 0x68746E6F6DLL;
        break;
      case 6:
        unint64_t v7 = 0xE400000000000000;
        uint64_t v8 = 1918985593;
        break;
      default:
        break;
    }
    unint64_t v9 = 0xE600000000000000;
    uint64_t v10 = 0x646E6F636573;
    switch(a1)
    {
      case 1:
        uint64_t v10 = 0x6574756E696DLL;
        break;
      case 2:
        unint64_t v9 = 0xE400000000000000;
        uint64_t v10 = 1920298856;
        break;
      case 3:
        unint64_t v9 = 0xE300000000000000;
        uint64_t v10 = 7954788;
        break;
      case 4:
        unint64_t v9 = 0xE400000000000000;
        uint64_t v10 = 1801807223;
        break;
      case 5:
        unint64_t v9 = 0xE500000000000000;
        uint64_t v10 = 0x68746E6F6DLL;
        break;
      case 6:
        unint64_t v9 = 0xE400000000000000;
        uint64_t v10 = 1918985593;
        break;
      default:
        break;
    }
    if (v8 == v10 && v7 == v9)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return 1;
    }
    char v12 = sub_10024FA60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12) {
      break;
    }
    if (v2 == v5)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_100214084(uint64_t a1, char a2)
{
  uint64_t v4 = sub_10024F9E0();
  v5._countAndFlagsBits = 45;
  v5._uint64_t object = (void *)0xE100000000000000;
  sub_10024E800(v5);
  v6._countAndFlagsBits = sub_100213DA0(a2);
  sub_10024E800(v6);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1002140FC(uint64_t a1, uint64_t a2, int a3)
{
  LODWORD(v59) = a3;
  uint64_t v58 = a2;
  uint64_t v4 = sub_10024DBF0();
  sub_10001B550();
  uint64_t v57 = v5;
  uint64_t v8 = __chkstk_darwin(v6, v7);
  uint64_t v56 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v10);
  char v12 = (char *)&v54 - v11;
  uint64_t v13 = sub_100019524((uint64_t *)&unk_10030FD70);
  __chkstk_darwin(v13 - 8, v14);
  sub_10002059C();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = sub_10024E030();
  sub_10001B550();
  uint64_t v20 = v19;
  __chkstk_darwin(v21, v22);
  sub_10002059C();
  uint64_t v55 = v24 - v23;
  uint64_t v25 = sub_10024E100();
  sub_10001B550();
  uint64_t v27 = v26;
  __chkstk_darwin(v28, v29);
  sub_10002059C();
  uint64_t v32 = v31 - v30;
  sub_10024E150();
  sub_10001B550();
  uint64_t v60 = v34;
  uint64_t v61 = v33;
  __chkstk_darwin(v33, v35);
  sub_10002059C();
  (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v32, enum case for Calendar.Identifier.gregorian(_:), v25);
  sub_10024E110();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v32, v25);
  sub_100213A0C(v58, v59);
  uint64_t v58 = a1;
  uint64_t v36 = v57;
  sub_10024E130();
  uint64_t v37 = *(void (**)(char *, uint64_t))(v36 + 8);
  uint64_t v59 = v4;
  v37(v12, v4);
  uint64_t v38 = v18;
  if (sub_10001FA0C(v17, 1, v18) == 1)
  {
    uint64_t v39 = sub_100214974();
    v40(v39);
    sub_100058654(v17);
    return 0;
  }
  else
  {
    char v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32);
    uint64_t v43 = v55;
    uint64_t v54 = v38;
    v42(v55, v17, v38);
    sub_100019524(&qword_1003199D8);
    uint64_t v44 = sub_10024E140();
    sub_10001B550();
    uint64_t v46 = v45;
    unint64_t v47 = (*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
    uint64_t v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = xmmword_100255FB0;
    (*(void (**)(unint64_t, void, uint64_t))(v46 + 104))(v48 + v47, enum case for Calendar.Component.day(_:), v44);
    sub_1001D4C5C();
    Swift::String v49 = v56;
    sub_10024E120();
    swift_bridgeObjectRelease();
    uint64_t v50 = sub_10024DBD0();
    LOBYTE(v44) = v51;
    v37(v49, v59);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v43, v54);
    uint64_t v52 = sub_100214974();
    v53(v52);
    if (v44) {
      return 0;
    }
    else {
      return v50;
    }
  }
}

uint64_t sub_1002144CC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = sub_10024E720();
  BOOL v6 = v4 == 83 && v5 == 0xE100000000000000;
  if (v6 || (v7 = v4, uint64_t v8 = v5, (sub_100214928() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v10 = v7 == 77 && v8 == 0xE100000000000000;
    if (v10 || (sub_100214928() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      if (a3) {
        return 1;
      }
      else {
        return 5;
      }
    }
    else
    {
      BOOL v11 = v7 == 72 && v8 == 0xE100000000000000;
      if (v11 || (sub_100214928() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v12 = v7 == 68 && v8 == 0xE100000000000000;
        if (v12 || (sub_100214928() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v13 = v7 == 87 && v8 == 0xE100000000000000;
          if (v13 || (sub_100214928() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (v7 == 89 && v8 == 0xE100000000000000)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            char v15 = sub_100214928();
            swift_bridgeObjectRelease();
            if (v15) {
              return 6;
            }
            else {
              return 7;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_100214640(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1002D5B90;
  v6._uint64_t object = a2;
  unint64_t v4 = sub_10024F790(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 7) {
    return 7;
  }
  else {
    return v4;
  }
}

uint64_t sub_10021468C(unsigned __int8 *a1, char *a2)
{
  return sub_1000F91A4(*a1, *a2);
}

Swift::Int sub_100214698()
{
  return sub_1001D3D24(*v0);
}

uint64_t sub_1002146A0()
{
  return sub_1000D0C98();
}

Swift::Int sub_1002146A8(uint64_t a1)
{
  return sub_1000D2C88(a1, *v1);
}

uint64_t sub_1002146B0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100214640(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1002146E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100213DA0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10021470C(uint64_t a1, uint64_t a2)
{
  return sub_100213838(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

unsigned char *storeEnumTagSinglePayload for OctaneSubscriptionPeriod.Unit(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x1002147F0);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OctaneSubscriptionPeriod.Unit()
{
  return &type metadata for OctaneSubscriptionPeriod.Unit;
}

unint64_t sub_10021482C()
{
  unint64_t result = qword_1003199E0[0];
  if (!qword_1003199E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1003199E0);
  }
  return result;
}

uint64_t sub_100214878(uint64_t a1)
{
  sub_1000195B4(v1, 1, 1, a1);
  return type metadata accessor for TimeZone(0);
}

uint64_t sub_1002148B4()
{
  return v0;
}

uint64_t sub_100214928()
{
  return sub_10024FA60();
}

uint64_t sub_100214974()
{
  return v0;
}

uint64_t IOError.init(errnoCode:reason:)(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t IOError.reason.getter(uint64_t a1)
{
  return a1;
}

uint64_t IOError.init(errnoCode:function:)()
{
  return sub_10024F360();
}

uint64_t sub_100214A24(int a1, uint64_t a2)
{
  if (strerror(a1))
  {
    sub_10024F330(18);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v4 = a2;
    v5._countAndFlagsBits = 8250;
    v5._uint64_t object = (void *)0xE200000000000000;
    sub_10024E800(v5);
    v6._countAndFlagsBits = sub_10024E820();
    sub_10024E800(v6);
    swift_bridgeObjectRelease();
    v7._countAndFlagsBits = 0x3A6F6E7272652820;
    v7._uint64_t object = (void *)0xE900000000000020;
    sub_10024E800(v7);
    v8._countAndFlagsBits = sub_10024F9E0();
    sub_10024E800(v8);
    swift_bridgeObjectRelease();
    v9._countAndFlagsBits = 41;
    v9._uint64_t object = (void *)0xE100000000000000;
    sub_10024E800(v9);
  }
  else
  {
    sub_10024F330(38);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v4 = a2;
    v10._uint64_t object = (void *)0x8000000100284E50;
    v10._countAndFlagsBits = 0xD000000000000022;
    sub_10024E800(v10);
    v11._countAndFlagsBits = sub_10024F9E0();
    sub_10024E800(v11);
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_100214BB0()
{
  return IOError.localizedDescription.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned int *)(v0 + 16));
}

uint64_t sub_100214BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IOError(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for IOError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for IOError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for IOError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 20))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for IOError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IOError()
{
  return &type metadata for IOError;
}

uint64_t sub_100214D38(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for IOError.FailureDescription(uint64_t a1)
{
  return sub_100214D5C(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(unsigned char *)(a1 + 17));
}

uint64_t sub_100214D5C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s25ASOctaneSupportXPCService7IOErrorV18FailureDescriptionOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 17);
  uint64_t v6 = *(unsigned __int8 *)(a2 + 16);
  sub_100214D38(*(void *)a2, v4, v6, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 17) = v5;
  return a1;
}

uint64_t assignWithCopy for IOError.FailureDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 17);
  uint64_t v6 = *(unsigned __int8 *)(a2 + 16);
  sub_100214D38(*(void *)a2, v4, v6, v5);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 17);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  uint64_t v10 = *(unsigned __int8 *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 17) = v5;
  sub_100214D5C(v7, v8, v10, v9);
  return a1;
}

__n128 initializeWithTake for IOError.FailureDescription(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for IOError.FailureDescription(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 17);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 17);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v8 = *(unsigned __int8 *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 17) = v4;
  sub_100214D5C(v5, v6, v8, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for IOError.FailureDescription(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 18))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 17);
      if (v3 <= 1) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IOError.FailureDescription(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 17) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100214F28(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 17);
}

uint64_t sub_100214F30(uint64_t result, char a2)
{
  *(unsigned char *)(result + 17) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IOError.FailureDescription()
{
  return &type metadata for IOError.FailureDescription;
}

_DWORD *initializeBufferWithCopyOfBuffer for IOError.Error(_DWORD *result, _DWORD *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for IOError.Error()
{
  return &type metadata for IOError.Error;
}

uint64_t _s25ASOctaneSupportXPCService7IOErrorV20localizedDescriptionSSvg_0(uint64_t a1, uint64_t a2, int a3)
{
  return sub_100214A24(a3, a1);
}

uint64_t NIOSingleStepByteToMessageDecoder.decode(context:buffer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_10024F030();
  sub_10002F9C8();
  uint64_t v27 = v9;
  sub_10007A8E8();
  __chkstk_darwin(v10, v11);
  BOOL v13 = (char *)&v26 - v12;
  sub_10002F9C8();
  uint64_t v15 = v14;
  sub_10007A8E8();
  double v18 = __chkstk_darwin(v16, v17);
  uint64_t v20 = (char *)&v26 - v19;
  uint64_t v21 = v31;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, double))(a4 + 16))(v29, a3, a4, v18);
  if (!v21)
  {
    uint64_t v31 = v4;
    uint64_t v23 = v8;
    int v24 = sub_10001FA0C((uint64_t)v13, 1, AssociatedTypeWitness);
    if (v24 == 1)
    {
      (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v23);
    }
    else
    {
      sub_100216374();
      v25();
      ByteToMessageDecoder.wrapInboundOut(_:)((uint64_t)v20, v30);
      ChannelHandlerContext.fireChannelRead(_:)();
      sub_10003908C((uint64_t)v30);
      (*(void (**)(char *, uint64_t))(v15 + 8))(v20, AssociatedTypeWitness);
    }
    return v24 == 1;
  }
  return result;
}

uint64_t NIOSingleStepByteToMessageDecoder.decodeLast(context:buffer:seenEOF:)(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  unsigned int v28 = a3;
  v27[1] = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = sub_10024F030();
  sub_10002F9C8();
  v27[0] = v10;
  sub_10007A8E8();
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)v27 - v13;
  sub_10002F9C8();
  uint64_t v16 = v15;
  sub_10007A8E8();
  double v19 = __chkstk_darwin(v17, v18);
  uint64_t v21 = (char *)v27 - v20;
  uint64_t v22 = v30;
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, double))(a5 + 24))(a2, v28, a4, a5, v19);
  if (!v22)
  {
    uint64_t v30 = v9;
    uint64_t v24 = v16;
    int v25 = sub_10001FA0C((uint64_t)v14, 1, AssociatedTypeWitness);
    if (v25 == 1)
    {
      (*(void (**)(char *, uint64_t))(v27[0] + 8))(v14, v30);
    }
    else
    {
      sub_100216374();
      v26();
      ByteToMessageDecoder.wrapInboundOut(_:)((uint64_t)v21, v29);
      ChannelHandlerContext.fireChannelRead(_:)();
      sub_10003908C((uint64_t)v29);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v21, AssociatedTypeWitness);
    }
    return v25 == 1;
  }
  return result;
}

uint64_t NIOSingleStepByteToMessageProcessor.__allocating_init(_:maximumBufferSize:)(uint64_t a1, uint64_t a2, char a3)
{
  char v5 = a3 & 1;
  uint64_t v6 = swift_allocObject();
  NIOSingleStepByteToMessageProcessor.init(_:maximumBufferSize:)(a1, a2, v5);
  return v6;
}

uint64_t *NIOSingleStepByteToMessageProcessor.init(_:maximumBufferSize:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = *v3;
  char v7 = (uint64_t *)((char *)v3 + *(void *)(*v3 + 112));
  void *v7 = 0;
  v7[1] = 0;
  *(void *)((char *)v7 + 15) = 0;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v6 + 80) - 8) + 32))((uint64_t)v3 + *(void *)(*v3 + 96), a1);
  uint64_t v8 = (uint64_t)v3 + *(void *)(*v3 + 104);
  *(void *)uint64_t v8 = a2;
  *(unsigned char *)(v8 + 8) = a3 & 1;
  return v3;
}

uint64_t sub_100215480(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v7 = HIDWORD(a3);
  uint64_t v8 = v3 + *(void *)(*(void *)v3 + 112);
  swift_beginAccess();
  uint64_t result = *(void *)v8;
  if (!*(void *)v8) {
    goto LABEL_5;
  }
  unsigned int v10 = *(_DWORD *)(v8 + 8);
  unsigned int v11 = *(_DWORD *)(v8 + 12);
  if (v11 < v10)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v11 == v10)
  {
LABEL_5:
    *(void *)uint64_t v8 = a1;
    *(void *)(v8 + 8) = a2;
    *(_DWORD *)(v8 + 16) = a3;
    *(unsigned char *)(v8 + 22) = BYTE6(a3);
    *(_WORD *)(v8 + 20) = v7;
    swift_release();
    return swift_retain();
  }
  uint64_t result = swift_beginAccess();
  if (!*(void *)v8) {
    goto LABEL_14;
  }
  Swift::UInt32 v12 = *(_DWORD *)(v8 + 12);
  uint64_t result = swift_beginAccess();
  unsigned int v13 = HIDWORD(a2) - a2;
  if (HIDWORD(a2) < a2) {
    goto LABEL_12;
  }
  uint64_t v14 = *(void *)(a1 + 24) + (BYTE6(a3) | ((unint64_t)(unsigned __int16)v7 << 8)) + a2;
  uint64_t v15 = v14 + v13;
  swift_retain();
  uint64_t result = ByteBuffer._setBytes(_:at:)(v14, v15, v12);
  int v16 = *(_DWORD *)(v8 + 12);
  BOOL v17 = __CFADD__(v16, result);
  int v18 = v16 + result;
  if (v17)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  *(_DWORD *)(v8 + 12) = v18;
  swift_endAccess();
  return swift_release();
}

uint64_t sub_1002155D4@<X0>(void (*a1)(uint64_t *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = *v2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_10024F030();
  uint64_t v29 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v9);
  unsigned int v11 = &v23[-v10];
  Swift::UInt32 v12 = (char *)v2 + *(void *)(v6 + 112);
  uint64_t result = swift_beginAccess();
  if (!*(void *)v12) {
    return sub_1000195B4(a2, 1, 1, AssociatedTypeWitness);
  }
  __int16 v14 = *((_WORD *)v12 + 10);
  unsigned int v16 = *((_DWORD *)v12 + 3);
  int v15 = *((_DWORD *)v12 + 4);
  unsigned int v17 = *((_DWORD *)v12 + 2);
  char v18 = v12[22];
  uint64_t v24 = *(void *)v12;
  unint64_t v25 = __PAIR64__(v16, v17);
  int v26 = v15;
  __int16 v27 = v14;
  char v28 = v18;
  if (v16 < v17)
  {
    __break(1u);
    return result;
  }
  if (v16 == v17) {
    return sub_1000195B4(a2, 1, 1, AssociatedTypeWitness);
  }
  *(void *)Swift::UInt32 v12 = 0;
  *((void *)v12 + 1) = 0;
  *(void *)(v12 + 15) = 0;
  a1(&v24);
  if (v3) {
    return swift_release();
  }
  unint64_t v19 = v25;
  int v20 = v26;
  __int16 v21 = v27;
  char v22 = v28;
  *(void *)Swift::UInt32 v12 = v24;
  *((void *)v12 + 1) = v19;
  v12[22] = v22;
  *((_WORD *)v12 + 10) = v21;
  *((_DWORD *)v12 + 4) = v20;
  swift_release();
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v29 + 32))(a2, v11, v8);
}

uint64_t sub_1002157F0(char a1, int a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v69 = a4;
  char v5 = v4;
  uint64_t v70 = a3;
  int v67 = a2;
  unint64_t v7 = (void *)*v4;
  uint64_t v8 = v7[11];
  uint64_t v65 = v7[10];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_10024F030();
  uint64_t v63 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v11);
  unsigned int v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v15);
  unsigned int v17 = (char *)&v60 - v16;
  uint64_t v66 = AssociatedTypeWitness;
  uint64_t v64 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(v18, v19);
  __int16 v21 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22, v23);
  uint64_t v62 = (char *)&v60 - v26;
  if ((a1 & 1) == 0)
  {
LABEL_6:
    int v36 = v67 & 1;
    __chkstk_darwin(v24, v25);
    *(&v60 - 2) = (uint64_t)v5;
    *((unsigned char *)&v60 - 8) = a1 & 1;
    *((unsigned char *)&v60 - 7) = v36;
    uint64_t v37 = v68;
    uint64_t result = sub_1002155D4((void (*)(uint64_t *))sub_100216350, (uint64_t)v13);
    if (v37) {
      return result;
    }
    int v67 = v36;
    LODWORD(v68) = a1 & 1;
    uint64_t v61 = v10;
    uint64_t v39 = (void (**)(char *, char *, uint64_t))(v64 + 32);
    uint64_t v40 = (uint64_t (**)(char *, uint64_t))(v64 + 8);
    uint64_t v41 = v66;
    while (sub_10001FA0C((uint64_t)v13, 1, v41) != 1)
    {
      (*v39)(v21, v13, v41);
      v70(v21);
      uint64_t v42 = (*v40)(v21, v41);
      __chkstk_darwin(v42, v43);
      *(&v60 - 2) = (uint64_t)v5;
      *((unsigned char *)&v60 - 8) = v68;
      *((unsigned char *)&v60 - 7) = v67;
      sub_1002155D4((void (*)(uint64_t *))sub_100216350, (uint64_t)v13);
    }
    (*(void (**)(char *, uint64_t))(v63 + 8))(v13, v61);
    uint64_t v47 = *v5;
    uint64_t v48 = (char *)v5 + *(void *)(*v5 + 104);
    if ((v48[8] & 1) == 0)
    {
      uint64_t v49 = *(void *)v48;
      uint64_t v50 = (char *)v5 + *(void *)(*v5 + 112);
      uint64_t result = swift_beginAccess();
      if (!*(void *)v50)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      unsigned int v51 = *((_DWORD *)v50 + 2);
      unsigned int v52 = *((_DWORD *)v50 + 3);
      BOOL v53 = v52 >= v51;
      unsigned int v54 = v52 - v51;
      if (!v53) {
        goto LABEL_33;
      }
      if (v49 < v54)
      {
        sub_10007A6A0();
        swift_allocError();
        return swift_willThrow();
      }
      uint64_t v47 = *v5;
    }
    uint64_t v57 = (char *)v5 + *(void *)(v47 + 112);
    uint64_t result = swift_beginAccess();
    if (!*(void *)v57)
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    unsigned int v58 = *((_DWORD *)v57 + 2);
    unsigned int v59 = *((_DWORD *)v57 + 3);
    if (v59 >= v58)
    {
      if (v59 != v58) {
        return result;
      }
      uint64_t result = swift_beginAccess();
      if (*(void *)v57)
      {
        ByteBuffer.discardReadBytes()();
        return swift_endAccess();
      }
LABEL_36:
      __break(1u);
      return result;
    }
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  __int16 v27 = (char *)v5 + v7[14];
  uint64_t v24 = swift_beginAccess();
  uint64_t v28 = *(void *)v27;
  if (!*(void *)v27)
  {
    if (qword_100308D08 == -1)
    {
LABEL_11:
      uint64_t v61 = v10;
      int32x2_t v34 = (int32x2_t)qword_10034C038;
      LODWORD(v31) = dword_10034C040;
      LOWORD(v32) = word_10034C044;
      char v33 = byte_10034C046;
      uint64_t v35 = swift_retain();
      goto LABEL_12;
    }
LABEL_31:
    swift_once();
    goto LABEL_11;
  }
  unsigned int v29 = *((_DWORD *)v27 + 2);
  unsigned int v30 = *((_DWORD *)v27 + 3);
  if (v30 < v29)
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v30 != v29) {
    goto LABEL_6;
  }
  uint64_t v61 = v10;
  unint64_t v31 = *((unsigned int *)v27 + 4) | ((unint64_t)(*((unsigned __int16 *)v27 + 10) | (v27[22] << 16)) << 32);
  uint64_t v32 = HIDWORD(v31) & 0xFFFFFF;
  char v33 = BYTE6(v31);
  int32x2_t v34 = vdup_n_s32(v29);
  uint64_t v35 = v28;
LABEL_12:
  uint64_t v44 = v66;
  v71[0] = v35;
  v71[1] = v34;
  int v72 = v31;
  __int16 v73 = v32;
  char v74 = v33;
  swift_beginAccess();
  uint64_t v45 = *(void (**)(void *, void, uint64_t, uint64_t))(v8 + 24);
  swift_retain();
  uint64_t v46 = v68;
  v45(v71, v67 & 1, v65, v8);
  swift_endAccess();
  if (!v46)
  {
    if (sub_10001FA0C((uint64_t)v17, 1, v44) == 1)
    {
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v17, v61);
    }
    uint64_t v55 = v64;
    uint64_t v56 = v62;
    (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v62, v17, v44);
    v70(v56);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v44);
  }
  return swift_release();
}

uint64_t sub_100215ECC(uint64_t a1, uint64_t *a2, char a3, char a4)
{
  uint64_t v6 = *(void *)(*a2 + 80);
  uint64_t v7 = *(void *)(*a2 + 88);
  if (a3)
  {
    swift_beginAccess();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 24))(a1, a4 & 1, v6, v7);
  }
  else
  {
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, v6, v7);
  }
  swift_endAccess();
  return sub_100216008(a1, a2);
}

uint64_t sub_100216008(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *(unsigned int *)(result + 8);
  uint64_t v3 = *(unsigned int *)(result + 12);
  if (v3 < v2)
  {
    __break(1u);
  }
  else if (v3 != v2)
  {
    uint64_t v4 = *a2;
    uint64_t v11 = *(unsigned int *)(result + 16);
    uint64_t v10 = *(unsigned __int16 *)(result + 20);
    uint64_t v9 = *(unsigned __int8 *)(result + 22);
    swift_beginAccess();
    uint64_t v5 = *(void *)(v4 + 80);
    uint64_t v6 = *(void *)(*(void *)(v4 + 88) + 8);
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 48);
    uint64_t v8 = swift_retain();
    LOBYTE(v4) = v7(v8, v2 | (v3 << 32), v11 | (v10 << 32) | (v9 << 48), v5, v6);
    swift_endAccess();
    uint64_t result = swift_release();
    if (v4) {
      return ByteBuffer.discardReadBytes()();
    }
  }
  return result;
}

uint64_t NIOSingleStepByteToMessageProcessor.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96));
  swift_release();
  return v0;
}

uint64_t NIOSingleStepByteToMessageProcessor.__deallocating_deinit()
{
  NIOSingleStepByteToMessageProcessor.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t NIOSingleStepByteToMessageProcessor.process(buffer:_:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *), uint64_t a5)
{
  return sub_1002157F0(0, 0, a4, a5);
}

uint64_t NIOSingleStepByteToMessageProcessor.finishProcessing(seenEOF:_:)(int a1, void (*a2)(char *), uint64_t a3)
{
  return sub_1002157F0(1, a1, a2, a3);
}

uint64_t sub_100216290()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for NIOSingleStepByteToMessageProcessor()
{
  return sub_10002F7A4();
}

uint64_t sub_100216350(uint64_t a1)
{
  return sub_100215ECC(a1, *(uint64_t **)(v1 + 16), *(unsigned char *)(v1 + 24), *(unsigned char *)(v1 + 25));
}

#error "1002163CC: call analysis failed (funcsize=160)"

double sub_100216628()
{
  uint64_t v3 = sub_10021B42C();
  sub_100110A88(v3, (uint64_t)v42, &qword_10030A948);
  sub_100110A88((uint64_t)v42, (uint64_t)v43, &qword_10030A948);
  if (v44)
  {
    uint64_t v4 = sub_10021B2A0();
    unint64_t v6 = v5;
    sub_1001C1594(v2, &v41);
    sub_1001C1594(&v41, &v45);
    if (v45.n128_u64[1])
    {
      sub_10024DC80();
      sub_1001E6EE4();
      sub_10024DC70();
      sub_10021AE34();
      sub_10021B260();
      if (v1)
      {
LABEL_4:
        swift_release();
        if (qword_100308DE0 != -1) {
          swift_once();
        }
        uint64_t v7 = sub_10024E1F0();
        sub_10001B0E8(v7, (uint64_t)qword_10034C0E0);
        sub_100065878((uint64_t *)v2);
        sub_100065878((uint64_t *)v2);
        sub_100065878((uint64_t *)v2);
        swift_errorRetain();
        sub_100065878((uint64_t *)v2);
        swift_errorRetain();
        uint64_t v8 = (void *)sub_10024E1D0();
        os_log_type_t v9 = sub_10024EE10();
        if (sub_10021B3E4(v9))
        {
          uint64_t v10 = sub_10003FD78();
          uint64_t v37 = sub_10021B248();
          uint64_t v40 = v37;
          *(_DWORD *)uint64_t v10 = 136446722;
          unint64_t v11 = v2[2].n128_u64[0];
          unint64_t v39 = v6;
          uint64_t v13 = *(void *)(v11 + 32);
          unint64_t v12 = *(void *)(v11 + 40);
          swift_bridgeObjectRetain();
          sub_1000F3F3C(v13, v12, &v40);
          sub_10024F100();
          swift_bridgeObjectRelease();
          sub_1000457A8((uint64_t *)v2);
          sub_1000457A8((uint64_t *)v2);
          uint64_t v14 = sub_10021B228();
          sub_10021B4C8(v14, v15, v16, v17, v18, v19, v20, v21, v33, v4, v37);
          sub_10021B514();
          swift_bridgeObjectRelease();
          sub_1000457A8((uint64_t *)v2);
          sub_1000457A8((uint64_t *)v2);
          *(_WORD *)(v10 + 22) = v4;
          swift_getErrorValue();
          uint64_t v22 = sub_10024FB80();
          sub_10021B4C8(v22, v23, v24, v25, v26, v27, v28, v29, v34, v35, v38);
          sub_10021B514();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          sub_10021B208((void *)&_mh_execute_header, v30, v31, "Error parsing request for endpoint %{public}s and client version %{public}s: %{public}s");
          swift_arrayDestroy();
          sub_10003FBCC();
          sub_10003FBCC();
          sub_10003F808(v36, v39);

          swift_errorRelease();
        }
        else
        {
          sub_10020E63C();
          swift_errorRelease();
          sub_1000457A8((uint64_t *)v2);
          sub_1000457A8((uint64_t *)v2);
          sub_1000457A8((uint64_t *)v2);
          sub_1000457A8((uint64_t *)v2);
          swift_errorRelease();
          swift_errorRelease();
        }
        goto LABEL_11;
      }
    }
    else
    {
      sub_10024D980();
      sub_1001E6EE4();
      sub_10024D970();
      sub_10021AE34();
      sub_10021B280();
      if (v1) {
        goto LABEL_4;
      }
    }
    sub_10020E63C();
    swift_release();
    return result;
  }
LABEL_11:
  double result = 0.0;
  v0[2] = 0u;
  v0[3] = 0u;
  *uint64_t v0 = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t sub_100216970()
{
  sub_10002FE20();
  uint64_t v45 = v4;
  uint64_t v46 = v5;
  uint64_t v6 = sub_10021B42C();
  sub_100110A88(v6, (uint64_t)v41, &qword_10030A948);
  sub_100110A88((uint64_t)v41, (uint64_t)v43, &qword_10030A948);
  if (v43[2])
  {
    sub_10021B47C((uint64_t)&v42);
    uint64_t v7 = sub_1000CB7C4();
    unint64_t v9 = v8;
    sub_1001C1594(v2, &v40);
    sub_1001C1594(&v40, &v44);
    if (v44.n128_u64[1])
    {
      sub_10024DC80();
      sub_1001E6EE4();
      sub_10024DC70();
      sub_10021AAA0();
      sub_10021B260();
      if (v1)
      {
LABEL_4:
        swift_release();
        if (qword_100308DE0 != -1) {
          swift_once();
        }
        uint64_t v10 = sub_10024E1F0();
        sub_10001B0E8(v10, (uint64_t)qword_10034C0E0);
        sub_100065878((uint64_t *)v2);
        sub_100065878((uint64_t *)v2);
        sub_100065878((uint64_t *)v2);
        swift_errorRetain();
        sub_100065878((uint64_t *)v2);
        swift_errorRetain();
        unint64_t v11 = (void *)sub_10024E1D0();
        os_log_type_t v12 = sub_10024EE10();
        if (sub_10021B3E4(v12))
        {
          sub_10003FD78();
          uint64_t v34 = sub_10021B248();
          v39[0] = v34;
          sub_10021B34C(4.8754e-34);
          sub_1000F3F3C(v3, v9, v39);
          sub_10021AFD0();
          swift_bridgeObjectRelease();
          sub_1000457A8((uint64_t *)v2);
          sub_1000457A8((uint64_t *)v2);
          uint64_t v13 = sub_10021B228();
          sub_10021B4C8(v13, v14, v15, v16, v17, v18, v19, v20, v7, v34, v36);
          sub_10021B0C8();
          swift_bridgeObjectRelease();
          sub_1000457A8((uint64_t *)v2);
          sub_1000457A8((uint64_t *)v2);
          sub_10021B3C0();
          uint64_t v21 = sub_10021B494();
          sub_10021B4C8(v21, v22, v23, v24, v25, v26, v27, v28, v32, v35, v37);
          sub_10021B0C8();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          sub_10021B208((void *)&_mh_execute_header, v29, v30, "Error parsing request for endpoint %{public}s and client version %{public}s: %{public}s");
          sub_10021B58C();
          sub_10003FBCC();
          sub_10003FBCC();
          sub_10003F808(v33, v38);

          swift_errorRelease();
        }
        else
        {
          sub_10020E63C();
          swift_errorRelease();
          sub_1000457A8((uint64_t *)v2);
          sub_1000457A8((uint64_t *)v2);
          sub_1000457A8((uint64_t *)v2);
          sub_1000457A8((uint64_t *)v2);
          swift_errorRelease();
          swift_errorRelease();
        }
        goto LABEL_11;
      }
    }
    else
    {
      sub_10024D980();
      sub_1001E6EE4();
      sub_10024D970();
      sub_10021AAA0();
      sub_10021B280();
      if (v1) {
        goto LABEL_4;
      }
    }
    sub_10020E63C();
    swift_release();
    return debugOnly(_:)(v0);
  }
LABEL_11:
  sub_10021AA98(v39);
  return sub_100110A88((uint64_t)v39, v0, &qword_10030ED40);
}

uint64_t sub_100216C7C()
{
  uint64_t v2 = sub_10021B580();
  sub_100110A88(v2, (uint64_t)v42, &qword_10030A948);
  sub_10021B568((uint64_t)v42);
  if (!v44) {
    return 0;
  }
  sub_10021B47C((uint64_t)v43);
  uint64_t v3 = sub_1000CB7C4();
  uint64_t v5 = v4;
  sub_1001C1594(v1, &v41);
  sub_1001C1594(&v41, &v45);
  if (v45.n128_u64[1])
  {
    sub_10024DC80();
    sub_1001E6EE4();
    sub_10024DC70();
    sub_10021AB38();
    sub_10021B0E8();
    if (v0)
    {
LABEL_4:
      swift_release();
      if (qword_100308DE0 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_10024E1F0();
      sub_10021B400(v6, (uint64_t)qword_10034C0E0);
      sub_100065878((uint64_t *)v1);
      sub_100065878((uint64_t *)v1);
      swift_errorRetain();
      sub_100065878((uint64_t *)v1);
      swift_errorRetain();
      uint64_t v7 = (void *)sub_10024E1D0();
      os_log_type_t v8 = sub_10024EE10();
      if (sub_1000ACFB8(v8))
      {
        sub_10003FD78();
        sub_10021B248();
        uint64_t v9 = sub_10021B03C(4.8754e-34);
        sub_10021B3A4(v9, v10, v11, v12, v13, v14, v15, v16);
        sub_10021AFD0();
        swift_bridgeObjectRelease();
        sub_1000457A8((uint64_t *)v1);
        sub_1000457A8((uint64_t *)v1);
        uint64_t v17 = sub_10021B0A8();
        sub_10021B1B4(v17, v18, v19, v20, v21, v22, v23, v24, v36, v5);
        sub_10021B16C();
        swift_bridgeObjectRelease();
        sub_1000457A8((uint64_t *)v1);
        sub_1000457A8((uint64_t *)v1);
        sub_10021B148();
        uint64_t v25 = sub_10021B494();
        sub_10021B1B4(v25, v26, v27, v28, v29, v30, v31, v32, v37, v38);
        sub_10021B190();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        sub_10021B128((void *)&_mh_execute_header, v33, v34, "Error parsing request for endpoint %{public}s and client version %{public}s: %{public}s");
        sub_10021B304();
        sub_10003FBCC();
        sub_10003FBCC();
        sub_10003F808(v3, v39);

        swift_errorRelease();
      }
      else
      {
        sub_10021B1F0();
        swift_errorRelease();
        sub_1000457A8((uint64_t *)v1);
        sub_1000457A8((uint64_t *)v1);
        sub_1000457A8((uint64_t *)v1);
        sub_1000457A8((uint64_t *)v1);
        swift_errorRelease();
        swift_errorRelease();
      }
      return 0;
    }
  }
  else
  {
    sub_10024D980();
    sub_1001E6EE4();
    sub_10024D970();
    sub_10021AB38();
    sub_10021B108();
    if (v0) {
      goto LABEL_4;
    }
  }
  sub_10021B1F0();
  swift_release();
  return v40;
}

uint64_t sub_100216F50()
{
  uint64_t v4 = sub_10021B580();
  sub_100110A88(v4, (uint64_t)v23, &qword_10030A948);
  sub_10021B568((uint64_t)v23);
  if (!v24)
  {
LABEL_11:
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    return v20;
  }
  uint64_t v5 = sub_10021B2A0();
  unint64_t v7 = v6;
  sub_1001C1594(v1, &v22);
  sub_1001C1594(&v22, &v25);
  if (v25.n128_u64[1])
  {
    sub_10024DC80();
    sub_1001E6EE4();
    sub_10024DC70();
    sub_10021ACE8();
    sub_10021B0E8();
    if (v0)
    {
LABEL_4:
      swift_release();
      if (qword_100308DE0 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_10024E1F0();
      sub_10021B400(v8, (uint64_t)qword_10034C0E0);
      sub_100065878((uint64_t *)v1);
      sub_100065878((uint64_t *)v1);
      swift_errorRetain();
      sub_100065878((uint64_t *)v1);
      swift_errorRetain();
      uint64_t v9 = (void *)sub_10024E1D0();
      os_log_type_t v10 = sub_10024EE10();
      if (sub_1000ACFB8(v10))
      {
        uint64_t v11 = sub_10003FD78();
        v19[0] = sub_10021B248();
        sub_10021B03C(4.8754e-34);
        sub_1000F3F3C(v3, v2, v19);
        sub_10024F100();
        swift_bridgeObjectRelease();
        sub_1000457A8((uint64_t *)v1);
        sub_1000457A8((uint64_t *)v1);
        uint64_t v12 = sub_10021B0A8();
        sub_1000F3F3C(v12, v13, v19);
        sub_10024F100();
        swift_bridgeObjectRelease();
        sub_1000457A8((uint64_t *)v1);
        sub_1000457A8((uint64_t *)v1);
        *(_WORD *)(v11 + 22) = v7;
        swift_getErrorValue();
        uint64_t v14 = sub_10024FB80();
        sub_1000F3F3C(v14, v15, v19);
        sub_10024F100();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        sub_10021B128((void *)&_mh_execute_header, v16, v17, "Error parsing request for endpoint %{public}s and client version %{public}s: %{public}s");
        swift_arrayDestroy();
        sub_10003FBCC();
        sub_10003FBCC();
        sub_10003F808(v5, v7);

        swift_errorRelease();
      }
      else
      {
        sub_10021B1F0();
        swift_errorRelease();
        sub_1000457A8((uint64_t *)v1);
        sub_1000457A8((uint64_t *)v1);
        sub_1000457A8((uint64_t *)v1);
        sub_1000457A8((uint64_t *)v1);
        swift_errorRelease();
        swift_errorRelease();
      }
      goto LABEL_11;
    }
  }
  else
  {
    sub_10024D980();
    sub_1001E6EE4();
    sub_10024D970();
    sub_10021ACE8();
    sub_10021B108();
    if (v0) {
      goto LABEL_4;
    }
  }
  sub_10021B1F0();
  swift_release();
  return v20;
}

double sub_100217298@<D0>(uint64_t a1@<X8>)
{
  sub_100110A88((uint64_t)&v1[3].n128_i64[1], (uint64_t)v8, &qword_10030A948);
  sub_100110A88((uint64_t)v8, (uint64_t)&v11, &qword_10030A948);
  if (*(void *)v12)
  {
    long long v9 = v11;
    *(_OWORD *)os_log_type_t v10 = *(_OWORD *)v12;
    *(void *)&v10[15] = *(void *)&v12[15];
    uint64_t v3 = sub_1000CB7C4();
    unint64_t v5 = v4;
    sub_1001C1594(v1, &v7);
    sub_1001C1594(&v7, &v13);
    if (v13.n128_u64[1])
    {
      sub_10024DC80();
      swift_allocObject();
      sub_10024DC70();
      sub_100219C5C();
      sub_10024DC60();
    }
    else
    {
      sub_10024D980();
      swift_allocObject();
      sub_10024D970();
      sub_100219C5C();
      sub_10024D960();
    }
    sub_10003F808(v3, v5);
    swift_release();
  }
  else
  {
    *(void *)(a1 + 96) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

#error "10021783C: call analysis failed (funcsize=177)"

#error "1002179F0: call analysis failed (funcsize=160)"

void *sub_100217C4C(unint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = a1;
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6)
  {
    while (1)
    {
      double result = (void *)sub_10024F450();
      if (v6 < 0) {
        break;
      }
      uint64_t v8 = 0;
      unint64_t v12 = v5 & 0xC000000000000001;
      unint64_t v9 = v5;
      while (v6 != v8)
      {
        if (v12) {
          id v10 = (id)sub_10024F380();
        }
        else {
          id v10 = *(id *)(v5 + 8 * v8 + 32);
        }
        long long v11 = v10;
        ++v8;
        sub_10001C2A8(a2 + 11, a2[14]);
        sub_10001C2A8(a2 + 6, a2[9]);
        sub_10008A5FC(a3, a4);
        sub_100218C00(v11);

        swift_release();
        sub_10024F400();
        sub_10024F490();
        sub_10024F4A0();
        sub_10024F420();
        unint64_t v5 = v9;
        if (v6 == v8) {
          goto LABEL_13;
        }
      }
      __break(1u);
LABEL_12:
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_10024F6F0();
      swift_bridgeObjectRelease();
      if (!v6) {
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_release();
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  return result;
}

double sub_100217E14()
{
  uint64_t v1 = sub_10021B08C();
  uint64_t v2 = sub_100026018(v1);
  __chkstk_darwin(v2, v3);
  sub_100062164();
  memcpy(__dst, v0, 0x59uLL);
  sub_10024DA00();
  sub_1001E6EE4();
  sub_10024D9F0();
  sub_10021B2CC();
  sub_10024D9B0();
  sub_10021AD80();
  uint64_t v4 = sub_10024D9E0();
  sub_10021B374(v4, v5);
  sub_10021AFA0((uint64_t)"application/json");
  swift_release();
  sub_10021B38C();
  sub_10021ADCC((uint64_t)v0);
  return sub_10021AF68();
}

double sub_100217F00()
{
  uint64_t v0 = sub_10021B08C();
  uint64_t v1 = sub_100026018(v0);
  __chkstk_darwin(v1, v2);
  sub_100062164();
  sub_10024DA00();
  sub_1001E6EE4();
  sub_10024D9F0();
  sub_10021B2CC();
  sub_10024D9B0();
  sub_10021AD34();
  uint64_t v3 = sub_10024D9E0();
  sub_10021B374(v3, v4);
  sub_10021AFA0((uint64_t)"application/json");
  swift_release();
  sub_10021B38C();
  swift_bridgeObjectRelease();
  return sub_10021AF68();
}

double sub_100217FE8()
{
  uint64_t v0 = sub_10024D9A0();
  uint64_t v1 = sub_100026018(v0);
  __chkstk_darwin(v1, v2);
  sub_100062164();
  sub_10024DA00();
  sub_1001E6EE4();
  sub_10024D9F0();
  sub_10021B2CC();
  sub_10024D9B0();
  sub_10021AAEC();
  uint64_t v3 = sub_10024D9E0();
  unint64_t v5 = v4;
  sub_1000473AC(v3, v4);
  sub_1000CBAF8(v3, v5, 0xD000000000000010, 0x8000000100278C80, (uint64_t)&v7);
  swift_release();
  sub_10003F808(v3, v5);
  return sub_10021AF68();
}

double sub_1002180FC()
{
  uint64_t v1 = sub_10021B08C();
  uint64_t v2 = sub_100026018(v1);
  __chkstk_darwin(v2, v3);
  sub_100062164();
  sub_10024DA00();
  sub_1001E6EE4();
  sub_10024D9F0();
  sub_10021B2CC();
  sub_10024D9B0();
  sub_100019524(&qword_100319B70);
  sub_10021A9AC();
  uint64_t v4 = sub_10024D9E0();
  sub_10021B374(v4, v5);
  sub_10021AFA0((uint64_t)"application/json");
  swift_release();
  sub_10021B38C();
  sub_10021AA00(v0);
  return sub_10021AF68();
}

void sub_1002181FC()
{
  sub_10002FE20();
  uint64_t v10 = v1;
  uint64_t v11 = v2;
  uint64_t v3 = sub_10021B08C();
  uint64_t v4 = sub_100026018(v3);
  __chkstk_darwin(v4, v5);
  sub_10021B324();
  sub_1001E6EE4();
  sub_10024D9F0();
  sub_10021B2CC();
  sub_10024D9B0();
  uint64_t AppReceiptResponse = type metadata accessor for CreateAppReceiptResponse();
  sub_10021AB84(&qword_100319BA0, (void (*)(uint64_t))type metadata accessor for CreateAppReceiptResponse);
  uint64_t v7 = sub_10021B4F4();
  if (AppReceiptResponse)
  {
    swift_errorRelease();
    sub_10021B458();
    swift_release();
  }
  else
  {
    sub_10021B374(v7, v8);
    sub_10021B01C(0x8000000100278C80, (uint64_t)&v9);
    swift_release();
    sub_10021B38C();
  }
  sub_10021B2E4();
  sub_10021ABCC(v0, (void (*)(void))type metadata accessor for CreateAppReceiptResponse);
  sub_10021B1CC();
}

double sub_10021832C()
{
  uint64_t v1 = sub_10021B08C();
  uint64_t v2 = sub_100026018(v1);
  __chkstk_darwin(v2, v3);
  sub_100062164();
  memcpy(__dst, v0, sizeof(__dst));
  sub_10024DA00();
  sub_1001E6EE4();
  sub_10024D9F0();
  sub_10021B2CC();
  sub_10024D9B0();
  sub_10021AC24();
  uint64_t v4 = sub_10024D9E0();
  sub_10021B374(v4, v5);
  sub_10021AFA0((uint64_t)"application/json");
  swift_release();
  sub_10021B38C();
  sub_10021AC70((uint64_t)v0);
  return sub_10021AF68();
}

double sub_100218418@<D0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10024D9A0();
  __chkstk_darwin(v4 - 8, v5);
  memcpy(__dst, a1, sizeof(__dst));
  sub_10024DA00();
  swift_allocObject();
  sub_10024D9F0();
  sub_10024D990();
  sub_10024D9B0();
  sub_100219BBC();
  uint64_t v6 = sub_10024D9E0();
  unint64_t v8 = v7;
  sub_1000473AC(v6, v7);
  sub_1000CBAF8(v6, v8, 0xD000000000000010, 0x8000000100278C80, (uint64_t)&v15);
  swift_release();
  sub_10003F808(v6, v8);
  sub_100219C08((uint64_t)a1);
  uint64_t v9 = v16;
  int v10 = v18;
  __int16 v11 = v19;
  char v12 = v20;
  double result = v17;
  *(_OWORD *)a2 = v15;
  *(void *)(a2 + 16) = v9;
  *(double *)(a2 + 24) = result;
  *(_DWORD *)(a2 + 32) = v10;
  *(_WORD *)(a2 + 36) = v11;
  *(unsigned char *)(a2 + 38) = v12;
  return result;
}

void sub_1002185A8()
{
  sub_10002FE20();
  uint64_t v10 = v1;
  uint64_t v11 = v2;
  uint64_t v3 = sub_10021B08C();
  uint64_t v4 = sub_100026018(v3);
  __chkstk_darwin(v4, v5);
  sub_10021B324();
  sub_1001E6EE4();
  sub_10024D9F0();
  sub_10021B2CC();
  sub_10024D9B0();
  uint64_t v6 = type metadata accessor for BagResponse();
  sub_10021AB84(&qword_100319BA8, (void (*)(uint64_t))type metadata accessor for BagResponse);
  uint64_t v7 = sub_10021B4F4();
  if (v6)
  {
    swift_errorRelease();
    sub_10021B458();
    swift_release();
  }
  else
  {
    sub_10021B374(v7, v8);
    sub_10021B01C(0x8000000100278C80, (uint64_t)&v9);
    swift_release();
    sub_10021B38C();
  }
  sub_10021B2E4();
  sub_10021ABCC(v0, (void (*)(void))type metadata accessor for BagResponse);
  sub_10021B1CC();
}

uint64_t sub_1002186D8()
{
  return sub_100218774();
}

uint64_t sub_10021870C()
{
  return sub_100218774();
}

uint64_t sub_100218740()
{
  return sub_100218774();
}

uint64_t sub_100218774()
{
  sub_10002FE20();
  uint64_t v38 = v1;
  uint64_t v39 = v2;
  uint64_t v36 = v3;
  uint64_t v37 = v4;
  uint64_t v5 = v0;
  uint64_t v34 = v6;
  uint64_t v35 = v7;
  uint64_t v9 = v8(0);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v11 = sub_100019524(&qword_100316370);
  uint64_t v12 = sub_100026018(v11);
  __chkstk_darwin(v12, v13);
  long long v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10024E450();
  sub_10001B550();
  uint64_t v18 = v17;
  uint64_t v21 = __chkstk_darwin(v19, v20);
  uint64_t v23 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21, v24);
  unint64_t v26 = (char *)&v34 - v25;
  if (qword_100308D80 != -1) {
    swift_once();
  }
  sub_10018B650((uint64_t)v15);
  if (sub_10001FA0C((uint64_t)v15, 1, v16) == 1)
  {
    sub_10021A900((uint64_t)v15);
    uint64_t v27 = sub_100019524(v37);
    return sub_1000195B4(v35, 1, 1, v27);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v26, v15, v16);
    sub_10021AE80();
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v23, v26, v16);
    uint64_t v29 = sub_10018B5F0();
    if (v30)
    {
      uint64_t v31 = v29;
      uint64_t v32 = v30;
      sub_100019524(&qword_1003090E8);
      uint64_t v33 = swift_allocObject();
      *(_OWORD *)(v33 + 16) = xmmword_100255FB0;
      *(void *)(v33 + 32) = v31;
      *(void *)(v33 + 40) = v32;
    }
    sub_10001C2A8((void *)(v5 + 16), *(void *)(v5 + 40));
    sub_10008BA8C();
    sub_100218A28();
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v26, v16);
  }
}

uint64_t sub_100218A28()
{
  sub_10002FE20();
  uint64_t v31 = v0;
  uint64_t v32 = v1;
  v28[1] = v3;
  uint64_t v29 = v2;
  uint64_t v5 = v4;
  char v7 = v6;
  uint64_t v9 = v8;
  Swift::Int v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v16 = sub_100019524(v4);
  sub_100025FBC();
  uint64_t v19 = __chkstk_darwin(v17, v18);
  uint64_t v21 = (char *)v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[*(int *)(v19 + 48)] = 0;
  if (v7) {
    goto LABEL_6;
  }
  if (v9 == 22)
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = 0;
    goto LABEL_7;
  }
  if (v9 == 20)
  {
    uint64_t v23 = 0x3635325352;
    uint64_t v22 = v13;
    goto LABEL_8;
  }
  if (v9 != 18)
  {
LABEL_6:
    uint64_t v22 = v13;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = _swiftEmptyArrayStorage;
  }
LABEL_7:
  uint64_t v23 = 0x3635325345;
LABEL_8:
  sub_100218DE4((uint64_t)v22, v23, 0xE500000000000000, v11, v30);
  memcpy(v21, v30, 0x48uLL);
  sub_10021AED4();
  uint64_t v24 = &v21[*(int *)(v16 + 40)];
  sub_10024E450();
  sub_100025FBC();
  (*(void (**)(char *, uint64_t))(v25 + 32))(v24, v29);
  unint64_t v26 = &v21[*(int *)(v16 + 44)];
  *(void *)unint64_t v26 = v9;
  v26[8] = v7 & 1;
  sub_100110A88((uint64_t)v21, v15, v5);
  return sub_1000195B4(v15, 0, 1, v16);
}

void *sub_100218C00(void *a1)
{
  sub_1000D96B0(v18, a1);
  sub_100110A88((uint64_t)v18, (uint64_t)v19, &qword_10030FC28);
  if (v20 == 255) {
    goto LABEL_8;
  }
  sub_1000CE8A4(v19, (uint64_t)v21);
  if (sub_1000D9D34() != 4)
  {
    sub_1000E20D4((uint64_t)v18);
LABEL_8:
    id v7 = a1;
    return a1;
  }
  uint64_t v2 = sub_1000D427C();
  uint64_t v4 = sub_1000FE9DC(v2, v3);
  swift_bridgeObjectRelease();
  sub_1000CE8A4(v21, (uint64_t)v22);
  switch(v25)
  {
    case 1:
      if (!v4) {
        goto LABEL_17;
      }
      uint64_t v9 = v23;
      uint64_t v8 = v24;
      swift_retain();
      uint64_t v10 = sub_100026CB8(v9, v8);
      goto LABEL_15;
    case 2:
      if (!v4) {
        goto LABEL_17;
      }
      uint64_t v12 = v23;
      uint64_t v11 = v24;
      swift_retain();
      uint64_t v10 = sub_100026F0C(v12, v11);
      goto LABEL_15;
    case 3:
      if (!v4) {
        goto LABEL_17;
      }
      uint64_t v14 = v23;
      uint64_t v13 = v24;
      swift_retain();
      uint64_t v10 = sub_100026F74(v14, v13);
LABEL_15:
      uint64_t v15 = v10;
      sub_1000E20D4((uint64_t)v18);
      swift_release();
      if (!v15) {
        goto LABEL_18;
      }
      char v6 = *(unsigned char *)(v15 + 57);
      swift_release();
      break;
    case 4:
LABEL_17:
      sub_1000E20D4((uint64_t)v18);
      goto LABEL_18;
    default:
      sub_1000E20D4((uint64_t)v18);
      if (v4 && (uint64_t v5 = *(void *)(v4 + 136)) != 0) {
        char v6 = *(unsigned char *)(v5 + 57);
      }
      else {
LABEL_18:
      }
        char v6 = 1;
      break;
  }
  sub_1000D9E08(v6);
  sub_1000A1278(a1, 0);
  id v16 = a1;
  swift_release();
  return a1;
}

void sub_100218DE4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, Swift::Int a4@<X3>, void *a5@<X8>)
{
  if (a4 >= 1)
  {
    sub_10024E750(a4);
    while (1)
      swift_stdlib_random();
  }
  *a5 = a2;
  a5[1] = a3;
  a5[2] = 0x63585F656C707041;
  a5[3] = 0xEF79654B5F65646FLL;
  a5[4] = 5527370;
  a5[5] = 0xE300000000000000;
  a5[6] = a1;
  a5[7] = 0;
  a5[8] = 0;
}

BOOL sub_100218F0C()
{
  sub_10002FE20();
  char v1 = v0;
  if (v2) {
    uint64_t v3 = 12918;
  }
  else {
    uint64_t v3 = 12662;
  }
  unint64_t v4 = sub_10006BE74(1uLL, v3, 0xE200000000000000);
  uint64_t v8 = v7;
  if (!((v4 ^ v5) >> 14))
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t v9 = v4;
  uint64_t v10 = v5;
  uint64_t v11 = v6;
  uint64_t v12 = sub_10021A394(v4, v5, v6, v7, 10);
  if ((v13 & 0x100) != 0)
  {
    uint64_t v14 = sub_100219D98(v9, v10, v11, v8, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_100219E9C);
    char v17 = v16;
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v14 = v12;
  char v15 = v13;
  swift_bridgeObjectRelease();
  if (v15) {
LABEL_9:
  }
    uint64_t v14 = 0;
LABEL_10:
  if (v1) {
    uint64_t v18 = 12918;
  }
  else {
    uint64_t v18 = 12662;
  }
  unint64_t v19 = sub_10006BE74(1uLL, v18, 0xE200000000000000);
  uint64_t v23 = v22;
  if (!((v19 ^ v20) >> 14))
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  uint64_t v24 = v19;
  uint64_t v25 = v20;
  uint64_t v26 = v21;
  uint64_t v27 = sub_10021A394(v19, v20, v21, v22, 10);
  if ((v28 & 0x100) == 0)
  {
    uint64_t v29 = v27;
    char v30 = v28;
    swift_bridgeObjectRelease();
    if ((v30 & 1) == 0) {
      return v14 < v29;
    }
    goto LABEL_18;
  }
  uint64_t v29 = sub_100219D98(v24, v25, v26, v23, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_100219E9C);
  char v32 = v31;
  swift_bridgeObjectRelease();
  if (v32) {
LABEL_18:
  }
    uint64_t v29 = 0;
  return v14 < v29;
}

uint64_t sub_1002190B4(char a1)
{
  if (a1) {
    return 12918;
  }
  else {
    return 12662;
  }
}

uint64_t sub_1002190CC(uint64_t a1, void *a2)
{
  v7._countAndFlagsBits = a1;
  v3._rawValue = &off_1002D6878;
  v7._uint64_t object = a2;
  Swift::Int v4 = sub_10024F790(v3, v7);
  swift_bridgeObjectRelease();
  if (v4 == 1) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = 2;
  }
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

BOOL sub_100219120()
{
  return sub_100218F0C();
}

void sub_10021912C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int16 v6 = v2;
  sub_100217298((uint64_t)&v24);
  uint64_t v9 = v31;
  if (v31)
  {
    uint64_t v10 = v29;
    __int16 v5 = v34;
    uint64_t v21 = v25;
    uint64_t v22 = v24;
    v43[0] = v24;
    v43[1] = v25;
    uint64_t v19 = v27;
    uint64_t v20 = v26;
    v43[2] = v26;
    v43[3] = v27;
    uint64_t v17 = v30;
    uint64_t v18 = v28;
    uint64_t v43[4] = v28;
    void v43[5] = v29;
    v43[6] = v30;
    v43[7] = v31;
    v43[8] = v32;
    v43[9] = v33;
    char v44 = v34 & 1;
    uint64_t v45 = v35;
    uint64_t v46 = v36;
    uint64_t v11 = sub_100161540(0x6E6F6973726576, 0xE700000000000000, *(void *)(a1 + 96));
    if (v12) {
      LOBYTE(v12) = sub_1002190CC(v11, v12) & 1;
    }
    __int16 v6 = 0;
    sub_1002193A0((uint64_t)v43, (char)v12, (uint64_t)&v24);
    sub_100219B4C(v22, v21, v20, v19, v18, v10, v17, v9);
    sub_100218418(&v24, (uint64_t)&v37);
    long long v23 = v37;
    uint64_t v9 = v38;
    uint64_t v3 = v39;
    unint64_t v4 = v40 | ((unint64_t)v41 << 32) | ((unint64_t)v42 << 48);
    sub_100022D68();
    sub_10006922C();
    uint64_t v13 = sub_100022D50();
    long long v14 = v23;
    uint64_t v15 = v13;
    *(void *)(v13 + 16) = 0;
    *(void *)(v13 + 24) = 0;
    uint64_t v16 = 3;
  }
  else
  {
    sub_100022D68();
    sub_10006922C();
    uint64_t v15 = sub_100022D50();
    *(double *)&long long v14 = sub_10021B4E0(v15);
    uint64_t v16 = 21;
  }
  *(void *)(v13 + 32) = v16;
  *(_WORD *)(v13 + 40) = v6;
  *(_WORD *)(v13 + 42) = v5;
  *(void *)a2 = v15;
  *(void *)(a2 + 8) = _swiftEmptyArrayStorage;
  *(unsigned char *)(a2 + 16) = 2;
  *(_OWORD *)(a2 + 24) = v14;
  *(void *)(a2 + 40) = v9;
  *(void *)(a2 + 48) = v3;
  *(unsigned char *)(a2 + 62) = BYTE6(v4);
  *(_WORD *)(a2 + 60) = WORD2(v4);
  *(_DWORD *)(a2 + 56) = v4;
}

uint64_t sub_1002193A0@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3;
  uint64_t v9 = sub_10024E030();
  sub_10001B550();
  uint64_t v11 = v10;
  __chkstk_darwin(v12, v13);
  uint64_t v62 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v5;
  memcpy((void *)(v15 + 24), (const void *)a1, 0x68uLL);
  unint64_t v16 = *(void *)(a1 + 24);
  if (v16)
  {
    uint64_t v57 = v11;
    uint64_t v63 = *(void *)(a1 + 16);
    unint64_t v17 = *(void *)(a1 + 72);
    if (*(unsigned char *)(a1 + 80)) {
      unint64_t v17 = 0;
    }
    unint64_t v65 = v17;
    *(void *)&long long v60 = v5;
    swift_retain();
    sub_100219D14(a1);
    if (qword_100308DE0 != -1) {
      swift_once();
    }
    uint64_t v59 = a3;
    int v58 = a2 & 1;
    uint64_t v18 = sub_10024E1F0();
    sub_10001B0E8(v18, (uint64_t)qword_10034C0E0);
    swift_bridgeObjectRetain_n();
    uint64_t v19 = sub_10024E1D0();
    os_log_type_t v20 = sub_10024EE30();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v64 = v4;
    uint64_t v61 = v15;
    if (v21)
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v56 = v9;
      uint64_t v23 = v22;
      uint64_t v55 = swift_slowAlloc();
      uint64_t v67 = v55;
      *(_DWORD *)uint64_t v23 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v66 = sub_1000F3F3C(v63, v16, &v67);
      sub_10024F100();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v23 + 12) = 2080;
      unint64_t v24 = v65;
      uint64_t v25 = sub_100197EF4();
      uint64_t v66 = sub_1000F3F3C(v25, v26, &v67);
      sub_10024F100();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Handling in-app receipts request for %s from revision %s.", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v9 = v56;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      unint64_t v24 = v65;
    }
    uint64_t v29 = (void *)v60;
    if (v24 <= 3)
    {
      uint64_t v30 = v62;
      sub_10024DF90();
      sub_10024DF70();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v30, v9);
    }
    uint64_t v31 = v29 + 11;
    sub_10001C2A8(v29 + 11, v29[14]);
    sub_100218F0C();
    sub_1001A44EC();
    uint64_t v32 = v63;
    uint64_t v33 = sub_1000A14CC();
    char v35 = v34;
    uint64_t v36 = v59;
    if (v65 <= 3)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v37 = v64;
      uint64_t v38 = sub_100217C4C((unint64_t)v33, v29, v32, v16);
      uint64_t v64 = v37;
      swift_bridgeObjectRelease();
      uint64_t v33 = v38;
    }
    sub_100219D14(a1);
    sub_1000C57C0(a1, (unint64_t)v33, v35 & 1, (void (*)(id))sub_100219D08, (uint64_t)v68);
    sub_100110A88((uint64_t)v68, (uint64_t)&v69, &qword_100319B58);
    uint64_t v39 = v74;
    if (v74)
    {
      unsigned int v40 = v29;
      uint64_t v41 = v69;
      char v42 = v70;
      uint64_t v43 = v71;
      uint64_t v44 = v72;
      uint64_t v45 = v73;
      uint64_t v62 = v75;
      int v58 = v76;
      uint64_t v57 = v77;
      unint64_t v65 = v79;
      LODWORD(v63) = v80;
      uint64_t v46 = v40[14];
      long long v60 = v78;
      uint64_t v47 = sub_10001C2A8(v31, v46);
      uint64_t v48 = *v47;
      uint64_t v49 = *(os_unfair_lock_s **)(*(void *)(*v47 + 128) + 16);
      swift_retain();
      os_unfair_lock_lock(v49);
      *(unsigned char *)(v48 + 112) = 1;
      os_unfair_lock_unlock(v49);
      swift_release();
      uint64_t result = swift_release();
      *(void *)uint64_t v36 = v41;
      *(unsigned char *)(v36 + 8) = v42;
      *(void *)(v36 + 16) = v43;
      *(void *)(v36 + 24) = v44;
      *(void *)(v36 + 32) = v45;
      unsigned int v51 = v62;
      *(void *)(v36 + 40) = v39;
      *(void *)(v36 + 48) = v51;
      *(unsigned char *)(v36 + 56) = v58;
      *(void *)(v36 + 64) = v57;
      *(_OWORD *)(v36 + 72) = v60;
      *(void *)(v36 + 88) = v65;
      *(unsigned char *)(v36 + 96) = v63;
      return result;
    }
    sub_100022A5C();
    uint64_t v52 = swift_allocError();
    sub_10021B5AC(v52, v53);
  }
  else
  {
    sub_100022A5C();
    uint64_t v27 = swift_allocError();
    sub_10021B5AC(v27, v28);
    swift_retain();
    sub_100219D14(a1);
  }
  swift_willThrow();
  return swift_release();
}

uint64_t sub_1002199B0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CheddarTransaction();
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (uint64_t *)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_1000D428C();
  uint64_t v12 = v11;
  sub_10001C2A8(a2 + 6, a2[9]);
  uint64_t v18 = sub_10008AEB4(2uLL, v10, v12, v13, v14, v15, v16, v17);
  LOBYTE(v10) = v19;
  swift_bridgeObjectRelease();
  LOBYTE(v12) = v10 & 1;
  uint64_t v21 = *(void *)(a3 + 48);
  uint64_t v20 = *(void *)(a3 + 56);
  id v22 = a1;
  swift_bridgeObjectRetain();
  sub_100155BB8(v22, v21, v20, v18, v12, v9);
  sub_10001C2A8(a2 + 11, a2[14]);
  sub_100218774();
  return sub_10021ABCC((uint64_t)v9, (void (*)(void))type metadata accessor for CheddarTransaction);
}

uint64_t type metadata accessor for TransactionHistoryRoute()
{
  return self;
}

uint64_t sub_100219B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_100219BBC()
{
  unint64_t result = qword_100319B48;
  if (!qword_100319B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319B48);
  }
  return result;
}

uint64_t sub_100219C08(uint64_t a1)
{
  return a1;
}

unint64_t sub_100219C5C()
{
  unint64_t result = qword_100319B50;
  if (!qword_100319B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319B50);
  }
  return result;
}

uint64_t sub_100219CA8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_100219D08(void *a1)
{
  return sub_1002199B0(a1, *(void **)(v1 + 16), v1 + 24);
}

uint64_t sub_100219D14(uint64_t a1)
{
  return a1;
}

uint64_t sub_100219D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100219D98(a1, a2, a3, a4, a5, (uint64_t (*)(void *, uint64_t, uint64_t))sub_10021A118);
}

uint64_t sub_100219D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void *, uint64_t, uint64_t))
{
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  sub_10021A470();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_10024E910();
  unint64_t v10 = v8;
  if ((v8 & 0x1000000000000000) == 0)
  {
    if ((v8 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v12 = HIBYTE(v10) & 0xF;
    uint64_t v17 = v9;
    uint64_t v18 = v10 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v11 = &v17;
    goto LABEL_7;
  }
  uint64_t v9 = sub_1001A55A4();
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  unint64_t v10 = v14;
  if ((v14 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v9 & 0x1000000000000000) != 0)
  {
    uint64_t v11 = (void *)((v10 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v12 = v9 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v11 = (void *)sub_10024F3E0();
  }
LABEL_7:
  uint64_t v15 = a6(v11, v12, a5);
  swift_bridgeObjectRelease();
  return v15;
}

unsigned __int8 *sub_100219E9C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v15 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v16 = a3 + 48;
        unsigned __int8 v17 = a3 + 55;
        unsigned __int8 v18 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = 58;
        }
        else
        {
          unsigned __int8 v18 = 97;
          unsigned __int8 v17 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          uint64_t v19 = result + 1;
          do
          {
            unsigned int v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                uint64_t v13 = 0;
                if (v20 < 0x61 || v20 >= v18) {
                  return (unsigned __int8 *)v13;
                }
                char v21 = -87;
              }
              else
              {
                char v21 = -55;
              }
            }
            else
            {
              char v21 = -48;
            }
            uint64_t v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21))) {
              return 0;
            }
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        unsigned __int8 v23 = a3 + 48;
        unsigned __int8 v24 = a3 + 55;
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v23 = 58;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v24 = 65;
        }
        if (result)
        {
          uint64_t v26 = 0;
          do
          {
            unsigned int v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                uint64_t v13 = 0;
                if (v27 < 0x61 || v27 >= v25) {
                  return (unsigned __int8 *)v13;
                }
                char v28 = -87;
              }
              else
              {
                char v28 = -55;
              }
            }
            else
            {
              char v28 = -48;
            }
            uint64_t v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
              return 0;
            }
            uint64_t v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28))) {
              return 0;
            }
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
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
                uint64_t v13 = 0;
                if (v11 < 0x61 || v11 >= v8) {
                  return (unsigned __int8 *)v13;
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
            uint64_t v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12))) {
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
  }
  __break(1u);
  return result;
}

unsigned __int8 *sub_10021A118(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v17 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v18 = a3 + 48;
        unsigned __int8 v19 = a3 + 55;
        unsigned __int8 v20 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = 58;
        }
        else
        {
          unsigned __int8 v20 = 97;
          unsigned __int8 v19 = 65;
        }
        if (result)
        {
          unint64_t v9 = 0;
          char v21 = result + 1;
          do
          {
            unsigned int v22 = *v21;
            if (v22 < 0x30 || v22 >= v18)
            {
              if (v22 < 0x41 || v22 >= v19)
              {
                uint64_t v13 = 0;
                if (v22 < 0x61 || v22 >= v20) {
                  return (unsigned __int8 *)v13;
                }
                char v23 = -87;
              }
              else
              {
                char v23 = -55;
              }
            }
            else
            {
              char v23 = -48;
            }
            if (!is_mul_ok(v9, a3)) {
              return 0;
            }
            unint64_t v24 = v9 * a3;
            unsigned __int8 v25 = v22 + v23;
            BOOL v16 = __CFADD__(v24, v25);
            unint64_t v9 = v24 + v25;
            if (v16) {
              return 0;
            }
            ++v21;
            --v17;
          }
          while (v17);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        unsigned __int8 v26 = a3 + 48;
        unsigned __int8 v27 = a3 + 55;
        unsigned __int8 v28 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = 58;
        }
        else
        {
          unsigned __int8 v28 = 97;
          unsigned __int8 v27 = 65;
        }
        if (result)
        {
          unint64_t v29 = 0;
          do
          {
            unsigned int v30 = *result;
            if (v30 < 0x30 || v30 >= v26)
            {
              if (v30 < 0x41 || v30 >= v27)
              {
                uint64_t v13 = 0;
                if (v30 < 0x61 || v30 >= v28) {
                  return (unsigned __int8 *)v13;
                }
                char v31 = -87;
              }
              else
              {
                char v31 = -55;
              }
            }
            else
            {
              char v31 = -48;
            }
            if (!is_mul_ok(v29, a3)) {
              return 0;
            }
            unint64_t v32 = v29 * a3;
            unsigned __int8 v33 = v30 + v31;
            BOOL v16 = __CFADD__(v32, v33);
            unint64_t v29 = v32 + v33;
            if (v16) {
              return 0;
            }
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)v29;
        }
        return 0;
      }
      return 0;
    }
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
          unint64_t v9 = 0;
          for (i = result + 1; ; ++i)
          {
            unsigned int v11 = *i;
            if (v11 < 0x30 || v11 >= v6)
            {
              if (v11 < 0x41 || v11 >= v7)
              {
                uint64_t v13 = 0;
                if (v11 < 0x61 || v11 >= v8) {
                  return (unsigned __int8 *)v13;
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
            if (!is_mul_ok(v9, a3)) {
              return 0;
            }
            unint64_t v14 = v9 * a3;
            unsigned __int8 v15 = v11 + v12;
            BOOL v16 = v14 >= v15;
            unint64_t v9 = v14 - v15;
            if (!v16) {
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
  }
  __break(1u);
  return result;
}

uint64_t sub_10021A394(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t result = 0;
    goto LABEL_8;
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    uint64_t v12 = HIBYTE(a4) & 0xF;
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    unsigned int v11 = v15;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    unsigned int v11 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v12 = a3 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unsigned int v11 = (void *)sub_10024F3E0();
  }
  uint64_t result = sub_10021A4BC((uint64_t)v11, v12, a1, a2, a3, a4, a5);
  if (!v5)
  {
    char v16 = v14 & 1;
LABEL_8:
    LOBYTE(v15[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

unint64_t sub_10021A470()
{
  unint64_t result = qword_100319B60;
  if (!qword_100319B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319B60);
  }
  return result;
}

uint64_t sub_10021A4BC(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v11 = a3;
  uint64_t v12 = result;
  uint64_t v13 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0) {
    LOBYTE(v13) = 1;
  }
  uint64_t v14 = 4 << v13;
  uint64_t v15 = a3 & 0xC;
  unint64_t v16 = a3;
  if (v15 == 4 << v13)
  {
    unint64_t result = sub_1000F44B4(a3, a5, a6);
    unint64_t v16 = result;
  }
  uint64_t v17 = HIBYTE(a6) & 0xF;
  if ((a6 & 0x1000000000000000) != 0)
  {
    unint64_t v19 = a5 & 0xFFFFFFFFFFFFLL;
    if ((a6 & 0x2000000000000000) != 0) {
      unint64_t v19 = HIBYTE(a6) & 0xF;
    }
    if (v19 < v16 >> 16) {
      goto LABEL_96;
    }
    unint64_t result = sub_10024E880();
    uint64_t v18 = result;
    uint64_t v17 = HIBYTE(a6) & 0xF;
  }
  else
  {
    uint64_t v18 = v16 >> 16;
  }
  if (v15 == v14)
  {
    uint64_t v20 = v17;
    unint64_t result = sub_1000F44B4(v11, a5, a6);
    uint64_t v17 = v20;
    unint64_t v11 = result;
  }
  if ((a4 & 0xC) == v14)
  {
    uint64_t v21 = a4;
    uint64_t v22 = v17;
    unint64_t result = sub_1000F44B4(v21, a5, a6);
    uint64_t v17 = v22;
    a4 = result;
    if ((a6 & 0x1000000000000000) == 0) {
      goto LABEL_11;
    }
  }
  else if ((a6 & 0x1000000000000000) == 0)
  {
LABEL_11:
    unint64_t result = (a4 >> 16) - (v11 >> 16);
    goto LABEL_22;
  }
  unint64_t v23 = a5 & 0xFFFFFFFFFFFFLL;
  if ((a6 & 0x2000000000000000) != 0) {
    unint64_t v23 = v17;
  }
  if (v23 < v11 >> 16) {
    goto LABEL_92;
  }
  if (v23 < a4 >> 16)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  unint64_t result = sub_10024E880();
LABEL_22:
  uint64_t v24 = v18 + result;
  if (__OFADD__(v18, result))
  {
    __break(1u);
    goto LABEL_91;
  }
  if (v24 < v18)
  {
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  unsigned __int8 v25 = (unsigned __int8 *)(v12 + v18);
  if (!v12) {
    unsigned __int8 v25 = 0;
  }
  int v26 = *v25;
  if (v26 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v37 = a7 + 48;
        unsigned __int8 v38 = a7 + 55;
        unsigned __int8 v39 = a7 + 87;
        if (a7 > 10)
        {
          unsigned __int8 v37 = 58;
        }
        else
        {
          unsigned __int8 v39 = 97;
          unsigned __int8 v38 = 65;
        }
        if (v25)
        {
          uint64_t v30 = 0;
          unsigned int v40 = v25 + 1;
          uint64_t v41 = result - 1;
          do
          {
            unsigned int v42 = *v40;
            if (v42 < 0x30 || v42 >= v37)
            {
              if (v42 < 0x41 || v42 >= v38)
              {
                uint64_t v35 = 0;
                if (v42 < 0x61 || v42 >= v39) {
                  return v35;
                }
                char v43 = -87;
              }
              else
              {
                char v43 = -55;
              }
            }
            else
            {
              char v43 = -48;
            }
            uint64_t v44 = v30 * a7;
            if ((unsigned __int128)(v30 * (__int128)a7) >> 64 != (v30 * a7) >> 63) {
              return 0;
            }
            uint64_t v30 = v44 + (v42 + v43);
            if (__OFADD__(v44, (v42 + v43))) {
              return 0;
            }
            ++v40;
            --v41;
          }
          while (v41);
          return v30;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_95;
  }
  if (v26 != 45)
  {
    if (v24 != v18)
    {
      unsigned __int8 v45 = a7 + 48;
      unsigned __int8 v46 = a7 + 55;
      unsigned __int8 v47 = a7 + 87;
      if (a7 > 10)
      {
        unsigned __int8 v45 = 58;
      }
      else
      {
        unsigned __int8 v47 = 97;
        unsigned __int8 v46 = 65;
      }
      if (v25)
      {
        uint64_t v48 = 0;
        do
        {
          unsigned int v49 = *v25;
          if (v49 < 0x30 || v49 >= v45)
          {
            if (v49 < 0x41 || v49 >= v46)
            {
              uint64_t v35 = 0;
              if (v49 < 0x61 || v49 >= v47) {
                return v35;
              }
              char v50 = -87;
            }
            else
            {
              char v50 = -55;
            }
          }
          else
          {
            char v50 = -48;
          }
          uint64_t v51 = v48 * a7;
          if ((unsigned __int128)(v48 * (__int128)a7) >> 64 != (v48 * a7) >> 63) {
            return 0;
          }
          uint64_t v48 = v51 + (v49 + v50);
          if (__OFADD__(v51, (v49 + v50))) {
            return 0;
          }
          ++v25;
          --result;
        }
        while (result);
        return v51 + (v49 + v50);
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v27 = a7 + 48;
      unsigned __int8 v28 = a7 + 55;
      unsigned __int8 v29 = a7 + 87;
      if (a7 > 10)
      {
        unsigned __int8 v27 = 58;
      }
      else
      {
        unsigned __int8 v29 = 97;
        unsigned __int8 v28 = 65;
      }
      if (v25)
      {
        uint64_t v30 = 0;
        char v31 = v25 + 1;
        uint64_t v32 = result - 1;
        while (1)
        {
          unsigned int v33 = *v31;
          if (v33 < 0x30 || v33 >= v27)
          {
            if (v33 < 0x41 || v33 >= v28)
            {
              uint64_t v35 = 0;
              if (v33 < 0x61 || v33 >= v29) {
                return v35;
              }
              char v34 = -87;
            }
            else
            {
              char v34 = -55;
            }
          }
          else
          {
            char v34 = -48;
          }
          uint64_t v36 = v30 * a7;
          if ((unsigned __int128)(v30 * (__int128)a7) >> 64 != (v30 * a7) >> 63) {
            return 0;
          }
          uint64_t v30 = v36 - (v33 + v34);
          if (__OFSUB__(v36, (v33 + v34))) {
            return 0;
          }
          ++v31;
          if (!--v32) {
            return v30;
          }
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

uint64_t sub_10021A900(uint64_t a1)
{
  uint64_t v2 = sub_100019524(&qword_100316370);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10021A960()
{
  unint64_t result = qword_100319B68;
  if (!qword_100319B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319B68);
  }
  return result;
}

unint64_t sub_10021A9AC()
{
  unint64_t result = qword_100319B78;
  if (!qword_100319B78)
  {
    sub_10001B028(&qword_100319B70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319B78);
  }
  return result;
}

uint64_t sub_10021AA00(uint64_t a1)
{
  return a1;
}

unint64_t sub_10021AA4C()
{
  unint64_t result = qword_100319B80;
  if (!qword_100319B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319B80);
  }
  return result;
}

void sub_10021AA98(void *a1)
{
}

unint64_t sub_10021AAA0()
{
  unint64_t result = qword_100319B88;
  if (!qword_100319B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319B88);
  }
  return result;
}

unint64_t sub_10021AAEC()
{
  unint64_t result = qword_100319B90;
  if (!qword_100319B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319B90);
  }
  return result;
}

unint64_t sub_10021AB38()
{
  unint64_t result = qword_100319B98;
  if (!qword_100319B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319B98);
  }
  return result;
}

uint64_t sub_10021AB84(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10021ABCC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_100025FBC();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_10021AC24()
{
  unint64_t result = qword_100319BB0;
  if (!qword_100319BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319BB0);
  }
  return result;
}

uint64_t sub_10021AC70(uint64_t a1)
{
  return a1;
}

unint64_t sub_10021ACE8()
{
  unint64_t result = qword_100319BB8;
  if (!qword_100319BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319BB8);
  }
  return result;
}

unint64_t sub_10021AD34()
{
  unint64_t result = qword_100319BC0;
  if (!qword_100319BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319BC0);
  }
  return result;
}

unint64_t sub_10021AD80()
{
  unint64_t result = qword_100319BC8;
  if (!qword_100319BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319BC8);
  }
  return result;
}

uint64_t sub_10021ADCC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  char v5 = *(unsigned char *)(a1 + 88);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100061100(v2, v3, v4, v5);
  return a1;
}

unint64_t sub_10021AE34()
{
  unint64_t result = qword_100319BD0;
  if (!qword_100319BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319BD0);
  }
  return result;
}

uint64_t sub_10021AE80()
{
  uint64_t v2 = sub_10021B534();
  v3(v2);
  sub_100025FBC();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_10021AED4()
{
  uint64_t v1 = sub_10021B534();
  v2(v1);
  sub_100025FBC();
  uint64_t v3 = sub_100110F58();
  v4(v3);
  return v0;
}

unint64_t sub_10021AF1C()
{
  unint64_t result = qword_100319BD8;
  if (!qword_100319BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319BD8);
  }
  return result;
}

double sub_10021AF68()
{
  uint64_t v2 = *(void *)(v1 + 16);
  int v3 = *(_DWORD *)(v1 + 32);
  __int16 v4 = *(_WORD *)(v1 + 36);
  char v5 = *(unsigned char *)(v1 + 38);
  double result = *(double *)(v1 + 24);
  *(_OWORD *)uint64_t v0 = *(_OWORD *)v1;
  *(void *)(v0 + 16) = v2;
  *(double *)(v0 + 24) = result;
  *(_DWORD *)(v0 + 32) = v3;
  *(_WORD *)(v0 + 36) = v4;
  *(unsigned char *)(v0 + 38) = v5;
  return result;
}

double sub_10021AFA0@<D0>(uint64_t a1@<X8>)
{
  return sub_1000CBAF8(v1, v2, 0xD000000000000010, (a1 - 32) | 0x8000000000000000, v3 - 88);
}

uint64_t sub_10021AFD0()
{
  return sub_10024F100();
}

unint64_t sub_10021AFF8()
{
  return sub_1000CB5C8(0, 0xE000000000000000, 6, v0 - 88);
}

double sub_10021B01C@<D0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return sub_1000CBAF8(v2, v3, 0xD000000000000010, a1, a2);
}

uint64_t sub_10021B03C(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10021B060()
{
  return sub_1000CB7C4();
}

uint64_t sub_10021B08C()
{
  return sub_10024D9A0();
}

uint64_t sub_10021B0A8()
{
  *(_WORD *)(v0 + 12) = 2082;
  return sub_1002125F8();
}

uint64_t sub_10021B0C8()
{
  return sub_10024F100();
}

uint64_t sub_10021B0E8()
{
  return sub_10024DC60();
}

uint64_t sub_10021B108()
{
  return sub_10024D960();
}

void sub_10021B128(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x20u);
}

uint64_t sub_10021B148()
{
  *(_WORD *)(v1 + 22) = v0;
  return swift_getErrorValue();
}

uint64_t sub_10021B16C()
{
  return sub_10024F100();
}

uint64_t sub_10021B190()
{
  return sub_10024F100();
}

uint64_t sub_10021B1B4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  return sub_1000F3F3C(a1, a2, (uint64_t *)va);
}

__n128 sub_10021B1CC()
{
  __n128 result = *(__n128 *)(v5 - 144);
  *uint64_t v0 = result;
  v0[1].n128_u64[0] = v1;
  v0[1].n128_u64[1] = v6;
  v0[2].n128_u32[0] = v2;
  v0[2].n128_u16[2] = v3;
  v0[2].n128_u8[6] = v4;
  return result;
}

uint64_t sub_10021B1F0()
{
  return sub_10003F808(v1, v0);
}

void sub_10021B208(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x20u);
}

uint64_t sub_10021B228()
{
  *(_WORD *)(v0 + 12) = 2082;
  return sub_1002125F8();
}

uint64_t sub_10021B248()
{
  return swift_slowAlloc();
}

uint64_t sub_10021B260()
{
  return sub_10024DC60();
}

uint64_t sub_10021B280()
{
  return sub_10024D960();
}

uint64_t sub_10021B2A0()
{
  return sub_1000CB7C4();
}

uint64_t sub_10021B2CC()
{
  return sub_10024D990();
}

__n128 sub_10021B2E4()
{
  __n128 result = *v0;
  *(__n128 *)(v1 - 144) = *v0;
  return result;
}

uint64_t sub_10021B304()
{
  return swift_arrayDestroy();
}

uint64_t sub_10021B324()
{
  return sub_10024DA00();
}

uint64_t sub_10021B34C(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10021B374(uint64_t a1, unint64_t a2)
{
  return sub_1000473AC(a1, a2);
}

uint64_t sub_10021B38C()
{
  return sub_10003F808(v0, v1);
}

uint64_t sub_10021B3A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  return sub_1000F3F3C(v9, v8, (uint64_t *)va);
}

uint64_t sub_10021B3C0()
{
  *(_WORD *)(v1 + 22) = v0;
  return swift_getErrorValue();
}

BOOL sub_10021B3E4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t *sub_10021B400(uint64_t a1, uint64_t a2)
{
  sub_10001B0E8(a1, a2);
  return sub_100065878(v2);
}

uint64_t sub_10021B42C()
{
  return v0 + 56;
}

unint64_t sub_10021B458()
{
  return sub_1000CB5C8(0, 0xE000000000000000, 6, v0 - 120);
}

__n128 sub_10021B47C@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)(v1 - 152);
  long long v3 = *(_OWORD *)(v1 - 136);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 31) = *(void *)(a1 + 71);
  return result;
}

uint64_t sub_10021B494()
{
  return sub_10024FB80();
}

uint64_t sub_10021B4C8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  return sub_1000F3F3C(a1, a2, (uint64_t *)va);
}

double sub_10021B4E0(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_10021B4F4()
{
  return sub_10024D9E0();
}

uint64_t sub_10021B514()
{
  return sub_10024F100();
}

uint64_t sub_10021B534()
{
  return 0;
}

__n128 *sub_10021B548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,__n128 a24)
{
  return sub_1001C1594(v24, &a24);
}

uint64_t sub_10021B568(uint64_t a1)
{
  return sub_100110A88(a1, v2 - 152, v1);
}

uint64_t sub_10021B580()
{
  return v0 + 56;
}

uint64_t sub_10021B58C()
{
  return swift_arrayDestroy();
}

void sub_10021B5AC(uint64_t a1, void *a2)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 21;
}

uint64_t AuditToken.rawValue.setter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *uint64_t v4 = result;
  v4[1] = a2;
  _OWORD v4[2] = a3;
  v4[3] = a4;
  return result;
}

uint64_t AuditToken.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = static AuditToken.decode<A>(data:)();
  if (!v3) {
    uint64_t v2 = v6;
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v2;
}

uint64_t static AuditToken.decode<A>(data:)()
{
  sub_10021B7C8((uint64_t)v3, 1, &v2);
  if (v0) {
    return swift_willThrow();
  }
  else {
    return v2;
  }
}

uint64_t AuditToken.data.getter()
{
  return 0x2000000000;
}

uint64_t sub_10021B7C8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (!result)
  {
    sub_10021BAE0();
    swift_allocError();
    *(void *)uint64_t v7 = 0;
    *(void *)(v7 + 8) = 0;
    *(unsigned char *)(v7 + 16) = 1;
    return swift_willThrow();
  }
  if ((unint64_t)(a2 - 0x400000000000000) >> 59 == 31)
  {
    uint64_t v4 = (_OWORD *)result;
    uint64_t v5 = 32 * a2;
    if (32 * a2 == sub_10024EC90())
    {
      double result = sub_10024DA70();
      long long v6 = v4[1];
      *a3 = *v4;
      a3[1] = v6;
      return result;
    }
    uint64_t v8 = sub_10024EC90();
    sub_10021BAE0();
    swift_allocError();
    *(void *)uint64_t v9 = v5;
    *(void *)(v9 + 8) = v8;
    *(unsigned char *)(v9 + 16) = 0;
    return swift_willThrow();
  }
  __break(1u);
  return result;
}

__n128 sub_10021B8EC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(unsigned char *)(a2 + 32) = 0;
  return result;
}

__n128 sub_10021B8FC@<Q0>(_OWORD *a1@<X8>)
{
  __n128 result = *(__n128 *)v1;
  long long v3 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v3;
  return result;
}

uint64_t variable initialization expression of ClientOverride.requestAuditTokenData()
{
  return 0;
}

uint64_t variable initialization expression of ClientOverride.vendorID@<X0>(uint64_t a1@<X8>)
{
  return sub_10021B944((uint64_t (*)(void))&type metadata accessor for UUID, a1);
}

uint64_t variable initialization expression of AcknowledgeMessageRequest.clientOverride@<X0>(uint64_t a1@<X8>)
{
  return sub_10021B944(type metadata accessor for ClientOverride, a1);
}

uint64_t sub_10021B944@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1(0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  return v4(a2, 1, 1, v3);
}

__n128 initializeWithCopy for AuditToken(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for AuditToken()
{
  return &type metadata for AuditToken;
}

__n128 initializeBufferWithCopyOfBuffer for AuditTokenDecodingError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AuditTokenDecodingError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AuditTokenDecodingError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 17) = v3;
  return result;
}

uint64_t sub_10021BA3C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10021BA58(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 1;
  }
  else
  {
    *(unsigned char *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AuditTokenDecodingError()
{
  return &type metadata for AuditTokenDecodingError;
}

void type metadata accessor for audit_token_t()
{
  if (!qword_100319BF0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100319BF0);
    }
  }
}

unint64_t sub_10021BAE0()
{
  unint64_t result = qword_100319BF8;
  if (!qword_100319BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319BF8);
  }
  return result;
}

uint64_t sub_10021BB3C()
{
  uint64_t result = 0x6974616D6F747561;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x69746375646F7270;
      break;
    case 2:
      uint64_t result = 0x786F62646E6173;
      break;
    case 3:
      uint64_t result = 0x73655465646F6378;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10021BBD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100221AB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10021BBFC(uint64_t a1)
{
  unint64_t v2 = sub_10021D014();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10021BC38(uint64_t a1)
{
  unint64_t v2 = sub_10021D014();
  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_10021BC74()
{
  return 0xD000000000000010;
}

uint64_t sub_10021BC90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100221C88(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_10021BCBC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10021BCC8(uint64_t a1)
{
  unint64_t v2 = sub_10021D0CC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10021BD04(uint64_t a1)
{
  unint64_t v2 = sub_10021D0CC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ClientOverride.Server.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10024DDC0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  long long v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ClientOverride.Server(0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10021F17C(v1, (uint64_t)v10, type metadata accessor for ClientOverride.Server);
  uint64_t v11 = sub_100019524(&qword_100319C00);
  uint64_t v12 = 0x6974616D6F747541;
  switch((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 3, v11))
  {
    case 1u:
      return v12;
    case 2u:
      uint64_t v12 = 0x69746375646F7250;
      break;
    case 3u:
      uint64_t v12 = 0x786F62646E6153;
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v10, v2);
      v14[0] = 0x73655465646F6358;
      v14[1] = 0xEA00000000002874;
      sub_10021D120(&qword_100319C08, (void (*)(uint64_t))&type metadata accessor for URL);
      v15._countAndFlagsBits = sub_10024F9E0();
      sub_10024E800(v15);
      swift_bridgeObjectRelease();
      v16._countAndFlagsBits = 41;
      v16._uint64_t object = (void *)0xE100000000000000;
      sub_10024E800(v16);
      uint64_t v12 = v14[0];
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      break;
  }
  return v12;
}

uint64_t type metadata accessor for ClientOverride.Server(uint64_t a1)
{
  return sub_10021DEF4(a1, (uint64_t *)&unk_100319E20);
}

uint64_t sub_10021BFF8(uint64_t a1)
{
  uint64_t v2 = sub_10024DDC0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  long long v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ClientOverride.Server(0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10021F17C(a1, (uint64_t)v10, type metadata accessor for ClientOverride.Server);
  uint64_t v11 = sub_100019524(&qword_100319C00);
  uint64_t v12 = 0x6974616D6F747541;
  switch((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 3, v11))
  {
    case 1u:
      break;
    case 2u:
      uint64_t v12 = 0x69746375646F7250;
      break;
    case 3u:
      uint64_t v12 = 0x786F62646E6153;
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v10, v2);
      v14[0] = 0x73655465646F6358;
      v14[1] = 0xEA00000000002874;
      sub_10021D120(&qword_100319C08, (void (*)(uint64_t))&type metadata accessor for URL);
      v15._countAndFlagsBits = sub_10024F9E0();
      sub_10024E800(v15);
      swift_bridgeObjectRelease();
      v16._countAndFlagsBits = 41;
      v16._uint64_t object = (void *)0xE100000000000000;
      sub_10024E800(v16);
      uint64_t v12 = v14[0];
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      break;
  }
  sub_10021F1E4(a1, type metadata accessor for ClientOverride.Server);
  return v12;
}

uint64_t ClientOverride.Server.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v76 = a2;
  uint64_t v3 = sub_100019524(&qword_100319C10);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v67 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100019524(&qword_100319C18);
  uint64_t v69 = *(void *)(v6 - 8);
  uint64_t v70 = v6;
  __chkstk_darwin(v6, v7);
  uint64_t v66 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_100019524(&qword_100319C20);
  uint64_t v68 = *(void *)(v72 - 8);
  __chkstk_darwin(v72, v9);
  uint64_t v71 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_10024DDC0();
  uint64_t v77 = *(void *)(v73 - 8);
  __chkstk_darwin(v73, v11);
  long long v78 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100019524(&qword_100319C28);
  uint64_t v74 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v14);
  Swift::String v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100019524(&qword_100319C30);
  __chkstk_darwin(v17 - 8, v18);
  uint64_t v20 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100019524(&qword_100319C38);
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21, v23);
  uint64_t v25 = (char *)&v64 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for ClientOverride.Server(0);
  __chkstk_darwin(v26 - 8, v27);
  unint64_t v65 = (char *)&v64 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29, v30);
  uint64_t v75 = (uint64_t)&v64 - v31;
  uint64_t v32 = a1[3];
  uint64_t v81 = a1;
  sub_10001C2A8(a1, v32);
  sub_10021D014();
  uint64_t v33 = v79;
  sub_10024FD20();
  if (v33)
  {
    swift_errorRelease();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v20, 1, 1, v21);
    sub_100051BB4((uint64_t)v20, &qword_100319C30);
  }
  else
  {
    uint64_t v79 = v13;
    uint64_t v37 = v77;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v20, 0, 1, v21);
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v25, v20, v21);
    uint64_t v38 = sub_10024F890();
    if (*(void *)(v38 + 16))
    {
      uint64_t v39 = *(unsigned __int8 *)(v38 + 32);
      swift_bridgeObjectRelease();
      switch(v39)
      {
        case 1:
          (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v21);
          uint64_t v44 = sub_100019524(&qword_100319C00);
          uint64_t v41 = v75;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v75, 2, 3, v44);
          goto LABEL_13;
        case 2:
          (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v21);
          uint64_t v45 = sub_100019524(&qword_100319C00);
          uint64_t v41 = v75;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v75, 3, 3, v45);
          goto LABEL_13;
        case 3:
          LOBYTE(v80[0]) = 3;
          sub_10021D0CC();
          sub_10024F7A0();
          sub_10021D120(&qword_100319C58, (void (*)(uint64_t))&type metadata accessor for URL);
          uint64_t v49 = v73;
          uint64_t v50 = v79;
          sub_10024F870();
          (*(void (**)(char *, uint64_t))(v74 + 8))(v16, v50);
          (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v21);
          char v34 = v81;
          uint64_t v41 = v75;
          (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v75, v78, v49);
          uint64_t v51 = sub_100019524(&qword_100319C00);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v41, 0, 3, v51);
          uint64_t v46 = v76;
          goto LABEL_21;
        default:
          (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v21);
          uint64_t v40 = sub_100019524(&qword_100319C00);
          uint64_t v41 = v75;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v75, 1, 3, v40);
LABEL_13:
          char v34 = v81;
          uint64_t v46 = v76;
          break;
      }
      goto LABEL_21;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v21);
  }
  char v34 = v81;
  sub_10001C2A8(v81, v81[3]);
  sub_10024FD10();
  sub_10001C2A8(v80, v80[3]);
  uint64_t v35 = sub_10024FA70();
  uint64_t v42 = v35;
  uint64_t v43 = v36;
  if (v35 == 1869903201 && v36 == 0xE400000000000000
    || (sub_10024FA60() & 1) != 0
    || v42 == 0x6974616D6F747561 && v43 == 0xE900000000000063
    || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v47 = sub_100019524(&qword_100319C00);
    uint64_t v41 = v75;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v75, 1, 3, v47);
  }
  else if (v42 == 1685025392 && v43 == 0xE400000000000000 {
         || (sub_10024FA60() & 1) != 0
  }
         || v42 == 0x69746375646F7270 && v43 == 0xEA00000000006E6FLL
         || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v52 = sub_100019524(&qword_100319C00);
    uint64_t v41 = v75;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v75, 2, 3, v52);
  }
  else if (v42 == 0x786F62646E6173 && v43 == 0xE700000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v53 = sub_100019524(&qword_100319C00);
    uint64_t v41 = v75;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v75, 3, 3, v53);
  }
  else
  {
    sub_100019524(&qword_100319C48);
    sub_10024E1A0();
    uint64_t v54 = (uint64_t)v67;
    sub_10024E1B0();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48))(v54, 1, v70) == 1)
    {
      sub_100051BB4(v54, &qword_100319C10);
      uint64_t v55 = sub_10024F3D0();
      swift_allocError();
      uint64_t v57 = v56;
      char v34 = v81;
      sub_10001C2A8(v81, v81[3]);
      sub_10024FD00();
      sub_10024F3B0();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v55 - 8) + 104))(v57, enum case for DecodingError.dataCorrupted(_:), v55);
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v68 + 8))(v71, v72);
      sub_10001C2EC((uint64_t)v80);
      return sub_10001C2EC((uint64_t)v34);
    }
    uint64_t v58 = v69;
    uint64_t v59 = v66;
    uint64_t v60 = v54;
    uint64_t v61 = v70;
    (*(void (**)(char *, uint64_t, uint64_t))(v69 + 32))(v66, v60, v70);
    swift_getKeyPath();
    sub_10024E1C0();
    swift_release();
    sub_10024E740();
    swift_bridgeObjectRelease();
    uint64_t v62 = (uint64_t)v65;
    sub_10024DD30();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v61);
    (*(void (**)(char *, uint64_t))(v68 + 8))(v71, v72);
    uint64_t v63 = sub_100019524(&qword_100319C00);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v62, 0, 3, v63);
    uint64_t v41 = v75;
    sub_10021D068(v62, v75);
    char v34 = v81;
  }
  uint64_t v46 = v76;
  sub_10001C2EC((uint64_t)v80);
LABEL_21:
  sub_10021D068(v41, v46);
  return sub_10001C2EC((uint64_t)v34);
}

unint64_t sub_10021D014()
{
  unint64_t result = qword_100319C40;
  if (!qword_100319C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319C40);
  }
  return result;
}

uint64_t sub_10021D068(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientOverride.Server(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10021D0CC()
{
  unint64_t result = qword_100319C50;
  if (!qword_100319C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319C50);
  }
  return result;
}

uint64_t sub_10021D120(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10021D168(uint64_t a1)
{
  unint64_t v2 = sub_10021D9CC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10021D1A4(uint64_t a1)
{
  unint64_t v2 = sub_10021D9CC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10021D1E0(uint64_t a1)
{
  unint64_t v2 = sub_10021D978();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10021D21C(uint64_t a1)
{
  unint64_t v2 = sub_10021D978();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10021D258@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_10021D288(uint64_t a1)
{
  unint64_t v2 = sub_10021D924();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10021D2C4(uint64_t a1)
{
  unint64_t v2 = sub_10021D924();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ClientOverride.Server.encode(to:)(void *a1)
{
  uint64_t v2 = sub_100019524(&qword_100319C60);
  uint64_t v46 = *(void *)(v2 - 8);
  uint64_t v47 = v2;
  __chkstk_darwin(v2, v3);
  uint64_t v43 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10024DDC0();
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v45 = v5;
  __chkstk_darwin(v5, v6);
  uint64_t v48 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100019524(&qword_100319C68);
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  __chkstk_darwin(v8, v9);
  uint64_t v40 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100019524(&qword_100319C70);
  uint64_t v38 = *(void *)(v11 - 8);
  uint64_t v39 = v11;
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100019524(&qword_100319C78);
  uint64_t v36 = *(void *)(v15 - 8);
  uint64_t v37 = v15;
  __chkstk_darwin(v15, v16);
  uint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for ClientOverride.Server(0);
  __chkstk_darwin(v19 - 8, v20);
  uint64_t v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100019524(&qword_100319C80);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23, v25);
  uint64_t v27 = (char *)&v35 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  sub_10021D014();
  sub_10024FD40();
  sub_10021F17C(v49, (uint64_t)v22, type metadata accessor for ClientOverride.Server);
  uint64_t v28 = sub_100019524(&qword_100319C00);
  switch((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 48))(v22, 3, v28))
  {
    case 1u:
      char v50 = 0;
      sub_10021D9CC();
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v18, v37);
      goto LABEL_6;
    case 2u:
      char v51 = 1;
      sub_10021D978();
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v39);
      goto LABEL_6;
    case 3u:
      char v52 = 2;
      sub_10021D924();
      char v34 = v40;
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v34, v42);
LABEL_6:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v27, v23);
      break;
    default:
      uint64_t v30 = v44;
      uint64_t v29 = v45;
      (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v48, v22, v45);
      char v53 = 3;
      sub_10021D0CC();
      uint64_t v31 = v43;
      sub_10024F8C0();
      sub_10021D120(&qword_100319C88, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v32 = v47;
      sub_10024F980();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v31, v32);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v48, v29);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v27, v23);
      break;
  }
  return result;
}

unint64_t sub_10021D924()
{
  unint64_t result = qword_100319C90;
  if (!qword_100319C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319C90);
  }
  return result;
}

unint64_t sub_10021D978()
{
  unint64_t result = qword_100319C98;
  if (!qword_100319C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319C98);
  }
  return result;
}

unint64_t sub_10021D9CC()
{
  unint64_t result = qword_100319CA0;
  if (!qword_100319CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319CA0);
  }
  return result;
}

uint64_t sub_10021DA24@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ClientOverride.Server.init(from:)(a1, a2);
}

uint64_t sub_10021DA3C(void *a1)
{
  return ClientOverride.Server.encode(to:)(a1);
}

uint64_t ClientOverride.description.getter()
{
  uint64_t v1 = type metadata accessor for ClientOverride.Server(0);
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100019524(&qword_100319CA8);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10024E0A0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = 0;
  unint64_t v26 = 0xE000000000000000;
  v14._uint64_t object = *(void **)(v0 + 24);
  if (v14._object)
  {
    v14._countAndFlagsBits = *(void *)(v0 + 16);
    v24._countAndFlagsBits = 0x2864696272;
    v24._uint64_t object = (void *)0xE500000000000000;
    sub_10024E800(v14);
    v27._countAndFlagsBits = 8233;
    v27._uint64_t object = (void *)0xE200000000000000;
    sub_10024E800(v27);
    sub_10024E800(v24);
    swift_bridgeObjectRelease();
  }
  v15._uint64_t object = *(void **)(v0 + 40);
  if (v15._object)
  {
    v15._countAndFlagsBits = *(void *)(v0 + 32);
    v24._countAndFlagsBits = 0x287372766272;
    v24._uint64_t object = (void *)0xE600000000000000;
    sub_10024E800(v15);
    v28._countAndFlagsBits = 8233;
    v28._uint64_t object = (void *)0xE200000000000000;
    sub_10024E800(v28);
    sub_10024E800(v24);
    swift_bridgeObjectRelease();
  }
  uint64_t v16 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v17 = (uint64_t *)(v0 + v16[9]);
  if ((v17[1] & 1) == 0)
  {
    uint64_t v18 = *v17;
    v24._countAndFlagsBits = 0x2864496D616461;
    v24._uint64_t object = (void *)0xE700000000000000;
    uint64_t v23 = v18;
    v29._countAndFlagsBits = sub_10024F9E0();
    sub_10024E800(v29);
    swift_bridgeObjectRelease();
    v30._countAndFlagsBits = 8233;
    v30._uint64_t object = (void *)0xE200000000000000;
    sub_10024E800(v30);
    sub_10024E800(v24);
    swift_bridgeObjectRelease();
  }
  uint64_t v19 = (uint64_t *)(v0 + v16[8]);
  if ((v19[1] & 1) == 0)
  {
    uint64_t v20 = *v19;
    v24._countAndFlagsBits = 0x6449737256747865;
    v24._uint64_t object = (void *)0xE900000000000028;
    uint64_t v23 = v20;
    v31._countAndFlagsBits = sub_10024F9E0();
    sub_10024E800(v31);
    swift_bridgeObjectRelease();
    v32._countAndFlagsBits = 8233;
    v32._uint64_t object = (void *)0xE200000000000000;
    sub_10024E800(v32);
    sub_10024E800(v24);
    swift_bridgeObjectRelease();
  }
  sub_10021DF2C(v0 + v16[10], (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100051BB4((uint64_t)v8, &qword_100319CA8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v8, v9);
    v24._countAndFlagsBits = 677669238;
    v24._uint64_t object = (void *)0xE400000000000000;
    sub_10021D120(&qword_100319CB0, (void (*)(uint64_t))&type metadata accessor for UUID);
    v33._countAndFlagsBits = sub_10024F9E0();
    sub_10024E800(v33);
    swift_bridgeObjectRelease();
    v34._countAndFlagsBits = 8233;
    v34._uint64_t object = (void *)0xE200000000000000;
    sub_10024E800(v34);
    sub_10024E800(v24);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  v24._countAndFlagsBits = 0x28726576726573;
  v24._uint64_t object = (void *)0xE700000000000000;
  sub_10021F17C(v0 + v16[7], (uint64_t)v4, type metadata accessor for ClientOverride.Server);
  v35._countAndFlagsBits = sub_10021BFF8((uint64_t)v4);
  sub_10024E800(v35);
  swift_bridgeObjectRelease();
  sub_10024E800(v24);
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t type metadata accessor for ClientOverride(uint64_t a1)
{
  return sub_10021DEF4(a1, (uint64_t *)&unk_100319D58);
}

uint64_t sub_10021DEF4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10021DF2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100019524(&qword_100319CA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ClientOverride.requestAuditTokenData.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_100047398(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t ClientOverride.requestAuditTokenData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10003F7F4(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t ClientOverride.requestBundleID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t AcknowledgeMessageRequest.offerID.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClientOverride.requestBundleVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ClientOverride.requestBundleVersion.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ClientOverride.server.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ClientOverride(0);
  return sub_10021F17C(v1 + *(int *)(v3 + 28), a1, type metadata accessor for ClientOverride.Server);
}

uint64_t ClientOverride.server.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientOverride(0) + 28);
  return sub_10021E150(a1, v3);
}

uint64_t sub_10021E150(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientOverride.Server(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*ClientOverride.server.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ClientOverride.storeExternalVersion.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ClientOverride(0) + 32));
}

uint64_t ClientOverride.storeExternalVersion.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for ClientOverride(0);
  uint64_t v6 = v2 + *(int *)(result + 32);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*ClientOverride.storeExternalVersion.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ClientOverride.storeItemID.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ClientOverride(0) + 36));
}

uint64_t ClientOverride.storeItemID.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for ClientOverride(0);
  uint64_t v6 = v2 + *(int *)(result + 36);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*ClientOverride.storeItemID.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ClientOverride.vendorID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientOverride(0) + 40);
  return sub_10021DF2C(v3, a1);
}

uint64_t ClientOverride.vendorID.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientOverride(0) + 40);
  return sub_10021E3FC(a1, v3);
}

uint64_t sub_10021E3FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100019524(&qword_100319CA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*ClientOverride.vendorID.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ClientOverride.init(requestAuditTokenData:requestBundleID:requestBundleVersion:server:storeItemID:storeExternalVersion:vendorID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, char a10, uint64_t a11, char a12, uint64_t a13)
{
  uint64_t v19 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v20 = (char *)a9 + v19[8];
  uint64_t v21 = (char *)a9 + v19[9];
  uint64_t v22 = (uint64_t)a9 + v19[10];
  uint64_t v23 = sub_10024E0A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  sub_10021D068(a7, (uint64_t)a9 + v19[7]);
  *(void *)uint64_t v20 = a11;
  v20[8] = a12 & 1;
  *(void *)uint64_t v21 = a8;
  v21[8] = a10 & 1;
  return sub_10021E3FC(a13, v22);
}

unint64_t sub_10021E5F0(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4274736575716572;
      break;
    case 2:
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0x726576726573;
      break;
    case 5:
      unint64_t result = 0x65744965726F7473;
      break;
    case 6:
      unint64_t result = 0x4449726F646E6576;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_10021E6E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10021E6FC()
{
  Swift::UInt v1 = *v0;
  sub_10024FC00();
  sub_10024FC20(v1);
  return sub_10024FC70();
}

void sub_10021E744()
{
  sub_10024FC20(*v0);
}

unint64_t sub_10021E770()
{
  return sub_10021E5F0(*v0);
}

uint64_t sub_10021E778@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100221D10(a1, a2);
  *a3 = result;
  return result;
}

void sub_10021E7A0(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_10021E7AC(uint64_t a1)
{
  unint64_t v2 = sub_10021EB28();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10021E7E8(uint64_t a1)
{
  unint64_t v2 = sub_10021EB28();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ClientOverride.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100019524(&qword_100319CB8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_10021EB28();
  sub_10024FD40();
  long long v12 = *v3;
  v11[15] = 0;
  sub_10021EB7C();
  sub_10024F910();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_10024F8D0();
    LOBYTE(v12) = 2;
    sub_10024F8D0();
    type metadata accessor for ClientOverride(0);
    LOBYTE(v12) = 3;
    type metadata accessor for ClientOverride.Server(0);
    sub_10021D120(&qword_100319CD0, (void (*)(uint64_t))type metadata accessor for ClientOverride.Server);
    sub_10024F980();
    LOBYTE(v12) = 4;
    sub_10024F930();
    LOBYTE(v12) = 5;
    sub_10024F930();
    LOBYTE(v12) = 6;
    sub_10024E0A0();
    sub_10021D120(&qword_100319CD8, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_10024F910();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_10021EB28()
{
  unint64_t result = qword_100319CC0;
  if (!qword_100319CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319CC0);
  }
  return result;
}

unint64_t sub_10021EB7C()
{
  unint64_t result = qword_100319CC8;
  if (!qword_100319CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319CC8);
  }
  return result;
}

uint64_t ClientOverride.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v3 = sub_100019524(&qword_100319CA8);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v39 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for ClientOverride.Server(0);
  __chkstk_darwin(v38, v6);
  uint64_t v37 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100019524(&qword_100319CE0);
  uint64_t v36 = *(void *)(v41 - 8);
  __chkstk_darwin(v41, v8);
  uint64_t v10 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ClientOverride(0);
  __chkstk_darwin(v11, v12);
  Swift::String v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_OWORD *)v14 + 1) = 0u;
  *((_OWORD *)v14 + 2) = 0u;
  *(_OWORD *)Swift::String v14 = xmmword_100258490;
  uint64_t v16 = &v14[v15[8]];
  *(void *)uint64_t v16 = 0;
  v16[8] = 1;
  uint64_t v17 = &v14[v15[9]];
  *(void *)uint64_t v17 = 0;
  v17[8] = 1;
  uint64_t v40 = v15;
  uint64_t v18 = (uint64_t)&v14[v15[10]];
  uint64_t v19 = sub_10024E0A0();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  uint64_t v42 = v18;
  v20(v18, 1, 1, v19);
  uint64_t v21 = a1[3];
  uint64_t v43 = a1;
  sub_10001C2A8(a1, v21);
  sub_10021EB28();
  uint64_t v22 = v44;
  sub_10024FD20();
  if (v22)
  {
    uint64_t v28 = v42;
    sub_10001C2EC((uint64_t)v43);
    sub_10003F7F4(*(void *)v14, *((void *)v14 + 1));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_100051BB4(v28, &qword_100319CA8);
  }
  else
  {
    uint64_t v44 = (uint64_t *)v16;
    uint64_t v23 = (uint64_t)v37;
    v34[1] = v19;
    uint64_t v24 = (uint64_t)v39;
    uint64_t v25 = v36;
    char v46 = 0;
    sub_10021F128();
    sub_10024F800();
    *(_OWORD *)Swift::String v14 = v45;
    LOBYTE(v45) = 1;
    *((void *)v14 + 2) = sub_10024F7C0();
    *((void *)v14 + 3) = v26;
    LOBYTE(v45) = 2;
    *((void *)v14 + 4) = sub_10024F7C0();
    *((void *)v14 + 5) = v27;
    LOBYTE(v45) = 3;
    sub_10021D120(&qword_100319CF0, (void (*)(uint64_t))type metadata accessor for ClientOverride.Server);
    sub_10024F870();
    sub_10021D068(v23, (uint64_t)&v14[v40[7]]);
    LOBYTE(v45) = 4;
    uint64_t v29 = sub_10024F820();
    Swift::String v30 = v44;
    *uint64_t v44 = v29;
    *((unsigned char *)v30 + 8) = v31 & 1;
    LOBYTE(v45) = 5;
    *(void *)uint64_t v17 = sub_10024F820();
    v17[8] = v32 & 1;
    LOBYTE(v45) = 6;
    sub_10021D120(&qword_100319CF8, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_10024F800();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v41);
    sub_10021E3FC(v24, v42);
    sub_10021F17C((uint64_t)v14, v35, type metadata accessor for ClientOverride);
    sub_10001C2EC((uint64_t)v43);
    return sub_10021F1E4((uint64_t)v14, type metadata accessor for ClientOverride);
  }
}

unint64_t sub_10021F128()
{
  unint64_t result = qword_100319CE8;
  if (!qword_100319CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319CE8);
  }
  return result;
}

uint64_t sub_10021F17C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10021F1E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10021F248@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ClientOverride.init(from:)(a1, a2);
}

uint64_t sub_10021F260(void *a1)
{
  return ClientOverride.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ClientOverride(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    unint64_t v7 = a2[1];
    if (v7 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      uint64_t v9 = *a2;
      sub_1000473AC(*a2, a2[1]);
      *uint64_t v4 = v9;
      v4[1] = v7;
    }
    uint64_t v10 = a2[3];
    _OWORD v4[2] = a2[2];
    v4[3] = v10;
    uint64_t v11 = a2[5];
    v4[4] = a2[4];
    v4[5] = v11;
    uint64_t v12 = a3[7];
    uint64_t v13 = (char *)v4 + v12;
    Swift::String v14 = (char *)a2 + v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_100019524(&qword_100319C00);
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 3, v15))
    {
      uint64_t v17 = type metadata accessor for ClientOverride.Server(0);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      uint64_t v18 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v13, v14, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 3, v15);
    }
    uint64_t v19 = a3[8];
    uint64_t v20 = a3[9];
    uint64_t v21 = (char *)v4 + v19;
    uint64_t v22 = (char *)a2 + v19;
    *(void *)uint64_t v21 = *(void *)v22;
    v21[8] = v22[8];
    uint64_t v23 = (char *)v4 + v20;
    uint64_t v24 = (char *)a2 + v20;
    *(void *)uint64_t v23 = *(void *)v24;
    v23[8] = v24[8];
    uint64_t v25 = a3[10];
    uint64_t v26 = (char *)v4 + v25;
    uint64_t v27 = (char *)a2 + v25;
    uint64_t v28 = sub_10024E0A0();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
    {
      uint64_t v30 = sub_100019524(&qword_100319CA8);
      memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
  }
  return v4;
}

uint64_t destroy for ClientOverride(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = a1[1];
  if (v4 >> 60 != 15) {
    sub_10003F808(*a1, v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v5 = (char *)a1 + *(int *)(a2 + 28);
  uint64_t v6 = sub_100019524(&qword_100319C00);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 3, v6))
  {
    uint64_t v7 = sub_10024DDC0();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }
  uint64_t v8 = (char *)a1 + *(int *)(a2 + 40);
  uint64_t v9 = sub_10024E0A0();
  uint64_t v12 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v9);
  if (!result)
  {
    uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v12 + 8);
    return v11(v8, v9);
  }
  return result;
}

uint64_t initializeWithCopy for ClientOverride(uint64_t a1, uint64_t *a2, int *a3)
{
  unint64_t v6 = a2[1];
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v7 = *a2;
    sub_1000473AC(*a2, a2[1]);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v6;
  }
  uint64_t v8 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;
  uint64_t v9 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v9;
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (char *)a2 + v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_100019524(&qword_100319C00);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 3, v13))
  {
    uint64_t v15 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    uint64_t v16 = sub_10024DDC0();
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v11, v12, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 3, v13);
  }
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = (char *)a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = v20[8];
  uint64_t v21 = a1 + v18;
  uint64_t v22 = (char *)a2 + v18;
  *(void *)uint64_t v21 = *(void *)v22;
  *(unsigned char *)(v21 + 8) = v22[8];
  uint64_t v23 = a3[10];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_10024E0A0();
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
  {
    uint64_t v28 = sub_100019524(&qword_100319CA8);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  return a1;
}

uint64_t *assignWithCopy for ClientOverride(uint64_t *a1, uint64_t *a2, int *a3)
{
  unint64_t v6 = a2[1];
  if ((unint64_t)a1[1] >> 60 == 15)
  {
    if (v6 >> 60 != 15)
    {
      uint64_t v7 = *a2;
      sub_1000473AC(*a2, a2[1]);
      *a1 = v7;
      a1[1] = v6;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 >> 60 == 15)
  {
    sub_1000567A4((uint64_t)a1);
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  uint64_t v8 = *a2;
  sub_1000473AC(*a2, a2[1]);
  uint64_t v9 = *a1;
  unint64_t v10 = a1[1];
  *a1 = v8;
  a1[1] = v6;
  sub_10003F808(v9, v10);
LABEL_8:
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100019524(&qword_100319C00);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 3, v14);
  int v18 = v16(v13, 3, v14);
  if (v17)
  {
    if (!v18)
    {
      uint64_t v19 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v12, v13, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 3, v14);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v18)
  {
    sub_100051BB4((uint64_t)v12, &qword_100319C00);
LABEL_13:
    uint64_t v20 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v12, v13, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_14;
  }
  uint64_t v39 = sub_10024DDC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 24))(v12, v13, v39);
LABEL_14:
  uint64_t v21 = a3[8];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = *(void *)v23;
  v22[8] = v23[8];
  *(void *)uint64_t v22 = v24;
  uint64_t v25 = a3[9];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = *(void *)v27;
  v26[8] = v27[8];
  *(void *)uint64_t v26 = v28;
  uint64_t v29 = a3[10];
  uint64_t v30 = (char *)a1 + v29;
  char v31 = (char *)a2 + v29;
  uint64_t v32 = sub_10024E0A0();
  uint64_t v33 = *(void *)(v32 - 8);
  Swift::String v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
  int v35 = v34(v30, 1, v32);
  int v36 = v34(v31, 1, v32);
  if (!v35)
  {
    if (!v36)
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 24))(v30, v31, v32);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v33 + 8))(v30, v32);
    goto LABEL_19;
  }
  if (v36)
  {
LABEL_19:
    uint64_t v37 = sub_100019524(&qword_100319CA8);
    memcpy(v30, v31, *(void *)(*(void *)(v37 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
  return a1;
}

_OWORD *initializeWithTake for ClientOverride(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[7];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100019524(&qword_100319C00);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 3, v10))
  {
    uint64_t v12 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v8, v9, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 3, v10);
  }
  uint64_t v14 = a3[8];
  uint64_t v15 = a3[9];
  uint64_t v16 = (char *)a1 + v14;
  int v17 = (char *)a2 + v14;
  *(void *)uint64_t v16 = *(void *)v17;
  v16[8] = v17[8];
  int v18 = (char *)a1 + v15;
  uint64_t v19 = (char *)a2 + v15;
  *(void *)int v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = a3[10];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = sub_10024E0A0();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    uint64_t v25 = sub_100019524(&qword_100319CA8);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  return a1;
}

uint64_t assignWithTake for ClientOverride(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v7 = *(void *)(a2 + 8);
  if (v7 >> 60 == 15)
  {
    sub_1000567A4(a1);
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v7;
  sub_10003F808(v8, v6);
LABEL_6:
  uint64_t v9 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = sub_100019524(&qword_100319C00);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 3, v14);
  int v18 = v16(v13, 3, v14);
  if (v17)
  {
    if (!v18)
    {
      uint64_t v19 = sub_10024DDC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 32))(v12, v13, v19);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 3, v14);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v18)
  {
    sub_100051BB4((uint64_t)v12, &qword_100319C00);
LABEL_11:
    uint64_t v20 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v12, v13, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_12;
  }
  uint64_t v37 = sub_10024DDC0();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v37 - 8) + 40))(v12, v13, v37);
LABEL_12:
  uint64_t v21 = a3[8];
  uint64_t v22 = a3[9];
  uint64_t v23 = a1 + v21;
  uint64_t v24 = a2 + v21;
  *(void *)uint64_t v23 = *(void *)v24;
  *(unsigned char *)(v23 + 8) = *(unsigned char *)(v24 + 8);
  uint64_t v25 = a1 + v22;
  uint64_t v26 = a2 + v22;
  *(void *)uint64_t v25 = *(void *)v26;
  *(unsigned char *)(v25 + 8) = *(unsigned char *)(v26 + 8);
  uint64_t v27 = a3[10];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  uint64_t v30 = sub_10024E0A0();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v31 + 48);
  int v33 = v32(v28, 1, v30);
  int v34 = v32(v29, 1, v30);
  if (!v33)
  {
    if (!v34)
    {
      (*(void (**)(void *, void *, uint64_t))(v31 + 40))(v28, v29, v30);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v31 + 8))(v28, v30);
    goto LABEL_17;
  }
  if (v34)
  {
LABEL_17:
    uint64_t v35 = sub_100019524(&qword_100319CA8);
    memcpy(v28, v29, *(void *)(*(void *)(v35 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v31 + 32))(v28, v29, v30);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientOverride(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100220338);
}

uint64_t sub_100220338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = type metadata accessor for ClientOverride.Server(0);
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = a1 + *(int *)(a3 + 28);
      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = sub_100019524(&qword_100319CA8);
      uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = a1 + *(int *)(a3 + 40);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t storeEnumTagSinglePayload for ClientOverride(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100220488);
}

uint64_t sub_100220488(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 24) = a2;
  }
  else
  {
    uint64_t v8 = type metadata accessor for ClientOverride.Server(0);
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
      uint64_t v13 = sub_100019524(&qword_100319CA8);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 40);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_1002205B8()
{
  type metadata accessor for ClientOverride.Server(319);
  if (v0 <= 0x3F)
  {
    sub_1002206A4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1002206A4()
{
  if (!qword_100319D68)
  {
    sub_10024E0A0();
    unint64_t v0 = sub_10024F030();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100319D68);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ClientOverride.Server(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_100019524(&qword_100319C00);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_10024DDC0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t destroy for ClientOverride.Server(uint64_t a1)
{
  uint64_t v2 = sub_100019524(&qword_100319C00);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 3, v2);
  if (!result)
  {
    uint64_t v4 = sub_10024DDC0();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(a1, v4);
  }
  return result;
}

void *initializeWithCopy for ClientOverride.Server(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100019524(&qword_100319C00);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_10024DDC0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *assignWithCopy for ClientOverride.Server(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100019524(&qword_100319C00);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_10024DDC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 24))(a1, a2, v13);
      return a1;
    }
    sub_100051BB4((uint64_t)a1, &qword_100319C00);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_10024DDC0();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

void *initializeWithTake for ClientOverride.Server(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100019524(&qword_100319C00);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_10024DDC0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *assignWithTake for ClientOverride.Server(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100019524(&qword_100319C00);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_10024DDC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 40))(a1, a2, v13);
      return a1;
    }
    sub_100051BB4((uint64_t)a1, &qword_100319C00);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_10024DDC0();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientOverride.Server(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100220EE8);
}

uint64_t sub_100220EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100019524(&qword_100319C00);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ClientOverride.Server(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100220F6C);
}

uint64_t sub_100220F6C(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_100019524(&qword_100319C00);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_100220FF4(uint64_t a1)
{
  uint64_t v2 = sub_100019524(&qword_100319C00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 3, v2);
}

uint64_t sub_100221060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100019524(&qword_100319C00);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 3, v4);
}

uint64_t sub_1002210D4()
{
  uint64_t result = sub_10024DDC0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for ClientOverride.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ClientOverride.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ClientOverride.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x1002212B4);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientOverride.CodingKeys()
{
  return &type metadata for ClientOverride.CodingKeys;
}

ValueMetadata *type metadata accessor for ClientOverride.Server.AutomaticCodingKeys()
{
  return &type metadata for ClientOverride.Server.AutomaticCodingKeys;
}

ValueMetadata *type metadata accessor for ClientOverride.Server.ProductionCodingKeys()
{
  return &type metadata for ClientOverride.Server.ProductionCodingKeys;
}

ValueMetadata *type metadata accessor for ClientOverride.Server.SandboxCodingKeys()
{
  return &type metadata for ClientOverride.Server.SandboxCodingKeys;
}

uint64_t getEnumTagSinglePayload for ClientOverride.Server.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ClientOverride.Server.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100221478);
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

ValueMetadata *type metadata accessor for ClientOverride.Server.CodingKeys()
{
  return &type metadata for ClientOverride.Server.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ClientOverride.Server.XcodeTestCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100221550);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientOverride.Server.XcodeTestCodingKeys()
{
  return &type metadata for ClientOverride.Server.XcodeTestCodingKeys;
}

unint64_t sub_10022158C()
{
  unint64_t result = qword_100319E30;
  if (!qword_100319E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E30);
  }
  return result;
}

unint64_t sub_1002215E4()
{
  unint64_t result = qword_100319E38;
  if (!qword_100319E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E38);
  }
  return result;
}

unint64_t sub_10022163C()
{
  unint64_t result = qword_100319E40;
  if (!qword_100319E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E40);
  }
  return result;
}

unint64_t sub_100221694()
{
  unint64_t result = qword_100319E48;
  if (!qword_100319E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E48);
  }
  return result;
}

unint64_t sub_1002216EC()
{
  unint64_t result = qword_100319E50;
  if (!qword_100319E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E50);
  }
  return result;
}

unint64_t sub_100221744()
{
  unint64_t result = qword_100319E58;
  if (!qword_100319E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E58);
  }
  return result;
}

unint64_t sub_10022179C()
{
  unint64_t result = qword_100319E60;
  if (!qword_100319E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E60);
  }
  return result;
}

unint64_t sub_1002217F4()
{
  unint64_t result = qword_100319E68;
  if (!qword_100319E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E68);
  }
  return result;
}

unint64_t sub_10022184C()
{
  unint64_t result = qword_100319E70;
  if (!qword_100319E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E70);
  }
  return result;
}

unint64_t sub_1002218A4()
{
  unint64_t result = qword_100319E78;
  if (!qword_100319E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E78);
  }
  return result;
}

unint64_t sub_1002218FC()
{
  unint64_t result = qword_100319E80;
  if (!qword_100319E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E80);
  }
  return result;
}

unint64_t sub_100221954()
{
  unint64_t result = qword_100319E88;
  if (!qword_100319E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E88);
  }
  return result;
}

unint64_t sub_1002219AC()
{
  unint64_t result = qword_100319E90;
  if (!qword_100319E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E90);
  }
  return result;
}

unint64_t sub_100221A04()
{
  unint64_t result = qword_100319E98;
  if (!qword_100319E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319E98);
  }
  return result;
}

unint64_t sub_100221A5C()
{
  unint64_t result = qword_100319EA0;
  if (!qword_100319EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319EA0);
  }
  return result;
}

uint64_t sub_100221AB0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6974616D6F747561 && a2 == 0xE900000000000063;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69746375646F7270 && a2 == 0xEA00000000006E6FLL || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x786F62646E6173 && a2 == 0xE700000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73655465646F6378 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_100221C88(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000100285010)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_10024FA60();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_100221D10(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x8000000100285030 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4274736575716572 && a2 == 0xEF4449656C646E75 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000100285050 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x726576726573 && a2 == 0xE600000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000100285070 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x65744965726F7473 && a2 == 0xEB0000000044496DLL || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x4449726F646E6576 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v5 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v5) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

Swift::Bool __swiftcall NSFileManager.isDirectory(atPath:)(Swift::String atPath)
{
  Swift::Bool v4 = 0;
  NSString v2 = sub_10024E6A0();
  [v1 fileExistsAtPath:v2 isDirectory:&v4];

  return v4;
}

uint64_t NSFileManager.fileExists(at:)()
{
  char v5 = 0;
  sub_10024DD80(0);
  NSString v1 = sub_10024E6A0();
  swift_bridgeObjectRelease();
  unsigned int v2 = [v0 fileExistsAtPath:v1 isDirectory:&v5];

  if (v5) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  return v3 | v2;
}

BOOL ExternalGatewayMode.isLink.getter(char a1)
{
  return (a1 & 0xFD) == 0;
}

unint64_t ExternalGatewayMode.description.getter(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1002221F8@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s15StoreKit_Shared19ExternalGatewayModeO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_100222224(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100222230()
{
  return sub_10024EA60();
}

uint64_t sub_100222290()
{
  return sub_10024EA10();
}

Swift::Int sub_1002222E0()
{
  return sub_10024FC70();
}

uint64_t sub_100222388()
{
  sub_10024E780();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100222418()
{
  return sub_10024FC70();
}

unint64_t ExternalGatewayOptionsKey.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000013;
  if (a1 == 1) {
    return 0xD000000000000015;
  }
  return result;
}

uint64_t sub_10022251C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100228A40(*a1, *a2);
}

Swift::Int sub_100222528()
{
  return sub_1002222E0();
}

uint64_t sub_100222530()
{
  return sub_100222388();
}

Swift::Int sub_100222538()
{
  return sub_100222418();
}

uint64_t sub_100222540@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s15StoreKit_Shared25ExternalGatewayOptionsKeyO8rawValueACSgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100222570@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ExternalGatewayOptionsKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t ExternalGatewaySheetRequest.generateToken.getter()
{
  return *v0;
}

uint64_t ExternalGatewaySheetRequest.kind.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ExternalGatewaySheetRequest.logKey.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ExternalGatewaySheetRequest.logKey.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t ExternalGatewaySheetRequest.options.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t ExternalGatewaySheetRequest.presentSheet.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t ExternalGatewaySheetRequest.init(kind:options:presentSheet:hostSceneID:generateToken:logKey:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  *(unsigned char *)a9 = a6;
  *(unsigned char *)(a9 + 1) = result;
  *(void *)(a9 + 8) = a7;
  *(void *)(a9 + 16) = a8;
  *(void *)(a9 + 24) = a2;
  *(unsigned char *)(a9 + 32) = a3;
  *(void *)(a9 + 40) = a4;
  *(void *)(a9 + 48) = a5;
  return result;
}

uint64_t ExternalGatewaySheetRequest.subscript.getter@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = sub_10024F030();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v22 - v10;
  sub_1000458B4(v3 + 24, (uint64_t)v24, &qword_100319EA8);
  sub_1000458B4((uint64_t)v24, (uint64_t)&v25, &qword_100319EA8);
  uint64_t v12 = v25;
  if (!v25)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    goto LABEL_14;
  }
  uint64_t v13 = 0xD000000000000013;
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v13 = 0xD000000000000015;
      uint64_t v14 = 0x8000000100284EF0;
    }
    else
    {
      uint64_t v14 = 0x8000000100284F10;
    }
    if (!*(void *)(v25 + 16)) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v14 = 0x8000000100284ED0;
    if (!*(void *)(v25 + 16))
    {
LABEL_12:
      long long v22 = 0u;
      long long v23 = 0u;
      goto LABEL_13;
    }
  }
  unint64_t v15 = sub_100222E80(v13, v14);
  if ((v16 & 1) == 0) {
    goto LABEL_12;
  }
  sub_1000318C8(*(void *)(v12 + 56) + 32 * v15, (uint64_t)&v22);
LABEL_13:
  swift_bridgeObjectRelease();
LABEL_14:
  sub_100019524(&qword_100319EB0);
  int v17 = swift_dynamicCast();
  int v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56);
  if (v17)
  {
    uint64_t v19 = *(void *)(a2 - 8);
    v18(v11, 0, 1, a2);
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(a3, v11, a2);
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = 1;
    v18(v11, 1, 1, a2);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v18)(a3, v20, 1, a2);
}

double ExternalGatewaySheetRequest.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100222F54(a1, v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t ExternalGatewaySheetRequest.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100019524(&qword_100319EB8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v20[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  sub_100223670();
  sub_10024FD40();
  LOBYTE(v20[0]) = 0;
  sub_10024F950();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  LOBYTE(v20[0]) = *(unsigned char *)(v3 + 1);
  HIBYTE(v19) = 1;
  sub_1002236C4();
  sub_10024F980();
  LOBYTE(v20[0]) = 2;
  sub_10024F940();
  LOBYTE(v20[0]) = 4;
  sub_10024F950();
  sub_1000458B4(v3 + 40, (uint64_t)v22, &qword_100319ED0);
  sub_1000458B4((uint64_t)v22, (uint64_t)v20, &qword_100319ED0);
  HIBYTE(v19) = 5;
  sub_100019524(&qword_100319ED0);
  sub_100223718();
  sub_10024F980();
  sub_1000458B4(v3 + 24, (uint64_t)v21, &qword_100319EA8);
  sub_1000458B4((uint64_t)v21, (uint64_t)&v23, &qword_100319EA8);
  if (!v23) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  uint64_t v11 = self;
  Class isa = sub_10024E4E0().super.isa;
  v20[0] = 0;
  id v13 = [v11 dataWithJSONObject:isa options:0 error:v20];

  id v14 = v20[0];
  if (!v13)
  {
    int v18 = v14;
    sub_10024DCE0();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  unint64_t v15 = (void *)sub_10024DF10();
  int v17 = v16;

  v20[0] = v15;
  v20[1] = v17;
  HIBYTE(v19) = 3;
  sub_10021EB7C();
  sub_10024F980();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return sub_10003F808((uint64_t)v15, (unint64_t)v17);
}

uint64_t sub_100222CC4()
{
  uint64_t result = 0x65746172656E6567;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1684957547;
      break;
    case 2:
      uint64_t result = 0x79654B676F6CLL;
      break;
    case 3:
      uint64_t result = 0x736E6F6974706FLL;
      break;
    case 4:
      uint64_t result = 0x53746E6573657270;
      break;
    case 5:
      uint64_t result = 0x6E65635374736F68;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100222D9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100223FE4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100222DC4(uint64_t a1)
{
  unint64_t v2 = sub_100223670();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100222E00(uint64_t a1)
{
  unint64_t v2 = sub_100223670();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100222E3C(void *a1)
{
  return ExternalGatewaySheetRequest.encode(to:)(a1);
}

unint64_t sub_100222E80(uint64_t a1, uint64_t a2)
{
  sub_10024FC00();
  sub_10024E780();
  Swift::Int v4 = sub_10024FC70();
  return sub_10011EF90(a1, a2, v4);
}

unint64_t _s15StoreKit_Shared19ExternalGatewayModeO8rawValueACSgSi_tcfC_0(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t _s15StoreKit_Shared25ExternalGatewayOptionsKeyO8rawValueACSgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1002F2598;
  v6._uint64_t object = a2;
  unint64_t v4 = sub_10024F790(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_100222F54@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = sub_10024F3C0();
  uint64_t v58 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100019524(&qword_100319F10);
  uint64_t v59 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  uint64_t v60 = a1;
  sub_10001C2A8(a1, v12);
  unint64_t v13 = sub_100223670();
  id v14 = v61;
  sub_10024FD20();
  if (v14)
  {
    sub_10001C2EC((uint64_t)v60);
    return swift_bridgeObjectRelease();
  }
  uint64_t v61 = a2;
  uint64_t v56 = v4;
  uint64_t v57 = v7;
  uint64_t v15 = v59;
  LOBYTE(v63) = 0;
  int v16 = sub_10024F840();
  LOBYTE(v62) = 1;
  sub_1002242F8();
  sub_10024F870();
  LODWORD(v55) = v16;
  int v17 = v63;
  LOBYTE(v63) = 2;
  uint64_t v18 = sub_10024F830();
  uint64_t v21 = v20;
  uint64_t v53 = v18;
  int v54 = v17;
  LOBYTE(v63) = 4;
  swift_bridgeObjectRetain();
  int v51 = sub_10024F840();
  LOBYTE(v63) = 5;
  uint64_t v22 = sub_10024F7C0();
  LOBYTE(v62) = 3;
  uint64_t v24 = v23;
  sub_10021F128();
  uint64_t v52 = v24;
  swift_bridgeObjectRetain();
  sub_10024F800();
  uint64_t v49 = v22;
  uint64_t v50 = v8;
  unint64_t v25 = v64;
  if (v64 >> 60 != 15)
  {
    uint64_t v29 = v21;
    uint64_t v30 = v63;
    uint64_t v31 = self;
    Class isa = sub_10024DEF0().super.isa;
    uint64_t v63 = 0;
    id v33 = [v31 JSONObjectWithData:isa options:0 error:&v63];

    char v28 = v55;
    if (v33)
    {
      int v34 = v63;
      sub_10024F250();
      swift_unknownObjectRelease();
      sub_100019524(&qword_100319F20);
      if (swift_dynamicCast())
      {
        uint64_t v26 = v29;
        sub_10003F7F4((uint64_t)v30, v25);
        uint64_t v27 = v62;
        (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v50);
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100019524(&qword_100319F28);
      uint64_t v40 = swift_allocObject();
      uint64_t v61 = v30;
      *(_OWORD *)(v40 + 16) = xmmword_100255FB0;
      *(void *)(v40 + 56) = &type metadata for ExternalGatewaySheetRequest.CodingKeys;
      *(void *)(v40 + 64) = v13;
      *(unsigned char *)(v40 + 32) = 3;
      uint64_t v63 = 0;
      unint64_t v64 = 0xE000000000000000;
      sub_10024F330(28);
      swift_bridgeObjectRelease();
      uint64_t v41 = v57;
      sub_10024F3B0();
      uint64_t v42 = sub_10024F3D0();
      swift_allocError();
      uint64_t v44 = v43;
      uint64_t v45 = v58;
      char v46 = *(void (**)(uint64_t, char *, uint64_t))(v58 + 16);
      unint64_t v55 = v25;
      uint64_t v47 = v56;
      v46(v43, v41, v56);
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v42 - 8) + 104))(v44, enum case for DecodingError.dataCorrupted(_:), v42);
      swift_willThrow();
      sub_10003F7F4((uint64_t)v61, v55);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v41, v47);
    }
    else
    {
      uint64_t v39 = v63;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10024DCE0();

      swift_willThrow();
      sub_10003F7F4((uint64_t)v30, v25);
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v50);
    sub_10001C2EC((uint64_t)v60);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  uint64_t v26 = v21;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v50);
  swift_bridgeObjectRelease();
  uint64_t v27 = 0;
  char v28 = v55;
LABEL_10:
  char v35 = v28 & 1;
  char v36 = v51 & 1;
  swift_bridgeObjectRetain();
  sub_10001C2EC((uint64_t)v60);
  uint64_t v37 = v52;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v38 = v61;
  *uint64_t v61 = v35;
  v38[1] = v54;
  *((void *)v38 + 1) = v53;
  *((void *)v38 + 2) = v26;
  *((void *)v38 + 3) = v27;
  v38[32] = v36;
  *((void *)v38 + 5) = v49;
  *((void *)v38 + 6) = v37;
  return result;
}

unint64_t sub_100223670()
{
  unint64_t result = qword_100319EC0;
  if (!qword_100319EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319EC0);
  }
  return result;
}

unint64_t sub_1002236C4()
{
  unint64_t result = qword_100319EC8;
  if (!qword_100319EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319EC8);
  }
  return result;
}

unint64_t sub_100223718()
{
  unint64_t result = qword_100319ED8;
  if (!qword_100319ED8)
  {
    sub_10001B028(&qword_100319ED0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319ED8);
  }
  return result;
}

unint64_t sub_100223788()
{
  unint64_t result = qword_100319EE0;
  if (!qword_100319EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319EE0);
  }
  return result;
}

unint64_t sub_1002237E0()
{
  unint64_t result = qword_100319EE8;
  if (!qword_100319EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319EE8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ExternalGatewayMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100223900);
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

ValueMetadata *type metadata accessor for ExternalGatewayMode()
{
  return &type metadata for ExternalGatewayMode;
}

uint64_t getEnumTagSinglePayload for ExternalGatewayOptionsKey(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ExternalGatewayOptionsKey(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100223A94);
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

ValueMetadata *type metadata accessor for ExternalGatewayOptionsKey()
{
  return &type metadata for ExternalGatewayOptionsKey;
}

uint64_t destroy for ExternalGatewaySheetRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ExternalGatewaySheetRequest(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ExternalGatewaySheetRequest(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ExternalGatewaySheetRequest(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ExternalGatewaySheetRequest(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExternalGatewaySheetRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExternalGatewaySheetRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExternalGatewaySheetRequest()
{
  return &type metadata for ExternalGatewaySheetRequest;
}

uint64_t getEnumTagSinglePayload for ExternalGatewaySheetRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ExternalGatewaySheetRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x100223EA4);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExternalGatewaySheetRequest.CodingKeys()
{
  return &type metadata for ExternalGatewaySheetRequest.CodingKeys;
}

unint64_t sub_100223EE0()
{
  unint64_t result = qword_100319EF0;
  if (!qword_100319EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319EF0);
  }
  return result;
}

unint64_t sub_100223F38()
{
  unint64_t result = qword_100319EF8;
  if (!qword_100319EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319EF8);
  }
  return result;
}

unint64_t sub_100223F90()
{
  unint64_t result = qword_100319F00;
  if (!qword_100319F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319F00);
  }
  return result;
}

uint64_t sub_100223FE4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65746172656E6567 && a2 == 0xED00006E656B6F54;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x736E6F6974706FLL && a2 == 0xE700000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x53746E6573657270 && a2 == 0xEC00000074656568 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E65635374736F68 && a2 == 0xEB00000000444965)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

unint64_t sub_1002242A4()
{
  unint64_t result = qword_100319F08;
  if (!qword_100319F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319F08);
  }
  return result;
}

unint64_t sub_1002242F8()
{
  unint64_t result = qword_100319F18;
  if (!qword_100319F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319F18);
  }
  return result;
}

unint64_t sub_10022434C(char a1)
{
  unint64_t result = 0x4465727574616566;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4164696C61766E69;
      break;
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
      unint64_t result = 0x7469746E45746F6ELL;
      break;
    case 4:
      unint64_t result = 0x746E6F4349556F6ELL;
      break;
    case 5:
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    case 8:
      unint64_t result = 0x636E614372657375;
      break;
    case 9:
      unint64_t result = 0x4D746E756F636361;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1002244C0(uint64_t a1)
{
  unint64_t v2 = sub_1002253E4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002244FC(uint64_t a1)
{
  unint64_t v2 = sub_1002253E4();
  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_100224538()
{
  return sub_10022434C(*v0);
}

uint64_t sub_100224540@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1002259E8(a1, a2);
  *a3 = result;
  return result;
}

void sub_100224568(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_100224574(uint64_t a1)
{
  unint64_t v2 = sub_100225390();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002245B0(uint64_t a1)
{
  unint64_t v2 = sub_100225390();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1002245EC(uint64_t a1)
{
  unint64_t v2 = sub_1002256D8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100224628(uint64_t a1)
{
  unint64_t v2 = sub_1002256D8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100224664(uint64_t a1)
{
  unint64_t v2 = sub_100225684();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002246A0(uint64_t a1)
{
  unint64_t v2 = sub_100225684();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1002246DC(uint64_t a1)
{
  unint64_t v2 = sub_100225588();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100224718(uint64_t a1)
{
  unint64_t v2 = sub_100225588();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100224754(uint64_t a1)
{
  unint64_t v2 = sub_100225630();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100224790(uint64_t a1)
{
  unint64_t v2 = sub_100225630();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1002247CC(uint64_t a1)
{
  unint64_t v2 = sub_1002255DC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100224808(uint64_t a1)
{
  unint64_t v2 = sub_1002255DC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100224844(uint64_t a1)
{
  unint64_t v2 = sub_100225534();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100224880(uint64_t a1)
{
  unint64_t v2 = sub_100225534();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1002248BC(uint64_t a1)
{
  unint64_t v2 = sub_1002254E0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002248F8(uint64_t a1)
{
  unint64_t v2 = sub_1002254E0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100224934(uint64_t a1)
{
  unint64_t v2 = sub_10022548C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100224970(uint64_t a1)
{
  unint64_t v2 = sub_10022548C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1002249AC(uint64_t a1)
{
  unint64_t v2 = sub_100225438();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002249E8(uint64_t a1)
{
  unint64_t v2 = sub_100225438();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t StoreKitInternalError.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v72 = a2;
  uint64_t v3 = sub_100019524(&qword_100319F30);
  uint64_t v70 = *(void *)(v3 - 8);
  uint64_t v71 = v3;
  __chkstk_darwin(v3, v4);
  uint64_t v69 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100019524(&qword_100319F38);
  uint64_t v67 = *(void *)(v6 - 8);
  uint64_t v68 = v6;
  __chkstk_darwin(v6, v7);
  uint64_t v66 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100019524(&qword_100319F40);
  uint64_t v64 = *(void *)(v9 - 8);
  uint64_t v65 = v9;
  __chkstk_darwin(v9, v10);
  uint64_t v63 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100019524(&qword_100319F48);
  uint64_t v61 = *(void *)(v12 - 8);
  uint64_t v62 = v12;
  __chkstk_darwin(v12, v13);
  uint64_t v60 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100019524(&qword_100319F50);
  uint64_t v58 = *(void *)(v15 - 8);
  uint64_t v59 = v15;
  __chkstk_darwin(v15, v16);
  uint64_t v57 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100019524(&qword_100319F58);
  uint64_t v55 = *(void *)(v56 - 8);
  __chkstk_darwin(v56, v18);
  int v54 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_100019524(&qword_100319F60);
  uint64_t v52 = *(void *)(v53 - 8);
  __chkstk_darwin(v53, v20);
  int v51 = (char *)&v46 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100019524(&qword_100319F68);
  uint64_t v49 = *(void *)(v50 - 8);
  __chkstk_darwin(v50, v22);
  uint64_t v24 = (char *)&v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100019524(&qword_100319F70);
  uint64_t v48 = *(void *)(v25 - 8);
  __chkstk_darwin(v25, v26);
  char v28 = (char *)&v46 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100019524(&qword_100319F78);
  uint64_t v47 = *(void *)(v29 - 8);
  __chkstk_darwin(v29, v30);
  uint64_t v32 = (char *)&v46 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_100019524(&qword_100319F80);
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v73 = v33;
  uint64_t v74 = v34;
  __chkstk_darwin(v33, v35);
  uint64_t v37 = (char *)&v46 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  sub_100225390();
  sub_10024FD40();
  switch((char)v72)
  {
    case 1:
      char v76 = 1;
      sub_100225684();
      uint64_t v39 = v73;
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v28, v25);
      return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v37, v39);
    case 2:
      char v77 = 2;
      sub_100225630();
      uint64_t v38 = v73;
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v24, v50);
      return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v37, v38);
    case 3:
      char v78 = 3;
      sub_1002255DC();
      uint64_t v41 = v51;
      uint64_t v38 = v73;
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v41, v53);
      return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v37, v38);
    case 4:
      char v79 = 4;
      sub_100225588();
      uint64_t v42 = v54;
      uint64_t v38 = v73;
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v42, v56);
      return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v37, v38);
    case 5:
      char v80 = 5;
      sub_100225534();
      uint64_t v43 = v57;
      uint64_t v38 = v73;
      sub_10024F8C0();
      uint64_t v45 = v58;
      uint64_t v44 = v59;
      goto LABEL_12;
    case 6:
      char v81 = 6;
      sub_1002254E0();
      uint64_t v43 = v60;
      uint64_t v38 = v73;
      sub_10024F8C0();
      uint64_t v45 = v61;
      uint64_t v44 = v62;
      goto LABEL_12;
    case 7:
      char v82 = 7;
      sub_10022548C();
      uint64_t v43 = v63;
      uint64_t v38 = v73;
      sub_10024F8C0();
      uint64_t v45 = v64;
      uint64_t v44 = v65;
      goto LABEL_12;
    case 8:
      char v83 = 8;
      sub_100225438();
      uint64_t v43 = v66;
      uint64_t v38 = v73;
      sub_10024F8C0();
      uint64_t v45 = v67;
      uint64_t v44 = v68;
      goto LABEL_12;
    case 9:
      char v84 = 9;
      sub_1002253E4();
      uint64_t v43 = v69;
      uint64_t v38 = v73;
      sub_10024F8C0();
      uint64_t v45 = v70;
      uint64_t v44 = v71;
LABEL_12:
      (*(void (**)(char *, uint64_t))(v45 + 8))(v43, v44);
      break;
    default:
      char v75 = 0;
      sub_1002256D8();
      uint64_t v38 = v73;
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v32, v29);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v37, v38);
}

unint64_t sub_100225390()
{
  unint64_t result = qword_100319F88;
  if (!qword_100319F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319F88);
  }
  return result;
}

unint64_t sub_1002253E4()
{
  unint64_t result = qword_100319F90;
  if (!qword_100319F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319F90);
  }
  return result;
}

unint64_t sub_100225438()
{
  unint64_t result = qword_100319F98;
  if (!qword_100319F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319F98);
  }
  return result;
}

unint64_t sub_10022548C()
{
  unint64_t result = qword_100319FA0;
  if (!qword_100319FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319FA0);
  }
  return result;
}

unint64_t sub_1002254E0()
{
  unint64_t result = qword_100319FA8;
  if (!qword_100319FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319FA8);
  }
  return result;
}

unint64_t sub_100225534()
{
  unint64_t result = qword_100319FB0;
  if (!qword_100319FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319FB0);
  }
  return result;
}

unint64_t sub_100225588()
{
  unint64_t result = qword_100319FB8;
  if (!qword_100319FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319FB8);
  }
  return result;
}

unint64_t sub_1002255DC()
{
  unint64_t result = qword_100319FC0;
  if (!qword_100319FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319FC0);
  }
  return result;
}

unint64_t sub_100225630()
{
  unint64_t result = qword_100319FC8;
  if (!qword_100319FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319FC8);
  }
  return result;
}

unint64_t sub_100225684()
{
  unint64_t result = qword_100319FD0;
  if (!qword_100319FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319FD0);
  }
  return result;
}

unint64_t sub_1002256D8()
{
  unint64_t result = qword_100319FD8;
  if (!qword_100319FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319FD8);
  }
  return result;
}

char *StoreKitInternalError.init(from:)(void *a1)
{
  return sub_100225E88(a1);
}

char *sub_100225744@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100225E88(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_100225770(void *a1)
{
  return StoreKitInternalError.encode(to:)(a1, *v1);
}

uint64_t StoreKitServerError.rawValue.getter(char a1)
{
  return qword_10026F648[a1];
}

BOOL sub_1002257A4(char *a1, char *a2)
{
  return qword_10026F648[*a1] == qword_10026F648[*a2];
}

Swift::Int sub_1002257C8()
{
  uint64_t v1 = *v0;
  sub_10024FC00();
  sub_10024FC20(qword_10026F648[v1]);
  return sub_10024FC70();
}

void sub_100225818()
{
  sub_10024FC20(qword_10026F648[*v0]);
}

Swift::Int sub_100225850()
{
  uint64_t v1 = *v0;
  sub_10024FC00();
  sub_10024FC20(qword_10026F648[v1]);
  return sub_10024FC70();
}

uint64_t sub_10022589C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s15StoreKit_Shared0aB11ServerErrorO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_1002258C8(void *a1@<X8>)
{
  *a1 = qword_10026F648[*v1];
}

uint64_t sub_1002258E0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10022795C();
  unint64_t v5 = sub_1002279B0();
  return Error<>._code.getter(a1, a2, v4, v5);
}

uint64_t sub_100225938()
{
  return sub_10024EA60();
}

uint64_t sub_100225998()
{
  return sub_10024EA10();
}

uint64_t sub_1002259E8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4465727574616566 && a2 == 0xEF64656C62617369;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4164696C61766E69 && a2 == 0xEA00000000007070 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000100285150 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7469746E45746F6ELL && a2 == 0xEB0000000064656CLL || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x746E6F4349556F6ELL && a2 == 0xEB00000000747865 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100285170 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100285190 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x636E614372657375 && a2 == 0xED000064656C6C65 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x4D746E756F636361 && a2 == 0xEE00676E69737369)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

char *sub_100225E88(void *a1)
{
  uint64_t v2 = sub_100019524(&qword_10031A0B8);
  uint64_t v80 = *(void *)(v2 - 8);
  uint64_t v81 = v2;
  __chkstk_darwin(v2, v3);
  uint64_t v85 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100019524(&qword_10031A0C0);
  uint64_t v78 = *(void *)(v5 - 8);
  uint64_t v79 = v5;
  __chkstk_darwin(v5, v6);
  uint64_t v89 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100019524(&qword_10031A0C8);
  uint64_t v76 = *(void *)(v8 - 8);
  uint64_t v77 = v8;
  __chkstk_darwin(v8, v9);
  char v84 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100019524(&qword_10031A0D0);
  uint64_t v74 = *(void *)(v11 - 8);
  uint64_t v75 = v11;
  __chkstk_darwin(v11, v12);
  uint64_t v88 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100019524(&qword_10031A0D8);
  uint64_t v72 = *(void *)(v14 - 8);
  uint64_t v73 = v14;
  __chkstk_darwin(v14, v15);
  uint64_t v87 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_100019524(&qword_10031A0E0);
  uint64_t v70 = *(void *)(v71 - 8);
  __chkstk_darwin(v71, v17);
  uint64_t v86 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_100019524(&qword_10031A0E8);
  uint64_t v68 = *(void *)(v69 - 8);
  __chkstk_darwin(v69, v19);
  char v83 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_100019524(&qword_10031A0F0);
  uint64_t v66 = *(void *)(v67 - 8);
  __chkstk_darwin(v67, v21);
  char v82 = (char *)&v60 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100019524(&qword_10031A0F8);
  uint64_t v64 = *(void *)(v65 - 8);
  __chkstk_darwin(v65, v23);
  uint64_t v25 = (char *)&v60 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100019524(&qword_10031A100);
  uint64_t v63 = *(void *)(v26 - 8);
  __chkstk_darwin(v26, v27);
  uint64_t v29 = (char *)&v60 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100019524(&qword_10031A108);
  uint64_t v31 = *(void *)(v30 - 8);
  __chkstk_darwin(v30, v32);
  uint64_t v34 = (char *)&v60 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = a1[3];
  uint64_t v90 = a1;
  sub_10001C2A8(a1, v35);
  sub_100225390();
  uint64_t v36 = v91;
  sub_10024FD20();
  if (!v36)
  {
    uint64_t v61 = v29;
    uint64_t v60 = v26;
    uint64_t v62 = v25;
    uint64_t v37 = v86;
    uint64_t v38 = v87;
    uint64_t v40 = v88;
    uint64_t v39 = v89;
    uint64_t v91 = v31;
    uint64_t v41 = v34;
    uint64_t v42 = sub_10024F890();
    if (*(void *)(v42 + 16) == 1)
    {
      uint64_t v34 = (char *)*(unsigned __int8 *)(v42 + 32);
      switch(*(unsigned char *)(v42 + 32))
      {
        case 1:
          uint64_t v43 = v91;
          v92[7] = 1;
          sub_100225684();
          int v51 = v62;
          sub_10024F7A0();
          uint64_t v45 = *(void (**)(char *, uint64_t))(v64 + 8);
          uint64_t v46 = v51;
          uint64_t v47 = &v93;
          goto LABEL_10;
        case 2:
          uint64_t v43 = v91;
          v92[24] = 2;
          sub_100225630();
          uint64_t v52 = v82;
          sub_10024F7A0();
          uint64_t v45 = *(void (**)(char *, uint64_t))(v66 + 8);
          uint64_t v46 = v52;
          uint64_t v47 = &v94;
          goto LABEL_10;
        case 3:
          uint64_t v43 = v91;
          v92[25] = 3;
          sub_1002255DC();
          uint64_t v53 = v83;
          sub_10024F7A0();
          uint64_t v45 = *(void (**)(char *, uint64_t))(v68 + 8);
          uint64_t v46 = v53;
          uint64_t v47 = &v95;
          goto LABEL_10;
        case 4:
          uint64_t v43 = v91;
          v92[26] = 4;
          sub_100225588();
          sub_10024F7A0();
          uint64_t v45 = *(void (**)(char *, uint64_t))(v70 + 8);
          uint64_t v46 = v37;
          uint64_t v47 = &v96;
          goto LABEL_10;
        case 5:
          uint64_t v43 = v91;
          v92[27] = 5;
          sub_100225534();
          uint64_t v40 = v38;
          sub_10024F7A0();
          uint64_t v55 = v72;
          uint64_t v54 = v73;
          goto LABEL_17;
        case 6:
          uint64_t v43 = v91;
          v92[28] = 6;
          sub_1002254E0();
          sub_10024F7A0();
          uint64_t v55 = v74;
          uint64_t v54 = v75;
          goto LABEL_17;
        case 7:
          uint64_t v43 = v91;
          v92[29] = 7;
          sub_10022548C();
          uint64_t v40 = v84;
          sub_10024F7A0();
          uint64_t v55 = v76;
          uint64_t v54 = v77;
LABEL_17:
          uint64_t v45 = *(void (**)(char *, uint64_t))(v55 + 8);
          uint64_t v46 = v40;
          goto LABEL_18;
        case 8:
          uint64_t v57 = v91;
          v92[30] = 8;
          sub_100225438();
          sub_10024F7A0();
          (*(void (**)(char *, uint64_t))(v78 + 8))(v39, v79);
          swift_bridgeObjectRelease();
          uint64_t v43 = v57;
          goto LABEL_19;
        case 9:
          uint64_t v58 = v91;
          v92[31] = 9;
          sub_1002253E4();
          uint64_t v59 = v85;
          sub_10024F7A0();
          (*(void (**)(char *, uint64_t))(v80 + 8))(v59, v81);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v58 + 8))(v41, v30);
          break;
        default:
          uint64_t v43 = v91;
          v92[6] = 0;
          sub_1002256D8();
          uint64_t v44 = v61;
          sub_10024F7A0();
          uint64_t v45 = *(void (**)(char *, uint64_t))(v63 + 8);
          uint64_t v46 = v44;
          uint64_t v47 = (uint64_t *)v92;
LABEL_10:
          uint64_t v54 = *(v47 - 32);
LABEL_18:
          v45(v46, v54);
          swift_bridgeObjectRelease();
LABEL_19:
          (*(void (**)(char *, uint64_t))(v43 + 8))(v41, v30);
          break;
      }
    }
    else
    {
      uint64_t v48 = sub_10024F3D0();
      swift_allocError();
      uint64_t v50 = v49;
      sub_100019524(&qword_10031A110);
      *uint64_t v50 = &type metadata for StoreKitInternalError;
      sub_10024F7B0();
      sub_10024F3B0();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v48 - 8) + 104))(v50, enum case for DecodingError.typeMismatch(_:), v48);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v91 + 8))(v34, v30);
    }
  }
  sub_10001C2EC((uint64_t)v90);
  return v34;
}

uint64_t _s15StoreKit_Shared0aB11ServerErrorO8rawValueACSgSi_tcfC_0(uint64_t a1)
{
  if (a1 <= 3503)
  {
    if (a1 > 2054)
    {
      switch(a1)
      {
        case 3027:
          return 9;
        case 3028:
        case 3029:
        case 3030:
        case 3031:
        case 3032:
        case 3033:
        case 3034:
        case 3035:
        case 3036:
        case 3037:
        case 3039:
        case 3040:
        case 3041:
        case 3042:
        case 3043:
        case 3044:
        case 3045:
        case 3046:
        case 3047:
        case 3048:
        case 3049:
        case 3050:
        case 3051:
        case 3052:
        case 3053:
        case 3054:
        case 3055:
        case 3056:
        case 3057:
        case 3058:
          return 26;
        case 3038:
          return 10;
        case 3059:
          return 11;
        case 3060:
          return 12;
        default:
          if (a1 == 2055)
          {
            uint64_t result = 7;
          }
          else
          {
            if (a1 != 3004) {
              return 26;
            }
            uint64_t result = 8;
          }
          break;
      }
    }
    else
    {
      uint64_t v1 = a1 - 1001;
      uint64_t result = 1;
      switch(v1)
      {
        case 0:
          uint64_t result = 0;
          break;
        case 2:
          return result;
        case 3:
          uint64_t result = 2;
          break;
        case 4:
          uint64_t result = 3;
          break;
        case 5:
          uint64_t result = 4;
          break;
        default:
          return 26;
      }
    }
    return result;
  }
  if (a1 <= 3899)
  {
    if (a1 <= 3602)
    {
      if (a1 == 3504) {
        return 13;
      }
      if (a1 == 3513) {
        return 14;
      }
    }
    else
    {
      switch(a1)
      {
        case 3603:
          return 15;
        case 3604:
          return 16;
        case 3705:
          return 17;
      }
    }
    return 26;
  }
  if (a1 > 500316)
  {
    switch(a1)
    {
      case 500317:
        return 23;
      case 500328:
        return 24;
      case 4000029:
        return 25;
    }
    return 26;
  }
  switch(a1)
  {
    case 3900:
      uint64_t result = 18;
      break;
    case 3901:
      uint64_t result = 19;
      break;
    case 3902:
      uint64_t result = 20;
      break;
    case 3903:
      uint64_t result = 21;
      break;
    case 3904:
      uint64_t result = 22;
      break;
    default:
      return 26;
  }
  return result;
}

unint64_t sub_100226CE8()
{
  unint64_t result = qword_100319FE0;
  if (!qword_100319FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319FE0);
  }
  return result;
}

unint64_t sub_100226D40()
{
  unint64_t result = qword_100319FE8;
  if (!qword_100319FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319FE8);
  }
  return result;
}

ValueMetadata *type metadata accessor for StoreKitInternalError()
{
  return &type metadata for StoreKitInternalError;
}

uint64_t getEnumTagSinglePayload for StoreKitServerError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE7) {
    goto LABEL_17;
  }
  if (a2 + 25 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 25) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 25;
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
      return (*a1 | (v4 << 8)) - 25;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 25;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1A;
  int v8 = v6 - 26;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StoreKitServerError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 25 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 25) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE6)
  {
    unsigned int v6 = ((a2 - 231) >> 8) + 1;
    *unint64_t result = a2 + 25;
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
        JUMPOUT(0x100226F08);
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
          *unint64_t result = a2 + 25;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StoreKitServerError()
{
  return &type metadata for StoreKitServerError;
}

uint64_t _s15StoreKit_Shared21StoreKitInternalErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s15StoreKit_Shared21StoreKitInternalErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x10022709CLL);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.CodingKeys()
{
  return &type metadata for StoreKitInternalError.CodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.FeatureDisabledCodingKeys()
{
  return &type metadata for StoreKitInternalError.FeatureDisabledCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.InvalidAppCodingKeys()
{
  return &type metadata for StoreKitInternalError.InvalidAppCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.NotAvailableInStorefrontCodingKeys()
{
  return &type metadata for StoreKitInternalError.NotAvailableInStorefrontCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.NotEntitledCodingKeys()
{
  return &type metadata for StoreKitInternalError.NotEntitledCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.NoUIContextCodingKeys()
{
  return &type metadata for StoreKitInternalError.NoUIContextCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.PurchasesDisabledCodingKeys()
{
  return &type metadata for StoreKitInternalError.PurchasesDisabledCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.UnimplementedFlowCodingKeys()
{
  return &type metadata for StoreKitInternalError.UnimplementedFlowCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.UnknownCodingKeys()
{
  return &type metadata for StoreKitInternalError.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.UserCancelledCodingKeys()
{
  return &type metadata for StoreKitInternalError.UserCancelledCodingKeys;
}

ValueMetadata *type metadata accessor for StoreKitInternalError.AccountMissingCodingKeys()
{
  return &type metadata for StoreKitInternalError.AccountMissingCodingKeys;
}

unint64_t sub_100227178()
{
  unint64_t result = qword_100319FF0;
  if (!qword_100319FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319FF0);
  }
  return result;
}

unint64_t sub_1002271D0()
{
  unint64_t result = qword_100319FF8;
  if (!qword_100319FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100319FF8);
  }
  return result;
}

unint64_t sub_100227228()
{
  unint64_t result = qword_10031A000;
  if (!qword_10031A000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A000);
  }
  return result;
}

unint64_t sub_100227280()
{
  unint64_t result = qword_10031A008;
  if (!qword_10031A008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A008);
  }
  return result;
}

unint64_t sub_1002272D8()
{
  unint64_t result = qword_10031A010;
  if (!qword_10031A010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A010);
  }
  return result;
}

unint64_t sub_100227330()
{
  unint64_t result = qword_10031A018;
  if (!qword_10031A018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A018);
  }
  return result;
}

unint64_t sub_100227388()
{
  unint64_t result = qword_10031A020;
  if (!qword_10031A020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A020);
  }
  return result;
}

unint64_t sub_1002273E0()
{
  unint64_t result = qword_10031A028;
  if (!qword_10031A028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A028);
  }
  return result;
}

unint64_t sub_100227438()
{
  unint64_t result = qword_10031A030;
  if (!qword_10031A030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A030);
  }
  return result;
}

unint64_t sub_100227490()
{
  unint64_t result = qword_10031A038;
  if (!qword_10031A038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A038);
  }
  return result;
}

unint64_t sub_1002274E8()
{
  unint64_t result = qword_10031A040;
  if (!qword_10031A040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A040);
  }
  return result;
}

unint64_t sub_100227540()
{
  unint64_t result = qword_10031A048;
  if (!qword_10031A048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A048);
  }
  return result;
}

unint64_t sub_100227598()
{
  unint64_t result = qword_10031A050;
  if (!qword_10031A050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A050);
  }
  return result;
}

unint64_t sub_1002275F0()
{
  unint64_t result = qword_10031A058;
  if (!qword_10031A058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A058);
  }
  return result;
}

unint64_t sub_100227648()
{
  unint64_t result = qword_10031A060;
  if (!qword_10031A060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A060);
  }
  return result;
}

unint64_t sub_1002276A0()
{
  unint64_t result = qword_10031A068;
  if (!qword_10031A068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A068);
  }
  return result;
}

unint64_t sub_1002276F8()
{
  unint64_t result = qword_10031A070;
  if (!qword_10031A070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A070);
  }
  return result;
}

unint64_t sub_100227750()
{
  unint64_t result = qword_10031A078;
  if (!qword_10031A078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A078);
  }
  return result;
}

unint64_t sub_1002277A8()
{
  unint64_t result = qword_10031A080;
  if (!qword_10031A080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A080);
  }
  return result;
}

unint64_t sub_100227800()
{
  unint64_t result = qword_10031A088;
  if (!qword_10031A088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A088);
  }
  return result;
}

unint64_t sub_100227858()
{
  unint64_t result = qword_10031A090;
  if (!qword_10031A090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A090);
  }
  return result;
}

unint64_t sub_1002278B0()
{
  unint64_t result = qword_10031A098;
  if (!qword_10031A098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A098);
  }
  return result;
}

unint64_t sub_100227908()
{
  unint64_t result = qword_10031A0A0;
  if (!qword_10031A0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A0A0);
  }
  return result;
}

unint64_t sub_10022795C()
{
  unint64_t result = qword_10031A0A8;
  if (!qword_10031A0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A0A8);
  }
  return result;
}

unint64_t sub_1002279B0()
{
  unint64_t result = qword_10031A0B0;
  if (!qword_10031A0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A0B0);
  }
  return result;
}

char *sub_100227A04()
{
  uint64_t v0 = sub_10024F0B0();
  if (v0)
  {
    uint64_t v1 = v0;
    unint64_t result = sub_10022F1BC(0, v0 & ~(v0 >> 63), 0);
    if ((v1 & 0x8000000000000000) == 0)
    {
      while (1)
      {
        uint64_t v4 = sub_10024F0C0();
        unint64_t v5 = v3;
        if (v4 == 45 && v3 == 0xE100000000000000)
        {
          unint64_t v5 = 0xE100000000000000;
          swift_bridgeObjectRelease();
          uint64_t v4 = 43;
        }
        else if (sub_10024FA60())
        {
          swift_bridgeObjectRelease();
          unint64_t v5 = 0xE100000000000000;
          uint64_t v4 = 43;
        }
        else
        {
          if (v4 == 95 && v5 == 0xE100000000000000)
          {
            unint64_t v5 = 0xE100000000000000;
            swift_bridgeObjectRelease();
LABEL_13:
            uint64_t v4 = 47;
            goto LABEL_14;
          }
          if (sub_10024FA60())
          {
            swift_bridgeObjectRelease();
            unint64_t v5 = 0xE100000000000000;
            goto LABEL_13;
          }
        }
LABEL_14:
        unint64_t v7 = _swiftEmptyArrayStorage[2];
        unint64_t v6 = _swiftEmptyArrayStorage[3];
        if (v7 >= v6 >> 1) {
          sub_10022F1BC((char *)(v6 > 1), v7 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v7 + 1;
        int v8 = &_swiftEmptyArrayStorage[2 * v7];
        v8[4] = v4;
        v8[5] = v5;
        sub_10024F070();
        if (!--v1) {
          goto LABEL_17;
        }
      }
    }
    __break(1u);
  }
  else
  {
LABEL_17:
    sub_100019524(&qword_10031A118);
    sub_100228230();
    uint64_t v11 = sub_10024E900();
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10024E790();
    swift_bridgeObjectRelease();
    uint64_t v10 = v9 & 3;
    if (v9 <= 0) {
      uint64_t v10 = -(-v9 & 3);
    }
    if (v10)
    {
      v12._countAndFlagsBits = 61;
      v12._uint64_t object = (void *)0xE100000000000000;
      v13._countAndFlagsBits = sub_10024E8D0(v12, 4 - v10);
      sub_10024E800(v13);
      swift_bridgeObjectRelease();
    }
    return (char *)v11;
  }
  return result;
}

Swift::String __swiftcall StringProtocol.base64URLEncodedToBase64()()
{
  sub_100227E30((void (*)(char *, char *))sub_100227D74, 0, v0, (uint64_t)&type metadata for Character, (uint64_t)&type metadata for Never, *(void *)(*(void *)(v1 + 8) + 8), (uint64_t)&protocol witness table for Never, v2);
  sub_100019524(&qword_10031A118);
  sub_100228230();
  uint64_t v9 = sub_10024E900();
  uint64_t v10 = v3;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_10024E790();
  swift_bridgeObjectRelease();
  uint64_t v5 = v4 & 3;
  if (v4 <= 0) {
    uint64_t v5 = -(-v4 & 3);
  }
  if (v5)
  {
    v11._countAndFlagsBits = 61;
    v11._uint64_t object = (void *)0xE100000000000000;
    v12._countAndFlagsBits = sub_10024E8D0(v11, 4 - v5);
    sub_10024E800(v12);
    swift_bridgeObjectRelease();
  }
  uint64_t v6 = v9;
  unint64_t v7 = v10;
  result._uint64_t object = v7;
  result._countAndFlagsBits = v6;
  return result;
}

uint64_t sub_100227D74@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)result;
  uint64_t v3 = *(void *)(result + 8);
  BOOL v5 = *(void *)result == 45 && v3 == 0xE100000000000000;
  if (v5 || (Swift::String result = sub_10024FA60(), (result & 1) != 0))
  {
    *a2 = 43;
    a2[1] = 0xE100000000000000;
  }
  else
  {
    BOOL v6 = v4 == 95 && v3 == 0xE100000000000000;
    if (v6 || (Swift::String result = sub_10024FA60(), (result & 1) != 0))
    {
      *a2 = 47;
      a2[1] = 0xE100000000000000;
    }
    else
    {
      *a2 = v4;
      a2[1] = v3;
      return swift_bridgeObjectRetain();
    }
  }
  return result;
}

uint64_t sub_100227E30(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v31 = a5;
  uint64_t v32 = a8;
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  uint64_t v30 = *(void *)(a5 - 8);
  __chkstk_darwin(a1, a2);
  uint64_t v43 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness, v10);
  Swift::String v12 = (char *)&v29 - v11;
  __chkstk_darwin(v13, v14);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void *)(v17 - 8);
  uint64_t v34 = v17;
  __chkstk_darwin(v17, v18);
  uint64_t v20 = (char *)&v29 - v19;
  uint64_t v21 = sub_10024EC90();
  if (!v21) {
    return sub_10024EAF0();
  }
  Swift::Int v22 = v21;
  uint64_t v46 = sub_10024F500();
  uint64_t v35 = sub_10024F510();
  sub_10024F440(v22);
  uint64_t v39 = v8;
  uint64_t result = sub_10024EC80();
  if (v22 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v37 = (void (**)(char *))(v36 + 2);
    uint64_t v38 = v16;
    ++v36;
    while (1)
    {
      uint64_t v24 = (void (*)(char *, void))sub_10024ED50();
      uint64_t v25 = v12;
      uint64_t v26 = v12;
      uint64_t v27 = AssociatedTypeWitness;
      (*v37)(v25);
      v24(v45, 0);
      uint64_t v28 = v44;
      v41(v26, v43);
      if (v28) {
        break;
      }
      uint64_t v44 = 0;
      (*v36)(v26, v27);
      sub_10024F4D0();
      sub_10024ECB0();
      --v22;
      Swift::String v12 = v26;
      if (!v22)
      {
        (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v34);
        return v46;
      }
    }
    (*v36)(v26, v27);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v34);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 32))(v32, v43, v31);
  }
  return result;
}

unint64_t sub_100228230()
{
  unint64_t result = qword_10031A120;
  if (!qword_10031A120)
  {
    sub_10001B028(&qword_10031A118);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A120);
  }
  return result;
}

uint64_t Data.init<A>(base64URLEncoded:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  StringProtocol.base64URLEncodedToBase64()();
  uint64_t v5 = sub_10024DE60();
  unint64_t v7 = v6;
  swift_bridgeObjectRelease();
  sub_100047398(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
  if (v7 >> 60 != 15) {
    sub_10003F7F4(v5, v7);
  }
  return v5;
}

uint64_t LazyJWS.rawHeader.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LazyJWS.rawPayload.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LazyJWS.rawSignature.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LazyJWS.init(rawValue:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1002285C0(a1, a2, v5);
  return sub_100228708((uint64_t)v5, a3);
}

uint64_t LazyJWS.payloadJSONString.getter()
{
  uint64_t v0 = sub_10024E6F0();
  __chkstk_darwin(v0 - 8, v1);
  swift_bridgeObjectRetain();
  sub_100227A04();
  uint64_t v2 = sub_10024DE60();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();
  sub_100047398(v2, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = 0;
  if (v4 >> 60 != 15)
  {
    sub_10003F7F4(v2, v4);
    sub_10024E6E0();
    uint64_t v5 = sub_10024E6D0();
    sub_10003F7F4(v2, v4);
  }
  return v5;
}

uint64_t sub_100228570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1002285C0(*(void *)a1, *(void *)(a1 + 8), v4);
  return sub_100228708((uint64_t)v4, a2);
}

uint64_t sub_1002285B4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1002285C0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  v22[0] = 46;
  v22[1] = 0xE100000000000000;
  uint64_t v21 = v22;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10022F548(3, 1, sub_100228A20, (uint64_t)v20, a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (*((void *)v6 + 2) == 3)
  {
    uint64_t v18 = *((void *)v6 + 5);
    uint64_t v19 = *((void *)v6 + 4);
    uint64_t v7 = *((void *)v6 + 7);
    uint64_t v10 = *((void *)v6 + 11);
    uint64_t v16 = *((void *)v6 + 10);
    uint64_t v17 = *((void *)v6 + 6);
    uint64_t v8 = *((void *)v6 + 8);
    uint64_t v9 = *((void *)v6 + 9);
    uint64_t v11 = *((void *)v6 + 12);
    uint64_t v12 = *((void *)v6 + 13);
    uint64_t v13 = *((void *)v6 + 14);
    uint64_t v14 = *((void *)v6 + 15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v19;
  a3[1] = v18;
  a3[2] = v17;
  a3[3] = v7;
  a3[4] = v8;
  a3[5] = v9;
  a3[6] = v16;
  a3[7] = v10;
  a3[8] = v11;
  a3[9] = v12;
  a3[10] = v13;
  a3[11] = v14;
  return result;
}

uint64_t sub_100228708(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100019524(&qword_10031A128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for LazyJWS()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LazyJWS(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for LazyJWS(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for LazyJWS(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for LazyJWS(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LazyJWS(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LazyJWS(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LazyJWS()
{
  return &type metadata for LazyJWS;
}

uint64_t sub_100228A20(void *a1)
{
  return sub_10022FB7C(a1, *(void **)(v1 + 16)) & 1;
}

uint64_t sub_100228A40(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000013;
  unint64_t v3 = 0x8000000100284ED0;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000015;
    }
    else {
      unint64_t v5 = 0xD000000000000013;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x8000000100284EF0;
    }
    else {
      unint64_t v6 = 0x8000000100284F10;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v5 = 0xD000000000000013;
    unint64_t v6 = 0x8000000100284ED0;
    int v7 = a2;
    if (!a2) {
      goto LABEL_12;
    }
  }
  if (v7 == 1)
  {
    unint64_t v2 = 0xD000000000000015;
    unint64_t v3 = 0x8000000100284EF0;
  }
  else
  {
    unint64_t v3 = 0x8000000100284F10;
  }
LABEL_12:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10024FA60();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100228B38(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x79654B676F6CLL;
  unint64_t v3 = 0xE600000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x79654B676F6CLL;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x49746375646F7270;
      unint64_t v3 = 0xE900000000000044;
      break;
    case 2:
      uint64_t v5 = 0x69666F725079656BLL;
      unint64_t v3 = 0xEA0000000000656CLL;
      break;
    case 3:
      uint64_t v5 = 0x736D61726170;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE600000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE900000000000044;
      if (v5 == 0x49746375646F7270) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      uint64_t v2 = 0x69666F725079656BLL;
      unint64_t v6 = 0xEA0000000000656CLL;
      goto LABEL_9;
    case 3:
      if (v5 == 0x736D61726170) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_10024FA60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_100228CC0(unsigned __int8 *a1, char *a2)
{
  return sub_100228B38(*a1, *a2);
}

Swift::Int sub_100228CCC()
{
  return sub_10024FC70();
}

uint64_t sub_100228DA4()
{
  sub_10024E780();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100228E64()
{
  return sub_10024FC70();
}

uint64_t sub_100228F38@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10022B3C4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_100228F68(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE600000000000000;
  uint64_t v3 = 0x79654B676F6CLL;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE900000000000044;
      uint64_t v3 = 0x49746375646F7270;
      goto LABEL_3;
    case 2:
      *a1 = 0x69666F725079656BLL;
      a1[1] = 0xEA0000000000656CLL;
      break;
    case 3:
      *a1 = 0x736D61726170;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_100229000()
{
  uint64_t result = 0x79654B676F6CLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x49746375646F7270;
      break;
    case 2:
      uint64_t result = 0x69666F725079656BLL;
      break;
    case 3:
      uint64_t result = 0x736D61726170;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10022908C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10022B3C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1002290B4(uint64_t a1)
{
  unint64_t v2 = sub_100229404();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002290F0(uint64_t a1)
{
  unint64_t v2 = sub_100229404();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ProductPageLookupRequest.ParameterRequest.parameters.getter()
{
  return swift_bridgeObjectRetain();
}

void __swiftcall ProductPageLookupRequest.ParameterRequest.init(productID:logKey:keyProfile:parameters:)(StoreKit_Shared::ProductPageLookupRequest::ParameterRequest *__return_ptr retstr, Swift::String productID, Swift::String logKey, Swift::String keyProfile, Swift::OpaquePointer parameters)
{
  retstr->logKey = logKey;
  retstr->productID = productID;
  retstr->keyProfile = keyProfile;
  retstr->parameters = parameters;
}

uint64_t ProductPageLookupRequest.ParameterRequest.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100019524(&qword_10031A130);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  char v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_100229404();
  sub_10024FD40();
  LOBYTE(v18[0]) = 1;
  sub_10024F940();
  if (v1) {
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
  }
  LOBYTE(v18[0]) = 0;
  sub_10024F940();
  LOBYTE(v18[0]) = 2;
  sub_10024F940();
  uint64_t v9 = self;
  Class isa = sub_10024E4E0().super.isa;
  v18[0] = 0;
  id v11 = [v9 dataWithJSONObject:isa options:0 error:v18];

  id v12 = v18[0];
  if (!v11)
  {
    uint64_t v16 = v12;
    sub_10024DCE0();

    swift_willThrow();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
  }
  uint64_t v13 = (void *)sub_10024DF10();
  uint64_t v15 = v14;

  v18[0] = v13;
  v18[1] = v15;
  v17[7] = 3;
  sub_10021EB7C();
  sub_10024F980();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
  return sub_10003F808((uint64_t)v13, (unint64_t)v15);
}

unint64_t sub_100229404()
{
  unint64_t result = qword_10031A138;
  if (!qword_10031A138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A138);
  }
  return result;
}

double ProductPageLookupRequest.ParameterRequest.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10022B410(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_1002294A8(void *a1)
{
  return ProductPageLookupRequest.ParameterRequest.encode(to:)(a1);
}

uint64_t ProductPageLookupRequest.URLRequest.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ProductPageLookupRequest.URLRequest() + 28);
  uint64_t v4 = sub_10024DDC0();
  long long v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t ProductPageLookupRequest.URLRequest.init(productID:url:keyProfile:logKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  a8[2] = a6;
  a8[3] = a7;
  a8[4] = a4;
  a8[5] = a5;
  id v12 = (char *)a8 + *(int *)(type metadata accessor for ProductPageLookupRequest.URLRequest() + 28);
  uint64_t v13 = sub_10024DDC0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v12, a3, v13);
  *a8 = a1;
  a8[1] = a2;
  return result;
}

uint64_t ProductPageLookupRequest.URLRequest.parameters.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10024DB00();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100019524(&qword_10031A140);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = (void *)sub_100229B6C((uint64_t)_swiftEmptyArrayStorage);
  type metadata accessor for ProductPageLookupRequest.URLRequest();
  sub_10024DB20();
  uint64_t v12 = sub_10024DB50();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1)
  {
    uint64_t v42 = sub_10024DB10();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    if (v42) {
      uint64_t v14 = (void *)v42;
    }
    else {
      uint64_t v14 = _swiftEmptyArrayStorage;
    }
    uint64_t v15 = v14[2];
    if (v15) {
      goto LABEL_3;
    }
LABEL_31:
    swift_bridgeObjectRelease();
LABEL_32:
    *(void *)&long long v58 = 25705;
    *((void *)&v58 + 1) = 0xE200000000000000;
    sub_10024F2E0();
    if (v11[2] && (unint64_t v43 = sub_10011EEF0((uint64_t)v60), (v44 & 1) != 0))
    {
      sub_1000318C8(v11[7] + 32 * v43, (uint64_t)&v58);
    }
    else
    {
      long long v58 = 0u;
      long long v59 = 0u;
    }
    sub_10003F6F4((uint64_t)v60);
    uint64_t v45 = *((void *)&v59 + 1);
    sub_100051BB4((uint64_t)&v58, &qword_100319EB0);
    if (!v45)
    {
      *(void *)&long long v58 = 25705;
      *((void *)&v58 + 1) = 0xE200000000000000;
      sub_10024F2E0();
      uint64_t v46 = *v1;
      uint64_t v47 = v1[1];
      *((void *)&v59 + 1) = &type metadata for String;
      *(void *)&long long v58 = v46;
      *((void *)&v58 + 1) = v47;
      sub_10003B908(&v58, v57);
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v56 = v11;
      sub_10022AE58(v57, (uint64_t)v60, isUniquelyReferenced_nonNull_native);
      id v11 = v56;
      swift_bridgeObjectRelease();
      sub_10003F6F4((uint64_t)v60);
    }
    return (uint64_t)v11;
  }
  sub_100051BB4((uint64_t)v10, &qword_10031A140);
  uint64_t v14 = _swiftEmptyArrayStorage;
  uint64_t v15 = _swiftEmptyArrayStorage[2];
  if (!v15) {
    goto LABEL_31;
  }
LABEL_3:
  v50[1] = v14;
  int v51 = v1;
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v16 = v3 + 16;
  uint64_t v18 = (char *)v14 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
  uint64_t v53 = (void (**)(char *, uint64_t))(v16 - 8);
  uint64_t v54 = v17;
  uint64_t v19 = &type metadata for String;
  uint64_t v55 = v16;
  uint64_t v52 = *(void *)(v16 + 56);
  v17(v6, v18, v2);
  while (1)
  {
    *(void *)&long long v58 = sub_10024DAE0();
    *((void *)&v58 + 1) = v21;
    sub_10024F2E0();
    uint64_t v22 = sub_10024DAF0();
    if (v23) {
      break;
    }
    swift_bridgeObjectRetain();
    unint64_t v35 = sub_10011EEF0((uint64_t)v60);
    char v37 = v36;
    swift_bridgeObjectRelease();
    if (v37)
    {
      char v38 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&v57[0] = v11;
      if ((v38 & 1) == 0)
      {
        sub_10022B020();
        id v11 = *(void **)&v57[0];
      }
      sub_10003F6F4(v11[6] + 40 * v35);
      sub_10003B908((_OWORD *)(v11[7] + 32 * v35), &v58);
      sub_10022AC8C(v35, (uint64_t)v11);
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v58 = 0u;
      long long v59 = 0u;
    }
    sub_10003F6F4((uint64_t)v60);
    sub_100051BB4((uint64_t)&v58, &qword_100319EB0);
LABEL_6:
    (*v53)(v6, v2);
    v18 += v52;
    if (!--v15)
    {
      swift_bridgeObjectRelease();
      uint64_t v1 = v51;
      goto LABEL_32;
    }
    v54(v6, v18, v2);
  }
  uint64_t v24 = v2;
  uint64_t v25 = v19;
  *((void *)&v59 + 1) = v19;
  *(void *)&long long v58 = v22;
  *((void *)&v58 + 1) = v23;
  sub_10003B908(&v58, v57);
  char v26 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v56 = v11;
  unint64_t v28 = sub_10011EEF0((uint64_t)v60);
  uint64_t v29 = v11[2];
  BOOL v30 = (v27 & 1) == 0;
  uint64_t v31 = v29 + v30;
  if (!__OFADD__(v29, v30))
  {
    char v32 = v27;
    if (v11[3] < v31)
    {
      sub_10022A64C(v31, v26);
      unint64_t v33 = sub_10011EEF0((uint64_t)v60);
      if ((v32 & 1) != (v34 & 1)) {
        goto LABEL_41;
      }
      unint64_t v28 = v33;
      id v11 = v56;
      if ((v32 & 1) == 0) {
        goto LABEL_20;
      }
LABEL_4:
      uint64_t v20 = (_OWORD *)(v11[7] + 32 * v28);
      sub_10001C2EC((uint64_t)v20);
      sub_10003B908(v57, v20);
LABEL_5:
      swift_bridgeObjectRelease();
      sub_10003F6F4((uint64_t)v60);
      uint64_t v19 = v25;
      uint64_t v2 = v24;
      goto LABEL_6;
    }
    if (v26)
    {
      id v11 = v56;
      if (v27) {
        goto LABEL_4;
      }
    }
    else
    {
      sub_10022B020();
      id v11 = v56;
      if (v32) {
        goto LABEL_4;
      }
    }
LABEL_20:
    v11[(v28 >> 6) + 8] |= 1 << v28;
    sub_10012018C((uint64_t)v60, v11[6] + 40 * v28);
    sub_10003B908(v57, (_OWORD *)(v11[7] + 32 * v28));
    uint64_t v39 = v11[2];
    BOOL v40 = __OFADD__(v39, 1);
    uint64_t v41 = v39 + 1;
    if (v40) {
      goto LABEL_40;
    }
    void v11[2] = v41;
    goto LABEL_5;
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  uint64_t result = sub_10024FB70();
  __break(1u);
  return result;
}

unint64_t sub_100229B6C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100019524(&qword_10031A238);
  uint64_t v2 = sub_10024F720();
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
    sub_10022CA9C(v6, (uint64_t)v15);
    unint64_t result = sub_10011EEF0((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_10003B908(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100229C9C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100019524(&qword_10031A230);
  uint64_t v2 = (void *)sub_10024F720();
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
    unint64_t result = sub_100222E80(v5, v6);
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

uint64_t static ProductPageLookupRequest.URLRequest.productID(from:)()
{
  uint64_t v0 = sub_10024DA50();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)v16 - v7;
  v16[0] = sub_10024DD40();
  v16[1] = v9;
  sub_10024DA20();
  sub_10024DA40();
  char v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v8, v0);
  sub_10022BB10();
  uint64_t v11 = sub_10024F160();
  unint64_t v13 = v12;
  v10(v4, v0);
  swift_bridgeObjectRelease();
  uint64_t v14 = HIBYTE(v13) & 0xF;
  if ((v13 & 0x2000000000000000) == 0) {
    uint64_t v14 = v11 & 0xFFFFFFFFFFFFLL;
  }
  if (!v14)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v11;
}

uint64_t sub_100229F30()
{
  uint64_t result = 0x49746375646F7270;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x79654B676F6CLL;
      break;
    case 2:
      uint64_t result = 0x69666F725079656BLL;
      break;
    case 3:
      uint64_t result = 7107189;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100229FBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10022C8E0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100229FE4(uint64_t a1)
{
  unint64_t v2 = sub_10022BB64();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10022A020(uint64_t a1)
{
  unint64_t v2 = sub_10022BB64();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ProductPageLookupRequest.URLRequest.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100019524(&qword_10031A150);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_10022BB64();
  sub_10024FD40();
  v9[15] = 0;
  sub_10024F940();
  if (!v1)
  {
    v9[14] = 1;
    sub_10024F940();
    v9[13] = 2;
    sub_10024F940();
    type metadata accessor for ProductPageLookupRequest.URLRequest();
    v9[12] = 3;
    sub_10024DDC0();
    sub_10022BBB8(&qword_100319C88);
    sub_10024F980();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t ProductPageLookupRequest.URLRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v3 = sub_10024DDC0();
  uint64_t v24 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v4);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100019524(&qword_10031A160);
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  __chkstk_darwin(v7, v8);
  char v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ProductPageLookupRequest.URLRequest();
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (void *)((char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10001C2A8(a1, a1[3]);
  sub_10022BB64();
  unint64_t v28 = v10;
  uint64_t v15 = v29;
  sub_10024FD20();
  if (v15) {
    return sub_10001C2EC((uint64_t)a1);
  }
  uint64_t v29 = v6;
  uint64_t v16 = v26;
  uint64_t v17 = v27;
  char v33 = 0;
  *uint64_t v14 = sub_10024F830();
  v14[1] = v18;
  char v32 = 1;
  void v14[2] = sub_10024F830();
  v14[3] = v19;
  char v31 = 2;
  uint64_t v20 = sub_10024F830();
  v23[1] = 0;
  v14[4] = v20;
  v14[5] = v21;
  char v30 = 3;
  sub_10022BBB8(&qword_100319C58);
  sub_10024F870();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v28, v17);
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))((char *)v14 + *(int *)(v11 + 28), v29, v3);
  sub_10022BBFC((uint64_t)v14, v25);
  sub_10001C2EC((uint64_t)a1);
  return sub_10022BC60((uint64_t)v14);
}

uint64_t sub_10022A61C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ProductPageLookupRequest.URLRequest.init(from:)(a1, a2);
}

uint64_t sub_10022A634(void *a1)
{
  return ProductPageLookupRequest.URLRequest.encode(to:)(a1);
}

uint64_t sub_10022A64C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100019524(&qword_10031A238);
  uint64_t v6 = sub_10024F710();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
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
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
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
            int64_t v14 = v24 + 1;
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
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_10003B908((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_10012018C(v25, (uint64_t)&v38);
      sub_1000318C8(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_10024F2C0(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_10003B908(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10022A964(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100019524(&qword_10031A230);
  char v42 = a2;
  uint64_t v6 = sub_10024F710();
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
  long long v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
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
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
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
        unint64_t v25 = *(void *)(v41 + 8 * v26);
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
            unint64_t v25 = *(void *)(v41 + 8 * v13);
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
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    unint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_10024FC00();
    sub_10024E780();
    uint64_t result = sub_10024FC70();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
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
    *unint64_t v20 = v36;
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

unint64_t sub_10022AC8C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10024F290();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10012018C(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        Swift::Int v10 = sub_10024F2C0(*(void *)(a2 + 40));
        uint64_t result = sub_10003F6F4((uint64_t)v28);
        Swift::Int v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            unint64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            unint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            unint64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              *unint64_t v20 = *v21;
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
    unint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
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

_OWORD *sub_10022AE58(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_10011EEF0(a2);
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
      sub_10022B020();
      goto LABEL_7;
    }
    sub_10022A64C(v13, a3 & 1);
    unint64_t v19 = sub_10011EEF0(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_10012018C(a2, (uint64_t)v21);
      return sub_10022AFA4(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_10024FB70();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_10001C2EC((uint64_t)v17);
  return sub_10003B908(a1, v17);
}

_OWORD *sub_10022AFA4(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_10003B908(a3, (_OWORD *)(a4[7] + 32 * a1));
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

void *sub_10022B020()
{
  uint64_t v1 = v0;
  sub_100019524(&qword_10031A238);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10024F700();
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_10012018C(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_1000318C8(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_10003B908(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
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
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10022B208()
{
  uint64_t v1 = v0;
  sub_100019524(&qword_10031A230);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10024F700();
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
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
    long long v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *uint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
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
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10022B3C4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1002F2600;
  v6._uint64_t object = a2;
  unint64_t v4 = sub_10024F790(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_10022B410@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v3 = sub_10024F3C0();
  uint64_t v56 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v4);
  Swift::String v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100019524(&qword_10031A248);
  uint64_t v57 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  unint64_t v11 = sub_100229404();
  unint64_t v12 = v58;
  sub_10024FD20();
  if (v12) {
    return sub_10001C2EC((uint64_t)a1);
  }
  unint64_t v54 = v11;
  long long v58 = v6;
  uint64_t v13 = v57;
  LOBYTE(v60) = 0;
  uint64_t v14 = sub_10024F830();
  uint64_t v17 = v16;
  uint64_t v52 = v14;
  LOBYTE(v60) = 1;
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_10024F830();
  uint64_t v20 = v19;
  uint64_t v53 = a1;
  uint64_t v49 = v18;
  LOBYTE(v60) = 2;
  swift_bridgeObjectRetain();
  uint64_t v51 = 0;
  uint64_t v21 = v20;
  uint64_t v48 = sub_10024F830();
  LOBYTE(v59) = 3;
  uint64_t v23 = v22;
  sub_10021F128();
  swift_bridgeObjectRetain();
  sub_10024F870();
  uint64_t v50 = v23;
  uint64_t v45 = v10;
  uint64_t v46 = v7;
  uint64_t v47 = v21;
  int64_t v25 = v60;
  unint64_t v24 = v61;
  unint64_t v26 = self;
  Class isa = sub_10024DEF0().super.isa;
  uint64_t v60 = 0;
  id v28 = [v26 JSONObjectWithData:isa options:0 error:&v60];

  if (v28)
  {
    BOOL v29 = v60;
    sub_10024F250();
    swift_unknownObjectRelease();
    sub_100019524(&qword_10031A250);
    char v30 = swift_dynamicCast();
    uint64_t v31 = v47;
    if (v30)
    {
      sub_10003F808((uint64_t)v25, v24);
      uint64_t v32 = v59;
      (*(void (**)(char *, uint64_t))(v13 + 8))(v45, v46);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10001C2EC((uint64_t)v53);
      swift_bridgeObjectRelease();
      uint64_t v33 = v50;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v34 = v55;
      *uint64_t v55 = v52;
      v34[1] = v17;
      void v34[2] = v49;
      v34[3] = v31;
      v34[4] = v48;
      v34[5] = v33;
      v34[6] = v32;
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100019524(&qword_100319F28);
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_100255FB0;
    unint64_t v37 = v54;
    *(void *)(v36 + 56) = &type metadata for ProductPageLookupRequest.ParameterRequest.CodingKeys;
    *(void *)(v36 + 64) = v37;
    *(unsigned char *)(v36 + 32) = 3;
    uint64_t v60 = 0;
    unint64_t v61 = 0xE000000000000000;
    sub_10024F330(37);
    swift_bridgeObjectRelease();
    uint64_t v38 = v58;
    uint64_t v55 = v25;
    sub_10024F3B0();
    uint64_t v39 = sub_10024F3D0();
    swift_allocError();
    uint64_t v41 = v40;
    unint64_t v42 = v24;
    uint64_t v43 = v56;
    (*(void (**)(uint64_t, char *, uint64_t))(v56 + 16))(v40, v38, v3);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v39 - 8) + 104))(v41, enum case for DecodingError.dataCorrupted(_:), v39);
    swift_willThrow();
    sub_10003F808((uint64_t)v55, v42);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v38, v3);
  }
  else
  {
    uint64_t v35 = v60;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10024DCE0();

    swift_willThrow();
    sub_10003F808((uint64_t)v25, v24);
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v45, v46);
  uint64_t v44 = v51;
  sub_10001C2EC((uint64_t)v53);
  swift_bridgeObjectRelease();
  if (!v44) {
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for ProductPageLookupRequest.URLRequest()
{
  uint64_t result = qword_10031A1C0;
  if (!qword_10031A1C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10022BB10()
{
  unint64_t result = qword_10031A148;
  if (!qword_10031A148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A148);
  }
  return result;
}

unint64_t sub_10022BB64()
{
  unint64_t result = qword_10031A158;
  if (!qword_10031A158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A158);
  }
  return result;
}

uint64_t sub_10022BBB8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10024DDC0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10022BBFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ProductPageLookupRequest.URLRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10022BC60(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ProductPageLookupRequest.URLRequest();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for ProductPageLookupRequest()
{
  return &type metadata for ProductPageLookupRequest;
}

uint64_t destroy for ProductPageLookupRequest.ParameterRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ProductPageLookupRequest.ParameterRequest(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ProductPageLookupRequest.ParameterRequest(void *a1, void *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ProductPageLookupRequest.ParameterRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProductPageLookupRequest.ParameterRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProductPageLookupRequest.ParameterRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProductPageLookupRequest.ParameterRequest()
{
  return &type metadata for ProductPageLookupRequest.ParameterRequest;
}

uint64_t *initializeBufferWithCopyOfBuffer for ProductPageLookupRequest.URLRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v11 = sub_10024DDC0();
    unint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t destroy for ProductPageLookupRequest.URLRequest(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_10024DDC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for ProductPageLookupRequest.URLRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = sub_10024DDC0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

void *assignWithCopy for ProductPageLookupRequest.URLRequest(void *a1, void *a2, uint64_t a3)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10024DDC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for ProductPageLookupRequest.URLRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_10024DDC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *assignWithTake for ProductPageLookupRequest.URLRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_10024DDC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProductPageLookupRequest.URLRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10022C3AC);
}

uint64_t sub_10022C3AC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_10024DDC0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ProductPageLookupRequest.URLRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10022C470);
}

uint64_t sub_10022C470(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10024DDC0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10022C518()
{
  uint64_t result = sub_10024DDC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProductPageLookupRequest.URLRequest.CodingKeys()
{
  return &type metadata for ProductPageLookupRequest.URLRequest.CodingKeys;
}

unsigned char *_s15StoreKit_Shared24ProductPageLookupRequestV10URLRequestV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10022C698);
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

ValueMetadata *type metadata accessor for ProductPageLookupRequest.ParameterRequest.CodingKeys()
{
  return &type metadata for ProductPageLookupRequest.ParameterRequest.CodingKeys;
}

unint64_t sub_10022C6D4()
{
  unint64_t result = qword_10031A200;
  if (!qword_10031A200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A200);
  }
  return result;
}

unint64_t sub_10022C72C()
{
  unint64_t result = qword_10031A208;
  if (!qword_10031A208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A208);
  }
  return result;
}

unint64_t sub_10022C784()
{
  unint64_t result = qword_10031A210;
  if (!qword_10031A210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A210);
  }
  return result;
}

unint64_t sub_10022C7DC()
{
  unint64_t result = qword_10031A218;
  if (!qword_10031A218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A218);
  }
  return result;
}

unint64_t sub_10022C834()
{
  unint64_t result = qword_10031A220;
  if (!qword_10031A220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A220);
  }
  return result;
}

unint64_t sub_10022C88C()
{
  unint64_t result = qword_10031A228;
  if (!qword_10031A228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A228);
  }
  return result;
}

uint64_t sub_10022C8E0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x49746375646F7270 && a2 == 0xE900000000000044;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69666F725079656BLL && a2 == 0xEA0000000000656CLL || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 7107189 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_10022CA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100019524(&qword_10031A240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t ProductResponse.Key.rawValue.getter(char a1)
{
  unint64_t result = 0x6B726F77747261;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7475626972747461;
      break;
    case 2:
      unint64_t result = 0x79636E6572727563;
      break;
    case 3:
      unint64_t result = 0x7470697263736564;
      break;
    case 4:
      unint64_t result = 0x746E756F63736964;
      break;
    case 5:
      unint64_t result = 1701667182;
      break;
    case 6:
      unint64_t result = 0x726F466563697270;
      break;
    case 7:
      unint64_t result = 0x6F43646574736F68;
      break;
    case 8:
      unint64_t result = 0x6E6F6973726576;
      break;
    case 9:
      unint64_t result = 1702521203;
      break;
    case 10:
      unint64_t result = 0xD000000000000011;
      break;
    case 11:
      unint64_t result = 25705;
      break;
    case 12:
      unint64_t result = 1684957547;
      break;
    case 13:
      unint64_t result = 0x6449726566666FLL;
      break;
    case 14:
      unint64_t result = 0x73726566666FLL;
      break;
    case 15:
      unint64_t result = 0x6570795465646F6DLL;
      break;
    case 16:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 17:
      unint64_t result = 0x726550664F6D756ELL;
      break;
    case 18:
      unint64_t result = 0x6563697270;
      break;
    case 19:
      unint64_t result = 0x6C61636F4C756369;
      break;
    case 20:
      unint64_t result = 0x6D614E726566666FLL;
      break;
    case 21:
      unint64_t result = 0xD000000000000015;
      break;
    case 22:
      unint64_t result = 0x647261646E617473;
      break;
    case 23:
    case 25:
      unint64_t result = 0xD000000000000016;
      break;
    case 24:
      unint64_t result = 0xD000000000000014;
      break;
    case 26:
      unint64_t result = 1701869940;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10022CE20(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = ProductResponse.Key.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == ProductResponse.Key.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10024FA60();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_10022CEAC()
{
  char v1 = *v0;
  sub_10024FC00();
  ProductResponse.Key.rawValue.getter(v1);
  sub_10024E780();
  swift_bridgeObjectRelease();
  return sub_10024FC70();
}

uint64_t sub_10022CF10()
{
  ProductResponse.Key.rawValue.getter(*v0);
  sub_10024E780();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_10022CF64()
{
  char v1 = *v0;
  sub_10024FC00();
  ProductResponse.Key.rawValue.getter(v1);
  sub_10024E780();
  swift_bridgeObjectRelease();
  return sub_10024FC70();
}

uint64_t sub_10022CFC4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s15StoreKit_Shared15ProductResponseV3KeyO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_10022CFF4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ProductResponse.Key.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t ProductResponse.serverCorrelationID.getter(uint64_t a1)
{
  return a1;
}

uint64_t ProductResponse.init(from:)(void *a1)
{
  uint64_t result = sub_10022D504(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t ProductResponse.encode(to:)(void *a1, void *a2, unint64_t a3)
{
  uint64_t v22 = a2;
  uint64_t v6 = sub_100019524(&qword_10031A258);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = self;
  sub_100019524(&qword_100319F20);
  Class isa = sub_10024EA80().super.isa;
  id v24 = 0;
  id v13 = [v11 dataWithJSONObject:isa options:0 error:&v24];

  id v14 = v24;
  if (v13)
  {
    unint64_t v15 = (void *)sub_10024DF10();
    unint64_t v21 = v16;

    sub_10001C2A8(a1, a1[3]);
    sub_10022DA7C();
    sub_10024FD40();
    id v24 = v22;
    unint64_t v25 = a3;
    char v23 = 0;
    swift_bridgeObjectRetain();
    sub_100019524(&qword_100319ED0);
    sub_10022E0B4((unint64_t *)&qword_100319ED8);
    sub_10024F980();
    if (v3)
    {
      sub_10003F808((uint64_t)v15, v21);
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v19 = (uint64_t)v15;
      id v24 = v15;
      unint64_t v20 = v21;
      unint64_t v25 = v21;
      char v23 = 1;
      sub_10021EB7C();
      sub_10024F980();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      return sub_10003F808(v19, v20);
    }
  }
  else
  {
    uint64_t v18 = v14;
    sub_10024DCE0();

    return swift_willThrow();
  }
}

BOOL sub_10022D368(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_10022D380()
{
  if (*v0) {
    return 0x73746375646F7270;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t sub_10022D3C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10022DFC4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10022D3E8(uint64_t a1)
{
  unint64_t v2 = sub_10022DA7C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10022D424(uint64_t a1)
{
  unint64_t v2 = sub_10022DA7C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10022D460@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10022D504(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_10022D490(void *a1)
{
  return ProductResponse.encode(to:)(a1, *(void **)v1, *(void *)(v1 + 8));
}

uint64_t _s15StoreKit_Shared15ProductResponseV3KeyO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0 = sub_10024FB00();
  swift_bridgeObjectRelease();
  if (v0 >= 0x1B) {
    return 27;
  }
  else {
    return v0;
  }
}

uint64_t sub_10022D504(void *a1)
{
  uint64_t v2 = sub_10024F3C0();
  uint64_t v35 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100019524(&qword_10031A288);
  uint64_t v36 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  unint64_t v10 = sub_10022DA7C();
  uint64_t v11 = v37;
  sub_10024FD20();
  if (v11) {
    return sub_10001C2EC((uint64_t)a1);
  }
  unint64_t v34 = v10;
  unint64_t v37 = v5;
  uint64_t v12 = v36;
  sub_100019524(&qword_100319ED0);
  LOBYTE(v38) = 0;
  sub_10022E0B4(&qword_10031A290);
  sub_10024F870();
  id v15 = v39;
  unint64_t v14 = v40;
  LOBYTE(v38) = 1;
  sub_10021F128();
  swift_bridgeObjectRetain();
  sub_10024F870();
  id v31 = v15;
  uint64_t v33 = v6;
  uint64_t v17 = (uint64_t)v39;
  unint64_t v16 = v40;
  uint64_t v18 = self;
  unint64_t v32 = v16;
  Class isa = sub_10024DEF0().super.isa;
  id v39 = 0;
  id v20 = [v18 JSONObjectWithData:isa options:0 error:&v39];

  if (v20)
  {
    uint64_t v30 = v17;
    id v21 = v39;
    sub_10024F250();
    swift_unknownObjectRelease();
    sub_100019524(&qword_10031A298);
    if (swift_dynamicCast())
    {
      sub_10003F808(v30, v32);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v33);
      swift_bridgeObjectRetain();
      sub_10001C2EC((uint64_t)a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v31;
    }
    swift_bridgeObjectRelease();
    sub_100019524(&qword_100319F28);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_100255FB0;
    unint64_t v24 = v34;
    *(void *)(v23 + 56) = &type metadata for ProductResponse.CodingKeys;
    *(void *)(v23 + 64) = v24;
    *(unsigned char *)(v23 + 32) = 1;
    id v39 = 0;
    unint64_t v40 = 0xE000000000000000;
    sub_10024F330(29);
    swift_bridgeObjectRelease();
    sub_10024F3B0();
    uint64_t v25 = sub_10024F3D0();
    swift_allocError();
    unint64_t v34 = v14;
    uint64_t v27 = v26;
    uint64_t v28 = v35;
    BOOL v29 = v37;
    (*(void (**)(uint64_t, char *, uint64_t))(v35 + 16))(v26, v37, v2);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, enum case for DecodingError.dataCorrupted(_:), v25);
    swift_willThrow();
    sub_10003F808(v30, v32);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v2);
  }
  else
  {
    id v22 = v39;
    swift_bridgeObjectRelease();
    sub_10024DCE0();

    swift_willThrow();
    sub_10003F808(v17, v32);
  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v33);
  sub_10001C2EC((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_10022DA7C()
{
  unint64_t result = qword_10031A260;
  if (!qword_10031A260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A260);
  }
  return result;
}

unint64_t sub_10022DAD4()
{
  unint64_t result = qword_10031A268;
  if (!qword_10031A268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A268);
  }
  return result;
}

__n128 initializeWithTake for ProductResponse(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ProductResponse(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

ValueMetadata *type metadata accessor for ProductResponse()
{
  return &type metadata for ProductResponse;
}

uint64_t getEnumTagSinglePayload for ProductResponse.Key(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE6) {
    goto LABEL_17;
  }
  if (a2 + 26 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 26) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 26;
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
      return (*a1 | (v4 << 8)) - 26;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 26;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1B;
  int v8 = v6 - 27;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ProductResponse.Key(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 26 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 26) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE5)
  {
    unsigned int v6 = ((a2 - 230) >> 8) + 1;
    *__n128 result = a2 + 26;
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
        JUMPOUT(0x10022DCF0);
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
          *__n128 result = a2 + 26;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProductResponse.Key()
{
  return &type metadata for ProductResponse.Key;
}

uint64_t getEnumTagSinglePayload for ProductResponse.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ProductResponse.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10022DE84);
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

ValueMetadata *type metadata accessor for ProductResponse.CodingKeys()
{
  return &type metadata for ProductResponse.CodingKeys;
}

unint64_t sub_10022DEC0()
{
  unint64_t result = qword_10031A270;
  if (!qword_10031A270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A270);
  }
  return result;
}

unint64_t sub_10022DF18()
{
  unint64_t result = qword_10031A278;
  if (!qword_10031A278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A278);
  }
  return result;
}

unint64_t sub_10022DF70()
{
  unint64_t result = qword_10031A280;
  if (!qword_10031A280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A280);
  }
  return result;
}

uint64_t sub_10022DFC4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x80000001002851F0 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73746375646F7270 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10022E0B4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001B028(&qword_100319ED0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t PurchaseIntentInternal.productName.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseIntentInternal.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PurchaseIntentInternal() + 32);
  uint64_t v4 = sub_10024E030();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for PurchaseIntentInternal()
{
  uint64_t result = qword_10031A320;
  if (!qword_10031A320) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PurchaseIntentInternal.additionalBuyParams.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for PurchaseIntentInternal() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseIntentInternal.init(appName:bundleID:productID:productName:timestamp:additionalBuyParams:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  uint64_t v13 = type metadata accessor for PurchaseIntentInternal();
  unint64_t v14 = (char *)a9 + *(int *)(v13 + 32);
  uint64_t v15 = sub_10024E030();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14, a10, v15);
  uint64_t v17 = (void *)((char *)a9 + *(int *)(v13 + 36));
  *uint64_t v17 = a11;
  v17[1] = a12;
  return result;
}

unint64_t PurchaseIntentInternal.additionalBuyParamsDictionary.getter()
{
  uint64_t v1 = type metadata accessor for PurchaseIntentInternal();
  uint64_t v3 = (uint64_t *)(v0 + *(int *)(v1 + 36));
  unint64_t v4 = v3[1];
  if (!v4)
  {
    return sub_100229C9C((uint64_t)_swiftEmptyArrayStorage);
  }
  uint64_t v5 = *v3;
  uint64_t v61 = 38;
  unint64_t v62 = 0xE100000000000000;
  __chkstk_darwin(v1, v2);
  unint64_t v54 = &v61;
  swift_bridgeObjectRetain_n();
  uint64_t v6 = 0;
  BOOL v7 = sub_10022F548(0x7FFFFFFFFFFFFFFFLL, 1, sub_10022FBD4, (uint64_t)v53, v5, v4);
  swift_bridgeObjectRelease();
  int64_t v8 = *((void *)v7 + 2);
  if (v8)
  {
    uint64_t v60 = _swiftEmptyArrayStorage;
    sub_10022F1DC(0, v8, 0);
    uint64_t v9 = 0;
    uint64_t v55 = v7;
    int64_t v56 = v8;
    uint64_t v57 = v7 + 32;
    do
    {
      uint64_t v10 = *(void *)&v57[32 * v9 + 24];
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_10024E740();
      unint64_t v13 = v12;
      uint64_t v61 = 61;
      unint64_t v62 = 0xE100000000000000;
      __chkstk_darwin(v11, v12);
      unint64_t v54 = &v61;
      swift_bridgeObjectRetain();
      unint64_t v14 = sub_10022F548(0x7FFFFFFFFFFFFFFFLL, 1, sub_10022FBD4, (uint64_t)v53, v11, v13);
      swift_bridgeObjectRelease();
      int64_t v15 = *((void *)v14 + 2);
      if (v15)
      {
        uint64_t v58 = v10;
        uint64_t v59 = v6;
        uint64_t v61 = (uint64_t)_swiftEmptyArrayStorage;
        sub_10022F1FC(0, v15, 0);
        unint64_t v16 = (void *)v61;
        uint64_t v17 = v14 + 56;
        do
        {
          swift_bridgeObjectRetain();
          uint64_t v18 = sub_10024E740();
          uint64_t v20 = v19;
          swift_bridgeObjectRelease();
          uint64_t v61 = (uint64_t)v16;
          unint64_t v22 = v16[2];
          unint64_t v21 = v16[3];
          if (v22 >= v21 >> 1)
          {
            sub_10022F1FC((char *)(v21 > 1), v22 + 1, 1);
            unint64_t v16 = (void *)v61;
          }
          void v16[2] = v22 + 1;
          uint64_t v23 = &v16[2 * v22];
          v23[4] = v18;
          v23[5] = v20;
          v17 += 32;
          --v15;
        }
        while (v15);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int64_t v8 = v56;
        uint64_t v6 = v59;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v16 = _swiftEmptyArrayStorage;
      }
      unint64_t v24 = v60;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10022F1DC(0, v24[2] + 1, 1);
        unint64_t v24 = v60;
      }
      unint64_t v26 = v24[2];
      unint64_t v25 = v24[3];
      if (v26 >= v25 >> 1)
      {
        sub_10022F1DC((void *)(v25 > 1), v26 + 1, 1);
        unint64_t v24 = v60;
      }
      ++v9;
      _OWORD v24[2] = v26 + 1;
      v24[v26 + 4] = v16;
    }
    while (v9 != v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v24 = _swiftEmptyArrayStorage;
  }
  unint64_t v28 = sub_100229C9C((uint64_t)_swiftEmptyArrayStorage);
  BOOL v29 = (char *)v24[2];
  if (!v29)
  {
    swift_bridgeObjectRelease();
    return v28;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v30 = 0;
  int64_t v56 = v28;
  uint64_t v57 = v29;
  while (1)
  {
    uint64_t v33 = (void *)v24[v30 + 4];
    if (v33[2] != 2) {
      goto LABEL_25;
    }
    uint64_t v35 = v33[4];
    uint64_t v34 = v33[5];
    uint64_t v36 = v33[7];
    uint64_t v58 = v33[6];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v59 = v36;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = v28;
    unint64_t v39 = sub_100222E80(v35, v34);
    uint64_t v40 = *(void *)(v28 + 16);
    BOOL v41 = (v38 & 1) == 0;
    uint64_t v42 = v40 + v41;
    if (__OFADD__(v40, v41)) {
      break;
    }
    char v43 = v38;
    if (*(void *)(v28 + 24) >= v42)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v46 = (void *)v61;
        if ((v38 & 1) == 0) {
          goto LABEL_34;
        }
      }
      else
      {
        sub_10022B208();
        uint64_t v46 = (void *)v61;
        if ((v43 & 1) == 0) {
          goto LABEL_34;
        }
      }
    }
    else
    {
      sub_10022A964(v42, isUniquelyReferenced_nonNull_native);
      unint64_t v44 = sub_100222E80(v35, v34);
      if ((v43 & 1) != (v45 & 1)) {
        goto LABEL_43;
      }
      unint64_t v39 = v44;
      uint64_t v46 = (void *)v61;
      if ((v43 & 1) == 0)
      {
LABEL_34:
        v46[(v39 >> 6) + 8] |= 1 << v39;
        uint64_t v47 = (uint64_t *)(v46[6] + 16 * v39);
        *uint64_t v47 = v35;
        v47[1] = v34;
        uint64_t v48 = (void *)(v46[7] + 16 * v39);
        uint64_t v49 = v59;
        void *v48 = v58;
        v48[1] = v49;
        uint64_t v50 = v46[2];
        BOOL v51 = __OFADD__(v50, 1);
        uint64_t v52 = v50 + 1;
        if (v51) {
          goto LABEL_42;
        }
        v46[2] = v52;
        swift_bridgeObjectRetain();
        goto LABEL_24;
      }
    }
    id v31 = (void *)(v46[7] + 16 * v39);
    swift_bridgeObjectRelease();
    uint64_t v32 = v59;
    *id v31 = v58;
    v31[1] = v32;
LABEL_24:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v28 = (unint64_t)v46;
    BOOL v29 = v57;
LABEL_25:
    if (v29 == (char *)++v30)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return v28;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  unint64_t result = sub_10024FB70();
  __break(1u);
  return result;
}

uint64_t PurchaseIntentInternal.buyParamsOfferID.getter()
{
  unint64_t v0 = PurchaseIntentInternal.additionalBuyParamsDictionary.getter();
  if (*(void *)(v0 + 16) && (unint64_t v1 = sub_100222E80(0x66664F636F486461, 0xEC00000064497265), (v2 & 1) != 0))
  {
    uint64_t v3 = *(void *)(*(void *)(v0 + 56) + 16 * v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v3 = 0;
  }
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t sub_10022E908()
{
  unint64_t result = 0x656D614E707061;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x4449656C646E7562;
      break;
    case 2:
      unint64_t result = 0x49746375646F7270;
      break;
    case 3:
      unint64_t result = 0x4E746375646F7270;
      break;
    case 4:
      unint64_t result = 0x6D617473656D6974;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10022E9E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100230724(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10022EA10(uint64_t a1)
{
  unint64_t v2 = sub_10022FC48();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10022EA4C(uint64_t a1)
{
  unint64_t v2 = sub_10022FC48();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PurchaseIntentInternal.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100019524(&qword_10031A2A0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  BOOL v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_10022FC48();
  sub_10024FD40();
  v9[15] = 0;
  sub_10024F8D0();
  if (!v1)
  {
    v9[14] = 1;
    sub_10024F940();
    v9[13] = 2;
    sub_10024F940();
    v9[12] = 3;
    sub_10024F8D0();
    type metadata accessor for PurchaseIntentInternal();
    v9[11] = 4;
    sub_10024E030();
    sub_10001FCBC(&qword_10031A2B0);
    sub_10024F980();
    v9[10] = 5;
    sub_10024F8D0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t PurchaseIntentInternal.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_10024E030();
  uint64_t v32 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v4);
  uint64_t v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100019524(&qword_10031A2B8);
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v34 = v7;
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PurchaseIntentInternal();
  __chkstk_darwin(v11, v12);
  unint64_t v14 = (void *)((char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = a1[3];
  uint64_t v35 = a1;
  sub_10001C2A8(a1, v15);
  sub_10022FC48();
  unint64_t v16 = v36;
  sub_10024FD20();
  if (v16) {
    return sub_10001C2EC((uint64_t)v35);
  }
  uint64_t v36 = v6;
  uint64_t v17 = v33;
  char v42 = 0;
  uint64_t v18 = (char *)v14;
  *unint64_t v14 = sub_10024F7C0();
  v14[1] = v19;
  char v41 = 1;
  void v14[2] = sub_10024F830();
  v14[3] = v20;
  char v40 = 2;
  uint64_t v21 = v17;
  *((void *)v18 + 4) = sub_10024F830();
  *((void *)v18 + 5) = v22;
  char v39 = 3;
  *((void *)v18 + 6) = sub_10024F7C0();
  *((void *)v18 + 7) = v23;
  char v38 = 4;
  sub_10001FCBC(&qword_10031A2C0);
  unint64_t v24 = v36;
  sub_10024F870();
  v30[1] = 0;
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(&v18[*(int *)(v11 + 32)], v24, v3);
  char v37 = 5;
  uint64_t v25 = sub_10024F7C0();
  uint64_t v27 = v26;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v34);
  unint64_t v28 = (uint64_t *)&v18[*(int *)(v11 + 36)];
  *unint64_t v28 = v25;
  v28[1] = v27;
  sub_10022FC9C((uint64_t)v18, v31);
  sub_10001C2EC((uint64_t)v35);
  return sub_10022FD00((uint64_t)v18);
}

uint64_t sub_10022F18C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseIntentInternal.init(from:)(a1, a2);
}

uint64_t sub_10022F1A4(void *a1)
{
  return PurchaseIntentInternal.encode(to:)(a1);
}

char *sub_10022F1BC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10022F21C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_10022F1DC(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10022F320(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_10022F1FC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10022F444(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_10022F21C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100019524(&qword_10031A3A0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_10022F320(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100019524(&qword_10031A388);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_100019524(&qword_10031A390);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_10022F444(char *result, int64_t a2, char a3, char *a4)
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
    sub_100019524(&qword_10031A380);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_10022F548(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v46[3] = a4;
  if (a1 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v11 = a5;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = _swiftEmptyArrayStorage;
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = 15;
  uint64_t v15 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v16 = HIBYTE(a6) & 0xF) : (uint64_t v16 = v11 & 0xFFFFFFFFFFFFLL), !v16))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v15 = v11 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((v11 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_10022F968(v30 | (v15 << 16), v43, a2 & 1, v14);
    swift_bridgeObjectRelease();
    uint64_t v10 = *(char **)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_38;
  }
  uint64_t v38 = a1;
  uint64_t v39 = v14;
  unint64_t v44 = 4 * v16;
  uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  unint64_t v9 = 15;
  unint64_t v8 = 15;
  unint64_t v17 = 15;
  while (1)
  {
    v46[0] = sub_10024E8F0();
    v46[1] = v18;
    uint64_t v19 = a3(v46);
    if (v7)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    uint64_t v6 = v19;
    swift_bridgeObjectRelease();
    if (v6) {
      break;
    }
    unint64_t v9 = sub_10024E7A0();
LABEL_9:
    if (v44 == v9 >> 14) {
      goto LABEL_29;
    }
  }
  if (v8 >> 14 == v9 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v9 = sub_10024E7A0();
    *(void *)(v43 + 16) = v9;
    unint64_t v8 = v9;
    unint64_t v17 = v9;
    goto LABEL_9;
  }
  if (v9 >> 14 < v8 >> 14)
  {
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v20 = sub_10024E920();
  uint64_t v40 = v21;
  uint64_t v41 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v10 = sub_10022FA78(0, *((void *)v10 + 2) + 1, 1, v10);
  }
  unint64_t v27 = *((void *)v10 + 2);
  unint64_t v26 = *((void *)v10 + 3);
  uint64_t v6 = v27 + 1;
  if (v27 >= v26 >> 1) {
    uint64_t v10 = sub_10022FA78((char *)(v26 > 1), v27 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v6;
  unint64_t v28 = &v10[32 * v27];
  *((void *)v28 + 4) = v41;
  *((void *)v28 + 5) = v23;
  *((void *)v28 + 6) = v25;
  *((void *)v28 + 7) = v40;
  *(void *)(v39 + 16) = v10;
  uint64_t v29 = sub_10024E7A0();
  unint64_t v9 = v29;
  *(void *)(v43 + 16) = v29;
  if (*((void *)v10 + 2) != v38)
  {
    unint64_t v8 = v29;
    unint64_t v17 = v29;
    goto LABEL_9;
  }
  unint64_t v17 = v29;
  unint64_t v8 = v29;
LABEL_29:
  if (v44 == v8 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v44 >= v17 >> 14)
  {
    uint64_t v6 = sub_10024E920();
    unint64_t v8 = v31;
    unint64_t v9 = v32;
    uint64_t v11 = v33;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_34;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  uint64_t v10 = sub_10022FA78(0, *((void *)v10 + 2) + 1, 1, v10);
LABEL_34:
  unint64_t v35 = *((void *)v10 + 2);
  unint64_t v34 = *((void *)v10 + 3);
  if (v35 >= v34 >> 1) {
    uint64_t v10 = sub_10022FA78((char *)(v34 > 1), v35 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v35 + 1;
  uint64_t v36 = &v10[32 * v35];
  *((void *)v36 + 4) = v6;
  *((void *)v36 + 5) = v8;
  *((void *)v36 + 6) = v9;
  *((void *)v36 + 7) = v11;
  *(void *)(v39 + 16) = v10;
LABEL_37:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_38:
  swift_release();
  return v10;
}

uint64_t sub_10022F968(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v10 = *(void *)(a2 + 16) >> 14;
  int v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1) {
    return v11 ^ 1u;
  }
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = a4;
  uint64_t v5 = sub_10024E920();
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  uint64_t v8 = v14;
  unint64_t v9 = *(char **)(v4 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    unint64_t v9 = sub_10022FA78(0, *((void *)v9 + 2) + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  unint64_t v17 = *((void *)v9 + 2);
  unint64_t v16 = *((void *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    unint64_t v9 = sub_10022FA78((char *)(v16 > 1), v17 + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  *((void *)v9 + 2) = v17 + 1;
  uint64_t v18 = &v9[32 * v17];
  *((void *)v18 + 4) = v5;
  *((void *)v18 + 5) = v6;
  *((void *)v18 + 6) = v7;
  *((void *)v18 + 7) = v8;
  return v11 ^ 1u;
}

char *sub_10022FA78(char *result, int64_t a2, char a3, char *a4)
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
    sub_100019524(&qword_10031A398);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10022FB7C(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_10024FA60() & 1;
  }
}

uint64_t sub_10022FBD4(void *a1)
{
  return sub_10022FBF0(a1) & 1;
}

uint64_t sub_10022FBF0(void *a1)
{
  unint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_10024FA60() & 1;
  }
}

unint64_t sub_10022FC48()
{
  unint64_t result = qword_10031A2A8;
  if (!qword_10031A2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A2A8);
  }
  return result;
}

uint64_t sub_10022FC9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PurchaseIntentInternal();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10022FD00(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PurchaseIntentInternal();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for PurchaseIntentInternal(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v10 = a2[7];
    uint64_t v11 = *(int *)(a3 + 32);
    uint64_t v20 = (char *)a2 + v11;
    uint64_t v21 = (char *)a1 + v11;
    a1[6] = a2[6];
    a1[7] = v10;
    uint64_t v12 = sub_10024E030();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v21, v20, v12);
    uint64_t v14 = *(int *)(a3 + 36);
    uint64_t v15 = (uint64_t *)((char *)v4 + v14);
    unint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for PurchaseIntentInternal(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_10024E030();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PurchaseIntentInternal(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  uint64_t v9 = a2[7];
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v18 = (char *)a2 + v10;
  uint64_t v19 = (char *)a1 + v10;
  a1[6] = a2[6];
  a1[7] = v9;
  uint64_t v11 = sub_10024E030();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v19, v18, v11);
  uint64_t v13 = *(int *)(a3 + 36);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PurchaseIntentInternal(void *a1, void *a2, uint64_t a3)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10024E030();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 36);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for PurchaseIntentInternal(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_10024E030();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 36)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 36));
  return a1;
}

void *assignWithTake for PurchaseIntentInternal(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_10024E030();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = *(int *)(a3 + 36);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  *uint64_t v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseIntentInternal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100230308);
}

uint64_t sub_100230308(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_10024E030();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PurchaseIntentInternal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1002303CC);
}

uint64_t sub_1002303CC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10024E030();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_100230474()
{
  uint64_t result = sub_10024E030();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PurchaseIntentInternal.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x1002305E4);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PurchaseIntentInternal.CodingKeys()
{
  return &type metadata for PurchaseIntentInternal.CodingKeys;
}

unint64_t sub_100230620()
{
  unint64_t result = qword_10031A368;
  if (!qword_10031A368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A368);
  }
  return result;
}

unint64_t sub_100230678()
{
  unint64_t result = qword_10031A370;
  if (!qword_10031A370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A370);
  }
  return result;
}

unint64_t sub_1002306D0()
{
  unint64_t result = qword_10031A378;
  if (!qword_10031A378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A378);
  }
  return result;
}

uint64_t sub_100230724(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656D614E707061 && a2 == 0xE700000000000000;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4449656C646E7562 && a2 == 0xE800000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x49746375646F7270 && a2 == 0xE900000000000044 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4E746375646F7270 && a2 == 0xEB00000000656D61 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000100285250)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_1002309CC()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100230A04()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t AcknowledgeMessageRequest.clientOverride.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AcknowledgeMessageRequest() + 28);
  return sub_100230AA4(v3, a1);
}

uint64_t type metadata accessor for AcknowledgeMessageRequest()
{
  uint64_t result = qword_10031A450;
  if (!qword_10031A450) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100230AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100019524(&qword_10031A3A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t AcknowledgeMessageRequest.clientOverride.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AcknowledgeMessageRequest() + 28);
  return sub_100230B50(a1, v3);
}

uint64_t sub_100230B50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100019524(&qword_10031A3A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*AcknowledgeMessageRequest.clientOverride.modify())(void)
{
  return debugOnly(_:);
}

uint64_t AcknowledgeMessageRequest.logKey.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AcknowledgeMessageRequest() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AcknowledgeMessageRequest.logKey.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for AcknowledgeMessageRequest() + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*AcknowledgeMessageRequest.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t AcknowledgeMessageRequest.init(messageType:bundleID:offerID:overrides:logKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10)
{
  uint64_t v17 = type metadata accessor for AcknowledgeMessageRequest();
  uint64_t v18 = (uint64_t)a9 + *(int *)(v17 + 28);
  uint64_t v19 = type metadata accessor for ClientOverride(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  uint64_t result = sub_100230B50(a7, v18);
  uint64_t v21 = (void *)((char *)a9 + *(int *)(v17 + 32));
  *uint64_t v21 = a8;
  v21[1] = a10;
  return result;
}

uint64_t AcknowledgeMessageRequest.encode()()
{
  sub_10024DA00();
  swift_allocObject();
  sub_10024D9F0();
  type metadata accessor for AcknowledgeMessageRequest();
  sub_100231BC0(&qword_10031A3B0, (void (*)(uint64_t))type metadata accessor for AcknowledgeMessageRequest);
  uint64_t v0 = sub_10024D9E0();
  swift_release();
  return v0;
}

uint64_t static AcknowledgeMessageRequest.decode(encodedRequest:)()
{
  return swift_release();
}

uint64_t sub_100230F40()
{
  uint64_t result = 0x546567617373656DLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x4449656C646E7562;
      break;
    case 2:
      uint64_t result = 0x4449726566666FLL;
      break;
    case 3:
      uint64_t result = 0x764F746E65696C63;
      break;
    case 4:
      uint64_t result = 0x79654B676F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100230FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100231914(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100231024(uint64_t a1)
{
  unint64_t v2 = sub_1002312D8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100231060(uint64_t a1)
{
  unint64_t v2 = sub_1002312D8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t AcknowledgeMessageRequest.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100019524(&qword_10031A3C0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_1002312D8();
  sub_10024FD40();
  v9[15] = 0;
  sub_10024F940();
  if (!v1)
  {
    v9[14] = 1;
    sub_10024F8D0();
    v9[13] = 2;
    sub_10024F940();
    type metadata accessor for AcknowledgeMessageRequest();
    v9[12] = 3;
    type metadata accessor for ClientOverride(0);
    sub_100231BC0(&qword_10031A3D0, (void (*)(uint64_t))type metadata accessor for ClientOverride);
    sub_10024F910();
    v9[11] = 4;
    sub_10024F940();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_1002312D8()
{
  unint64_t result = qword_10031A3C8;
  if (!qword_10031A3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A3C8);
  }
  return result;
}

uint64_t AcknowledgeMessageRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v3 = sub_100019524(&qword_10031A3A8);
  __chkstk_darwin(v3 - 8, v4);
  unint64_t v31 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100019524(&qword_10031A3D8);
  uint64_t v30 = *(void *)(v32 - 8);
  __chkstk_darwin(v32, v6);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AcknowledgeMessageRequest();
  __chkstk_darwin(v9, v10);
  uint64_t v12 = (void *)((char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = (uint64_t)v12 + *(int *)(v13 + 28);
  uint64_t v15 = type metadata accessor for ClientOverride(0);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v33 = v14;
  v16(v14, 1, 1, v15);
  sub_10001C2A8(a1, a1[3]);
  sub_1002312D8();
  uint64_t v17 = (uint64_t)v34;
  sub_10024FD20();
  if (v17)
  {
    sub_10001C2EC((uint64_t)a1);
    return sub_100051BB4(v33, &qword_10031A3A8);
  }
  else
  {
    v28[1] = v15;
    unint64_t v34 = a1;
    uint64_t v18 = v30;
    uint64_t v19 = (uint64_t)v31;
    char v39 = 0;
    *uint64_t v12 = sub_10024F830();
    v12[1] = v20;
    char v38 = 1;
    void v12[2] = sub_10024F7C0();
    v12[3] = v21;
    char v37 = 2;
    v12[4] = sub_10024F830();
    v12[5] = v22;
    char v36 = 3;
    sub_100231BC0(&qword_10031A3E0, (void (*)(uint64_t))type metadata accessor for ClientOverride);
    sub_10024F800();
    sub_100230B50(v19, v33);
    char v35 = 4;
    uint64_t v23 = sub_10024F830();
    uint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v32);
    unint64_t v26 = (uint64_t *)((char *)v12 + *(int *)(v9 + 32));
    *unint64_t v26 = v23;
    v26[1] = v25;
    sub_100231790((uint64_t)v12, v29);
    sub_10001C2EC((uint64_t)v34);
    return sub_100232E98((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for AcknowledgeMessageRequest);
  }
}

uint64_t sub_100231790(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AcknowledgeMessageRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1002317F4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AcknowledgeMessageRequest.init(from:)(a1, a2);
}

uint64_t sub_10023180C(void *a1)
{
  return AcknowledgeMessageRequest.encode(to:)(a1);
}

Swift::Int sub_100231828()
{
  uint64_t v1 = *v0;
  sub_10024FC00();
  sub_10024FC20(v1 + 1);
  return sub_10024FC70();
}

void sub_100231870()
{
  sub_10024FC20(*v0 + 1);
}

Swift::Int sub_1002318A0()
{
  uint64_t v1 = *v0;
  sub_10024FC00();
  sub_10024FC20(v1 + 1);
  return sub_10024FC70();
}

void sub_1002318E4(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t MessageType.messageTypeString.getter(char a1)
{
  return qword_1002701B8[a1];
}

uint64_t sub_100231914(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x546567617373656DLL && a2 == 0xEB00000000657079;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4449656C646E7562 && a2 == 0xE800000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4449726566666FLL && a2 == 0xE700000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x764F746E65696C63 && a2 == 0xEE00656469727265 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_100231B68(uint64_t a1)
{
  uint64_t result = sub_100231BC0(&qword_10031A3E8, (void (*)(uint64_t))type metadata accessor for AcknowledgeMessageRequest);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_100231BC0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100231C08(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_100231BC0(&qword_10031A3B8, (void (*)(uint64_t))type metadata accessor for AcknowledgeMessageRequest);
  uint64_t result = sub_100231BC0(&qword_10031A3B0, (void (*)(uint64_t))type metadata accessor for AcknowledgeMessageRequest);
  *(void *)(a1 + 24) = result;
  return result;
}

unint64_t sub_100231C90()
{
  unint64_t result = qword_10031A3F0;
  if (!qword_10031A3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A3F0);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AcknowledgeMessageRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = a2[5];
    uint64_t v9 = *(int *)(a3 + 28);
    __dst = (uint64_t *)((char *)a1 + v9);
    uint64_t v10 = (uint64_t *)((char *)a2 + v9);
    a1[4] = a2[4];
    a1[5] = v8;
    uint64_t v11 = type metadata accessor for ClientOverride(0);
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = sub_100019524(&qword_10031A3A8);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
      uint64_t v15 = a3;
    }
    else
    {
      unint64_t v17 = v10[1];
      uint64_t v46 = v12;
      if (v17 >> 60 == 15)
      {
        *(_OWORD *)__dst = *(_OWORD *)v10;
      }
      else
      {
        uint64_t v18 = *v10;
        sub_1000473AC(*v10, v17);
        void *__dst = v18;
        __dst[1] = v17;
      }
      uint64_t v19 = (int *)v11;
      uint64_t v15 = a3;
      uint64_t v20 = v10[3];
      __dst[2] = v10[2];
      __dst[3] = v20;
      uint64_t v21 = v10[5];
      __dst[4] = v10[4];
      __dst[5] = v21;
      uint64_t v22 = v19[7];
      uint64_t v23 = (char *)__dst + v22;
      uint64_t v24 = (char *)v10 + v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_100019524(&qword_100319C00);
      uint64_t v26 = *(void *)(v25 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 3, v25))
      {
        uint64_t v27 = type metadata accessor for ClientOverride.Server(0);
        memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        uint64_t v28 = sub_10024DDC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v23, v24, v28);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 3, v25);
      }
      uint64_t v29 = v19[8];
      uint64_t v30 = (char *)__dst + v29;
      unint64_t v31 = (char *)v10 + v29;
      *(void *)uint64_t v30 = *(void *)v31;
      v30[8] = v31[8];
      uint64_t v32 = v19[9];
      uint64_t v33 = (char *)__dst + v32;
      unint64_t v34 = (char *)v10 + v32;
      v33[8] = v34[8];
      *(void *)uint64_t v33 = *(void *)v34;
      uint64_t v35 = v19[10];
      char v36 = (char *)__dst + v35;
      char v37 = (char *)v10 + v35;
      uint64_t v38 = sub_10024E0A0();
      uint64_t v39 = *(void *)(v38 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
      {
        uint64_t v40 = sub_100019524(&qword_100319CA8);
        memcpy(v36, v37, *(void *)(*(void *)(v40 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v36, v37, v38);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
      }
      (*(void (**)(void *, void, uint64_t, int *))(v46 + 56))(__dst, 0, 1, v19);
    }
    uint64_t v41 = *(int *)(v15 + 32);
    char v42 = (uint64_t *)((char *)v4 + v41);
    uint64_t v43 = (uint64_t *)((char *)a2 + v41);
    uint64_t v44 = v43[1];
    *char v42 = *v43;
    v42[1] = v44;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AcknowledgeMessageRequest(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t *)(a1 + *(int *)(a2 + 28));
  uint64_t v5 = type metadata accessor for ClientOverride(0);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    unint64_t v6 = v4[1];
    if (v6 >> 60 != 15) {
      sub_10003F808(*v4, v6);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = (char *)v4 + *(int *)(v5 + 28);
    uint64_t v8 = sub_100019524(&qword_100319C00);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 3, v8))
    {
      uint64_t v9 = sub_10024DDC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v7, v9);
    }
    uint64_t v10 = (char *)v4 + *(int *)(v5 + 40);
    uint64_t v11 = sub_10024E0A0();
    uint64_t v12 = *(void *)(v11 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    }
  }
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AcknowledgeMessageRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  uint64_t v8 = *(int *)(a3 + 28);
  __dst = (void *)((char *)a1 + v8);
  uint64_t v9 = (void *)((char *)a2 + v8);
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(unsigned int (**)(void *, uint64_t, int *))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = sub_100019524(&qword_10031A3A8);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
    uint64_t v14 = a3;
  }
  else
  {
    unint64_t v15 = v9[1];
    uint64_t v43 = v11;
    if (v15 >> 60 == 15)
    {
      *(_OWORD *)__dst = *(_OWORD *)v9;
    }
    else
    {
      uint64_t v16 = *v9;
      sub_1000473AC(*v9, v15);
      void *__dst = v16;
      __dst[1] = v15;
    }
    uint64_t v14 = a3;
    uint64_t v17 = v9[3];
    __dst[2] = v9[2];
    __dst[3] = v17;
    uint64_t v18 = v9[5];
    __dst[4] = v9[4];
    __dst[5] = v18;
    uint64_t v19 = v10[7];
    uint64_t v20 = (char *)__dst + v19;
    uint64_t v21 = (char *)v9 + v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_100019524(&qword_100319C00);
    uint64_t v23 = *(void *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 3, v22))
    {
      uint64_t v24 = type metadata accessor for ClientOverride.Server(0);
      memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      uint64_t v25 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v20, v21, v25);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 3, v22);
    }
    uint64_t v26 = v10[8];
    uint64_t v27 = (char *)__dst + v26;
    uint64_t v28 = (char *)v9 + v26;
    *(void *)uint64_t v27 = *(void *)v28;
    v27[8] = v28[8];
    uint64_t v29 = v10[9];
    uint64_t v30 = (char *)__dst + v29;
    unint64_t v31 = (char *)v9 + v29;
    v30[8] = v31[8];
    *(void *)uint64_t v30 = *(void *)v31;
    uint64_t v32 = v10[10];
    uint64_t v33 = (char *)__dst + v32;
    unint64_t v34 = (char *)v9 + v32;
    uint64_t v35 = sub_10024E0A0();
    uint64_t v36 = *(void *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
    {
      uint64_t v37 = sub_100019524(&qword_100319CA8);
      memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
    (*(void (**)(void *, void, uint64_t, int *))(v43 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v38 = *(int *)(v14 + 32);
  uint64_t v39 = (void *)((char *)a1 + v38);
  uint64_t v40 = (void *)((char *)a2 + v38);
  uint64_t v41 = v40[1];
  *uint64_t v39 = *v40;
  v39[1] = v41;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AcknowledgeMessageRequest(void *a1, void *a2, uint64_t a3)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (void *)((char *)a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v10 = *((void *)v9 - 1);
  uint64_t v11 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_100232E98((uint64_t)v7, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }
    unint64_t v18 = v8[1];
    uint64_t v78 = a3;
    if ((unint64_t)v7[1] >> 60 == 15)
    {
      if (v18 >> 60 != 15)
      {
        uint64_t v19 = *v8;
        sub_1000473AC(*v8, v18);
        uint64_t *v7 = v19;
        v7[1] = v18;
        goto LABEL_25;
      }
    }
    else
    {
      if (v18 >> 60 != 15)
      {
        uint64_t v46 = *v8;
        sub_1000473AC(*v8, v18);
        uint64_t v47 = *v7;
        unint64_t v48 = v7[1];
        uint64_t *v7 = v46;
        v7[1] = v18;
        sub_10003F808(v47, v48);
LABEL_25:
        _OWORD v7[2] = v8[2];
        v7[3] = v8[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v7[4] = v8[4];
        v7[5] = v8[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v49 = v9[7];
        uint64_t v50 = (char *)v7 + v49;
        BOOL v51 = (char *)v8 + v49;
        uint64_t v52 = sub_100019524(&qword_100319C00);
        uint64_t v75 = *(void *)(v52 - 8);
        uint64_t v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v75 + 48);
        uint64_t v76 = (uint64_t)v50;
        LODWORD(v50) = v53(v50, 3, v52);
        int v54 = v53(v51, 3, v52);
        if (v50)
        {
          if (!v54)
          {
            uint64_t v57 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v57 - 8) + 16))(v76, v51, v57);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v75 + 56))(v76, 0, 3, v52);
            goto LABEL_33;
          }
          size_t v55 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          int64_t v56 = (void *)v76;
        }
        else
        {
          if (!v54)
          {
            uint64_t v58 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v58 - 8) + 24))(v76, v51, v58);
            goto LABEL_33;
          }
          sub_100051BB4(v76, &qword_100319C00);
          size_t v55 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          int64_t v56 = (void *)v76;
        }
        memcpy(v56, v51, v55);
LABEL_33:
        uint64_t v59 = v9[8];
        uint64_t v60 = (char *)v7 + v59;
        uint64_t v61 = (char *)v8 + v59;
        uint64_t v62 = *(void *)v61;
        v60[8] = v61[8];
        *(void *)uint64_t v60 = v62;
        uint64_t v63 = v9[9];
        uint64_t v64 = (char *)v7 + v63;
        uint64_t v65 = (char *)v8 + v63;
        uint64_t v66 = *(void *)v65;
        v64[8] = v65[8];
        *(void *)uint64_t v64 = v66;
        uint64_t v67 = v9[10];
        uint64_t v68 = (char *)v7 + v67;
        uint64_t v69 = (char *)v8 + v67;
        uint64_t v70 = sub_10024E0A0();
        uint64_t v71 = *(void *)(v70 - 8);
        uint64_t v72 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
        int v73 = v72(v68, 1, v70);
        int v74 = v72(v69, 1, v70);
        if (v73)
        {
          a3 = v78;
          if (!v74)
          {
            (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v68, v69, v70);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(v68, 0, 1, v70);
            goto LABEL_20;
          }
        }
        else
        {
          a3 = v78;
          if (!v74)
          {
            (*(void (**)(char *, char *, uint64_t))(v71 + 24))(v68, v69, v70);
            goto LABEL_20;
          }
          (*(void (**)(char *, uint64_t))(v71 + 8))(v68, v70);
        }
        size_t v15 = *(void *)(*(void *)(sub_100019524(&qword_100319CA8) - 8) + 64);
        uint64_t v16 = (uint64_t *)v68;
        uint64_t v17 = (uint64_t *)v69;
        goto LABEL_8;
      }
      sub_1000567A4((uint64_t)v7);
    }
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v8;
    goto LABEL_25;
  }
  if (v13)
  {
LABEL_7:
    size_t v15 = *(void *)(*(void *)(sub_100019524(&qword_10031A3A8) - 8) + 64);
    uint64_t v16 = v7;
    uint64_t v17 = v8;
LABEL_8:
    memcpy(v16, v17, v15);
    goto LABEL_20;
  }
  unint64_t v14 = v8[1];
  uint64_t v77 = a3;
  if (v14 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v8;
  }
  else
  {
    uint64_t v20 = *v8;
    sub_1000473AC(*v8, v14);
    uint64_t *v7 = v20;
    v7[1] = v14;
  }
  _OWORD v7[2] = v8[2];
  v7[3] = v8[3];
  v7[4] = v8[4];
  v7[5] = v8[5];
  uint64_t v21 = v9[7];
  uint64_t v22 = (char *)v7 + v21;
  uint64_t v23 = (char *)v8 + v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_100019524(&qword_100319C00);
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 3, v24))
  {
    uint64_t v26 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v27 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v22, v23, v27);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 3, v24);
  }
  a3 = v77;
  uint64_t v28 = v9[8];
  uint64_t v29 = (char *)v7 + v28;
  uint64_t v30 = (char *)v8 + v28;
  uint64_t v31 = *(void *)v30;
  v29[8] = v30[8];
  *(void *)uint64_t v29 = v31;
  uint64_t v32 = v9[9];
  uint64_t v33 = (char *)v7 + v32;
  unint64_t v34 = (char *)v8 + v32;
  uint64_t v35 = *(void *)v34;
  v33[8] = v34[8];
  *(void *)uint64_t v33 = v35;
  uint64_t v36 = v9[10];
  uint64_t v37 = (char *)v7 + v36;
  uint64_t v38 = (char *)v8 + v36;
  uint64_t v39 = sub_10024E0A0();
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
  {
    uint64_t v41 = sub_100019524(&qword_100319CA8);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v37, v38, v39);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  (*(void (**)(uint64_t *, void, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
LABEL_20:
  uint64_t v42 = *(int *)(a3 + 32);
  uint64_t v43 = (void *)((char *)a1 + v42);
  uint64_t v44 = (void *)((char *)a2 + v42);
  *uint64_t v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100232E98(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *initializeWithTake for AcknowledgeMessageRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (_OWORD *)((char *)a1 + v7);
  uint64_t v9 = (_OWORD *)((char *)a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v11 = *((void *)v10 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100019524(&qword_10031A3A8);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    long long v13 = v9[1];
    *uint64_t v8 = *v9;
    v8[1] = v13;
    v8[2] = v9[2];
    uint64_t v14 = v10[7];
    __dst = (char *)v8 + v14;
    size_t v15 = (char *)v9 + v14;
    uint64_t v16 = sub_100019524(&qword_100319C00);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 3, v16))
    {
      uint64_t v18 = type metadata accessor for ClientOverride.Server(0);
      memcpy(__dst, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      uint64_t v19 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(__dst, v15, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 3, v16);
    }
    uint64_t v20 = v10[8];
    uint64_t v21 = (char *)v8 + v20;
    uint64_t v22 = (char *)v9 + v20;
    *(void *)uint64_t v21 = *(void *)v22;
    unsigned char v21[8] = v22[8];
    uint64_t v23 = v10[9];
    uint64_t v24 = (char *)v8 + v23;
    uint64_t v25 = (char *)v9 + v23;
    unsigned char v24[8] = v25[8];
    *(void *)uint64_t v24 = *(void *)v25;
    uint64_t v26 = v10[10];
    uint64_t v27 = (char *)v8 + v26;
    uint64_t v28 = (char *)v9 + v26;
    uint64_t v29 = sub_10024E0A0();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      uint64_t v31 = sub_100019524(&qword_100319CA8);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

void *assignWithTake for AcknowledgeMessageRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (void *)((char *)a2 + v9);
  uint64_t v12 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v13 = *((void *)v12 - 1);
  uint64_t v14 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_100232E98((uint64_t)v10, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }
    unint64_t v27 = v10[1];
    uint64_t v78 = a3;
    if (v27 >> 60 != 15)
    {
      unint64_t v28 = v11[1];
      if (v28 >> 60 != 15)
      {
        uint64_t v48 = *v10;
        *uint64_t v10 = *v11;
        v10[1] = v28;
        sub_10003F808(v48, v27);
LABEL_20:
        uint64_t v49 = v11[3];
        v10[2] = v11[2];
        v10[3] = v49;
        swift_bridgeObjectRelease();
        uint64_t v50 = v11[5];
        v10[4] = v11[4];
        v10[5] = v50;
        swift_bridgeObjectRelease();
        uint64_t v51 = v12[7];
        uint64_t v52 = (char *)v10 + v51;
        uint64_t v53 = (char *)v11 + v51;
        uint64_t v54 = sub_100019524(&qword_100319C00);
        uint64_t v75 = *(void *)(v54 - 8);
        size_t v55 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v75 + 48);
        uint64_t v76 = (uint64_t)v52;
        LODWORD(v52) = v55(v52, 3, v54);
        int v56 = v55(v53, 3, v54);
        if (v52)
        {
          if (!v56)
          {
            uint64_t v59 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v59 - 8) + 32))(v76, v53, v59);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v75 + 56))(v76, 0, 3, v54);
            goto LABEL_28;
          }
          size_t v57 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          uint64_t v58 = (void *)v76;
        }
        else
        {
          if (!v56)
          {
            uint64_t v60 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v60 - 8) + 40))(v76, v53, v60);
            goto LABEL_28;
          }
          sub_100051BB4(v76, &qword_100319C00);
          size_t v57 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          uint64_t v58 = (void *)v76;
        }
        memcpy(v58, v53, v57);
LABEL_28:
        uint64_t v61 = v12[8];
        uint64_t v62 = (char *)v10 + v61;
        uint64_t v63 = (char *)v11 + v61;
        *(void *)uint64_t v62 = *(void *)v63;
        v62[8] = v63[8];
        uint64_t v64 = v12[9];
        uint64_t v65 = (char *)v10 + v64;
        uint64_t v66 = (char *)v11 + v64;
        v65[8] = v66[8];
        *(void *)uint64_t v65 = *(void *)v66;
        uint64_t v67 = v12[10];
        uint64_t v68 = (char *)v10 + v67;
        uint64_t v69 = (char *)v11 + v67;
        uint64_t v70 = sub_10024E0A0();
        uint64_t v71 = *(void *)(v70 - 8);
        uint64_t v72 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
        int v73 = v72(v68, 1, v70);
        int v74 = v72(v69, 1, v70);
        if (v73)
        {
          a3 = v78;
          if (!v74)
          {
            (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v68, v69, v70);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(v68, 0, 1, v70);
            goto LABEL_18;
          }
        }
        else
        {
          a3 = v78;
          if (!v74)
          {
            (*(void (**)(char *, char *, uint64_t))(v71 + 40))(v68, v69, v70);
            goto LABEL_18;
          }
          (*(void (**)(char *, uint64_t))(v71 + 8))(v68, v70);
        }
        size_t v24 = *(void *)(*(void *)(sub_100019524(&qword_100319CA8) - 8) + 64);
        uint64_t v25 = (uint64_t *)v68;
        uint64_t v26 = (uint64_t *)v69;
        goto LABEL_8;
      }
      sub_1000567A4((uint64_t)v10);
    }
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
    goto LABEL_20;
  }
  if (v16)
  {
LABEL_7:
    size_t v24 = *(void *)(*(void *)(sub_100019524(&qword_10031A3A8) - 8) + 64);
    uint64_t v25 = v10;
    uint64_t v26 = v11;
LABEL_8:
    memcpy(v25, v26, v24);
    goto LABEL_18;
  }
  uint64_t v77 = a3;
  long long v17 = *((_OWORD *)v11 + 1);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v17;
  *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
  uint64_t v18 = v12[7];
  uint64_t v19 = (char *)v10 + v18;
  uint64_t v20 = (char *)v11 + v18;
  uint64_t v21 = sub_100019524(&qword_100319C00);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 3, v21))
  {
    uint64_t v23 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    uint64_t v29 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v19, v20, v29);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 3, v21);
  }
  uint64_t v30 = v12[8];
  uint64_t v31 = (char *)v10 + v30;
  uint64_t v32 = (char *)v11 + v30;
  *(void *)uint64_t v31 = *(void *)v32;
  v31[8] = v32[8];
  uint64_t v33 = v12[9];
  unint64_t v34 = (char *)v10 + v33;
  uint64_t v35 = (char *)v11 + v33;
  v34[8] = v35[8];
  *(void *)unint64_t v34 = *(void *)v35;
  uint64_t v36 = v12[10];
  uint64_t v37 = (char *)v10 + v36;
  uint64_t v38 = (char *)v11 + v36;
  uint64_t v39 = sub_10024E0A0();
  uint64_t v40 = *(void *)(v39 - 8);
  a3 = v77;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
  {
    uint64_t v41 = sub_100019524(&qword_100319CA8);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v37, v38, v39);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  (*(void (**)(uint64_t *, void, uint64_t, int *))(v13 + 56))(v10, 0, 1, v12);
LABEL_18:
  uint64_t v42 = *(int *)(a3 + 32);
  uint64_t v43 = (void *)((char *)a1 + v42);
  uint64_t v44 = (void *)((char *)a2 + v42);
  uint64_t v46 = *v44;
  uint64_t v45 = v44[1];
  *uint64_t v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AcknowledgeMessageRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100233980);
}

uint64_t sub_100233980(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100019524(&qword_10031A3A8);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AcknowledgeMessageRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100233A48);
}

uint64_t sub_100233A48(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100019524(&qword_10031A3A8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100233AF4()
{
  sub_100233B98();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100233B98()
{
  if (!qword_10031A460)
  {
    type metadata accessor for ClientOverride(255);
    unint64_t v0 = sub_10024F030();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10031A460);
    }
  }
}

ValueMetadata *type metadata accessor for MessageType()
{
  return &type metadata for MessageType;
}

uint64_t _s15StoreKit_Shared11MessageTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s15StoreKit_Shared11MessageTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x100233D64);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AcknowledgeMessageRequest.CodingKeys()
{
  return &type metadata for AcknowledgeMessageRequest.CodingKeys;
}

unint64_t sub_100233DA0()
{
  unint64_t result = qword_10031A4A0;
  if (!qword_10031A4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A4A0);
  }
  return result;
}

unint64_t sub_100233DF8()
{
  unint64_t result = qword_10031A4A8;
  if (!qword_10031A4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A4A8);
  }
  return result;
}

unint64_t sub_100233E50()
{
  unint64_t result = qword_10031A4B0;
  if (!qword_10031A4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A4B0);
  }
  return result;
}

uint64_t ClientOverrideRequest.clientOverride.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientOverrideRequest() + 20);
  return sub_100230AA4(v3, a1);
}

uint64_t type metadata accessor for ClientOverrideRequest()
{
  uint64_t result = qword_10031A540;
  if (!qword_10031A540) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ClientOverrideRequest.logKey.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ClientOverrideRequest() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClientOverrideRequest.logKey.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ClientOverrideRequest() + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ClientOverrideRequest.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ClientOverrideRequest.until.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientOverrideRequest() + 28);
  uint64_t v4 = sub_10024E030();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t ClientOverrideRequest.init(bundleID:clientOverride:until:logKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  uint64_t v12 = (int *)type metadata accessor for ClientOverrideRequest();
  sub_10023412C(a3, (uint64_t)a7 + v12[5]);
  uint64_t v13 = (char *)a7 + v12[7];
  uint64_t v14 = sub_10024E030();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v13, a4, v14);
  int v16 = (void *)((char *)a7 + v12[6]);
  void *v16 = a5;
  v16[1] = a6;
  return result;
}

uint64_t sub_10023412C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100019524(&qword_10031A3A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100234194()
{
  uint64_t result = 0x4449656C646E7562;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x764F746E65696C63;
      break;
    case 2:
      uint64_t result = 0x79654B676F6CLL;
      break;
    case 3:
      uint64_t result = 0x6C69746E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100234228@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100236E74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100234250(uint64_t a1)
{
  unint64_t v2 = sub_10023452C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10023428C(uint64_t a1)
{
  unint64_t v2 = sub_10023452C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ClientOverrideRequest.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100019524(&qword_10031A4B8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  BOOL v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_10023452C();
  sub_10024FD40();
  v9[15] = 0;
  sub_10024F940();
  if (!v1)
  {
    type metadata accessor for ClientOverrideRequest();
    v9[14] = 1;
    type metadata accessor for ClientOverride(0);
    sub_100234B50(&qword_10031A3D0, (void (*)(uint64_t))type metadata accessor for ClientOverride);
    sub_10024F910();
    v9[13] = 2;
    sub_10024F940();
    v9[12] = 3;
    sub_10024E030();
    sub_100234B50(&qword_10031A2B0, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_10024F980();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_10023452C()
{
  unint64_t result = qword_10031A4C0;
  if (!qword_10031A4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A4C0);
  }
  return result;
}

uint64_t ClientOverrideRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v28 = sub_10024E030();
  uint64_t v26 = *(void *)(v28 - 8);
  __chkstk_darwin(v28, v3);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100019524(&qword_10031A3A8);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100019524(&qword_10031A4C8);
  uint64_t v29 = *(void *)(v31 - 8);
  __chkstk_darwin(v31, v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (int *)type metadata accessor for ClientOverrideRequest();
  __chkstk_darwin(v13, v14);
  int v16 = (uint64_t *)((char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10001C2A8(a1, a1[3]);
  sub_10023452C();
  uint64_t v30 = v12;
  uint64_t v17 = v32;
  sub_10024FD20();
  if (v17) {
    return sub_10001C2EC((uint64_t)a1);
  }
  uint64_t v18 = v29;
  char v36 = 0;
  uint64_t *v16 = sub_10024F830();
  v16[1] = v19;
  type metadata accessor for ClientOverride(0);
  char v35 = 1;
  sub_100234B50(&qword_10031A3E0, (void (*)(uint64_t))type metadata accessor for ClientOverride);
  sub_10024F800();
  sub_10023412C((uint64_t)v9, (uint64_t)v16 + v13[5]);
  char v34 = 2;
  uint64_t v20 = sub_10024F830();
  uint64_t v21 = (uint64_t *)((char *)v16 + v13[6]);
  *uint64_t v21 = v20;
  v21[1] = v22;
  char v33 = 3;
  sub_100234B50(&qword_10031A2C0, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v23 = v28;
  sub_10024F870();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v30, v31);
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))((char *)v16 + v13[7], v5, v23);
  sub_100234A10((uint64_t)v16, v27);
  sub_10001C2EC((uint64_t)a1);
  return sub_100235DE8((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for ClientOverrideRequest);
}

uint64_t sub_100234A10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientOverrideRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100234A74(uint64_t a1)
{
  uint64_t result = sub_100234B50(&qword_10031A4D0, (void (*)(uint64_t))type metadata accessor for ClientOverrideRequest);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_100234ACC(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_100234B50(&qword_10031A4D8, (void (*)(uint64_t))type metadata accessor for ClientOverrideRequest);
  uint64_t result = sub_100234B50(&qword_10031A4E0, (void (*)(uint64_t))type metadata accessor for ClientOverrideRequest);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_100234B50(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100234B98@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ClientOverrideRequest.init(from:)(a1, a2);
}

uint64_t sub_100234BB0(void *a1)
{
  return ClientOverrideRequest.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ClientOverrideRequest(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (unint64_t *)((char *)a1 + v8);
    uint64_t v10 = (unint64_t *)((char *)a2 + v8);
    uint64_t v11 = (int *)type metadata accessor for ClientOverride(0);
    uint64_t v12 = *((void *)v11 - 1);
    uint64_t v13 = *(unsigned int (**)(unint64_t *, uint64_t, int *))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = sub_100019524(&qword_10031A3A8);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      unint64_t v16 = v10[1];
      if (v16 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      }
      else
      {
        unint64_t v17 = *v10;
        sub_1000473AC(*v10, v10[1]);
        *uint64_t v9 = v17;
        v9[1] = v16;
      }
      unint64_t v18 = v10[3];
      v9[2] = v10[2];
      v9[3] = v18;
      unint64_t v19 = v10[5];
      v9[4] = v10[4];
      v9[5] = v19;
      uint64_t v20 = v11[7];
      __dst = (char *)v9 + v20;
      uint64_t v21 = (char *)v10 + v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_100019524(&qword_100319C00);
      uint64_t v23 = *(void *)(v22 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 3, v22))
      {
        uint64_t v24 = type metadata accessor for ClientOverride.Server(0);
        memcpy(__dst, v21, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        uint64_t v25 = sub_10024DDC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(__dst, v21, v25);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(__dst, 0, 3, v22);
      }
      uint64_t v26 = v11[8];
      uint64_t v27 = (char *)v9 + v26;
      uint64_t v28 = (char *)v10 + v26;
      *(void *)uint64_t v27 = *(void *)v28;
      v27[8] = v28[8];
      uint64_t v29 = v11[9];
      uint64_t v30 = (char *)v9 + v29;
      uint64_t v31 = (char *)v10 + v29;
      v30[8] = v31[8];
      *(void *)uint64_t v30 = *(void *)v31;
      uint64_t v32 = v11[10];
      char v33 = (char *)v9 + v32;
      char v34 = (char *)v10 + v32;
      uint64_t v35 = sub_10024E0A0();
      uint64_t v36 = *(void *)(v35 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
      {
        uint64_t v37 = sub_100019524(&qword_100319CA8);
        memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
      }
      (*(void (**)(unint64_t *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v38 = a3[6];
    uint64_t v39 = a3[7];
    uint64_t v40 = (uint64_t *)((char *)v4 + v38);
    uint64_t v41 = (uint64_t *)((char *)a2 + v38);
    uint64_t v42 = v41[1];
    *uint64_t v40 = *v41;
    v40[1] = v42;
    uint64_t v43 = (char *)v4 + v39;
    uint64_t v44 = (char *)a2 + v39;
    uint64_t v45 = sub_10024E030();
    uint64_t v46 = *(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16);
    swift_bridgeObjectRetain();
    v46(v43, v44, v45);
  }
  return v4;
}

uint64_t destroy for ClientOverrideRequest(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  uint64_t v5 = type metadata accessor for ClientOverride(0);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    unint64_t v6 = v4[1];
    if (v6 >> 60 != 15) {
      sub_10003F808(*v4, v6);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = (char *)v4 + *(int *)(v5 + 28);
    uint64_t v8 = sub_100019524(&qword_100319C00);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 3, v8))
    {
      uint64_t v9 = sub_10024DDC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v7, v9);
    }
    uint64_t v10 = (char *)v4 + *(int *)(v5 + 40);
    uint64_t v11 = sub_10024E0A0();
    uint64_t v12 = *(void *)(v11 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v13 = a1 + *(int *)(a2 + 28);
  uint64_t v14 = sub_10024E030();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);
  return v15(v13, v14);
}

void *initializeWithCopy for ClientOverrideRequest(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(unsigned int (**)(unint64_t *, uint64_t, int *))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = sub_100019524(&qword_10031A3A8);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    unint64_t v14 = v9[1];
    if (v14 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    }
    else
    {
      unint64_t v15 = *v9;
      sub_1000473AC(*v9, v9[1]);
      *uint64_t v8 = v15;
      v8[1] = v14;
    }
    unint64_t v16 = v9[3];
    v8[2] = v9[2];
    v8[3] = v16;
    unint64_t v17 = v9[5];
    v8[4] = v9[4];
    v8[5] = v17;
    uint64_t v18 = v10[7];
    __dst = (char *)v8 + v18;
    unint64_t v19 = (char *)v9 + v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_100019524(&qword_100319C00);
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 3, v20))
    {
      uint64_t v22 = type metadata accessor for ClientOverride.Server(0);
      memcpy(__dst, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      uint64_t v23 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(__dst, v19, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 3, v20);
    }
    uint64_t v24 = v10[8];
    uint64_t v25 = (char *)v8 + v24;
    uint64_t v26 = (char *)v9 + v24;
    *(void *)uint64_t v25 = *(void *)v26;
    double v25[8] = v26[8];
    uint64_t v27 = v10[9];
    uint64_t v28 = (char *)v8 + v27;
    uint64_t v29 = (char *)v9 + v27;
    v28[8] = v29[8];
    *(void *)uint64_t v28 = *(void *)v29;
    uint64_t v30 = v10[10];
    uint64_t v31 = (char *)v8 + v30;
    uint64_t v32 = (char *)v9 + v30;
    uint64_t v33 = sub_10024E0A0();
    uint64_t v34 = *(void *)(v33 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
    {
      uint64_t v35 = sub_100019524(&qword_100319CA8);
      memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
    }
    (*(void (**)(unint64_t *, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v36 = a3[6];
  uint64_t v37 = a3[7];
  uint64_t v38 = (void *)((char *)a1 + v36);
  uint64_t v39 = (void *)((char *)a2 + v36);
  uint64_t v40 = v39[1];
  *uint64_t v38 = *v39;
  v38[1] = v40;
  uint64_t v41 = (char *)a1 + v37;
  uint64_t v42 = (char *)a2 + v37;
  uint64_t v43 = sub_10024E030();
  uint64_t v44 = *(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16);
  swift_bridgeObjectRetain();
  v44(v41, v42, v43);
  return a1;
}

void *assignWithCopy for ClientOverrideRequest(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (void *)((char *)a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v10 = *((void *)v9 - 1);
  uint64_t v11 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (v13)
    {
      sub_100235DE8((uint64_t)v7, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }
    unint64_t v18 = v8[1];
    char v82 = a3;
    if ((unint64_t)v7[1] >> 60 == 15)
    {
      if (v18 >> 60 != 15)
      {
        uint64_t v19 = *v8;
        sub_1000473AC(*v8, v18);
        uint64_t *v7 = v19;
        v7[1] = v18;
        goto LABEL_25;
      }
    }
    else
    {
      if (v18 >> 60 != 15)
      {
        uint64_t v50 = *v8;
        sub_1000473AC(*v8, v18);
        uint64_t v51 = *v7;
        unint64_t v52 = v7[1];
        uint64_t *v7 = v50;
        v7[1] = v18;
        sub_10003F808(v51, v52);
LABEL_25:
        _OWORD v7[2] = v8[2];
        v7[3] = v8[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v7[4] = v8[4];
        v7[5] = v8[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v53 = v9[7];
        uint64_t v54 = (char *)v7 + v53;
        size_t v55 = (char *)v8 + v53;
        uint64_t v56 = sub_100019524(&qword_100319C00);
        uint64_t v79 = *(void *)(v56 - 8);
        size_t v57 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v79 + 48);
        uint64_t v80 = (uint64_t)v54;
        LODWORD(v54) = v57(v54, 3, v56);
        int v58 = v57(v55, 3, v56);
        if (v54)
        {
          if (!v58)
          {
            uint64_t v61 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v61 - 8) + 16))(v80, v55, v61);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v79 + 56))(v80, 0, 3, v56);
            goto LABEL_33;
          }
          size_t v59 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          uint64_t v60 = (void *)v80;
        }
        else
        {
          if (!v58)
          {
            uint64_t v62 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v62 - 8) + 24))(v80, v55, v62);
            goto LABEL_33;
          }
          sub_100051BB4(v80, &qword_100319C00);
          size_t v59 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          uint64_t v60 = (void *)v80;
        }
        memcpy(v60, v55, v59);
LABEL_33:
        uint64_t v63 = v9[8];
        uint64_t v64 = (char *)v7 + v63;
        uint64_t v65 = (char *)v8 + v63;
        uint64_t v66 = *(void *)v65;
        v64[8] = v65[8];
        *(void *)uint64_t v64 = v66;
        uint64_t v67 = v9[9];
        uint64_t v68 = (char *)v7 + v67;
        uint64_t v69 = (char *)v8 + v67;
        uint64_t v70 = *(void *)v69;
        v68[8] = v69[8];
        *(void *)uint64_t v68 = v70;
        uint64_t v71 = v9[10];
        uint64_t v72 = (char *)v7 + v71;
        int v73 = (char *)v8 + v71;
        uint64_t v74 = sub_10024E0A0();
        uint64_t v75 = *(void *)(v74 - 8);
        uint64_t v76 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v75 + 48);
        int v77 = v76(v72, 1, v74);
        int v78 = v76(v73, 1, v74);
        if (v77)
        {
          a3 = v82;
          if (!v78)
          {
            (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v72, v73, v74);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v75 + 56))(v72, 0, 1, v74);
            goto LABEL_20;
          }
        }
        else
        {
          a3 = v82;
          if (!v78)
          {
            (*(void (**)(char *, char *, uint64_t))(v75 + 24))(v72, v73, v74);
            goto LABEL_20;
          }
          (*(void (**)(char *, uint64_t))(v75 + 8))(v72, v74);
        }
        size_t v15 = *(void *)(*(void *)(sub_100019524(&qword_100319CA8) - 8) + 64);
        unint64_t v16 = (uint64_t *)v72;
        unint64_t v17 = (uint64_t *)v73;
        goto LABEL_8;
      }
      sub_1000567A4((uint64_t)v7);
    }
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v8;
    goto LABEL_25;
  }
  if (v13)
  {
LABEL_7:
    size_t v15 = *(void *)(*(void *)(sub_100019524(&qword_10031A3A8) - 8) + 64);
    unint64_t v16 = v7;
    unint64_t v17 = v8;
LABEL_8:
    memcpy(v16, v17, v15);
    goto LABEL_20;
  }
  unint64_t v14 = v8[1];
  uint64_t v81 = a3;
  if (v14 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v8;
  }
  else
  {
    uint64_t v20 = *v8;
    sub_1000473AC(*v8, v14);
    uint64_t *v7 = v20;
    v7[1] = v14;
  }
  _OWORD v7[2] = v8[2];
  v7[3] = v8[3];
  v7[4] = v8[4];
  v7[5] = v8[5];
  uint64_t v21 = v9[7];
  uint64_t v22 = (char *)v7 + v21;
  uint64_t v23 = (char *)v8 + v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_100019524(&qword_100319C00);
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 3, v24))
  {
    uint64_t v26 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v27 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v22, v23, v27);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 3, v24);
  }
  a3 = v81;
  uint64_t v28 = v9[8];
  uint64_t v29 = (char *)v7 + v28;
  uint64_t v30 = (char *)v8 + v28;
  uint64_t v31 = *(void *)v30;
  v29[8] = v30[8];
  *(void *)uint64_t v29 = v31;
  uint64_t v32 = v9[9];
  uint64_t v33 = (char *)v7 + v32;
  uint64_t v34 = (char *)v8 + v32;
  uint64_t v35 = *(void *)v34;
  v33[8] = v34[8];
  *(void *)uint64_t v33 = v35;
  uint64_t v36 = v9[10];
  uint64_t v37 = (char *)v7 + v36;
  uint64_t v38 = (char *)v8 + v36;
  uint64_t v39 = sub_10024E0A0();
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
  {
    uint64_t v41 = sub_100019524(&qword_100319CA8);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v37, v38, v39);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  (*(void (**)(uint64_t *, void, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
LABEL_20:
  uint64_t v42 = a3[6];
  uint64_t v43 = (void *)((char *)a1 + v42);
  uint64_t v44 = (void *)((char *)a2 + v42);
  *uint64_t v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v45 = a3[7];
  uint64_t v46 = (char *)a1 + v45;
  uint64_t v47 = (char *)a2 + v45;
  uint64_t v48 = sub_10024E030();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 24))(v46, v47, v48);
  return a1;
}

uint64_t sub_100235DE8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *initializeWithTake for ClientOverrideRequest(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (_OWORD *)((char *)a1 + v6);
  uint64_t v8 = (_OWORD *)((char *)a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v10 = *((void *)v9 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_100019524(&qword_10031A3A8);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    long long v12 = v8[1];
    _OWORD *v7 = *v8;
    v7[1] = v12;
    _OWORD v7[2] = v8[2];
    uint64_t v13 = v9[7];
    __dst = (char *)v7 + v13;
    unint64_t v14 = (char *)v8 + v13;
    uint64_t v15 = sub_100019524(&qword_100319C00);
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 3, v15))
    {
      uint64_t v17 = type metadata accessor for ClientOverride.Server(0);
      memcpy(__dst, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      uint64_t v18 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(__dst, v14, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 3, v15);
    }
    uint64_t v19 = v9[8];
    uint64_t v20 = (char *)v7 + v19;
    uint64_t v21 = (char *)v8 + v19;
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
    uint64_t v22 = v9[9];
    uint64_t v23 = (char *)v7 + v22;
    uint64_t v24 = (char *)v8 + v22;
    v23[8] = v24[8];
    *(void *)uint64_t v23 = *(void *)v24;
    uint64_t v25 = v9[10];
    uint64_t v26 = (char *)v7 + v25;
    uint64_t v27 = (char *)v8 + v25;
    uint64_t v28 = sub_10024E0A0();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
    {
      uint64_t v30 = sub_100019524(&qword_100319CA8);
      memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v31 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  uint64_t v32 = (char *)a1 + v31;
  uint64_t v33 = (char *)a2 + v31;
  uint64_t v34 = sub_10024E030();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
  return a1;
}

void *assignWithTake for ClientOverrideRequest(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v11 = *((void *)v10 - 1);
  long long v12 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_100235DE8((uint64_t)v8, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }
    unint64_t v24 = v8[1];
    int v77 = a3;
    if (v24 >> 60 != 15)
    {
      unint64_t v25 = v9[1];
      if (v25 >> 60 != 15)
      {
        uint64_t v49 = *v8;
        *uint64_t v8 = *v9;
        v8[1] = v25;
        sub_10003F808(v49, v24);
LABEL_20:
        uint64_t v50 = v9[3];
        v8[2] = v9[2];
        v8[3] = v50;
        swift_bridgeObjectRelease();
        uint64_t v51 = v9[5];
        v8[4] = v9[4];
        v8[5] = v51;
        swift_bridgeObjectRelease();
        uint64_t v52 = v10[7];
        uint64_t v53 = (char *)v8 + v52;
        uint64_t v54 = (char *)v9 + v52;
        uint64_t v55 = sub_100019524(&qword_100319C00);
        uint64_t v76 = *(void *)(v55 - 8);
        uint64_t v56 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v76 + 48);
        __dsta = v53;
        LODWORD(v53) = v56(v53, 3, v55);
        int v57 = v56(v54, 3, v55);
        if (v53)
        {
          if (!v57)
          {
            uint64_t v60 = sub_10024DDC0();
            (*(void (**)(void *, char *, uint64_t))(*(void *)(v60 - 8) + 32))(__dsta, v54, v60);
            (*(void (**)(void *, void, uint64_t, uint64_t))(v76 + 56))(__dsta, 0, 3, v55);
            goto LABEL_28;
          }
          size_t v58 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          size_t v59 = __dsta;
        }
        else
        {
          if (!v57)
          {
            uint64_t v61 = sub_10024DDC0();
            (*(void (**)(void *, char *, uint64_t))(*(void *)(v61 - 8) + 40))(__dsta, v54, v61);
            goto LABEL_28;
          }
          sub_100051BB4((uint64_t)__dsta, &qword_100319C00);
          size_t v58 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          size_t v59 = __dsta;
        }
        memcpy(v59, v54, v58);
LABEL_28:
        a3 = v77;
        uint64_t v62 = v10[8];
        uint64_t v63 = (char *)v8 + v62;
        uint64_t v64 = (char *)v9 + v62;
        *(void *)uint64_t v63 = *(void *)v64;
        v63[8] = v64[8];
        uint64_t v65 = v10[9];
        uint64_t v66 = (char *)v8 + v65;
        uint64_t v67 = (char *)v9 + v65;
        v66[8] = v67[8];
        *(void *)uint64_t v66 = *(void *)v67;
        uint64_t v68 = v10[10];
        uint64_t v69 = (char *)v8 + v68;
        uint64_t v70 = (char *)v9 + v68;
        uint64_t v71 = sub_10024E0A0();
        uint64_t v72 = *(void *)(v71 - 8);
        int v73 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48);
        int v74 = v73(v69, 1, v71);
        int v75 = v73(v70, 1, v71);
        if (v74)
        {
          if (!v75)
          {
            (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v69, v70, v71);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v69, 0, 1, v71);
            goto LABEL_18;
          }
        }
        else
        {
          if (!v75)
          {
            (*(void (**)(char *, char *, uint64_t))(v72 + 40))(v69, v70, v71);
            goto LABEL_18;
          }
          (*(void (**)(char *, uint64_t))(v72 + 8))(v69, v71);
        }
        size_t v21 = *(void *)(*(void *)(sub_100019524(&qword_100319CA8) - 8) + 64);
        uint64_t v22 = (uint64_t *)v69;
        uint64_t v23 = (uint64_t *)v70;
        goto LABEL_8;
      }
      sub_1000567A4((uint64_t)v8);
    }
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    goto LABEL_20;
  }
  if (v14)
  {
LABEL_7:
    size_t v21 = *(void *)(*(void *)(sub_100019524(&qword_10031A3A8) - 8) + 64);
    uint64_t v22 = v8;
    uint64_t v23 = v9;
LABEL_8:
    memcpy(v22, v23, v21);
    goto LABEL_18;
  }
  long long v15 = *((_OWORD *)v9 + 1);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *((_OWORD *)v8 + 1) = v15;
  *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
  uint64_t v16 = v10[7];
  __dst = (char *)v8 + v16;
  uint64_t v17 = (char *)v9 + v16;
  uint64_t v18 = sub_100019524(&qword_100319C00);
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 3, v18))
  {
    uint64_t v20 = type metadata accessor for ClientOverride.Server(0);
    memcpy(__dst, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    uint64_t v26 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(__dst, v17, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 3, v18);
  }
  uint64_t v27 = v10[8];
  uint64_t v28 = (char *)v8 + v27;
  uint64_t v29 = (char *)v9 + v27;
  *(void *)uint64_t v28 = *(void *)v29;
  v28[8] = v29[8];
  uint64_t v30 = v10[9];
  uint64_t v31 = (char *)v8 + v30;
  uint64_t v32 = (char *)v9 + v30;
  v31[8] = v32[8];
  *(void *)uint64_t v31 = *(void *)v32;
  uint64_t v33 = v10[10];
  uint64_t v34 = (char *)v8 + v33;
  uint64_t v35 = (char *)v9 + v33;
  uint64_t v36 = sub_10024E0A0();
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    uint64_t v38 = sub_100019524(&qword_100319CA8);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v34, v35, v36);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  (*(void (**)(uint64_t *, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
LABEL_18:
  uint64_t v39 = a3[6];
  uint64_t v40 = (void *)((char *)a1 + v39);
  uint64_t v41 = (void *)((char *)a2 + v39);
  uint64_t v43 = *v41;
  uint64_t v42 = v41[1];
  *uint64_t v40 = v43;
  v40[1] = v42;
  swift_bridgeObjectRelease();
  uint64_t v44 = a3[7];
  uint64_t v45 = (char *)a1 + v44;
  uint64_t v46 = (char *)a2 + v44;
  uint64_t v47 = sub_10024E030();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 40))(v45, v46, v47);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientOverrideRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100236920);
}

uint64_t sub_100236920(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100019524(&qword_10031A3A8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      long long v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_10024E030();
      int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for ClientOverrideRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100236A64);
}

uint64_t sub_100236A64(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_100019524(&qword_10031A3A8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      long long v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_10024E030();
      int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 28);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_100236B94()
{
  sub_100233B98();
  if (v0 <= 0x3F)
  {
    sub_10024E030();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unsigned char *storeEnumTagSinglePayload for ClientOverrideRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100236D34);
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

ValueMetadata *type metadata accessor for ClientOverrideRequest.CodingKeys()
{
  return &type metadata for ClientOverrideRequest.CodingKeys;
}

unint64_t sub_100236D70()
{
  unint64_t result = qword_10031A580;
  if (!qword_10031A580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A580);
  }
  return result;
}

unint64_t sub_100236DC8()
{
  unint64_t result = qword_10031A588;
  if (!qword_10031A588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A588);
  }
  return result;
}

unint64_t sub_100236E20()
{
  unint64_t result = qword_10031A590;
  if (!qword_10031A590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A590);
  }
  return result;
}

uint64_t sub_100236E74(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4449656C646E7562 && a2 == 0xE800000000000000;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x764F746E65696C63 && a2 == 0xEE00656469727265 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C69746E75 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_100237044()
{
  uint64_t result = 0x6C7561666544736FLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1684099177;
      break;
    case 2:
      uint64_t result = 0x656E6F685069;
      break;
    case 3:
      uint64_t result = 6513005;
      break;
    case 4:
      uint64_t result = 0x7974696C616572;
      break;
    case 5:
      uint64_t result = 30324;
      break;
    case 6:
      uint64_t result = 0x6863746177;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100237108@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10023A62C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100237130(uint64_t a1)
{
  unint64_t v2 = sub_100237BAC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10023716C(uint64_t a1)
{
  unint64_t v2 = sub_100237BAC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1002371A8(uint64_t a1)
{
  unint64_t v2 = sub_100237DA4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002371E4(uint64_t a1)
{
  unint64_t v2 = sub_100237DA4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100237220(uint64_t a1)
{
  unint64_t v2 = sub_100237D50();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10023725C(uint64_t a1)
{
  unint64_t v2 = sub_100237D50();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100237298(uint64_t a1)
{
  unint64_t v2 = sub_100237CFC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002372D4(uint64_t a1)
{
  unint64_t v2 = sub_100237CFC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100237310(uint64_t a1)
{
  unint64_t v2 = sub_100237DF8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10023734C(uint64_t a1)
{
  unint64_t v2 = sub_100237DF8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100237388(uint64_t a1)
{
  unint64_t v2 = sub_100237CA8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002373C4(uint64_t a1)
{
  unint64_t v2 = sub_100237CA8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100237400(uint64_t a1)
{
  unint64_t v2 = sub_100237C54();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10023743C(uint64_t a1)
{
  unint64_t v2 = sub_100237C54();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100237478(uint64_t a1)
{
  unint64_t v2 = sub_100237C00();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002374B4(uint64_t a1)
{
  unint64_t v2 = sub_100237C00();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ProductRequest.Platform.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v55 = a2;
  uint64_t v3 = sub_100019524(&qword_10031A598);
  uint64_t v53 = *(void *)(v3 - 8);
  uint64_t v54 = v3;
  __chkstk_darwin(v3, v4);
  uint64_t v52 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100019524(&qword_10031A5A0);
  uint64_t v50 = *(void *)(v6 - 8);
  uint64_t v51 = v6;
  __chkstk_darwin(v6, v7);
  uint64_t v49 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100019524(&qword_10031A5A8);
  uint64_t v47 = *(void *)(v9 - 8);
  uint64_t v48 = v9;
  __chkstk_darwin(v9, v10);
  uint64_t v46 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100019524(&qword_10031A5B0);
  uint64_t v44 = *(void *)(v12 - 8);
  uint64_t v45 = v12;
  __chkstk_darwin(v12, v13);
  uint64_t v43 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100019524(&qword_10031A5B8);
  uint64_t v41 = *(void *)(v15 - 8);
  uint64_t v42 = v15;
  __chkstk_darwin(v15, v16);
  uint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100019524(&qword_10031A5C0);
  uint64_t v40 = *(void *)(v19 - 8);
  __chkstk_darwin(v19, v20);
  uint64_t v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100019524(&qword_10031A5C8);
  uint64_t v39 = *(void *)(v23 - 8);
  __chkstk_darwin(v23, v24);
  uint64_t v26 = (char *)&v38 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100019524(&qword_10031A5D0);
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v56 = v27;
  uint64_t v57 = v28;
  __chkstk_darwin(v27, v29);
  uint64_t v31 = (char *)&v38 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  sub_100237BAC();
  sub_10024FD40();
  switch((char)v55)
  {
    case 1:
      char v59 = 1;
      sub_100237DA4();
      uint64_t v32 = v56;
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v22, v19);
      return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v31, v32);
    case 2:
      char v60 = 2;
      sub_100237D50();
      uint64_t v33 = v56;
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v18, v42);
      return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v31, v33);
    case 3:
      char v61 = 3;
      sub_100237CFC();
      uint64_t v35 = v43;
      uint64_t v32 = v56;
      sub_10024F8C0();
      uint64_t v37 = v44;
      uint64_t v36 = v45;
      goto LABEL_9;
    case 4:
      char v62 = 4;
      sub_100237CA8();
      uint64_t v35 = v46;
      uint64_t v32 = v56;
      sub_10024F8C0();
      uint64_t v37 = v47;
      uint64_t v36 = v48;
      goto LABEL_9;
    case 5:
      char v63 = 5;
      sub_100237C54();
      uint64_t v35 = v49;
      uint64_t v32 = v56;
      sub_10024F8C0();
      uint64_t v37 = v50;
      uint64_t v36 = v51;
      goto LABEL_9;
    case 6:
      char v64 = 6;
      sub_100237C00();
      uint64_t v35 = v52;
      uint64_t v32 = v56;
      sub_10024F8C0();
      uint64_t v37 = v53;
      uint64_t v36 = v54;
LABEL_9:
      (*(void (**)(char *, uint64_t))(v37 + 8))(v35, v36);
      break;
    default:
      char v58 = 0;
      sub_100237DF8();
      uint64_t v32 = v56;
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v23);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v31, v32);
}

unint64_t sub_100237BAC()
{
  unint64_t result = qword_10031A5D8;
  if (!qword_10031A5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A5D8);
  }
  return result;
}

unint64_t sub_100237C00()
{
  unint64_t result = qword_10031A5E0;
  if (!qword_10031A5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A5E0);
  }
  return result;
}

unint64_t sub_100237C54()
{
  unint64_t result = qword_10031A5E8;
  if (!qword_10031A5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A5E8);
  }
  return result;
}

unint64_t sub_100237CA8()
{
  unint64_t result = qword_10031A5F0;
  if (!qword_10031A5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A5F0);
  }
  return result;
}

unint64_t sub_100237CFC()
{
  unint64_t result = qword_10031A5F8;
  if (!qword_10031A5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A5F8);
  }
  return result;
}

unint64_t sub_100237D50()
{
  unint64_t result = qword_10031A600;
  if (!qword_10031A600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A600);
  }
  return result;
}

unint64_t sub_100237DA4()
{
  unint64_t result = qword_10031A608;
  if (!qword_10031A608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A608);
  }
  return result;
}

unint64_t sub_100237DF8()
{
  unint64_t result = qword_10031A610;
  if (!qword_10031A610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A610);
  }
  return result;
}

void *ProductRequest.Platform.init(from:)(void *a1)
{
  return sub_10023A8D8(a1);
}

void *sub_100237E64@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10023A8D8(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_100237E90(void *a1)
{
  return ProductRequest.Platform.encode(to:)(a1, *v1);
}

unint64_t sub_100237EAC()
{
  uint64_t v1 = 0x654D79636167656CLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x495041616964656DLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000019;
  }
}

uint64_t sub_100237F18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10023B224(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100237F40(uint64_t a1)
{
  unint64_t v2 = sub_10023B0D4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100237F7C(uint64_t a1)
{
  unint64_t v2 = sub_10023B0D4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100237FB8(uint64_t a1)
{
  unint64_t v2 = sub_10023B1D0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100237FF4(uint64_t a1)
{
  unint64_t v2 = sub_10023B1D0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100238030(uint64_t a1)
{
  unint64_t v2 = sub_10023B17C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10023806C(uint64_t a1)
{
  unint64_t v2 = sub_10023B17C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1002380A8(uint64_t a1)
{
  unint64_t v2 = sub_10023B128();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002380E4(uint64_t a1)
{
  unint64_t v2 = sub_10023B128();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ProductRequest.RequestKind.encode(to:)(void *a1, int a2)
{
  int v28 = a2;
  uint64_t v3 = sub_100019524(&qword_10031A618);
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  __chkstk_darwin(v3, v4);
  uint64_t v25 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100019524(&qword_10031A620);
  uint64_t v23 = *(void *)(v6 - 8);
  uint64_t v24 = v6;
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100019524(&qword_10031A628);
  uint64_t v22 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v11);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100019524(&qword_10031A630);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  uint64_t v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  sub_10023B0D4();
  sub_10024FD40();
  if ((_BYTE)v28)
  {
    if (v28 == 1)
    {
      char v30 = 1;
      sub_10023B17C();
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
    }
    else
    {
      char v31 = 2;
      sub_10023B128();
      uint64_t v19 = v25;
      sub_10024F8C0();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v19, v27);
    }
  }
  else
  {
    char v29 = 0;
    sub_10023B1D0();
    sub_10024F8C0();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v10);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
}

void *ProductRequest.RequestKind.init(from:)(void *a1)
{
  return sub_10023B39C(a1);
}

void *sub_1002384A4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10023B39C(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_1002384D0(void *a1)
{
  return ProductRequest.RequestKind.encode(to:)(a1, *v1);
}

uint64_t sub_1002384EC()
{
  if (*v0) {
    return 0xD000000000000012;
  }
  else {
    return 0x73746375646F7270;
  }
}

uint64_t sub_10023852C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10023BA08(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100238554(uint64_t a1)
{
  unint64_t v2 = sub_10023B90C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100238590(uint64_t a1)
{
  unint64_t v2 = sub_10023B90C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1002385CC()
{
  return 7554121;
}

uint64_t sub_1002385E0(uint64_t a1)
{
  unint64_t v2 = sub_10023B9B4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10023861C(uint64_t a1)
{
  unint64_t v2 = sub_10023B9B4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100238658@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 7554121 && a2 == 0xE300000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_10024FA60();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1002386E0(uint64_t a1)
{
  unint64_t v2 = sub_10023B960();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10023871C(uint64_t a1)
{
  unint64_t v2 = sub_10023B960();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ProductRequest.IdentifierKind.encode(to:)(void *a1, uint64_t a2, int a3)
{
  uint64_t v23 = a2;
  int v24 = a3;
  uint64_t v4 = sub_100019524(&qword_10031A658);
  uint64_t v21 = *(void *)(v4 - 8);
  uint64_t v22 = v4;
  __chkstk_darwin(v4, v5);
  char v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100019524(&qword_10031A660);
  uint64_t v20 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100019524(&qword_10031A668);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  sub_10023B90C();
  sub_10024FD40();
  uint64_t v17 = (uint64_t (**)(char *, uint64_t))(v13 + 8);
  if (v24)
  {
    LOBYTE(v25) = 1;
    sub_10023B960();
    sub_10024F8C0();
    uint64_t v25 = v23;
    sub_100019524(&qword_10031A390);
    sub_100240634(&qword_10031A680);
    uint64_t v18 = v22;
    sub_10024F980();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v18);
  }
  else
  {
    LOBYTE(v25) = 0;
    sub_10023B9B4();
    sub_10024F8C0();
    uint64_t v25 = v23;
    sub_100019524(&qword_10031A390);
    sub_100240634(&qword_10031A680);
    sub_10024F980();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v8);
  }
  return (*v17)(v16, v12);
}

void *ProductRequest.IdentifierKind.init(from:)(void *a1)
{
  uint64_t result = sub_10023BAF8(a1);
  if (v1) {
    return (void *)v3;
  }
  return result;
}

void *sub_100238AEC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10023BAF8(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5 & 1;
  }
  return result;
}

uint64_t sub_100238B20(void *a1)
{
  return ProductRequest.IdentifierKind.encode(to:)(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8));
}

void *static ProductRequest.IncludedResource.all.getter()
{
  uint64_t v3 = &_swiftEmptySetSingleton;
  sub_100239CCC(&v2, 0);
  sub_100239CCC(&v1, 1);
  return v3;
}

_UNKNOWN **static ProductRequest.IncludedResource.allCases.getter()
{
  return &off_1002F2928;
}

uint64_t sub_100238BA0()
{
  if (*v0) {
    return 0x4F6B6361426E6977;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t sub_100238BEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10023C154(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100238C14(uint64_t a1)
{
  unint64_t v2 = sub_10023C058();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100238C50(uint64_t a1)
{
  unint64_t v2 = sub_10023C058();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100238C8C(uint64_t a1)
{
  unint64_t v2 = sub_10023C100();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100238CC8(uint64_t a1)
{
  unint64_t v2 = sub_10023C100();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100238D04(uint64_t a1)
{
  unint64_t v2 = sub_10023C0AC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100238D40(uint64_t a1)
{
  unint64_t v2 = sub_10023C0AC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ProductRequest.IncludedResource.encode(to:)(void *a1, int a2)
{
  int v21 = a2;
  uint64_t v3 = sub_100019524(&qword_10031A690);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  __chkstk_darwin(v3, v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100019524(&qword_10031A698);
  uint64_t v7 = *(void *)(v18 - 8);
  __chkstk_darwin(v18, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100019524(&qword_10031A6A0);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  sub_10023C058();
  sub_10024FD40();
  uint64_t v16 = (uint64_t (**)(char *, uint64_t))(v12 + 8);
  if (v21)
  {
    char v23 = 1;
    sub_10023C0AC();
    sub_10024F8C0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v20);
  }
  else
  {
    char v22 = 0;
    sub_10023C100();
    sub_10024F8C0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v18);
  }
  return (*v16)(v15, v11);
}

uint64_t ProductRequest.IncludedResource.init(from:)(uint64_t a1)
{
  return sub_10023C268(a1) & 1;
}

uint64_t sub_100239048@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10023C268(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_100239078(void *a1)
{
  return ProductRequest.IncludedResource.encode(to:)(a1, *v1);
}

void sub_100239094(void *a1@<X8>)
{
  *a1 = &off_1002F2950;
}

uint64_t PurchaseIntentRequest.Remove.clientOverride.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100230AA4(v1, a1);
}

uint64_t ProductRequest.identifier.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for ProductRequest() + 20));
  uint64_t v2 = *v1;
  ChannelOptions.Storage._storage.getter(*v1, *((unsigned __int8 *)v1 + 8));
  return v2;
}

uint64_t ProductRequest.kind.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ProductRequest() + 24));
}

uint64_t ProductRequest.includedResources.getter()
{
  type metadata accessor for ProductRequest();
  return swift_bridgeObjectRetain();
}

uint64_t ProductRequest.logKey.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ProductRequest() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ProductRequest.logKey.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ProductRequest() + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ProductRequest.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t ProductRequest.platform.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ProductRequest() + 36));
}

int *ProductRequest.init(identifier:kind:resources:logKey:platform:clientOverride:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  sub_10023412C(a8, a9);
  uint64_t result = (int *)type metadata accessor for ProductRequest();
  uint64_t v18 = a9 + result[5];
  *(void *)uint64_t v18 = a1;
  *(unsigned char *)(v18 + 8) = a2 & 1;
  *(unsigned char *)(a9 + result[6]) = a3;
  *(void *)(a9 + result[7]) = a4;
  uint64_t v19 = (void *)(a9 + result[8]);
  *uint64_t v19 = a5;
  v19[1] = a6;
  *(unsigned char *)(a9 + result[9]) = a7;
  return result;
}

unint64_t sub_1002392E4()
{
  unint64_t result = 0x764F746E65696C63;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x696669746E656469;
      break;
    case 2:
      unint64_t result = 1684957547;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x79654B676F6CLL;
      break;
    case 5:
      unint64_t result = 0x6D726F6674616C70;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1002393B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1002403A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1002393DC(uint64_t a1)
{
  unint64_t v2 = sub_10023C704();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100239418(uint64_t a1)
{
  unint64_t v2 = sub_10023C704();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ProductRequest.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100019524(&qword_10031A6C0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  sub_10023C704();
  sub_10024FD40();
  LOBYTE(v16) = 0;
  type metadata accessor for ClientOverride(0);
  sub_10023CD14(&qword_10031A3D0, (void (*)(uint64_t))type metadata accessor for ClientOverride);
  sub_10024F910();
  if (!v2)
  {
    uint64_t v10 = (int *)type metadata accessor for ProductRequest();
    uint64_t v11 = (uint64_t *)(v3 + v10[5]);
    uint64_t v12 = *v11;
    LOBYTE(v11) = *((unsigned char *)v11 + 8);
    uint64_t v16 = v12;
    char v17 = (char)v11;
    char v15 = 1;
    sub_10023C758();
    sub_10024F980();
    LOBYTE(v16) = *(unsigned char *)(v3 + v10[6]);
    char v15 = 2;
    sub_10023C7AC();
    sub_10024F980();
    uint64_t v16 = *(void *)(v3 + v10[7]);
    char v15 = 3;
    sub_100019524(&qword_10031A6E0);
    sub_10023C954(&qword_10031A6E8, (void (*)(void))sub_10023C800);
    sub_10024F980();
    LOBYTE(v16) = 4;
    sub_10024F940();
    LOBYTE(v16) = *(unsigned char *)(v3 + v10[9]);
    char v15 = 5;
    sub_10023C854();
    sub_10024F980();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t ProductRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v4 = sub_100019524(&qword_10031A3A8);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100019524(&qword_10031A700);
  uint64_t v8 = *(void *)(v27 - 8);
  __chkstk_darwin(v27, v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (int *)type metadata accessor for ProductRequest();
  __chkstk_darwin(v12, v13);
  char v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  int v28 = a1;
  sub_10001C2A8(a1, v16);
  sub_10023C704();
  sub_10024FD20();
  if (v2) {
    return sub_10001C2EC((uint64_t)v28);
  }
  uint64_t v17 = v8;
  type metadata accessor for ClientOverride(0);
  LOBYTE(v29) = 0;
  sub_10023CD14(&qword_10031A3E0, (void (*)(uint64_t))type metadata accessor for ClientOverride);
  uint64_t v18 = v27;
  sub_10024F800();
  sub_10023412C((uint64_t)v7, (uint64_t)v15);
  char v31 = 1;
  sub_10023C8AC();
  sub_10024F870();
  char v19 = v30;
  uint64_t v20 = &v15[v12[5]];
  *(void *)uint64_t v20 = v29;
  v20[8] = v19;
  char v31 = 2;
  sub_10023C900();
  sub_10024F870();
  v15[v12[6]] = v29;
  sub_100019524(&qword_10031A6E0);
  char v31 = 3;
  sub_10023C954(&qword_10031A718, (void (*)(void))sub_10023C9C4);
  sub_10024F870();
  *(void *)&v15[v12[7]] = v29;
  LOBYTE(v29) = 4;
  uint64_t v21 = sub_10024F830();
  char v22 = (uint64_t *)&v15[v12[8]];
  *char v22 = v21;
  v22[1] = v23;
  char v31 = 5;
  sub_10023CA18();
  sub_10024F870();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v18);
  v15[v12[9]] = v29;
  sub_10023CA6C((uint64_t)v15, v26);
  sub_10001C2EC((uint64_t)v28);
  return sub_10023DF0C((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for ProductRequest);
}

uint64_t sub_100239C9C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ProductRequest.init(from:)(a1, a2);
}

uint64_t sub_100239CB4(void *a1)
{
  return ProductRequest.encode(to:)(a1);
}

uint64_t sub_100239CCC(unsigned char *a1, char a2)
{
  uint64_t v3 = v2;
  Swift::Int v6 = a2 & 1;
  uint64_t v7 = *v3;
  sub_10024FC00();
  sub_10024FC20(a2 & 1);
  Swift::Int v8 = sub_10024FC70();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_10023A0B4(v6, v10, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v15;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v11 = *(void *)(v7 + 48);
  if ((((v6 == 0) ^ *(unsigned __int8 *)(v11 + v10)) & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v10 = (v10 + 1) & v12;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while ((((v6 == 0) ^ *(unsigned __int8 *)(v11 + v10)) & 1) == 0);
  }
  uint64_t result = 0;
  LOBYTE(v6) = *(unsigned char *)(*(void *)(*v3 + 48) + v10);
LABEL_8:
  *a1 = v6;
  return result;
}

uint64_t sub_100239E08()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100019524(&qword_10031A990);
  uint64_t result = sub_10024F300();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    Swift::Int v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *Swift::Int v6 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      Swift::UInt v18 = *(unsigned __int8 *)(*(void *)(v2 + 48) + v14);
      sub_10024FC00();
      sub_10024FC20(v18);
      uint64_t result = sub_10024FC70();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_10023A0B4(Swift::Int result, unint64_t a2, char a3)
{
  Swift::UInt v5 = result & 1;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100239E08();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (Swift::Int)sub_10023A21C();
      goto LABEL_14;
    }
    sub_10023A3B0();
  }
  uint64_t v8 = *v3;
  sub_10024FC00();
  sub_10024FC20(v5);
  uint64_t result = sub_10024FC70();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (((v5 == 0) ^ *(unsigned __int8 *)(v10 + a2)))
    {
LABEL_13:
      uint64_t result = sub_10024FB60();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (((v5 == 0) ^ *(unsigned __int8 *)(v10 + a2))) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v12 + 48) + a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_10023A21C()
{
  uint64_t v1 = v0;
  sub_100019524(&qword_10031A990);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10024F2F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10023A3B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100019524(&qword_10031A990);
  uint64_t result = sub_10024F300();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    Swift::UInt v18 = *(unsigned __int8 *)(*(void *)(v2 + 48) + v14);
    sub_10024FC00();
    sub_10024FC20(v18);
    uint64_t result = sub_10024FC70();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10023A62C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C7561666544736FLL && a2 == 0xE900000000000074;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684099177 && a2 == 0xE400000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656E6F685069 && a2 == 0xE600000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 6513005 && a2 == 0xE300000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7974696C616572 && a2 == 0xE700000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 30324 && a2 == 0xE200000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6863746177 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

void *sub_10023A8D8(void *a1)
{
  uint64_t v2 = sub_100019524(&qword_10031A9D8);
  uint64_t v59 = *(void *)(v2 - 8);
  uint64_t v60 = v2;
  __chkstk_darwin(v2, v3);
  char v62 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100019524(&qword_10031A9E0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v57 = v5;
  uint64_t v58 = v6;
  __chkstk_darwin(v5, v7);
  uint64_t v65 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100019524(&qword_10031A9E8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v55 = v9;
  uint64_t v56 = v10;
  __chkstk_darwin(v9, v11);
  char v64 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100019524(&qword_10031A9F0);
  uint64_t v53 = *(void *)(v13 - 8);
  uint64_t v54 = v13;
  __chkstk_darwin(v13, v14);
  char v63 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100019524(&qword_10031A9F8);
  uint64_t v51 = *(void *)(v16 - 8);
  uint64_t v52 = v16;
  __chkstk_darwin(v16, v17);
  char v61 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100019524(&qword_10031AA00);
  uint64_t v49 = *(void *)(v19 - 8);
  uint64_t v50 = v19;
  __chkstk_darwin(v19, v20);
  char v22 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100019524(&qword_10031AA08);
  uint64_t v48 = *(void *)(v23 - 8);
  __chkstk_darwin(v23, v24);
  uint64_t v26 = (char *)&v45 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100019524(&qword_10031AA10);
  uint64_t v28 = *(void *)(v27 - 8);
  __chkstk_darwin(v27, v29);
  char v31 = (uint64_t *)((char *)&v45 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v32 = a1[3];
  uint64_t v66 = a1;
  sub_10001C2A8(a1, v32);
  sub_100237BAC();
  uint64_t v33 = v67;
  sub_10024FD20();
  if (v33) {
    goto LABEL_6;
  }
  uint64_t v47 = v26;
  uint64_t v46 = v23;
  uint64_t v67 = v22;
  uint64_t v35 = v63;
  uint64_t v34 = v64;
  uint64_t v36 = v65;
  uint64_t v37 = v31;
  uint64_t v38 = sub_10024F890();
  if (*(void *)(v38 + 16) != 1)
  {
    uint64_t v40 = sub_10024F3D0();
    swift_allocError();
    char v31 = v41;
    sub_100019524(&qword_10031A110);
    *char v31 = &type metadata for ProductRequest.Platform;
    sub_10024F7B0();
    sub_10024F3B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v40 - 8) + 104))(v31, enum case for DecodingError.typeMismatch(_:), v40);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v37, v27);
LABEL_6:
    sub_10001C2EC((uint64_t)v66);
    return v31;
  }
  char v31 = (void *)*(unsigned __int8 *)(v38 + 32);
  switch(*(unsigned char *)(v38 + 32))
  {
    case 1:
      char v69 = 1;
      sub_100237DA4();
      uint64_t v34 = v67;
      sub_10024F7A0();
      uint64_t v44 = v49;
      uint64_t v43 = v50;
      goto LABEL_14;
    case 2:
      char v70 = 2;
      sub_100237D50();
      uint64_t v34 = v61;
      sub_10024F7A0();
      uint64_t v44 = v51;
      uint64_t v43 = v52;
      goto LABEL_14;
    case 3:
      char v71 = 3;
      sub_100237CFC();
      uint64_t v34 = v35;
      sub_10024F7A0();
      uint64_t v44 = v53;
      uint64_t v43 = v54;
      goto LABEL_14;
    case 4:
      char v72 = 4;
      sub_100237CA8();
      sub_10024F7A0();
      uint64_t v43 = v55;
      uint64_t v44 = v56;
      goto LABEL_14;
    case 5:
      char v73 = 5;
      sub_100237C54();
      sub_10024F7A0();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v36, v57);
      break;
    case 6:
      char v74 = 6;
      sub_100237C00();
      uint64_t v34 = v62;
      sub_10024F7A0();
      uint64_t v44 = v59;
      uint64_t v43 = v60;
LABEL_14:
      (*(void (**)(char *, uint64_t))(v44 + 8))(v34, v43);
      break;
    default:
      char v68 = 0;
      sub_100237DF8();
      uint64_t v39 = v47;
      sub_10024F7A0();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v39, v46);
      break;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(void *, uint64_t))(v28 + 8))(v37, v27);
  sub_10001C2EC((uint64_t)v66);
  return v31;
}

unint64_t sub_10023B0D4()
{
  unint64_t result = qword_10031A638;
  if (!qword_10031A638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A638);
  }
  return result;
}

unint64_t sub_10023B128()
{
  unint64_t result = qword_10031A640;
  if (!qword_10031A640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A640);
  }
  return result;
}

unint64_t sub_10023B17C()
{
  unint64_t result = qword_10031A648;
  if (!qword_10031A648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A648);
  }
  return result;
}

unint64_t sub_10023B1D0()
{
  unint64_t result = qword_10031A650;
  if (!qword_10031A650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A650);
  }
  return result;
}

uint64_t sub_10023B224(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000019 && a2 == 0x8000000100285270 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x654D79636167656CLL && a2 == 0xEE00495041616964 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x495041616964656DLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_10023B39C(void *a1)
{
  uint64_t v2 = sub_100019524(&qword_10031A9B8);
  uint64_t v29 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  __chkstk_darwin(v2, v3);
  uint64_t v33 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100019524(&qword_10031A9C0);
  uint64_t v28 = *(void *)(v31 - 8);
  __chkstk_darwin(v31, v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100019524(&qword_10031A9C8);
  uint64_t v27 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100019524(&qword_10031A9D0);
  uint64_t v32 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (uint64_t *)((char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10001C2A8(a1, a1[3]);
  sub_10023B0D4();
  uint64_t v16 = (uint64_t)v34;
  sub_10024FD20();
  if (v16) {
    goto LABEL_7;
  }
  uint64_t v26 = v8;
  uint64_t v17 = v33;
  uint64_t v34 = a1;
  uint64_t v18 = v15;
  uint64_t v19 = sub_10024F890();
  if (*(void *)(v19 + 16) != 1)
  {
    uint64_t v21 = sub_10024F3D0();
    swift_allocError();
    uint64_t v15 = v22;
    sub_100019524(&qword_10031A110);
    *uint64_t v15 = &type metadata for ProductRequest.RequestKind;
    sub_10024F7B0();
    sub_10024F3B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v15, enum case for DecodingError.typeMismatch(_:), v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v32 + 8))(v18, v12);
    a1 = v34;
LABEL_7:
    sub_10001C2EC((uint64_t)a1);
    return v15;
  }
  uint64_t v15 = (void *)*(unsigned __int8 *)(v19 + 32);
  if (*(unsigned char *)(v19 + 32))
  {
    if (v15 == 1)
    {
      char v36 = 1;
      sub_10023B17C();
      sub_10024F7A0();
      uint64_t v20 = v32;
      (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v31);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v18, v12);
    }
    else
    {
      char v37 = 2;
      sub_10023B128();
      sub_10024F7A0();
      uint64_t v24 = v32;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v30);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v24 + 8))(v18, v12);
    }
  }
  else
  {
    char v35 = 0;
    sub_10023B1D0();
    sub_10024F7A0();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v26);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v32 + 8))(v18, v12);
  }
  sub_10001C2EC((uint64_t)v34);
  return v15;
}

unint64_t sub_10023B90C()
{
  unint64_t result = qword_10031A670;
  if (!qword_10031A670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A670);
  }
  return result;
}

unint64_t sub_10023B960()
{
  unint64_t result = qword_10031A678;
  if (!qword_10031A678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A678);
  }
  return result;
}

unint64_t sub_10023B9B4()
{
  unint64_t result = qword_10031A688;
  if (!qword_10031A688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A688);
  }
  return result;
}

uint64_t sub_10023BA08(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73746375646F7270 && a2 == 0xE800000000000000;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001002790D0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void *sub_10023BAF8(void *a1)
{
  uint64_t v27 = sub_100019524(&qword_10031A998);
  uint64_t v29 = *(void *)(v27 - 8);
  __chkstk_darwin(v27, v2);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100019524(&qword_10031A9A0);
  uint64_t v28 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100019524(&qword_10031A9A8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v30 = a1;
  uint64_t v15 = sub_10001C2A8(a1, v14);
  sub_10023B90C();
  uint64_t v16 = v31;
  sub_10024FD20();
  if (v16) {
    goto LABEL_6;
  }
  uint64_t v26 = v5;
  uint64_t v31 = v10;
  uint64_t v17 = sub_10024F890();
  if (*(void *)(v17 + 16) != 1)
  {
    uint64_t v19 = sub_10024F3D0();
    swift_allocError();
    uint64_t v21 = v20;
    sub_100019524(&qword_10031A110);
    *uint64_t v21 = &type metadata for ProductRequest.IdentifierKind;
    uint64_t v15 = v13;
    sub_10024F7B0();
    sub_10024F3B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, enum case for DecodingError.typeMismatch(_:), v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v9);
LABEL_6:
    sub_10001C2EC((uint64_t)v30);
    return v15;
  }
  if (*(unsigned char *)(v17 + 32))
  {
    LOBYTE(v32) = 1;
    sub_10023B960();
    sub_10024F7A0();
    sub_100019524(&qword_10031A390);
    sub_100240634(&qword_10031A9B0);
    uint64_t v18 = v27;
    sub_10024F870();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v4, v18);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v9);
  }
  else
  {
    LOBYTE(v32) = 0;
    sub_10023B9B4();
    uint64_t v23 = v8;
    sub_10024F7A0();
    sub_100019524(&qword_10031A390);
    sub_100240634(&qword_10031A9B0);
    uint64_t v24 = v26;
    sub_10024F870();
    uint64_t v25 = v31;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v23, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v9);
  }
  uint64_t v15 = v32;
  sub_10001C2EC((uint64_t)v30);
  return v15;
}

unint64_t sub_10023C058()
{
  unint64_t result = qword_10031A6A8;
  if (!qword_10031A6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A6A8);
  }
  return result;
}

unint64_t sub_10023C0AC()
{
  unint64_t result = qword_10031A6B0;
  if (!qword_10031A6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A6B0);
  }
  return result;
}

unint64_t sub_10023C100()
{
  unint64_t result = qword_10031A6B8;
  if (!qword_10031A6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A6B8);
  }
  return result;
}

uint64_t sub_10023C154(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x8000000100285290 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4F6B6361426E6977 && a2 == 0xED00007372656666)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10023C268(uint64_t a1)
{
  uint64_t v2 = sub_100019524(&qword_10031A978);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v25 = v2;
  uint64_t v26 = v3;
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100019524(&qword_10031A980);
  uint64_t v28 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100019524(&qword_10031A988);
  uint64_t v27 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8((void *)a1, *(void *)(a1 + 24));
  sub_10023C058();
  uint64_t v15 = v29;
  sub_10024FD20();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v16 = v28;
  uint64_t v24 = v7;
  uint64_t v29 = a1;
  uint64_t v17 = sub_10024F890();
  if (*(void *)(v17 + 16) != 1)
  {
    uint64_t v19 = sub_10024F3D0();
    swift_allocError();
    uint64_t v21 = v20;
    sub_100019524(&qword_10031A110);
    *uint64_t v21 = &type metadata for ProductRequest.IncludedResource;
    sub_10024F7B0();
    sub_10024F3B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, enum case for DecodingError.typeMismatch(_:), v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v11);
    a1 = v29;
LABEL_7:
    sub_10001C2EC(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v17 + 32);
  if (a1)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v17 + 32);
    char v31 = 1;
    sub_10023C0AC();
    sub_10024F7A0();
    uint64_t v18 = v27;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v25);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v11);
    a1 = v28;
  }
  else
  {
    char v30 = 0;
    sub_10023C100();
    sub_10024F7A0();
    uint64_t v22 = v27;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v10, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v11);
  }
  sub_10001C2EC(v29);
  return a1;
}

uint64_t type metadata accessor for ProductRequest()
{
  uint64_t result = qword_10031A7C8;
  if (!qword_10031A7C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10023C704()
{
  unint64_t result = qword_10031A6C8;
  if (!qword_10031A6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A6C8);
  }
  return result;
}

unint64_t sub_10023C758()
{
  unint64_t result = qword_10031A6D0;
  if (!qword_10031A6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A6D0);
  }
  return result;
}

unint64_t sub_10023C7AC()
{
  unint64_t result = qword_10031A6D8;
  if (!qword_10031A6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A6D8);
  }
  return result;
}

unint64_t sub_10023C800()
{
  unint64_t result = qword_10031A6F0;
  if (!qword_10031A6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A6F0);
  }
  return result;
}

unint64_t sub_10023C854()
{
  unint64_t result = qword_10031A6F8;
  if (!qword_10031A6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A6F8);
  }
  return result;
}

unint64_t sub_10023C8AC()
{
  unint64_t result = qword_10031A708;
  if (!qword_10031A708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A708);
  }
  return result;
}

unint64_t sub_10023C900()
{
  unint64_t result = qword_10031A710;
  if (!qword_10031A710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A710);
  }
  return result;
}

uint64_t sub_10023C954(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001B028(&qword_10031A6E0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10023C9C4()
{
  unint64_t result = qword_10031A720;
  if (!qword_10031A720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A720);
  }
  return result;
}

unint64_t sub_10023CA18()
{
  unint64_t result = qword_10031A728;
  if (!qword_10031A728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A728);
  }
  return result;
}

uint64_t sub_10023CA6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ProductRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10023CAD4()
{
  unint64_t result = qword_10031A730;
  if (!qword_10031A730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A730);
  }
  return result;
}

unint64_t sub_10023CB2C()
{
  unint64_t result = qword_10031A738;
  if (!qword_10031A738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A738);
  }
  return result;
}

unint64_t sub_10023CB84()
{
  unint64_t result = qword_10031A740;
  if (!qword_10031A740)
  {
    sub_10001B028(&qword_10031A748);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A740);
  }
  return result;
}

unint64_t sub_10023CBE4()
{
  unint64_t result = qword_10031A750;
  if (!qword_10031A750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A750);
  }
  return result;
}

uint64_t sub_10023CC38(uint64_t a1)
{
  uint64_t result = sub_10023CD14(&qword_10031A758, (void (*)(uint64_t))type metadata accessor for ProductRequest);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_10023CC90(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_10023CD14(&qword_10031A760, (void (*)(uint64_t))type metadata accessor for ProductRequest);
  uint64_t result = sub_10023CD14(&qword_10031A768, (void (*)(uint64_t))type metadata accessor for ProductRequest);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_10023CD14(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t *initializeBufferWithCopyOfBuffer for ProductRequest(unint64_t *a1, unint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    unint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (unint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = (int *)type metadata accessor for ClientOverride(0);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_100019524(&qword_10031A3A8);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      unint64_t v11 = a2[1];
      if (v11 >> 60 == 15)
      {
        *(_OWORD *)a1 = *(_OWORD *)a2;
      }
      else
      {
        unint64_t v12 = *a2;
        sub_1000473AC(*a2, a2[1]);
        *a1 = v12;
        a1[1] = v11;
      }
      unint64_t v13 = a2[3];
      a1[2] = a2[2];
      a1[3] = v13;
      unint64_t v14 = a2[5];
      a1[4] = a2[4];
      a1[5] = v14;
      uint64_t v15 = v7[7];
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_100019524(&qword_100319C00);
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 3, v18))
      {
        uint64_t v20 = type metadata accessor for ClientOverride.Server(0);
        memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        uint64_t v21 = sub_10024DDC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v16, v17, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 3, v18);
      }
      uint64_t v22 = v7[8];
      uint64_t v23 = (char *)a1 + v22;
      uint64_t v24 = (char *)a2 + v22;
      *(void *)uint64_t v23 = *(void *)v24;
      v23[8] = v24[8];
      uint64_t v25 = v7[9];
      uint64_t v26 = (char *)a1 + v25;
      uint64_t v27 = (char *)a2 + v25;
      v26[8] = v27[8];
      *(void *)uint64_t v26 = *(void *)v27;
      uint64_t v28 = v7[10];
      uint64_t v29 = (char *)a1 + v28;
      char v30 = (char *)a2 + v28;
      uint64_t v31 = sub_10024E0A0();
      uint64_t v32 = *(void *)(v31 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
      {
        uint64_t v33 = sub_100019524(&qword_100319CA8);
        memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
      }
      (*(void (**)(unint64_t *, void, uint64_t, int *))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v34 = a3[5];
    char v35 = (char *)a1 + v34;
    char v36 = (char *)a2 + v34;
    uint64_t v37 = *(void *)v36;
    unsigned __int8 v38 = v36[8];
    ChannelOptions.Storage._storage.getter(*(void *)v36, v38);
    *(void *)char v35 = v37;
    v35[8] = v38;
    uint64_t v39 = a3[7];
    *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    *(unint64_t *)((char *)a1 + v39) = *(unint64_t *)((char *)a2 + v39);
    uint64_t v40 = a3[8];
    uint64_t v41 = a3[9];
    uint64_t v42 = (unint64_t *)((char *)a1 + v40);
    uint64_t v43 = (unint64_t *)((char *)a2 + v40);
    uint64_t v44 = v43[1];
    *uint64_t v42 = *v43;
    v42[1] = v44;
    *((unsigned char *)a1 + v41) = *((unsigned char *)a2 + v41);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ProductRequest(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientOverride(0);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {
    unint64_t v5 = a1[1];
    if (v5 >> 60 != 15) {
      sub_10003F808(*a1, v5);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = (char *)a1 + *(int *)(v4 + 28);
    uint64_t v7 = sub_100019524(&qword_100319C00);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 3, v7))
    {
      uint64_t v8 = sub_10024DDC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
    }
    uint64_t v9 = (char *)a1 + *(int *)(v4 + 40);
    uint64_t v10 = sub_10024E0A0();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    }
  }
  j__swift_bridgeObjectRelease(*(uint64_t *)((char *)a1 + *(int *)(a2 + 20)), *((unsigned __int8 *)a1 + *(int *)(a2 + 20) + 8));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t *initializeWithCopy for ProductRequest(unint64_t *a1, unint64_t *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100019524(&qword_10031A3A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    unint64_t v9 = a2[1];
    if (v9 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      unint64_t v10 = *a2;
      sub_1000473AC(*a2, a2[1]);
      *a1 = v10;
      a1[1] = v9;
    }
    unint64_t v11 = a2[3];
    a1[2] = a2[2];
    a1[3] = v11;
    unint64_t v12 = a2[5];
    a1[4] = a2[4];
    a1[5] = v12;
    uint64_t v13 = v6[7];
    unint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100019524(&qword_100319C00);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 3, v16))
    {
      uint64_t v18 = type metadata accessor for ClientOverride.Server(0);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      uint64_t v19 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v14, v15, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 3, v16);
    }
    uint64_t v20 = v6[8];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    *(void *)uint64_t v21 = *(void *)v22;
    unsigned char v21[8] = v22[8];
    uint64_t v23 = v6[9];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    unsigned char v24[8] = v25[8];
    *(void *)uint64_t v24 = *(void *)v25;
    uint64_t v26 = v6[10];
    uint64_t v27 = (char *)a1 + v26;
    uint64_t v28 = (char *)a2 + v26;
    uint64_t v29 = sub_10024E0A0();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      uint64_t v31 = sub_100019524(&qword_100319CA8);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
    (*(void (**)(unint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v32 = a3[5];
  uint64_t v33 = (char *)a1 + v32;
  uint64_t v34 = (char *)a2 + v32;
  uint64_t v35 = *(void *)v34;
  unsigned __int8 v36 = v34[8];
  ChannelOptions.Storage._storage.getter(*(void *)v34, v36);
  *(void *)uint64_t v33 = v35;
  v33[8] = v36;
  uint64_t v37 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *(unint64_t *)((char *)a1 + v37) = *(unint64_t *)((char *)a2 + v37);
  uint64_t v38 = a3[8];
  uint64_t v39 = a3[9];
  uint64_t v40 = (unint64_t *)((char *)a1 + v38);
  uint64_t v41 = (unint64_t *)((char *)a2 + v38);
  uint64_t v42 = v41[1];
  *uint64_t v40 = *v41;
  v40[1] = v42;
  *((unsigned char *)a1 + v39) = *((unsigned char *)a2 + v39);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for ProductRequest(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_10023DF0C((uint64_t)a1, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }
    unint64_t v15 = a2[1];
    if ((unint64_t)a1[1] >> 60 == 15)
    {
      if (v15 >> 60 != 15)
      {
        uint64_t v16 = *a2;
        sub_1000473AC(*a2, a2[1]);
        *a1 = v16;
        a1[1] = v15;
        goto LABEL_25;
      }
    }
    else
    {
      if (v15 >> 60 != 15)
      {
        uint64_t v50 = *a2;
        sub_1000473AC(*a2, a2[1]);
        uint64_t v51 = *a1;
        unint64_t v52 = a1[1];
        *a1 = v50;
        a1[1] = v15;
        sub_10003F808(v51, v52);
LABEL_25:
        a1[2] = a2[2];
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        a1[4] = a2[4];
        a1[5] = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v53 = v6[7];
        uint64_t v54 = (char *)a1 + v53;
        uint64_t v55 = (char *)a2 + v53;
        uint64_t v56 = sub_100019524(&qword_100319C00);
        uint64_t v57 = *(void *)(v56 - 8);
        uint64_t v58 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v57 + 48);
        uint64_t v80 = (uint64_t)v54;
        LODWORD(v54) = v58(v54, 3, v56);
        int v59 = v58(v55, 3, v56);
        if (v54)
        {
          if (!v59)
          {
            uint64_t v62 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v62 - 8) + 16))(v80, v55, v62);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v57 + 56))(v80, 0, 3, v56);
            goto LABEL_33;
          }
          size_t v60 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          char v61 = (void *)v80;
        }
        else
        {
          if (!v59)
          {
            uint64_t v63 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v63 - 8) + 24))(v80, v55, v63);
            goto LABEL_33;
          }
          sub_100051BB4(v80, &qword_100319C00);
          size_t v60 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          char v61 = (void *)v80;
        }
        memcpy(v61, v55, v60);
LABEL_33:
        uint64_t v64 = v6[8];
        uint64_t v65 = (char *)a1 + v64;
        uint64_t v66 = (char *)a2 + v64;
        uint64_t v67 = *(void *)v66;
        v65[8] = v66[8];
        *(void *)uint64_t v65 = v67;
        uint64_t v68 = v6[9];
        char v69 = (char *)a1 + v68;
        char v70 = (char *)a2 + v68;
        uint64_t v71 = *(void *)v70;
        v69[8] = v70[8];
        *(void *)char v69 = v71;
        uint64_t v72 = v6[10];
        char v73 = (char *)a1 + v72;
        char v74 = (char *)a2 + v72;
        uint64_t v75 = sub_10024E0A0();
        uint64_t v76 = *(void *)(v75 - 8);
        int v77 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v76 + 48);
        int v78 = v77(v73, 1, v75);
        int v79 = v77(v74, 1, v75);
        if (v78)
        {
          if (!v79)
          {
            (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v73, v74, v75);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v76 + 56))(v73, 0, 1, v75);
            goto LABEL_20;
          }
        }
        else
        {
          if (!v79)
          {
            (*(void (**)(char *, char *, uint64_t))(v76 + 24))(v73, v74, v75);
            goto LABEL_20;
          }
          (*(void (**)(char *, uint64_t))(v76 + 8))(v73, v75);
        }
        size_t v12 = *(void *)(*(void *)(sub_100019524(&qword_100319CA8) - 8) + 64);
        uint64_t v13 = (uint64_t *)v73;
        unint64_t v14 = (uint64_t *)v74;
        goto LABEL_8;
      }
      sub_1000567A4((uint64_t)a1);
    }
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_25;
  }
  if (v10)
  {
LABEL_7:
    size_t v12 = *(void *)(*(void *)(sub_100019524(&qword_10031A3A8) - 8) + 64);
    uint64_t v13 = a1;
    unint64_t v14 = a2;
LABEL_8:
    memcpy(v13, v14, v12);
    goto LABEL_20;
  }
  unint64_t v11 = a2[1];
  if (v11 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v17 = *a2;
    sub_1000473AC(*a2, a2[1]);
    *a1 = v17;
    a1[1] = v11;
  }
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  uint64_t v18 = v6[7];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_100019524(&qword_100319C00);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 3, v21))
  {
    uint64_t v23 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    uint64_t v24 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v19, v20, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 3, v21);
  }
  uint64_t v25 = v6[8];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = *(void *)v27;
  v26[8] = v27[8];
  *(void *)uint64_t v26 = v28;
  uint64_t v29 = v6[9];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = *(void *)v31;
  v30[8] = v31[8];
  *(void *)uint64_t v30 = v32;
  uint64_t v33 = v6[10];
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = sub_10024E0A0();
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    uint64_t v38 = sub_100019524(&qword_100319CA8);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  (*(void (**)(uint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_20:
  uint64_t v39 = a3[5];
  uint64_t v40 = (char *)a1 + v39;
  uint64_t v41 = (char *)a2 + v39;
  uint64_t v42 = *(void *)v41;
  unsigned __int8 v43 = v41[8];
  ChannelOptions.Storage._storage.getter(*(void *)v41, v43);
  uint64_t v44 = *(void *)v40;
  uint64_t v45 = v40[8];
  *(void *)uint64_t v40 = v42;
  v40[8] = v43;
  j__swift_bridgeObjectRelease(v44, v45);
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v46 = a3[8];
  uint64_t v47 = (uint64_t *)((char *)a1 + v46);
  uint64_t v48 = (uint64_t *)((char *)a2 + v46);
  *uint64_t v47 = *v48;
  v47[1] = v48[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  return a1;
}

uint64_t sub_10023DF0C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *initializeWithTake for ProductRequest(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100019524(&qword_10031A3A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    long long v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    a1[2] = a2[2];
    uint64_t v10 = v6[7];
    unint64_t v11 = (char *)a1 + v10;
    size_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_100019524(&qword_100319C00);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 3, v13))
    {
      uint64_t v15 = type metadata accessor for ClientOverride.Server(0);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      uint64_t v16 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v11, v12, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 3, v13);
    }
    uint64_t v17 = v6[8];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    uint64_t v20 = v6[9];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    unsigned char v21[8] = v22[8];
    *(void *)uint64_t v21 = *(void *)v22;
    uint64_t v23 = v6[10];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = sub_10024E0A0();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      uint64_t v28 = sub_100019524(&qword_100319CA8);
      memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v29 = a3[5];
  uint64_t v30 = a3[6];
  uint64_t v31 = (char *)a1 + v29;
  uint64_t v32 = (char *)a2 + v29;
  *(void *)uint64_t v31 = *(void *)v32;
  v31[8] = v32[8];
  *((unsigned char *)a1 + v30) = *((unsigned char *)a2 + v30);
  uint64_t v33 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v33) = *(_OWORD *)((char *)a2 + v33);
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  return a1;
}

uint64_t *assignWithTake for ProductRequest(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_10023DF0C((uint64_t)a1, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }
    unint64_t v21 = a1[1];
    if (v21 >> 60 != 15)
    {
      unint64_t v22 = a2[1];
      if (v22 >> 60 != 15)
      {
        uint64_t v49 = *a1;
        *a1 = *a2;
        a1[1] = v22;
        sub_10003F808(v49, v21);
LABEL_20:
        uint64_t v50 = a2[3];
        a1[2] = a2[2];
        a1[3] = v50;
        swift_bridgeObjectRelease();
        uint64_t v51 = a2[5];
        a1[4] = a2[4];
        a1[5] = v51;
        swift_bridgeObjectRelease();
        uint64_t v52 = v6[7];
        uint64_t v53 = (char *)a1 + v52;
        uint64_t v54 = (char *)a2 + v52;
        uint64_t v55 = sub_100019524(&qword_100319C00);
        uint64_t v56 = *(void *)(v55 - 8);
        uint64_t v57 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v56 + 48);
        uint64_t v77 = (uint64_t)v53;
        LODWORD(v53) = v57(v53, 3, v55);
        int v58 = v57(v54, 3, v55);
        if (v53)
        {
          if (!v58)
          {
            uint64_t v61 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v61 - 8) + 32))(v77, v54, v61);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v56 + 56))(v77, 0, 3, v55);
            goto LABEL_28;
          }
          size_t v59 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          size_t v60 = (void *)v77;
        }
        else
        {
          if (!v58)
          {
            uint64_t v62 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v62 - 8) + 40))(v77, v54, v62);
            goto LABEL_28;
          }
          sub_100051BB4(v77, &qword_100319C00);
          size_t v59 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          size_t v60 = (void *)v77;
        }
        memcpy(v60, v54, v59);
LABEL_28:
        uint64_t v63 = v6[8];
        uint64_t v64 = (char *)a1 + v63;
        uint64_t v65 = (char *)a2 + v63;
        *(void *)uint64_t v64 = *(void *)v65;
        v64[8] = v65[8];
        uint64_t v66 = v6[9];
        uint64_t v67 = (char *)a1 + v66;
        uint64_t v68 = (char *)a2 + v66;
        v67[8] = v68[8];
        *(void *)uint64_t v67 = *(void *)v68;
        uint64_t v69 = v6[10];
        char v70 = (char *)a1 + v69;
        uint64_t v71 = (char *)a2 + v69;
        uint64_t v72 = sub_10024E0A0();
        uint64_t v73 = *(void *)(v72 - 8);
        char v74 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v73 + 48);
        int v75 = v74(v70, 1, v72);
        int v76 = v74(v71, 1, v72);
        if (v75)
        {
          if (!v76)
          {
            (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v70, v71, v72);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v73 + 56))(v70, 0, 1, v72);
            goto LABEL_18;
          }
        }
        else
        {
          if (!v76)
          {
            (*(void (**)(char *, char *, uint64_t))(v73 + 40))(v70, v71, v72);
            goto LABEL_18;
          }
          (*(void (**)(char *, uint64_t))(v73 + 8))(v70, v72);
        }
        size_t v18 = *(void *)(*(void *)(sub_100019524(&qword_100319CA8) - 8) + 64);
        uint64_t v19 = (uint64_t *)v70;
        uint64_t v20 = (uint64_t *)v71;
        goto LABEL_8;
      }
      sub_1000567A4((uint64_t)a1);
    }
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_20;
  }
  if (v10)
  {
LABEL_7:
    size_t v18 = *(void *)(*(void *)(sub_100019524(&qword_10031A3A8) - 8) + 64);
    uint64_t v19 = a1;
    uint64_t v20 = a2;
LABEL_8:
    memcpy(v19, v20, v18);
    goto LABEL_18;
  }
  long long v11 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v12 = v6[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_100019524(&qword_100319C00);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 3, v15))
  {
    uint64_t v17 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v23 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v13, v14, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 3, v15);
  }
  uint64_t v24 = v6[8];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  *(void *)uint64_t v25 = *(void *)v26;
  double v25[8] = v26[8];
  uint64_t v27 = v6[9];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  v28[8] = v29[8];
  *(void *)uint64_t v28 = *(void *)v29;
  uint64_t v30 = v6[10];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = sub_10024E0A0();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    uint64_t v35 = sub_100019524(&qword_100319CA8);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v32, v33);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  (*(void (**)(uint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_18:
  uint64_t v36 = a3[5];
  uint64_t v37 = (char *)a1 + v36;
  uint64_t v38 = (char *)a2 + v36;
  uint64_t v39 = *(void *)v38;
  LOBYTE(v38) = v38[8];
  uint64_t v40 = *(void *)v37;
  uint64_t v41 = v37[8];
  *(void *)uint64_t v37 = v39;
  v37[8] = (char)v38;
  j__swift_bridgeObjectRelease(v40, v41);
  uint64_t v42 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *(uint64_t *)((char *)a1 + v42) = *(uint64_t *)((char *)a2 + v42);
  swift_bridgeObjectRelease();
  uint64_t v43 = a3[8];
  uint64_t v44 = (uint64_t *)((char *)a1 + v43);
  uint64_t v45 = (uint64_t *)((char *)a2 + v43);
  uint64_t v47 = *v45;
  uint64_t v46 = v45[1];
  *uint64_t v44 = v47;
  v44[1] = v46;
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProductRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10023EA10);
}

uint64_t sub_10023EA10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100019524(&qword_10031A3A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ProductRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10023EAE8);
}

uint64_t sub_10023EAE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100019524(&qword_10031A3A8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

void sub_10023EBA8()
{
  sub_100233B98();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for ProductRequest.Platform()
{
  return &type metadata for ProductRequest.Platform;
}

ValueMetadata *type metadata accessor for ProductRequest.RequestKind()
{
  return &type metadata for ProductRequest.RequestKind;
}

uint64_t initializeBufferWithCopyOfBuffer for ProductRequest.IdentifierKind(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unsigned __int8 v4 = *((unsigned char *)a2 + 8);
  ChannelOptions.Storage._storage.getter(*a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for ProductRequest.IdentifierKind(uint64_t a1)
{
  return j__swift_bridgeObjectRelease(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t *assignWithCopy for ProductRequest.IdentifierKind(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unsigned __int8 v4 = *((unsigned char *)a2 + 8);
  ChannelOptions.Storage._storage.getter(*a2, v4);
  uint64_t v5 = *a1;
  uint64_t v6 = *((unsigned __int8 *)a1 + 8);
  *a1 = v3;
  *((unsigned char *)a1 + 8) = v4;
  j__swift_bridgeObjectRelease(v5, v6);
  return a1;
}

uint64_t initializeWithTake for ProductRequest.IdentifierKind(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t *assignWithTake for ProductRequest.IdentifierKind(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *a1;
  uint64_t v6 = *((unsigned __int8 *)a1 + 8);
  *a1 = v3;
  *((unsigned char *)a1 + 8) = v4;
  j__swift_bridgeObjectRelease(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProductRequest.IdentifierKind(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ProductRequest.IdentifierKind(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10023EE24(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_10023EE2C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ProductRequest.IdentifierKind()
{
  return &type metadata for ProductRequest.IdentifierKind;
}

ValueMetadata *type metadata accessor for ProductRequest.IncludedResource()
{
  return &type metadata for ProductRequest.IncludedResource;
}

unsigned char *storeEnumTagSinglePayload for ProductRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x10023EF2CLL);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProductRequest.CodingKeys()
{
  return &type metadata for ProductRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.IncludedResource.CodingKeys()
{
  return &type metadata for ProductRequest.IncludedResource.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.IncludedResource.PromotionalOffersCodingKeys()
{
  return &type metadata for ProductRequest.IncludedResource.PromotionalOffersCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.IncludedResource.WinBackOffersCodingKeys()
{
  return &type metadata for ProductRequest.IncludedResource.WinBackOffersCodingKeys;
}

unsigned char *_s15StoreKit_Shared14ProductRequestV16IncludedResourceOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10023F060);
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

ValueMetadata *type metadata accessor for ProductRequest.IdentifierKind.CodingKeys()
{
  return &type metadata for ProductRequest.IdentifierKind.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.IdentifierKind.ProductsCodingKeys()
{
  return &type metadata for ProductRequest.IdentifierKind.ProductsCodingKeys;
}

unsigned char *_s15StoreKit_Shared14ProductRequestV14IdentifierKindO18ProductsCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10023F148);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProductRequest.IdentifierKind.SubscriptionGroupsCodingKeys()
{
  return &type metadata for ProductRequest.IdentifierKind.SubscriptionGroupsCodingKeys;
}

unsigned char *_s15StoreKit_Shared14ProductRequestV11RequestKindOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10023F24CLL);
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

ValueMetadata *type metadata accessor for ProductRequest.RequestKind.CodingKeys()
{
  return &type metadata for ProductRequest.RequestKind.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.RequestKind.LegacyFetchSoftwareAddOnsCodingKeys()
{
  return &type metadata for ProductRequest.RequestKind.LegacyFetchSoftwareAddOnsCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.RequestKind.LegacyMediaAPICodingKeys()
{
  return &type metadata for ProductRequest.RequestKind.LegacyMediaAPICodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.RequestKind.MediaAPICodingKeys()
{
  return &type metadata for ProductRequest.RequestKind.MediaAPICodingKeys;
}

unsigned char *_s15StoreKit_Shared14ProductRequestV8PlatformOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x10023F380);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.CodingKeys()
{
  return &type metadata for ProductRequest.Platform.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.OsDefaultCodingKeys()
{
  return &type metadata for ProductRequest.Platform.OsDefaultCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.IPadCodingKeys()
{
  return &type metadata for ProductRequest.Platform.IPadCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.IPhoneCodingKeys()
{
  return &type metadata for ProductRequest.Platform.IPhoneCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.MacCodingKeys()
{
  return &type metadata for ProductRequest.Platform.MacCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.RealityCodingKeys()
{
  return &type metadata for ProductRequest.Platform.RealityCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.TvCodingKeys()
{
  return &type metadata for ProductRequest.Platform.TvCodingKeys;
}

ValueMetadata *type metadata accessor for ProductRequest.Platform.WatchCodingKeys()
{
  return &type metadata for ProductRequest.Platform.WatchCodingKeys;
}

unint64_t sub_10023F42C()
{
  unint64_t result = qword_10031A810;
  if (!qword_10031A810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A810);
  }
  return result;
}

unint64_t sub_10023F484()
{
  unint64_t result = qword_10031A818;
  if (!qword_10031A818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A818);
  }
  return result;
}

unint64_t sub_10023F4DC()
{
  unint64_t result = qword_10031A820;
  if (!qword_10031A820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A820);
  }
  return result;
}

unint64_t sub_10023F534()
{
  unint64_t result = qword_10031A828;
  if (!qword_10031A828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A828);
  }
  return result;
}

unint64_t sub_10023F58C()
{
  unint64_t result = qword_10031A830;
  if (!qword_10031A830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A830);
  }
  return result;
}

unint64_t sub_10023F5E4()
{
  unint64_t result = qword_10031A838;
  if (!qword_10031A838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A838);
  }
  return result;
}

unint64_t sub_10023F63C()
{
  unint64_t result = qword_10031A840;
  if (!qword_10031A840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A840);
  }
  return result;
}

unint64_t sub_10023F694()
{
  unint64_t result = qword_10031A848;
  if (!qword_10031A848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A848);
  }
  return result;
}

unint64_t sub_10023F6EC()
{
  unint64_t result = qword_10031A850;
  if (!qword_10031A850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A850);
  }
  return result;
}

unint64_t sub_10023F744()
{
  unint64_t result = qword_10031A858;
  if (!qword_10031A858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A858);
  }
  return result;
}

unint64_t sub_10023F79C()
{
  unint64_t result = qword_10031A860;
  if (!qword_10031A860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A860);
  }
  return result;
}

unint64_t sub_10023F7F4()
{
  unint64_t result = qword_10031A868;
  if (!qword_10031A868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A868);
  }
  return result;
}

unint64_t sub_10023F84C()
{
  unint64_t result = qword_10031A870;
  if (!qword_10031A870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A870);
  }
  return result;
}

unint64_t sub_10023F8A4()
{
  unint64_t result = qword_10031A878;
  if (!qword_10031A878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A878);
  }
  return result;
}

unint64_t sub_10023F8FC()
{
  unint64_t result = qword_10031A880;
  if (!qword_10031A880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A880);
  }
  return result;
}

unint64_t sub_10023F954()
{
  unint64_t result = qword_10031A888;
  if (!qword_10031A888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A888);
  }
  return result;
}

unint64_t sub_10023F9AC()
{
  unint64_t result = qword_10031A890;
  if (!qword_10031A890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A890);
  }
  return result;
}

unint64_t sub_10023FA04()
{
  unint64_t result = qword_10031A898;
  if (!qword_10031A898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A898);
  }
  return result;
}

unint64_t sub_10023FA5C()
{
  unint64_t result = qword_10031A8A0;
  if (!qword_10031A8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A8A0);
  }
  return result;
}

unint64_t sub_10023FAB4()
{
  unint64_t result = qword_10031A8A8;
  if (!qword_10031A8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A8A8);
  }
  return result;
}

unint64_t sub_10023FB0C()
{
  unint64_t result = qword_10031A8B0;
  if (!qword_10031A8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A8B0);
  }
  return result;
}

unint64_t sub_10023FB64()
{
  unint64_t result = qword_10031A8B8;
  if (!qword_10031A8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A8B8);
  }
  return result;
}

unint64_t sub_10023FBBC()
{
  unint64_t result = qword_10031A8C0;
  if (!qword_10031A8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A8C0);
  }
  return result;
}

unint64_t sub_10023FC14()
{
  unint64_t result = qword_10031A8C8;
  if (!qword_10031A8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A8C8);
  }
  return result;
}

unint64_t sub_10023FC6C()
{
  unint64_t result = qword_10031A8D0;
  if (!qword_10031A8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A8D0);
  }
  return result;
}

unint64_t sub_10023FCC4()
{
  unint64_t result = qword_10031A8D8;
  if (!qword_10031A8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A8D8);
  }
  return result;
}

unint64_t sub_10023FD1C()
{
  unint64_t result = qword_10031A8E0;
  if (!qword_10031A8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A8E0);
  }
  return result;
}

unint64_t sub_10023FD74()
{
  unint64_t result = qword_10031A8E8;
  if (!qword_10031A8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A8E8);
  }
  return result;
}

unint64_t sub_10023FDCC()
{
  unint64_t result = qword_10031A8F0;
  if (!qword_10031A8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A8F0);
  }
  return result;
}

unint64_t sub_10023FE24()
{
  unint64_t result = qword_10031A8F8;
  if (!qword_10031A8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A8F8);
  }
  return result;
}

unint64_t sub_10023FE7C()
{
  unint64_t result = qword_10031A900;
  if (!qword_10031A900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A900);
  }
  return result;
}

unint64_t sub_10023FED4()
{
  unint64_t result = qword_10031A908;
  if (!qword_10031A908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A908);
  }
  return result;
}

unint64_t sub_10023FF2C()
{
  unint64_t result = qword_10031A910;
  if (!qword_10031A910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A910);
  }
  return result;
}

unint64_t sub_10023FF84()
{
  unint64_t result = qword_10031A918;
  if (!qword_10031A918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A918);
  }
  return result;
}

unint64_t sub_10023FFDC()
{
  unint64_t result = qword_10031A920;
  if (!qword_10031A920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A920);
  }
  return result;
}

unint64_t sub_100240034()
{
  unint64_t result = qword_10031A928;
  if (!qword_10031A928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A928);
  }
  return result;
}

unint64_t sub_10024008C()
{
  unint64_t result = qword_10031A930;
  if (!qword_10031A930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A930);
  }
  return result;
}

unint64_t sub_1002400E4()
{
  unint64_t result = qword_10031A938;
  if (!qword_10031A938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A938);
  }
  return result;
}

unint64_t sub_10024013C()
{
  unint64_t result = qword_10031A940;
  if (!qword_10031A940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A940);
  }
  return result;
}

unint64_t sub_100240194()
{
  unint64_t result = qword_10031A948;
  if (!qword_10031A948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A948);
  }
  return result;
}

unint64_t sub_1002401EC()
{
  unint64_t result = qword_10031A950;
  if (!qword_10031A950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A950);
  }
  return result;
}

unint64_t sub_100240244()
{
  unint64_t result = qword_10031A958;
  if (!qword_10031A958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A958);
  }
  return result;
}

unint64_t sub_10024029C()
{
  unint64_t result = qword_10031A960;
  if (!qword_10031A960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A960);
  }
  return result;
}

unint64_t sub_1002402F4()
{
  unint64_t result = qword_10031A968;
  if (!qword_10031A968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A968);
  }
  return result;
}

unint64_t sub_10024034C()
{
  unint64_t result = qword_10031A970;
  if (!qword_10031A970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031A970);
  }
  return result;
}

uint64_t sub_1002403A0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x764F746E65696C63 && a2 == 0xEE00656469727265;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001002852B0 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_100240634(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001B028(&qword_10031A390);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1002406A0(uint64_t a1)
{
  unint64_t v2 = sub_100240BB8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002406DC(uint64_t a1)
{
  unint64_t v2 = sub_100240BB8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100240718(uint64_t a1)
{
  unint64_t v2 = sub_100240B64();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100240754(uint64_t a1)
{
  unint64_t v2 = sub_100240B64();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100240790()
{
  if (*v0) {
    return 0x746E65696C63;
  }
  else {
    return 7105633;
  }
}

uint64_t sub_1002407C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10024290C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1002407E8(uint64_t a1)
{
  unint64_t v2 = sub_100240B10();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100240824(uint64_t a1)
{
  unint64_t v2 = sub_100240B10();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PurchaseIntentRequest.Kind.encode(to:)(void *a1, int a2)
{
  int v21 = a2;
  uint64_t v3 = sub_100019524(&qword_10031AA18);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  __chkstk_darwin(v3, v4);
  char v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100019524(&qword_10031AA20);
  uint64_t v7 = *(void *)(v18 - 8);
  __chkstk_darwin(v18, v8);
  unint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100019524(&qword_10031AA28);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  sub_100240B10();
  sub_10024FD40();
  uint64_t v16 = (uint64_t (**)(char *, uint64_t))(v12 + 8);
  if (v21)
  {
    char v23 = 1;
    sub_100240B64();
    sub_10024F8C0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v20);
  }
  else
  {
    char v22 = 0;
    sub_100240BB8();
    sub_10024F8C0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v18);
  }
  return (*v16)(v15, v11);
}

unint64_t sub_100240B10()
{
  unint64_t result = qword_10031AA30;
  if (!qword_10031AA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AA30);
  }
  return result;
}

unint64_t sub_100240B64()
{
  unint64_t result = qword_10031AA38;
  if (!qword_10031AA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AA38);
  }
  return result;
}

unint64_t sub_100240BB8()
{
  unint64_t result = qword_10031AA40;
  if (!qword_10031AA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AA40);
  }
  return result;
}

uint64_t PurchaseIntentRequest.Kind.init(from:)(uint64_t a1)
{
  return sub_1002429E8(a1) & 1;
}

uint64_t sub_100240C28@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1002429E8(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_100240C58(void *a1)
{
  return PurchaseIntentRequest.Kind.encode(to:)(a1, *v1);
}

uint64_t PurchaseIntentRequest.Add.intent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100242F58(v1, a1, (uint64_t (*)(void))type metadata accessor for PurchaseIntentInternal);
}

uint64_t PurchaseIntentRequest.Add.launchApp.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PurchaseIntentRequest.Add(0) + 20));
}

uint64_t PurchaseIntentRequest.Add.logKey.getter()
{
  return sub_100241528(type metadata accessor for PurchaseIntentRequest.Add);
}

uint64_t PurchaseIntentRequest.Add.logKey.setter(uint64_t a1, uint64_t a2)
{
  return sub_100241588(a1, a2, type metadata accessor for PurchaseIntentRequest.Add);
}

uint64_t (*PurchaseIntentRequest.Add.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t PurchaseIntentRequest.Add.notify.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PurchaseIntentRequest.Add(0) + 28));
}

int *PurchaseIntentRequest.Add.init(intent:launchApp:notify:logKey:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  sub_100242E58(a1, a6);
  uint64_t result = (int *)type metadata accessor for PurchaseIntentRequest.Add(0);
  *(unsigned char *)(a6 + result[5]) = a2;
  uint64_t v12 = (void *)(a6 + result[6]);
  *uint64_t v12 = a4;
  v12[1] = a5;
  *(unsigned char *)(a6 + result[7]) = a3;
  return result;
}

uint64_t sub_100240DD4()
{
  uint64_t result = 0x746E65746E69;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x704168636E75616CLL;
      break;
    case 2:
      uint64_t result = 0x79654B676F6CLL;
      break;
    case 3:
      uint64_t result = 0x796669746F6ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100240E54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100248280(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100240E7C(uint64_t a1)
{
  unint64_t v2 = sub_100242EBC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100240EB8(uint64_t a1)
{
  unint64_t v2 = sub_100242EBC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PurchaseIntentRequest.Add.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100019524(&qword_10031AA48);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_100242EBC();
  sub_10024FD40();
  v9[15] = 0;
  type metadata accessor for PurchaseIntentInternal();
  sub_100242F10(&qword_10031AA58, (void (*)(uint64_t))type metadata accessor for PurchaseIntentInternal);
  sub_10024F980();
  if (!v1)
  {
    type metadata accessor for PurchaseIntentRequest.Add(0);
    v9[14] = 1;
    sub_10024F950();
    v9[13] = 2;
    sub_10024F940();
    v9[12] = 3;
    sub_10024F950();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t PurchaseIntentRequest.Add.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v4 = type metadata accessor for PurchaseIntentInternal();
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100019524(&qword_10031AA60);
  uint64_t v26 = *(void *)(v8 - 8);
  uint64_t v27 = v8;
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (int *)type metadata accessor for PurchaseIntentRequest.Add(0);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v28 = a1;
  sub_10001C2A8(a1, v16);
  sub_100242EBC();
  sub_10024FD20();
  if (v2) {
    return sub_10001C2EC((uint64_t)v28);
  }
  uint64_t v17 = v26;
  uint64_t v18 = (uint64_t)v15;
  char v32 = 0;
  sub_100242F10(&qword_10031AA68, (void (*)(uint64_t))type metadata accessor for PurchaseIntentInternal);
  uint64_t v19 = v27;
  sub_10024F870();
  sub_100242E58((uint64_t)v7, v18);
  char v31 = 1;
  *(unsigned char *)(v18 + v12[5]) = sub_10024F840() & 1;
  char v30 = 2;
  uint64_t v20 = sub_10024F830();
  int v21 = (uint64_t *)(v18 + v12[6]);
  *int v21 = v20;
  v21[1] = v22;
  char v29 = 3;
  char v23 = sub_10024F840();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v19);
  *(unsigned char *)(v18 + v12[7]) = v23 & 1;
  sub_100242F58(v18, v25, type metadata accessor for PurchaseIntentRequest.Add);
  sub_10001C2EC((uint64_t)v28);
  return sub_100242FC0(v18, type metadata accessor for PurchaseIntentRequest.Add);
}

uint64_t sub_1002414BC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseIntentRequest.Add.init(from:)(a1, a2);
}

uint64_t sub_1002414D4(void *a1)
{
  return PurchaseIntentRequest.Add.encode(to:)(a1);
}

uint64_t PurchaseIntentRequest.Remove.kind.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PurchaseIntentRequest.Remove(0) + 20));
}

uint64_t PurchaseIntentRequest.Remove.logKey.getter()
{
  return sub_100241528(type metadata accessor for PurchaseIntentRequest.Remove);
}

uint64_t sub_100241528(uint64_t (*a1)(void))
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1(0) + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t PurchaseIntentRequest.Remove.logKey.setter(uint64_t a1, uint64_t a2)
{
  return sub_100241588(a1, a2, type metadata accessor for PurchaseIntentRequest.Remove);
}

uint64_t sub_100241588(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = (void *)(v3 + *(int *)(a3(0) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*PurchaseIntentRequest.Remove.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t PurchaseIntentRequest.Remove.productID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for PurchaseIntentRequest.Remove(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

int *PurchaseIntentRequest.Remove.init(clientOverride:kind:logKey:productID:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  char v12 = a2 & 1;
  sub_10023412C(a1, a7);
  uint64_t result = (int *)type metadata accessor for PurchaseIntentRequest.Remove(0);
  *(unsigned char *)(a7 + result[5]) = v12;
  uint64_t v14 = (void *)(a7 + result[6]);
  *uint64_t v14 = a3;
  v14[1] = a4;
  uint64_t v15 = (void *)(a7 + result[7]);
  *uint64_t v15 = a5;
  v15[1] = a6;
  return result;
}

uint64_t sub_1002416D0()
{
  uint64_t result = 0x764F746E65696C63;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1684957547;
      break;
    case 2:
      uint64_t result = 0x79654B676F6CLL;
      break;
    case 3:
      uint64_t result = 0x49746375646F7270;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100241764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100248430(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10024178C(uint64_t a1)
{
  unint64_t v2 = sub_100243040();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002417C8(uint64_t a1)
{
  unint64_t v2 = sub_100243040();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PurchaseIntentRequest.Remove.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100019524(&qword_10031AA70);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_100243040();
  sub_10024FD40();
  v11[15] = 0;
  type metadata accessor for ClientOverride(0);
  sub_100242F10(&qword_10031A3D0, (void (*)(uint64_t))type metadata accessor for ClientOverride);
  sub_10024F910();
  if (!v2)
  {
    v11[14] = *(unsigned char *)(v3 + *(int *)(type metadata accessor for PurchaseIntentRequest.Remove(0) + 20));
    v11[13] = 1;
    sub_100243094();
    sub_10024F980();
    v11[12] = 2;
    sub_10024F940();
    v11[11] = 3;
    sub_10024F8D0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t PurchaseIntentRequest.Remove.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v4 = sub_100019524(&qword_10031A3A8);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100019524(&qword_10031AA88);
  uint64_t v8 = *(void *)(v29 - 8);
  __chkstk_darwin(v29, v9);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = (int *)type metadata accessor for PurchaseIntentRequest.Remove(0);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  char v30 = a1;
  sub_10001C2A8(a1, v16);
  sub_100243040();
  sub_10024FD20();
  if (v2) {
    return sub_10001C2EC((uint64_t)v30);
  }
  uint64_t v17 = v8;
  type metadata accessor for ClientOverride(0);
  char v35 = 0;
  sub_100242F10(&qword_10031A3E0, (void (*)(uint64_t))type metadata accessor for ClientOverride);
  uint64_t v18 = v29;
  sub_10024F800();
  sub_10023412C((uint64_t)v7, (uint64_t)v15);
  char v33 = 1;
  sub_1002430E8();
  sub_10024F870();
  v15[v12[5]] = v34;
  char v32 = 2;
  uint64_t v19 = sub_10024F830();
  uint64_t v20 = (uint64_t *)&v15[v12[6]];
  *uint64_t v20 = v19;
  v20[1] = v21;
  char v31 = 3;
  uint64_t v22 = sub_10024F7C0();
  uint64_t v24 = v23;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v18);
  uint64_t v25 = (uint64_t *)&v15[v12[7]];
  *uint64_t v25 = v22;
  v25[1] = v24;
  sub_100242F58((uint64_t)v15, v28, type metadata accessor for PurchaseIntentRequest.Remove);
  sub_10001C2EC((uint64_t)v30);
  return sub_100242FC0((uint64_t)v15, type metadata accessor for PurchaseIntentRequest.Remove);
}

uint64_t sub_100241E00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseIntentRequest.Remove.init(from:)(a1, a2);
}

uint64_t sub_100241E18(void *a1)
{
  return PurchaseIntentRequest.Remove.encode(to:)(a1);
}

uint64_t PurchaseIntentRequest.Query.after.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10024E030();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t PurchaseIntentRequest.Query.clientOverride.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PurchaseIntentRequest.Query(0) + 20);
  return sub_100230AA4(v3, a1);
}

uint64_t PurchaseIntentRequest.Query.kind.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PurchaseIntentRequest.Query(0) + 24));
}

uint64_t PurchaseIntentRequest.Query.logKey.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for PurchaseIntentRequest.Query(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseIntentRequest.Query.logKey.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for PurchaseIntentRequest.Query(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*PurchaseIntentRequest.Query.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t PurchaseIntentRequest.Query.init(after:clientOverride:kind:logKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v11 = a3 & 1;
  uint64_t v12 = sub_10024E030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a6, a1, v12);
  uint64_t v13 = (int *)type metadata accessor for PurchaseIntentRequest.Query(0);
  uint64_t result = sub_10023412C(a2, a6 + v13[5]);
  *(unsigned char *)(a6 + v13[6]) = v11;
  uint64_t v15 = (void *)(a6 + v13[7]);
  *uint64_t v15 = a4;
  v15[1] = a5;
  return result;
}

uint64_t sub_100242080()
{
  uint64_t result = 0x7265746661;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x764F746E65696C63;
      break;
    case 2:
      uint64_t result = 1684957547;
      break;
    case 3:
      uint64_t result = 0x79654B676F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10024210C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100248604(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100242134(uint64_t a1)
{
  unint64_t v2 = sub_10024315C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100242170(uint64_t a1)
{
  unint64_t v2 = sub_10024315C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PurchaseIntentRequest.Query.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100019524(&qword_10031AA98);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = &v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_10024315C();
  sub_10024FD40();
  v12[15] = 0;
  sub_10024E030();
  sub_100242F10(&qword_10031A2B0, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_10024F980();
  if (!v2)
  {
    uint64_t v10 = type metadata accessor for PurchaseIntentRequest.Query(0);
    v12[14] = 1;
    type metadata accessor for ClientOverride(0);
    sub_100242F10(&qword_10031A3D0, (void (*)(uint64_t))type metadata accessor for ClientOverride);
    sub_10024F910();
    v12[13] = *(unsigned char *)(v3 + *(int *)(v10 + 24));
    v12[12] = 2;
    sub_100243094();
    sub_10024F980();
    v12[11] = 3;
    sub_10024F940();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t PurchaseIntentRequest.Query.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v3 = sub_100019524(&qword_10031A3A8);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10024E030();
  uint64_t v26 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v8);
  uint64_t v28 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100019524(&qword_10031AAA8);
  uint64_t v27 = *(void *)(v30 - 8);
  __chkstk_darwin(v30, v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (int *)type metadata accessor for PurchaseIntentRequest.Query(0);
  __chkstk_darwin(v13, v14);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  sub_10024315C();
  uint64_t v29 = v12;
  uint64_t v17 = (uint64_t)v31;
  sub_10024FD20();
  if (v17) {
    return sub_10001C2EC((uint64_t)a1);
  }
  uint64_t v18 = v27;
  char v31 = a1;
  char v36 = 0;
  sub_100242F10(&qword_10031A2C0, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_10024F870();
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v16, v28, v7);
  type metadata accessor for ClientOverride(0);
  char v35 = 1;
  sub_100242F10(&qword_10031A3E0, (void (*)(uint64_t))type metadata accessor for ClientOverride);
  sub_10024F800();
  sub_10023412C((uint64_t)v6, (uint64_t)&v16[v13[5]]);
  char v33 = 2;
  sub_1002430E8();
  sub_10024F870();
  v16[v13[6]] = v34;
  char v32 = 3;
  uint64_t v19 = sub_10024F830();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v29, v30);
  uint64_t v22 = (uint64_t *)&v16[v13[7]];
  *uint64_t v22 = v19;
  v22[1] = v21;
  sub_100242F58((uint64_t)v16, v25, type metadata accessor for PurchaseIntentRequest.Query);
  sub_10001C2EC((uint64_t)v31);
  return sub_100242FC0((uint64_t)v16, type metadata accessor for PurchaseIntentRequest.Query);
}

uint64_t sub_1002428DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseIntentRequest.Query.init(from:)(a1, a2);
}

uint64_t sub_1002428F4(void *a1)
{
  return PurchaseIntentRequest.Query.encode(to:)(a1);
}

uint64_t sub_10024290C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7105633 && a2 == 0xE300000000000000;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E65696C63 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1002429E8(uint64_t a1)
{
  uint64_t v2 = sub_100019524(&qword_10031AD40);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v25 = v2;
  uint64_t v26 = v3;
  __chkstk_darwin(v2, v4);
  char v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100019524(&qword_10031AD48);
  uint64_t v28 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100019524(&qword_10031AD50);
  uint64_t v27 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8((void *)a1, *(void *)(a1 + 24));
  sub_100240B10();
  uint64_t v15 = v29;
  sub_10024FD20();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v16 = v28;
  uint64_t v24 = v7;
  uint64_t v29 = a1;
  uint64_t v17 = sub_10024F890();
  if (*(void *)(v17 + 16) != 1)
  {
    uint64_t v19 = sub_10024F3D0();
    swift_allocError();
    uint64_t v21 = v20;
    sub_100019524(&qword_10031A110);
    *uint64_t v21 = &type metadata for PurchaseIntentRequest.Kind;
    sub_10024F7B0();
    sub_10024F3B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, enum case for DecodingError.typeMismatch(_:), v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v11);
    a1 = v29;
LABEL_7:
    sub_10001C2EC(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v17 + 32);
  if (a1)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v17 + 32);
    char v31 = 1;
    sub_100240B64();
    sub_10024F7A0();
    uint64_t v18 = v27;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v25);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v11);
    a1 = v28;
  }
  else
  {
    char v30 = 0;
    sub_100240BB8();
    sub_10024F7A0();
    uint64_t v22 = v27;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v10, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v11);
  }
  sub_10001C2EC(v29);
  return a1;
}

uint64_t type metadata accessor for PurchaseIntentRequest.Add(uint64_t a1)
{
  return sub_10021DEF4(a1, qword_10031AB50);
}

uint64_t sub_100242E58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PurchaseIntentInternal();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100242EBC()
{
  unint64_t result = qword_10031AA50;
  if (!qword_10031AA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AA50);
  }
  return result;
}

uint64_t sub_100242F10(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100242F58(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100242FC0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for PurchaseIntentRequest.Remove(uint64_t a1)
{
  return sub_10021DEF4(a1, qword_10031ABE8);
}

unint64_t sub_100243040()
{
  unint64_t result = qword_10031AA78;
  if (!qword_10031AA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AA78);
  }
  return result;
}

unint64_t sub_100243094()
{
  unint64_t result = qword_10031AA80;
  if (!qword_10031AA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AA80);
  }
  return result;
}

unint64_t sub_1002430E8()
{
  unint64_t result = qword_10031AA90;
  if (!qword_10031AA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AA90);
  }
  return result;
}

uint64_t type metadata accessor for PurchaseIntentRequest.Query(uint64_t a1)
{
  return sub_10021DEF4(a1, qword_10031AC80);
}

unint64_t sub_10024315C()
{
  unint64_t result = qword_10031AAA0;
  if (!qword_10031AAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AAA0);
  }
  return result;
}

unint64_t sub_1002431B4()
{
  unint64_t result = qword_10031AAB0;
  if (!qword_10031AAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AAB0);
  }
  return result;
}

uint64_t sub_100243208(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_100242F10(&qword_10031AAB8, (void (*)(uint64_t))type metadata accessor for PurchaseIntentRequest.Add);
  uint64_t result = sub_100242F10(&qword_10031AAC0, (void (*)(uint64_t))type metadata accessor for PurchaseIntentRequest.Add);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_10024328C(uint64_t a1)
{
  uint64_t result = sub_100242F10(&qword_10031AAC8, (void (*)(uint64_t))type metadata accessor for PurchaseIntentRequest.Remove);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1002432E4(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_100242F10(&qword_10031AAD0, (void (*)(uint64_t))type metadata accessor for PurchaseIntentRequest.Remove);
  uint64_t result = sub_100242F10(&qword_10031AAD8, (void (*)(uint64_t))type metadata accessor for PurchaseIntentRequest.Remove);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_100243368(uint64_t a1)
{
  uint64_t result = sub_100242F10(&qword_10031AAE0, (void (*)(uint64_t))type metadata accessor for PurchaseIntentRequest.Query);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1002433C0(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_100242F10(&qword_10031AAE8, (void (*)(uint64_t))type metadata accessor for PurchaseIntentRequest.Query);
  uint64_t result = sub_100242F10(&qword_10031AAF0, (void (*)(uint64_t))type metadata accessor for PurchaseIntentRequest.Query);
  *(void *)(a1 + 24) = result;
  return result;
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest()
{
  return &type metadata for PurchaseIntentRequest;
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Kind()
{
  return &type metadata for PurchaseIntentRequest.Kind;
}

void *initializeBufferWithCopyOfBuffer for PurchaseIntentRequest.Add(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v10 = a2[7];
    a1[6] = a2[6];
    a1[7] = v10;
    uint64_t v11 = type metadata accessor for PurchaseIntentInternal();
    uint64_t v12 = *(int *)(v11 + 32);
    uint64_t v25 = (char *)a2 + v12;
    uint64_t v26 = (char *)v4 + v12;
    uint64_t v13 = sub_10024E030();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24(v26, v25, v13);
    uint64_t v14 = *(int *)(v11 + 36);
    uint64_t v15 = (void *)((char *)v4 + v14);
    uint64_t v16 = (void *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = a3[6];
    *((unsigned char *)v4 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v19 = (void *)((char *)v4 + v18);
    uint64_t v20 = (void *)((char *)a2 + v18);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    *((unsigned char *)v4 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for PurchaseIntentRequest.Add(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for PurchaseIntentInternal() + 32);
  uint64_t v3 = sub_10024E030();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PurchaseIntentRequest.Add(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = a2[7];
  a1[6] = a2[6];
  a1[7] = v8;
  uint64_t v9 = type metadata accessor for PurchaseIntentInternal();
  uint64_t v10 = *(int *)(v9 + 32);
  uint64_t v22 = (char *)a2 + v10;
  uint64_t v23 = (char *)a1 + v10;
  uint64_t v11 = sub_10024E030();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v23, v22, v11);
  uint64_t v13 = *(int *)(v9 + 36);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v20 = v19[1];
  void *v18 = *v19;
  v18[1] = v20;
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PurchaseIntentRequest.Add(void *a1, void *a2, int *a3)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for PurchaseIntentInternal();
  uint64_t v7 = *(int *)(v6 + 32);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10024E030();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(v6 + 36);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v14 = a3[6];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

_OWORD *initializeWithTake for PurchaseIntentRequest.Add(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = type metadata accessor for PurchaseIntentInternal();
  uint64_t v9 = *(int *)(v8 + 32);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_10024E030();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *(_OWORD *)((char *)a1 + *(int *)(v8 + 36)) = *(_OWORD *)((char *)a2 + *(int *)(v8 + 36));
  uint64_t v13 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  *(_OWORD *)((char *)a1 + v13) = *(_OWORD *)((char *)a2 + v13);
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

void *assignWithTake for PurchaseIntentRequest.Add(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for PurchaseIntentInternal();
  uint64_t v11 = *(int *)(v10 + 32);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_10024E030();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = *(int *)(v10 + 36);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  void *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseIntentRequest.Add(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100243B70);
}

uint64_t sub_100243B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PurchaseIntentInternal();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for PurchaseIntentRequest.Add(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100243C48);
}

uint64_t sub_100243C48(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for PurchaseIntentInternal();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_100243D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100245A5C(a1, a2, a3, (uint64_t (*)(uint64_t))type metadata accessor for PurchaseIntentInternal);
}

unint64_t *initializeBufferWithCopyOfBuffer for PurchaseIntentRequest.Remove(unint64_t *a1, unint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    unint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (unint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = (int *)type metadata accessor for ClientOverride(0);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_100019524(&qword_10031A3A8);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      unint64_t v11 = a2[1];
      if (v11 >> 60 == 15)
      {
        *(_OWORD *)a1 = *(_OWORD *)a2;
      }
      else
      {
        unint64_t v12 = *a2;
        sub_1000473AC(*a2, a2[1]);
        *a1 = v12;
        a1[1] = v11;
      }
      unint64_t v13 = a2[3];
      a1[2] = a2[2];
      a1[3] = v13;
      unint64_t v14 = a2[5];
      a1[4] = a2[4];
      a1[5] = v14;
      uint64_t v15 = v7[7];
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_100019524(&qword_100319C00);
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 3, v18))
      {
        uint64_t v20 = type metadata accessor for ClientOverride.Server(0);
        memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        uint64_t v21 = sub_10024DDC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v16, v17, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 3, v18);
      }
      uint64_t v22 = v7[8];
      uint64_t v23 = (char *)a1 + v22;
      uint64_t v24 = (char *)a2 + v22;
      *(void *)uint64_t v23 = *(void *)v24;
      v23[8] = v24[8];
      uint64_t v25 = v7[9];
      uint64_t v26 = (char *)a1 + v25;
      uint64_t v27 = (char *)a2 + v25;
      v26[8] = v27[8];
      *(void *)uint64_t v26 = *(void *)v27;
      uint64_t v28 = v7[10];
      uint64_t v29 = (char *)a1 + v28;
      char v30 = (char *)a2 + v28;
      uint64_t v31 = sub_10024E0A0();
      uint64_t v32 = *(void *)(v31 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
      {
        uint64_t v33 = sub_100019524(&qword_100319CA8);
        memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
      }
      (*(void (**)(unint64_t *, void, uint64_t, int *))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v34 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    char v35 = (unint64_t *)((char *)a1 + v34);
    char v36 = (unint64_t *)((char *)a2 + v34);
    uint64_t v37 = v36[1];
    *char v35 = *v36;
    v35[1] = v37;
    uint64_t v38 = a3[7];
    uint64_t v39 = (unint64_t *)((char *)a1 + v38);
    uint64_t v40 = (unint64_t *)((char *)a2 + v38);
    uint64_t v41 = v40[1];
    *uint64_t v39 = *v40;
    v39[1] = v41;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for PurchaseIntentRequest.Remove(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for ClientOverride(0);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2))
  {
    unint64_t v3 = a1[1];
    if (v3 >> 60 != 15) {
      sub_10003F808(*a1, v3);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = (char *)a1 + *(int *)(v2 + 28);
    uint64_t v5 = sub_100019524(&qword_100319C00);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 3, v5))
    {
      uint64_t v6 = sub_10024DDC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
    }
    uint64_t v7 = (char *)a1 + *(int *)(v2 + 40);
    uint64_t v8 = sub_10024E0A0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    }
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t *initializeWithCopy for PurchaseIntentRequest.Remove(unint64_t *a1, unint64_t *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100019524(&qword_10031A3A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    unint64_t v9 = a2[1];
    if (v9 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      unint64_t v10 = *a2;
      sub_1000473AC(*a2, a2[1]);
      *a1 = v10;
      a1[1] = v9;
    }
    unint64_t v11 = a2[3];
    a1[2] = a2[2];
    a1[3] = v11;
    unint64_t v12 = a2[5];
    a1[4] = a2[4];
    a1[5] = v12;
    uint64_t v13 = v6[7];
    unint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100019524(&qword_100319C00);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 3, v16))
    {
      uint64_t v18 = type metadata accessor for ClientOverride.Server(0);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      uint64_t v19 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v14, v15, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 3, v16);
    }
    uint64_t v20 = v6[8];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    *(void *)uint64_t v21 = *(void *)v22;
    unsigned char v21[8] = v22[8];
    uint64_t v23 = v6[9];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    unsigned char v24[8] = v25[8];
    *(void *)uint64_t v24 = *(void *)v25;
    uint64_t v26 = v6[10];
    uint64_t v27 = (char *)a1 + v26;
    uint64_t v28 = (char *)a2 + v26;
    uint64_t v29 = sub_10024E0A0();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      uint64_t v31 = sub_100019524(&qword_100319CA8);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
    (*(void (**)(unint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v32 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v33 = (unint64_t *)((char *)a1 + v32);
  uint64_t v34 = (unint64_t *)((char *)a2 + v32);
  uint64_t v35 = v34[1];
  *uint64_t v33 = *v34;
  v33[1] = v35;
  uint64_t v36 = a3[7];
  uint64_t v37 = (unint64_t *)((char *)a1 + v36);
  uint64_t v38 = (unint64_t *)((char *)a2 + v36);
  uint64_t v39 = v38[1];
  *uint64_t v37 = *v38;
  v37[1] = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for PurchaseIntentRequest.Remove(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_100242FC0((uint64_t)a1, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }
    unint64_t v15 = a2[1];
    if ((unint64_t)a1[1] >> 60 == 15)
    {
      if (v15 >> 60 != 15)
      {
        uint64_t v16 = *a2;
        sub_1000473AC(*a2, a2[1]);
        *a1 = v16;
        a1[1] = v15;
        goto LABEL_25;
      }
    }
    else
    {
      if (v15 >> 60 != 15)
      {
        uint64_t v46 = *a2;
        sub_1000473AC(*a2, a2[1]);
        uint64_t v47 = *a1;
        unint64_t v48 = a1[1];
        *a1 = v46;
        a1[1] = v15;
        sub_10003F808(v47, v48);
LABEL_25:
        a1[2] = a2[2];
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        a1[4] = a2[4];
        a1[5] = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v49 = v6[7];
        uint64_t v50 = (char *)a1 + v49;
        uint64_t v51 = (char *)a2 + v49;
        uint64_t v52 = sub_100019524(&qword_100319C00);
        uint64_t v53 = *(void *)(v52 - 8);
        uint64_t v54 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v53 + 48);
        uint64_t v76 = (uint64_t)v50;
        LODWORD(v50) = v54(v50, 3, v52);
        int v55 = v54(v51, 3, v52);
        if (v50)
        {
          if (!v55)
          {
            uint64_t v58 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v58 - 8) + 16))(v76, v51, v58);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v53 + 56))(v76, 0, 3, v52);
            goto LABEL_33;
          }
          size_t v56 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          uint64_t v57 = (void *)v76;
        }
        else
        {
          if (!v55)
          {
            uint64_t v59 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v59 - 8) + 24))(v76, v51, v59);
            goto LABEL_33;
          }
          sub_100051BB4(v76, &qword_100319C00);
          size_t v56 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          uint64_t v57 = (void *)v76;
        }
        memcpy(v57, v51, v56);
LABEL_33:
        uint64_t v60 = v6[8];
        uint64_t v61 = (char *)a1 + v60;
        uint64_t v62 = (char *)a2 + v60;
        uint64_t v63 = *(void *)v62;
        v61[8] = v62[8];
        *(void *)uint64_t v61 = v63;
        uint64_t v64 = v6[9];
        uint64_t v65 = (char *)a1 + v64;
        uint64_t v66 = (char *)a2 + v64;
        uint64_t v67 = *(void *)v66;
        v65[8] = v66[8];
        *(void *)uint64_t v65 = v67;
        uint64_t v68 = v6[10];
        uint64_t v69 = (char *)a1 + v68;
        char v70 = (char *)a2 + v68;
        uint64_t v71 = sub_10024E0A0();
        uint64_t v72 = *(void *)(v71 - 8);
        uint64_t v73 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48);
        int v74 = v73(v69, 1, v71);
        int v75 = v73(v70, 1, v71);
        if (v74)
        {
          if (!v75)
          {
            (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v69, v70, v71);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v69, 0, 1, v71);
            goto LABEL_20;
          }
        }
        else
        {
          if (!v75)
          {
            (*(void (**)(char *, char *, uint64_t))(v72 + 24))(v69, v70, v71);
            goto LABEL_20;
          }
          (*(void (**)(char *, uint64_t))(v72 + 8))(v69, v71);
        }
        size_t v12 = *(void *)(*(void *)(sub_100019524(&qword_100319CA8) - 8) + 64);
        uint64_t v13 = (uint64_t *)v69;
        unint64_t v14 = (uint64_t *)v70;
        goto LABEL_8;
      }
      sub_1000567A4((uint64_t)a1);
    }
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_25;
  }
  if (v10)
  {
LABEL_7:
    size_t v12 = *(void *)(*(void *)(sub_100019524(&qword_10031A3A8) - 8) + 64);
    uint64_t v13 = a1;
    unint64_t v14 = a2;
LABEL_8:
    memcpy(v13, v14, v12);
    goto LABEL_20;
  }
  unint64_t v11 = a2[1];
  if (v11 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v17 = *a2;
    sub_1000473AC(*a2, a2[1]);
    *a1 = v17;
    a1[1] = v11;
  }
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  uint64_t v18 = v6[7];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_100019524(&qword_100319C00);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 3, v21))
  {
    uint64_t v23 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    uint64_t v24 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v19, v20, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 3, v21);
  }
  uint64_t v25 = v6[8];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = *(void *)v27;
  v26[8] = v27[8];
  *(void *)uint64_t v26 = v28;
  uint64_t v29 = v6[9];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = *(void *)v31;
  v30[8] = v31[8];
  *(void *)uint64_t v30 = v32;
  uint64_t v33 = v6[10];
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = sub_10024E0A0();
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    uint64_t v38 = sub_100019524(&qword_100319CA8);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  (*(void (**)(uint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_20:
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v39 = a3[6];
  uint64_t v40 = (uint64_t *)((char *)a1 + v39);
  uint64_t v41 = (uint64_t *)((char *)a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v42 = a3[7];
  uint64_t v43 = (uint64_t *)((char *)a1 + v42);
  uint64_t v44 = (uint64_t *)((char *)a2 + v42);
  *uint64_t v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for PurchaseIntentRequest.Remove(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100019524(&qword_10031A3A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    long long v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    a1[2] = a2[2];
    uint64_t v10 = v6[7];
    unint64_t v11 = (char *)a1 + v10;
    size_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_100019524(&qword_100319C00);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 3, v13))
    {
      uint64_t v15 = type metadata accessor for ClientOverride.Server(0);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      uint64_t v16 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v11, v12, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 3, v13);
    }
    uint64_t v17 = v6[8];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    uint64_t v20 = v6[9];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    unsigned char v21[8] = v22[8];
    *(void *)uint64_t v21 = *(void *)v22;
    uint64_t v23 = v6[10];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = sub_10024E0A0();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      uint64_t v28 = sub_100019524(&qword_100319CA8);
      memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v29 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  *(_OWORD *)((char *)a1 + v29) = *(_OWORD *)((char *)a2 + v29);
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  return a1;
}

uint64_t *assignWithTake for PurchaseIntentRequest.Remove(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_100242FC0((uint64_t)a1, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }
    unint64_t v21 = a1[1];
    if (v21 >> 60 != 15)
    {
      unint64_t v22 = a2[1];
      if (v22 >> 60 != 15)
      {
        uint64_t v47 = *a1;
        *a1 = *a2;
        a1[1] = v22;
        sub_10003F808(v47, v21);
LABEL_20:
        uint64_t v48 = a2[3];
        a1[2] = a2[2];
        a1[3] = v48;
        swift_bridgeObjectRelease();
        uint64_t v49 = a2[5];
        a1[4] = a2[4];
        a1[5] = v49;
        swift_bridgeObjectRelease();
        uint64_t v50 = v6[7];
        uint64_t v51 = (char *)a1 + v50;
        uint64_t v52 = (char *)a2 + v50;
        uint64_t v53 = sub_100019524(&qword_100319C00);
        uint64_t v54 = *(void *)(v53 - 8);
        int v55 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
        uint64_t v75 = (uint64_t)v51;
        LODWORD(v51) = v55(v51, 3, v53);
        int v56 = v55(v52, 3, v53);
        if (v51)
        {
          if (!v56)
          {
            uint64_t v59 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v59 - 8) + 32))(v75, v52, v59);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56))(v75, 0, 3, v53);
            goto LABEL_28;
          }
          size_t v57 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          uint64_t v58 = (void *)v75;
        }
        else
        {
          if (!v56)
          {
            uint64_t v60 = sub_10024DDC0();
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v60 - 8) + 40))(v75, v52, v60);
            goto LABEL_28;
          }
          sub_100051BB4(v75, &qword_100319C00);
          size_t v57 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          uint64_t v58 = (void *)v75;
        }
        memcpy(v58, v52, v57);
LABEL_28:
        uint64_t v61 = v6[8];
        uint64_t v62 = (char *)a1 + v61;
        uint64_t v63 = (char *)a2 + v61;
        *(void *)uint64_t v62 = *(void *)v63;
        v62[8] = v63[8];
        uint64_t v64 = v6[9];
        uint64_t v65 = (char *)a1 + v64;
        uint64_t v66 = (char *)a2 + v64;
        v65[8] = v66[8];
        *(void *)uint64_t v65 = *(void *)v66;
        uint64_t v67 = v6[10];
        uint64_t v68 = (char *)a1 + v67;
        uint64_t v69 = (char *)a2 + v67;
        uint64_t v70 = sub_10024E0A0();
        uint64_t v71 = *(void *)(v70 - 8);
        uint64_t v72 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
        int v73 = v72(v68, 1, v70);
        int v74 = v72(v69, 1, v70);
        if (v73)
        {
          if (!v74)
          {
            (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v68, v69, v70);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(v68, 0, 1, v70);
            goto LABEL_18;
          }
        }
        else
        {
          if (!v74)
          {
            (*(void (**)(char *, char *, uint64_t))(v71 + 40))(v68, v69, v70);
            goto LABEL_18;
          }
          (*(void (**)(char *, uint64_t))(v71 + 8))(v68, v70);
        }
        size_t v18 = *(void *)(*(void *)(sub_100019524(&qword_100319CA8) - 8) + 64);
        uint64_t v19 = (uint64_t *)v68;
        uint64_t v20 = (uint64_t *)v69;
        goto LABEL_8;
      }
      sub_1000567A4((uint64_t)a1);
    }
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_20;
  }
  if (v10)
  {
LABEL_7:
    size_t v18 = *(void *)(*(void *)(sub_100019524(&qword_10031A3A8) - 8) + 64);
    uint64_t v19 = a1;
    uint64_t v20 = a2;
LABEL_8:
    memcpy(v19, v20, v18);
    goto LABEL_18;
  }
  long long v11 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v12 = v6[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_100019524(&qword_100319C00);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 3, v15))
  {
    uint64_t v17 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v23 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v13, v14, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 3, v15);
  }
  uint64_t v24 = v6[8];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  *(void *)uint64_t v25 = *(void *)v26;
  double v25[8] = v26[8];
  uint64_t v27 = v6[9];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  v28[8] = v29[8];
  *(void *)uint64_t v28 = *(void *)v29;
  uint64_t v30 = v6[10];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = sub_10024E0A0();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    uint64_t v35 = sub_100019524(&qword_100319CA8);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v32, v33);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  (*(void (**)(uint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_18:
  uint64_t v36 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v37 = (uint64_t *)((char *)a1 + v36);
  uint64_t v38 = (uint64_t *)((char *)a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[7];
  uint64_t v42 = (uint64_t *)((char *)a1 + v41);
  uint64_t v43 = (uint64_t *)((char *)a2 + v41);
  uint64_t v45 = *v43;
  uint64_t v44 = v43[1];
  *uint64_t v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseIntentRequest.Remove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10024589C);
}

uint64_t sub_10024589C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100019524(&qword_10031A3A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for PurchaseIntentRequest.Remove(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100245978);
}

uint64_t sub_100245978(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100019524(&qword_10031A3A8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_100245A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100245A5C(a1, a2, a3, (uint64_t (*)(uint64_t))sub_100233B98);
}

uint64_t sub_100245A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for PurchaseIntentRequest.Query(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10024E030();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (void *)((char *)a1 + v8);
    unint64_t v10 = (void *)((char *)a2 + v8);
    long long v11 = (int *)type metadata accessor for ClientOverride(0);
    uint64_t v12 = *((void *)v11 - 1);
    if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_100019524(&qword_10031A3A8);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      unint64_t v15 = v10[1];
      if (v15 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      }
      else
      {
        unint64_t v16 = *v10;
        sub_1000473AC(*v10, v10[1]);
        *uint64_t v9 = v16;
        v9[1] = v15;
      }
      unint64_t v17 = v10[3];
      v9[2] = v10[2];
      v9[3] = v17;
      unint64_t v18 = v10[5];
      v9[4] = v10[4];
      v9[5] = v18;
      uint64_t v19 = v11[7];
      __dst = (char *)v9 + v19;
      uint64_t v20 = (char *)v10 + v19;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_100019524(&qword_100319C00);
      uint64_t v22 = *(void *)(v21 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 3, v21))
      {
        uint64_t v23 = type metadata accessor for ClientOverride.Server(0);
        memcpy(__dst, v20, *(void *)(*(void *)(v23 - 8) + 64));
      }
      else
      {
        uint64_t v24 = sub_10024DDC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(__dst, v20, v24);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 3, v21);
      }
      uint64_t v25 = v11[8];
      uint64_t v26 = (char *)v9 + v25;
      uint64_t v27 = (char *)v10 + v25;
      *(void *)uint64_t v26 = *(void *)v27;
      v26[8] = v27[8];
      uint64_t v28 = v11[9];
      uint64_t v29 = (char *)v9 + v28;
      uint64_t v30 = (char *)v10 + v28;
      v29[8] = v30[8];
      *(void *)uint64_t v29 = *(void *)v30;
      uint64_t v31 = v11[10];
      uint64_t v32 = (char *)v9 + v31;
      uint64_t v33 = (char *)v10 + v31;
      uint64_t v34 = sub_10024E0A0();
      uint64_t v35 = *(void *)(v34 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
      {
        uint64_t v36 = sub_100019524(&qword_100319CA8);
        memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
      }
      (*(void (**)(unint64_t *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v37 = a3[7];
    *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    uint64_t v38 = (void *)((char *)a1 + v37);
    uint64_t v39 = (void *)((char *)a2 + v37);
    uint64_t v40 = v39[1];
    *uint64_t v38 = *v39;
    v38[1] = v40;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10024E030();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  uint64_t v6 = type metadata accessor for ClientOverride(0);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
  {
    unint64_t v7 = v5[1];
    if (v7 >> 60 != 15) {
      sub_10003F808(*v5, v7);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = (char *)v5 + *(int *)(v6 + 28);
    uint64_t v9 = sub_100019524(&qword_100319C00);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 3, v9))
    {
      uint64_t v10 = sub_10024DDC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v8, v10);
    }
    long long v11 = (char *)v5 + *(int *)(v6 + 40);
    uint64_t v12 = sub_10024E0A0();
    uint64_t v13 = *(void *)(v12 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10024E030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (unint64_t *)(a1 + v7);
  uint64_t v9 = (unint64_t *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v11 = *((void *)v10 - 1);
  if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100019524(&qword_10031A3A8);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    unint64_t v13 = v9[1];
    if (v13 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    }
    else
    {
      unint64_t v14 = *v9;
      sub_1000473AC(*v9, v9[1]);
      *uint64_t v8 = v14;
      v8[1] = v13;
    }
    unint64_t v15 = v9[3];
    v8[2] = v9[2];
    v8[3] = v15;
    unint64_t v16 = v9[5];
    v8[4] = v9[4];
    v8[5] = v16;
    uint64_t v17 = v10[7];
    __dst = (char *)v8 + v17;
    unint64_t v18 = (char *)v9 + v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_100019524(&qword_100319C00);
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 3, v19))
    {
      uint64_t v21 = type metadata accessor for ClientOverride.Server(0);
      memcpy(__dst, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(__dst, v18, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 3, v19);
    }
    uint64_t v23 = v10[8];
    uint64_t v24 = (char *)v8 + v23;
    uint64_t v25 = (char *)v9 + v23;
    *(void *)uint64_t v24 = *(void *)v25;
    unsigned char v24[8] = v25[8];
    uint64_t v26 = v10[9];
    uint64_t v27 = (char *)v8 + v26;
    uint64_t v28 = (char *)v9 + v26;
    v27[8] = v28[8];
    *(void *)uint64_t v27 = *(void *)v28;
    uint64_t v29 = v10[10];
    uint64_t v30 = (char *)v8 + v29;
    uint64_t v31 = (char *)v9 + v29;
    uint64_t v32 = sub_10024E0A0();
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
    {
      uint64_t v34 = sub_100019524(&qword_100319CA8);
      memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
    }
    (*(void (**)(unint64_t *, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v35 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (void *)(a2 + v35);
  uint64_t v38 = v37[1];
  *uint64_t v36 = *v37;
  v36[1] = v38;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10024E030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_100242FC0((uint64_t)v8, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }
    unint64_t v19 = v9[1];
    uint64_t v77 = a3;
    if ((unint64_t)v8[1] >> 60 == 15)
    {
      if (v19 >> 60 != 15)
      {
        uint64_t v20 = *v9;
        sub_1000473AC(*v9, v19);
        *uint64_t v8 = v20;
        v8[1] = v19;
        goto LABEL_25;
      }
    }
    else
    {
      if (v19 >> 60 != 15)
      {
        uint64_t v46 = *v9;
        sub_1000473AC(*v9, v19);
        uint64_t v47 = *v8;
        unint64_t v48 = v8[1];
        *uint64_t v8 = v46;
        v8[1] = v19;
        sub_10003F808(v47, v48);
LABEL_25:
        v8[2] = v9[2];
        v8[3] = v9[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v8[4] = v9[4];
        v8[5] = v9[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v49 = v10[7];
        uint64_t v50 = (char *)v8 + v49;
        uint64_t v51 = (char *)v9 + v49;
        uint64_t v52 = sub_100019524(&qword_100319C00);
        uint64_t v75 = *(void *)(v52 - 8);
        uint64_t v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v75 + 48);
        __dsta = v50;
        LODWORD(v50) = v53(v50, 3, v52);
        __src = v51;
        int v54 = v53(v51, 3, v52);
        if (v50)
        {
          a3 = v77;
          if (!v54)
          {
            uint64_t v57 = sub_10024DDC0();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v57 - 8) + 16))(__dsta, __src, v57);
            (*(void (**)(void *, void, uint64_t, uint64_t))(v75 + 56))(__dsta, 0, 3, v52);
            goto LABEL_33;
          }
          size_t v55 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          int v56 = __dsta;
        }
        else
        {
          a3 = v77;
          if (!v54)
          {
            uint64_t v58 = sub_10024DDC0();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v58 - 8) + 24))(__dsta, __src, v58);
            goto LABEL_33;
          }
          sub_100051BB4((uint64_t)__dsta, &qword_100319C00);
          size_t v55 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          int v56 = __dsta;
        }
        memcpy(v56, __src, v55);
LABEL_33:
        uint64_t v59 = v10[8];
        uint64_t v60 = (char *)v8 + v59;
        uint64_t v61 = (char *)v9 + v59;
        uint64_t v62 = *(void *)v61;
        v60[8] = v61[8];
        *(void *)uint64_t v60 = v62;
        uint64_t v63 = v10[9];
        uint64_t v64 = (char *)v8 + v63;
        uint64_t v65 = (char *)v9 + v63;
        uint64_t v66 = *(void *)v65;
        v64[8] = v65[8];
        *(void *)uint64_t v64 = v66;
        uint64_t v67 = v10[10];
        uint64_t v68 = (char *)v8 + v67;
        uint64_t v69 = (char *)v9 + v67;
        uint64_t v70 = sub_10024E0A0();
        uint64_t v71 = *(void *)(v70 - 8);
        uint64_t v72 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
        int v73 = v72(v68, 1, v70);
        int v74 = v72(v69, 1, v70);
        if (v73)
        {
          if (!v74)
          {
            (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v68, v69, v70);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(v68, 0, 1, v70);
            goto LABEL_20;
          }
        }
        else
        {
          if (!v74)
          {
            (*(void (**)(char *, char *, uint64_t))(v71 + 24))(v68, v69, v70);
            goto LABEL_20;
          }
          (*(void (**)(char *, uint64_t))(v71 + 8))(v68, v70);
        }
        size_t v16 = *(void *)(*(void *)(sub_100019524(&qword_100319CA8) - 8) + 64);
        uint64_t v17 = (uint64_t *)v68;
        unint64_t v18 = (uint64_t *)v69;
        goto LABEL_8;
      }
      sub_1000567A4((uint64_t)v8);
    }
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    goto LABEL_25;
  }
  if (v14)
  {
LABEL_7:
    size_t v16 = *(void *)(*(void *)(sub_100019524(&qword_10031A3A8) - 8) + 64);
    uint64_t v17 = v8;
    unint64_t v18 = v9;
LABEL_8:
    memcpy(v17, v18, v16);
    goto LABEL_20;
  }
  unint64_t v15 = v9[1];
  if (v15 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  }
  else
  {
    uint64_t v21 = *v9;
    sub_1000473AC(*v9, v9[1]);
    *uint64_t v8 = v21;
    v8[1] = v15;
  }
  v8[2] = v9[2];
  v8[3] = v9[3];
  v8[4] = v9[4];
  v8[5] = v9[5];
  uint64_t v22 = v10[7];
  __dst = (char *)v8 + v22;
  uint64_t v23 = (char *)v9 + v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_100019524(&qword_100319C00);
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 3, v24))
  {
    uint64_t v26 = type metadata accessor for ClientOverride.Server(0);
    memcpy(__dst, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    uint64_t v27 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(__dst, v23, v27);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(__dst, 0, 3, v24);
  }
  uint64_t v28 = v10[8];
  uint64_t v29 = (char *)v8 + v28;
  uint64_t v30 = (char *)v9 + v28;
  uint64_t v31 = *(void *)v30;
  v29[8] = v30[8];
  *(void *)uint64_t v29 = v31;
  uint64_t v32 = v10[9];
  uint64_t v33 = (char *)v8 + v32;
  uint64_t v34 = (char *)v9 + v32;
  uint64_t v35 = *(void *)v34;
  v33[8] = v34[8];
  *(void *)uint64_t v33 = v35;
  uint64_t v36 = v10[10];
  uint64_t v37 = (char *)v8 + v36;
  uint64_t v38 = (char *)v9 + v36;
  uint64_t v39 = sub_10024E0A0();
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
  {
    uint64_t v41 = sub_100019524(&qword_100319CA8);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v37, v38, v39);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  (*(void (**)(uint64_t *, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
LABEL_20:
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v42 = a3[7];
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (void *)(a2 + v42);
  *uint64_t v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10024E030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v11 = *((void *)v10 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100019524(&qword_10031A3A8);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    long long v13 = v9[1];
    *uint64_t v8 = *v9;
    v8[1] = v13;
    v8[2] = v9[2];
    uint64_t v14 = v10[7];
    __dst = (char *)v8 + v14;
    unint64_t v15 = (char *)v9 + v14;
    uint64_t v16 = sub_100019524(&qword_100319C00);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 3, v16))
    {
      uint64_t v18 = type metadata accessor for ClientOverride.Server(0);
      memcpy(__dst, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      uint64_t v19 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(__dst, v15, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 3, v16);
    }
    uint64_t v20 = v10[8];
    uint64_t v21 = (char *)v8 + v20;
    uint64_t v22 = (char *)v9 + v20;
    *(void *)uint64_t v21 = *(void *)v22;
    unsigned char v21[8] = v22[8];
    uint64_t v23 = v10[9];
    uint64_t v24 = (char *)v8 + v23;
    uint64_t v25 = (char *)v9 + v23;
    unsigned char v24[8] = v25[8];
    *(void *)uint64_t v24 = *(void *)v25;
    uint64_t v26 = v10[10];
    uint64_t v27 = (char *)v8 + v26;
    uint64_t v28 = (char *)v9 + v26;
    uint64_t v29 = sub_10024E0A0();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      uint64_t v31 = sub_100019524(&qword_100319CA8);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v32 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v32) = *(_OWORD *)(a2 + v32);
  return a1;
}

uint64_t assignWithTake for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10024E030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_100242FC0((uint64_t)v8, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }
    unint64_t v24 = v8[1];
    int v73 = a3;
    if (v24 >> 60 != 15)
    {
      unint64_t v25 = v9[1];
      if (v25 >> 60 != 15)
      {
        uint64_t v45 = *v8;
        *uint64_t v8 = *v9;
        v8[1] = v25;
        sub_10003F808(v45, v24);
LABEL_20:
        uint64_t v46 = v9[3];
        v8[2] = v9[2];
        v8[3] = v46;
        swift_bridgeObjectRelease();
        uint64_t v47 = v9[5];
        v8[4] = v9[4];
        v8[5] = v47;
        swift_bridgeObjectRelease();
        uint64_t v48 = v10[7];
        uint64_t v49 = (char *)v8 + v48;
        uint64_t v50 = (char *)v9 + v48;
        uint64_t v51 = sub_100019524(&qword_100319C00);
        uint64_t v72 = *(void *)(v51 - 8);
        uint64_t v52 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48);
        __dsta = v49;
        LODWORD(v49) = v52(v49, 3, v51);
        int v53 = v52(v50, 3, v51);
        if (v49)
        {
          if (!v53)
          {
            uint64_t v56 = sub_10024DDC0();
            (*(void (**)(void *, char *, uint64_t))(*(void *)(v56 - 8) + 32))(__dsta, v50, v56);
            (*(void (**)(void *, void, uint64_t, uint64_t))(v72 + 56))(__dsta, 0, 3, v51);
            goto LABEL_28;
          }
          size_t v54 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          size_t v55 = __dsta;
        }
        else
        {
          if (!v53)
          {
            uint64_t v57 = sub_10024DDC0();
            (*(void (**)(void *, char *, uint64_t))(*(void *)(v57 - 8) + 40))(__dsta, v50, v57);
            goto LABEL_28;
          }
          sub_100051BB4((uint64_t)__dsta, &qword_100319C00);
          size_t v54 = *(void *)(*(void *)(type metadata accessor for ClientOverride.Server(0) - 8) + 64);
          size_t v55 = __dsta;
        }
        memcpy(v55, v50, v54);
LABEL_28:
        a3 = v73;
        uint64_t v58 = v10[8];
        uint64_t v59 = (char *)v8 + v58;
        uint64_t v60 = (char *)v9 + v58;
        *(void *)uint64_t v59 = *(void *)v60;
        v59[8] = v60[8];
        uint64_t v61 = v10[9];
        uint64_t v62 = (char *)v8 + v61;
        uint64_t v63 = (char *)v9 + v61;
        v62[8] = v63[8];
        *(void *)uint64_t v62 = *(void *)v63;
        uint64_t v64 = v10[10];
        uint64_t v65 = (char *)v8 + v64;
        uint64_t v66 = (char *)v9 + v64;
        uint64_t v67 = sub_10024E0A0();
        uint64_t v68 = *(void *)(v67 - 8);
        uint64_t v69 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v68 + 48);
        int v70 = v69(v65, 1, v67);
        int v71 = v69(v66, 1, v67);
        if (v70)
        {
          if (!v71)
          {
            (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v65, v66, v67);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v68 + 56))(v65, 0, 1, v67);
            goto LABEL_18;
          }
        }
        else
        {
          if (!v71)
          {
            (*(void (**)(char *, char *, uint64_t))(v68 + 40))(v65, v66, v67);
            goto LABEL_18;
          }
          (*(void (**)(char *, uint64_t))(v68 + 8))(v65, v67);
        }
        size_t v21 = *(void *)(*(void *)(sub_100019524(&qword_100319CA8) - 8) + 64);
        uint64_t v22 = (uint64_t *)v65;
        uint64_t v23 = (uint64_t *)v66;
        goto LABEL_8;
      }
      sub_1000567A4((uint64_t)v8);
    }
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    goto LABEL_20;
  }
  if (v14)
  {
LABEL_7:
    size_t v21 = *(void *)(*(void *)(sub_100019524(&qword_10031A3A8) - 8) + 64);
    uint64_t v22 = v8;
    uint64_t v23 = v9;
LABEL_8:
    memcpy(v22, v23, v21);
    goto LABEL_18;
  }
  long long v15 = *((_OWORD *)v9 + 1);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *((_OWORD *)v8 + 1) = v15;
  *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
  uint64_t v16 = v10[7];
  __dst = (char *)v8 + v16;
  uint64_t v17 = (char *)v9 + v16;
  uint64_t v18 = sub_100019524(&qword_100319C00);
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 3, v18))
  {
    uint64_t v20 = type metadata accessor for ClientOverride.Server(0);
    memcpy(__dst, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    uint64_t v26 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(__dst, v17, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 3, v18);
  }
  uint64_t v27 = v10[8];
  uint64_t v28 = (char *)v8 + v27;
  uint64_t v29 = (char *)v9 + v27;
  *(void *)uint64_t v28 = *(void *)v29;
  v28[8] = v29[8];
  uint64_t v30 = v10[9];
  uint64_t v31 = (char *)v8 + v30;
  uint64_t v32 = (char *)v9 + v30;
  v31[8] = v32[8];
  *(void *)uint64_t v31 = *(void *)v32;
  uint64_t v33 = v10[10];
  uint64_t v34 = (char *)v8 + v33;
  uint64_t v35 = (char *)v9 + v33;
  uint64_t v36 = sub_10024E0A0();
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    uint64_t v38 = sub_100019524(&qword_100319CA8);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v34, v35, v36);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  (*(void (**)(uint64_t *, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
LABEL_18:
  uint64_t v39 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v40 = (void *)(a1 + v39);
  uint64_t v41 = (uint64_t *)(a2 + v39);
  uint64_t v43 = *v41;
  uint64_t v42 = v41[1];
  *uint64_t v40 = v43;
  v40[1] = v42;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100247790);
}

uint64_t sub_100247790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10024E030();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100019524(&qword_10031A3A8);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for PurchaseIntentRequest.Query(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1002478C0);
}

uint64_t sub_1002478C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_10024E030();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_100019524(&qword_10031A3A8);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_1002479D8()
{
  sub_10024E030();
  if (v0 <= 0x3F)
  {
    sub_100233B98();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Query.CodingKeys()
{
  return &type metadata for PurchaseIntentRequest.Query.CodingKeys;
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Remove.CodingKeys()
{
  return &type metadata for PurchaseIntentRequest.Remove.CodingKeys;
}

unsigned char *_s15StoreKit_Shared21PurchaseIntentRequestO5QueryV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100247BA4);
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

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Add.CodingKeys()
{
  return &type metadata for PurchaseIntentRequest.Add.CodingKeys;
}

unsigned char *_s15StoreKit_Shared21PurchaseIntentRequestO4KindOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100247CA8);
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

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Kind.CodingKeys()
{
  return &type metadata for PurchaseIntentRequest.Kind.CodingKeys;
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Kind.AllCodingKeys()
{
  return &type metadata for PurchaseIntentRequest.Kind.AllCodingKeys;
}

ValueMetadata *type metadata accessor for PurchaseIntentRequest.Kind.ClientCodingKeys()
{
  return &type metadata for PurchaseIntentRequest.Kind.ClientCodingKeys;
}

unint64_t sub_100247D04()
{
  unint64_t result = qword_10031ACC0;
  if (!qword_10031ACC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031ACC0);
  }
  return result;
}

unint64_t sub_100247D5C()
{
  unint64_t result = qword_10031ACC8;
  if (!qword_10031ACC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031ACC8);
  }
  return result;
}

unint64_t sub_100247DB4()
{
  unint64_t result = qword_10031ACD0;
  if (!qword_10031ACD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031ACD0);
  }
  return result;
}

unint64_t sub_100247E0C()
{
  unint64_t result = qword_10031ACD8;
  if (!qword_10031ACD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031ACD8);
  }
  return result;
}

unint64_t sub_100247E64()
{
  unint64_t result = qword_10031ACE0;
  if (!qword_10031ACE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031ACE0);
  }
  return result;
}

unint64_t sub_100247EBC()
{
  unint64_t result = qword_10031ACE8;
  if (!qword_10031ACE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031ACE8);
  }
  return result;
}

unint64_t sub_100247F14()
{
  unint64_t result = qword_10031ACF0;
  if (!qword_10031ACF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031ACF0);
  }
  return result;
}

unint64_t sub_100247F6C()
{
  unint64_t result = qword_10031ACF8;
  if (!qword_10031ACF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031ACF8);
  }
  return result;
}

unint64_t sub_100247FC4()
{
  unint64_t result = qword_10031AD00;
  if (!qword_10031AD00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AD00);
  }
  return result;
}

unint64_t sub_10024801C()
{
  unint64_t result = qword_10031AD08;
  if (!qword_10031AD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AD08);
  }
  return result;
}

unint64_t sub_100248074()
{
  unint64_t result = qword_10031AD10;
  if (!qword_10031AD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AD10);
  }
  return result;
}

unint64_t sub_1002480CC()
{
  unint64_t result = qword_10031AD18;
  if (!qword_10031AD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AD18);
  }
  return result;
}

unint64_t sub_100248124()
{
  unint64_t result = qword_10031AD20;
  if (!qword_10031AD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AD20);
  }
  return result;
}

unint64_t sub_10024817C()
{
  unint64_t result = qword_10031AD28;
  if (!qword_10031AD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AD28);
  }
  return result;
}

unint64_t sub_1002481D4()
{
  unint64_t result = qword_10031AD30;
  if (!qword_10031AD30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AD30);
  }
  return result;
}

unint64_t sub_10024822C()
{
  unint64_t result = qword_10031AD38;
  if (!qword_10031AD38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AD38);
  }
  return result;
}

uint64_t sub_100248280(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E65746E69 && a2 == 0xE600000000000000;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x704168636E75616CLL && a2 == 0xE900000000000070 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x796669746F6ELL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_100248430(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x764F746E65696C63 && a2 == 0xEE00656469727265;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x49746375646F7270 && a2 == 0xE900000000000044)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_100248604(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7265746661 && a2 == 0xE500000000000000;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x764F746E65696C63 && a2 == 0xEE00656469727265 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t StorefrontRequest.logKey.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for StorefrontRequest() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for StorefrontRequest()
{
  uint64_t result = qword_10031ADE0;
  if (!qword_10031ADE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t StorefrontRequest.logKey.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StorefrontRequest() + 20));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StorefrontRequest.logKey.modify())(void)
{
  return debugOnly(_:);
}

uint64_t StorefrontRequest.init(clientOverride:logKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_10023412C(a1, a4);
  uint64_t result = type metadata accessor for StorefrontRequest();
  uint64_t v8 = (void *)(a4 + *(int *)(result + 20));
  *uint64_t v8 = a2;
  v8[1] = a3;
  return result;
}

uint64_t sub_10024892C()
{
  if (*v0) {
    return 0x79654B676F6CLL;
  }
  else {
    return 0x764F746E65696C63;
  }
}

uint64_t sub_100248970@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10024AFD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100248998(uint64_t a1)
{
  unint64_t v2 = sub_100248BC8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002489D4(uint64_t a1)
{
  unint64_t v2 = sub_100248BC8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t StorefrontRequest.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100019524(&qword_10031AD58);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_100248BC8();
  sub_10024FD40();
  v9[15] = 0;
  type metadata accessor for ClientOverride(0);
  sub_100249058(&qword_10031A3D0, (void (*)(uint64_t))type metadata accessor for ClientOverride);
  sub_10024F910();
  if (!v1)
  {
    type metadata accessor for StorefrontRequest();
    v9[14] = 1;
    sub_10024F940();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_100248BC8()
{
  unint64_t result = qword_10031AD60;
  if (!qword_10031AD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AD60);
  }
  return result;
}

uint64_t StorefrontRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v4 = sub_100019524(&qword_10031A3A8);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100019524(&qword_10031AD68);
  uint64_t v24 = *(void *)(v8 - 8);
  uint64_t v25 = v8;
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for StorefrontRequest();
  __chkstk_darwin(v12, v13);
  long long v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2A8(a1, a1[3]);
  sub_100248BC8();
  sub_10024FD20();
  if (v2) {
    return sub_10001C2EC((uint64_t)a1);
  }
  uint64_t v16 = v24;
  type metadata accessor for ClientOverride(0);
  char v27 = 0;
  sub_100249058(&qword_10031A3E0, (void (*)(uint64_t))type metadata accessor for ClientOverride);
  sub_10024F800();
  sub_10023412C((uint64_t)v7, (uint64_t)v15);
  char v26 = 1;
  uint64_t v17 = sub_10024F830();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v25);
  uint64_t v20 = (uint64_t *)&v15[*(int *)(v12 + 20)];
  *uint64_t v20 = v17;
  v20[1] = v19;
  sub_100248F18((uint64_t)v15, v23);
  sub_10001C2EC((uint64_t)a1);
  return sub_10024A13C((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for StorefrontRequest);
}

uint64_t sub_100248F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StorefrontRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100248F7C(uint64_t a1)
{
  uint64_t result = sub_100249058(&qword_10031AD70, (void (*)(uint64_t))type metadata accessor for StorefrontRequest);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_100248FD4(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_100249058(&qword_10031AD78, (void (*)(uint64_t))type metadata accessor for StorefrontRequest);
  uint64_t result = sub_100249058(&qword_10031AD80, (void (*)(uint64_t))type metadata accessor for StorefrontRequest);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_100249058(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1002490A0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return StorefrontRequest.init(from:)(a1, a2);
}

uint64_t sub_1002490B8(void *a1)
{
  return StorefrontRequest.encode(to:)(a1);
}

unint64_t *initializeBufferWithCopyOfBuffer for StorefrontRequest(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    unint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (unint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = (int *)type metadata accessor for ClientOverride(0);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_100019524(&qword_10031A3A8);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      unint64_t v11 = a2[1];
      if (v11 >> 60 == 15)
      {
        *(_OWORD *)a1 = *(_OWORD *)a2;
      }
      else
      {
        unint64_t v12 = *a2;
        sub_1000473AC(*a2, a2[1]);
        *a1 = v12;
        a1[1] = v11;
      }
      unint64_t v13 = a2[3];
      a1[2] = a2[2];
      a1[3] = v13;
      unint64_t v14 = a2[5];
      a1[4] = a2[4];
      a1[5] = v14;
      uint64_t v15 = v7[7];
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_100019524(&qword_100319C00);
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 3, v18))
      {
        uint64_t v20 = type metadata accessor for ClientOverride.Server(0);
        memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        uint64_t v21 = sub_10024DDC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v16, v17, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 3, v18);
      }
      uint64_t v22 = v7[8];
      uint64_t v23 = (char *)a1 + v22;
      uint64_t v24 = (char *)a2 + v22;
      *(void *)uint64_t v23 = *(void *)v24;
      v23[8] = v24[8];
      uint64_t v25 = v7[9];
      char v26 = (char *)a1 + v25;
      char v27 = (char *)a2 + v25;
      v26[8] = v27[8];
      *(void *)char v26 = *(void *)v27;
      uint64_t v28 = v7[10];
      uint64_t v29 = (char *)a1 + v28;
      uint64_t v30 = (char *)a2 + v28;
      uint64_t v31 = sub_10024E0A0();
      uint64_t v32 = *(void *)(v31 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
      {
        uint64_t v33 = sub_100019524(&qword_100319CA8);
        memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
      }
      (*(void (**)(unint64_t *, void, uint64_t, int *))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v34 = *(int *)(a3 + 20);
    uint64_t v35 = (unint64_t *)((char *)a1 + v34);
    uint64_t v36 = (unint64_t *)((char *)a2 + v34);
    uint64_t v37 = v36[1];
    *uint64_t v35 = *v36;
    v35[1] = v37;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for StorefrontRequest(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for ClientOverride(0);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2))
  {
    unint64_t v3 = a1[1];
    if (v3 >> 60 != 15) {
      sub_10003F808(*a1, v3);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = (char *)a1 + *(int *)(v2 + 28);
    uint64_t v5 = sub_100019524(&qword_100319C00);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 3, v5))
    {
      uint64_t v6 = sub_10024DDC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
    }
    uint64_t v7 = (char *)a1 + *(int *)(v2 + 40);
    uint64_t v8 = sub_10024E0A0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    }
  }
  return swift_bridgeObjectRelease();
}

unint64_t *initializeWithCopy for StorefrontRequest(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(unint64_t *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100019524(&qword_10031A3A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    unint64_t v9 = a2[1];
    if (v9 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      unint64_t v10 = *a2;
      sub_1000473AC(*a2, a2[1]);
      *a1 = v10;
      a1[1] = v9;
    }
    unint64_t v11 = a2[3];
    a1[2] = a2[2];
    a1[3] = v11;
    unint64_t v12 = a2[5];
    a1[4] = a2[4];
    a1[5] = v12;
    uint64_t v13 = v6[7];
    unint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100019524(&qword_100319C00);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 3, v16))
    {
      uint64_t v18 = type metadata accessor for ClientOverride.Server(0);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      uint64_t v19 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v14, v15, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 3, v16);
    }
    uint64_t v20 = v6[8];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    *(void *)uint64_t v21 = *(void *)v22;
    unsigned char v21[8] = v22[8];
    uint64_t v23 = v6[9];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    unsigned char v24[8] = v25[8];
    *(void *)uint64_t v24 = *(void *)v25;
    uint64_t v26 = v6[10];
    char v27 = (char *)a1 + v26;
    uint64_t v28 = (char *)a2 + v26;
    uint64_t v29 = sub_10024E0A0();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      uint64_t v31 = sub_100019524(&qword_100319CA8);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
    (*(void (**)(unint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v32 = *(int *)(a3 + 20);
  uint64_t v33 = (unint64_t *)((char *)a1 + v32);
  uint64_t v34 = (unint64_t *)((char *)a2 + v32);
  uint64_t v35 = v34[1];
  *uint64_t v33 = *v34;
  v33[1] = v35;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for StorefrontRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_10024A13C((uint64_t)a1, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }
    unint64_t v15 = a2[1];
    uint64_t v73 = a3;
    if ((unint64_t)a1[1] >> 60 == 15)
    {
      if (v15 >> 60 != 15)
      {
        uint64_t v16 = *a2;
        sub_1000473AC(*a2, v15);
        *a1 = v16;
        a1[1] = v15;
        goto LABEL_25;
      }
    }
    else
    {
      if (v15 >> 60 != 15)
      {
        uint64_t v43 = *a2;
        sub_1000473AC(*a2, v15);
        uint64_t v44 = *a1;
        unint64_t v45 = a1[1];
        *a1 = v43;
        a1[1] = v15;
        sub_10003F808(v44, v45);
LABEL_25:
        a1[2] = a2[2];
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        a1[4] = a2[4];
        a1[5] = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v46 = v6[7];
        uint64_t v47 = (char *)a1 + v46;
        uint64_t v48 = (char *)a2 + v46;
        uint64_t v49 = sub_100019524(&qword_100319C00);
        uint64_t v50 = *(void *)(v49 - 8);
        uint64_t v51 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v50 + 48);
        int v52 = v51(v47, 3, v49);
        int v53 = v51(v48, 3, v49);
        if (v52)
        {
          if (!v53)
          {
            uint64_t v54 = sub_10024DDC0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 16))(v47, v48, v54);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v47, 0, 3, v49);
LABEL_31:
            uint64_t v56 = v6[8];
            uint64_t v57 = (char *)a1 + v56;
            uint64_t v58 = (char *)a2 + v56;
            uint64_t v59 = *(void *)v58;
            v57[8] = v58[8];
            *(void *)uint64_t v57 = v59;
            uint64_t v60 = v6[9];
            uint64_t v61 = (char *)a1 + v60;
            uint64_t v62 = (char *)a2 + v60;
            uint64_t v63 = *(void *)v62;
            v61[8] = v62[8];
            *(void *)uint64_t v61 = v63;
            uint64_t v64 = v6[10];
            uint64_t v65 = (char *)a1 + v64;
            uint64_t v66 = (char *)a2 + v64;
            uint64_t v67 = sub_10024E0A0();
            uint64_t v68 = *(void *)(v67 - 8);
            uint64_t v69 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v68 + 48);
            int v70 = v69(v65, 1, v67);
            int v71 = v69(v66, 1, v67);
            if (v70)
            {
              a3 = v73;
              if (!v71)
              {
                (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v65, v66, v67);
                (*(void (**)(char *, void, uint64_t, uint64_t))(v68 + 56))(v65, 0, 1, v67);
                goto LABEL_20;
              }
            }
            else
            {
              a3 = v73;
              if (!v71)
              {
                (*(void (**)(char *, char *, uint64_t))(v68 + 24))(v65, v66, v67);
                goto LABEL_20;
              }
              (*(void (**)(char *, uint64_t))(v68 + 8))(v65, v67);
            }
            size_t v12 = *(void *)(*(void *)(sub_100019524(&qword_100319CA8) - 8) + 64);
            uint64_t v13 = (uint64_t *)v65;
            unint64_t v14 = (uint64_t *)v66;
            goto LABEL_8;
          }
        }
        else
        {
          if (!v53)
          {
            uint64_t v72 = sub_10024DDC0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 24))(v47, v48, v72);
            goto LABEL_31;
          }
          sub_100051BB4((uint64_t)v47, &qword_100319C00);
        }
        uint64_t v55 = type metadata accessor for ClientOverride.Server(0);
        memcpy(v47, v48, *(void *)(*(void *)(v55 - 8) + 64));
        goto LABEL_31;
      }
      sub_1000567A4((uint64_t)a1);
    }
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_25;
  }
  if (v10)
  {
LABEL_7:
    size_t v12 = *(void *)(*(void *)(sub_100019524(&qword_10031A3A8) - 8) + 64);
    uint64_t v13 = a1;
    unint64_t v14 = a2;
LABEL_8:
    memcpy(v13, v14, v12);
    goto LABEL_20;
  }
  unint64_t v11 = a2[1];
  if (v11 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v17 = *a2;
    sub_1000473AC(*a2, a2[1]);
    *a1 = v17;
    a1[1] = v11;
  }
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  uint64_t v18 = v6[7];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_100019524(&qword_100319C00);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 3, v21))
  {
    uint64_t v23 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    uint64_t v24 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v19, v20, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 3, v21);
  }
  uint64_t v25 = v6[8];
  uint64_t v26 = (char *)a1 + v25;
  char v27 = (char *)a2 + v25;
  uint64_t v28 = *(void *)v27;
  v26[8] = v27[8];
  *(void *)uint64_t v26 = v28;
  uint64_t v29 = v6[9];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = *(void *)v31;
  v30[8] = v31[8];
  *(void *)uint64_t v30 = v32;
  uint64_t v33 = v6[10];
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = sub_10024E0A0();
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    uint64_t v38 = sub_100019524(&qword_100319CA8);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  (*(void (**)(uint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_20:
  uint64_t v39 = *(int *)(a3 + 20);
  uint64_t v40 = (uint64_t *)((char *)a1 + v39);
  uint64_t v41 = (uint64_t *)((char *)a2 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10024A13C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *initializeWithTake for StorefrontRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100019524(&qword_10031A3A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    long long v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    a1[2] = a2[2];
    uint64_t v10 = v6[7];
    unint64_t v11 = (char *)a1 + v10;
    size_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_100019524(&qword_100319C00);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 3, v13))
    {
      uint64_t v15 = type metadata accessor for ClientOverride.Server(0);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      uint64_t v16 = sub_10024DDC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v11, v12, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 3, v13);
    }
    uint64_t v17 = v6[8];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    uint64_t v20 = v6[9];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    unsigned char v21[8] = v22[8];
    *(void *)uint64_t v21 = *(void *)v22;
    uint64_t v23 = v6[10];
    uint64_t v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = sub_10024E0A0();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      uint64_t v28 = sub_100019524(&qword_100319CA8);
      memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t *assignWithTake for StorefrontRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for ClientOverride(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_10024A13C((uint64_t)a1, type metadata accessor for ClientOverride);
      goto LABEL_7;
    }
    unint64_t v21 = a1[1];
    uint64_t v70 = a3;
    if (v21 >> 60 != 15)
    {
      unint64_t v22 = a2[1];
      if (v22 >> 60 != 15)
      {
        uint64_t v42 = *a1;
        *a1 = *a2;
        a1[1] = v22;
        sub_10003F808(v42, v21);
LABEL_20:
        uint64_t v43 = a2[3];
        a1[2] = a2[2];
        a1[3] = v43;
        swift_bridgeObjectRelease();
        uint64_t v44 = a2[5];
        a1[4] = a2[4];
        a1[5] = v44;
        swift_bridgeObjectRelease();
        uint64_t v45 = v6[7];
        uint64_t v46 = (char *)a1 + v45;
        uint64_t v47 = (char *)a2 + v45;
        uint64_t v48 = sub_100019524(&qword_100319C00);
        uint64_t v49 = *(void *)(v48 - 8);
        uint64_t v50 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48);
        int v51 = v50(v46, 3, v48);
        int v52 = v50(v47, 3, v48);
        if (v51)
        {
          if (!v52)
          {
            uint64_t v53 = sub_10024DDC0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 32))(v46, v47, v53);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v46, 0, 3, v48);
LABEL_26:
            uint64_t v55 = v6[8];
            uint64_t v56 = (char *)a1 + v55;
            uint64_t v57 = (char *)a2 + v55;
            *(void *)uint64_t v56 = *(void *)v57;
            v56[8] = v57[8];
            uint64_t v58 = v6[9];
            uint64_t v59 = (char *)a1 + v58;
            uint64_t v60 = (char *)a2 + v58;
            v59[8] = v60[8];
            *(void *)uint64_t v59 = *(void *)v60;
            uint64_t v61 = v6[10];
            uint64_t v62 = (char *)a1 + v61;
            uint64_t v63 = (char *)a2 + v61;
            uint64_t v64 = sub_10024E0A0();
            uint64_t v65 = *(void *)(v64 - 8);
            uint64_t v66 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v65 + 48);
            int v67 = v66(v62, 1, v64);
            int v68 = v66(v63, 1, v64);
            if (v67)
            {
              a3 = v70;
              if (!v68)
              {
                (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v62, v63, v64);
                (*(void (**)(char *, void, uint64_t, uint64_t))(v65 + 56))(v62, 0, 1, v64);
                goto LABEL_18;
              }
            }
            else
            {
              a3 = v70;
              if (!v68)
              {
                (*(void (**)(char *, char *, uint64_t))(v65 + 40))(v62, v63, v64);
                goto LABEL_18;
              }
              (*(void (**)(char *, uint64_t))(v65 + 8))(v62, v64);
            }
            size_t v18 = *(void *)(*(void *)(sub_100019524(&qword_100319CA8) - 8) + 64);
            uint64_t v19 = (uint64_t *)v62;
            uint64_t v20 = (uint64_t *)v63;
            goto LABEL_8;
          }
        }
        else
        {
          if (!v52)
          {
            uint64_t v69 = sub_10024DDC0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v69 - 8) + 40))(v46, v47, v69);
            goto LABEL_26;
          }
          sub_100051BB4((uint64_t)v46, &qword_100319C00);
        }
        uint64_t v54 = type metadata accessor for ClientOverride.Server(0);
        memcpy(v46, v47, *(void *)(*(void *)(v54 - 8) + 64));
        goto LABEL_26;
      }
      sub_1000567A4((uint64_t)a1);
    }
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_20;
  }
  if (v10)
  {
LABEL_7:
    size_t v18 = *(void *)(*(void *)(sub_100019524(&qword_10031A3A8) - 8) + 64);
    uint64_t v19 = a1;
    uint64_t v20 = a2;
LABEL_8:
    memcpy(v19, v20, v18);
    goto LABEL_18;
  }
  long long v11 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v12 = v6[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_100019524(&qword_100319C00);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 3, v15))
  {
    uint64_t v17 = type metadata accessor for ClientOverride.Server(0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v23 = sub_10024DDC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v13, v14, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 3, v15);
  }
  uint64_t v24 = v6[8];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  *(void *)uint64_t v25 = *(void *)v26;
  double v25[8] = v26[8];
  uint64_t v27 = v6[9];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  v28[8] = v29[8];
  *(void *)uint64_t v28 = *(void *)v29;
  uint64_t v30 = v6[10];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = sub_10024E0A0();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    uint64_t v35 = sub_100019524(&qword_100319CA8);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v32, v33);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  (*(void (**)(uint64_t *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_18:
  uint64_t v36 = *(int *)(a3 + 20);
  uint64_t v37 = (uint64_t *)((char *)a1 + v36);
  uint64_t v38 = (uint64_t *)((char *)a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StorefrontRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10024AB98);
}

uint64_t sub_10024AB98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100019524(&qword_10031A3A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for StorefrontRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10024AC74);
}

uint64_t sub_10024AC74(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100019524(&qword_10031A3A8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

void sub_10024AD38()
{
  sub_100233B98();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for StorefrontRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10024AE98);
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

ValueMetadata *type metadata accessor for StorefrontRequest.CodingKeys()
{
  return &type metadata for StorefrontRequest.CodingKeys;
}

unint64_t sub_10024AED4()
{
  unint64_t result = qword_10031AE18;
  if (!qword_10031AE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AE18);
  }
  return result;
}

unint64_t sub_10024AF2C()
{
  unint64_t result = qword_10031AE20;
  if (!qword_10031AE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AE20);
  }
  return result;
}

unint64_t sub_10024AF84()
{
  unint64_t result = qword_10031AE28;
  if (!qword_10031AE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AE28);
  }
  return result;
}

uint64_t sub_10024AFD8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x764F746E65696C63 && a2 == 0xEE00656469727265;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79654B676F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t StorefrontInternal.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StorefrontInternal() + 24);
  uint64_t v4 = sub_10024E0F0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for StorefrontInternal()
{
  uint64_t result = qword_10031AEB0;
  if (!qword_10031AEB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t StorefrontInternal.init(id:countryCode:locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  uint64_t v7 = (char *)a6 + *(int *)(type metadata accessor for StorefrontInternal() + 24);
  uint64_t v8 = sub_10024E0F0();
  uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32);
  return v9(v7, a5, v8);
}

uint64_t sub_10024B234()
{
  uint64_t v1 = 0x437972746E756F63;
  if (*v0 != 1) {
    uint64_t v1 = 0x656C61636F6CLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 25705;
  }
}

uint64_t sub_10024B288@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10024C290(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10024B2B0(uint64_t a1)
{
  unint64_t v2 = sub_10024B914();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10024B2EC(uint64_t a1)
{
  unint64_t v2 = sub_10024B914();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t StorefrontInternal.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100019524(&qword_10031AE30);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001C2A8(a1, a1[3]);
  sub_10024B914();
  sub_10024FD40();
  v9[15] = 0;
  sub_10024F940();
  if (!v1)
  {
    v9[14] = 1;
    sub_10024F940();
    type metadata accessor for StorefrontInternal();
    v9[13] = 2;
    sub_10024E0F0();
    sub_10024B968(&qword_10031AE40);
    sub_10024F980();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t StorefrontInternal.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v4 = sub_10024E0F0();
  uint64_t v24 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100019524(&qword_10031AE48);
  uint64_t v26 = *(void *)(v8 - 8);
  uint64_t v27 = v8;
  __chkstk_darwin(v8, v9);
  long long v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for StorefrontInternal();
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (uint64_t *)((char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = a1[3];
  uint64_t v28 = a1;
  sub_10001C2A8(a1, v16);
  sub_10024B914();
  sub_10024FD20();
  if (v2) {
    return sub_10001C2EC((uint64_t)v28);
  }
  uint64_t v17 = v26;
  char v31 = 0;
  *uint64_t v15 = sub_10024F830();
  v15[1] = v18;
  char v30 = 1;
  _OWORD v15[2] = sub_10024F830();
  v15[3] = v19;
  char v29 = 2;
  sub_10024B968(&qword_10031AE50);
  uint64_t v23 = v7;
  uint64_t v20 = (uint64_t)v15;
  uint64_t v21 = v27;
  sub_10024F870();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v21);
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(v20 + *(int *)(v12 + 24), v23, v4);
  sub_10024B9AC(v20, v25);
  sub_10001C2EC((uint64_t)v28);
  return sub_10024BA10(v20);
}

uint64_t sub_10024B83C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return StorefrontInternal.init(from:)(a1, a2);
}

uint64_t sub_10024B854(void *a1)
{
  return StorefrontInternal.encode(to:)(a1);
}

uint64_t sub_10024B86C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t _s15StoreKit_Shared18StorefrontInternalV23__derived_struct_equalsySbAC_ACtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_10024FA60() & 1) == 0) {
    return 0;
  }
  BOOL v5 = a1[2] == a2[2] && a1[3] == a2[3];
  if (!v5 && (sub_10024FA60() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(type metadata accessor for StorefrontInternal() + 24);
  return static Locale.== infix(_:_:)((char *)a1 + v6, (char *)a2 + v6);
}

unint64_t sub_10024B914()
{
  unint64_t result = qword_10031AE38;
  if (!qword_10031AE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AE38);
  }
  return result;
}

uint64_t sub_10024B968(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10024E0F0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10024B9AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StorefrontInternal();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10024BA10(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StorefrontInternal();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_10024BA6C()
{
  return &protocol witness table for String;
}

uint64_t *initializeBufferWithCopyOfBuffer for StorefrontInternal(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_10024E0F0();
    long long v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for StorefrontInternal(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_10024E0F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for StorefrontInternal(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10024E0F0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *assignWithCopy for StorefrontInternal(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_10024E0F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for StorefrontInternal(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_10024E0F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *assignWithTake for StorefrontInternal(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_10024E0F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorefrontInternal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10024BE80);
}

uint64_t sub_10024BE80(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_10024E0F0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for StorefrontInternal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10024BF44);
}

uint64_t sub_10024BF44(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10024E0F0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10024BFEC()
{
  uint64_t result = sub_10024E0F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for StorefrontInternal.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10024C150);
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

ValueMetadata *type metadata accessor for StorefrontInternal.CodingKeys()
{
  return &type metadata for StorefrontInternal.CodingKeys;
}

unint64_t sub_10024C18C()
{
  unint64_t result = qword_10031AEF0;
  if (!qword_10031AEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AEF0);
  }
  return result;
}

unint64_t sub_10024C1E4()
{
  unint64_t result = qword_10031AEF8;
  if (!qword_10031AEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AEF8);
  }
  return result;
}

unint64_t sub_10024C23C()
{
  unint64_t result = qword_10031AF00;
  if (!qword_10031AF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10031AF00);
  }
  return result;
}

uint64_t sub_10024C290(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL || (sub_10024FA60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_10024FA60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void sub_10024C3E0()
{
}

void sub_10024C40C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2143, "((header_field_mark ? 1 : 0) + (header_value_mark ? 1 : 0) + (url_mark ? 1 : 0) + (body_mark ? 1 : 0) + (status_mark ? 1 : 0)) <= 1");
}

void sub_10024C438()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2149, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C464()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2148, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C490()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2147, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C4BC()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2146, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C4E8()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2145, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C514()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 746, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C540()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 788, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C56C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 914, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C598()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 920, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C5C4()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 970, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C5F0()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1080, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C61C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1089, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C648()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1389, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C674()
{
}

void sub_10024C6A0()
{
}

void sub_10024C6CC()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1495, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C6F8()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1503, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C724()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1794, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C750()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1806, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C77C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1929, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C7A8()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1937, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C7D4()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1898, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C800()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1892, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C82C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1977, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C858()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1954, "parser->content_length != 0 && parser->content_length != ULLONG_MAX");
}

void sub_10024C884()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 1993, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C8B0()
{
}

void sub_10024C8DC()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2002, "nread == 1");
}

void sub_10024C908()
{
}

void sub_10024C934()
{
}

void sub_10024C960()
{
}

void sub_10024C98C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2078, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024C9B8()
{
}

void sub_10024C9E4()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2089, "parser->content_length != 0 && parser->content_length != ULLONG_MAX");
}

void sub_10024CA10()
{
}

void sub_10024CA3C()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2110, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024CA68()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2107, "parser->content_length == 0");
}

void sub_10024CA94()
{
}

void sub_10024CAC0()
{
  __assert_rtn("c_nio_http_parser_execute", "c_nio_http_parser.c", 2119, "HTTP_PARSER_ERRNO(parser) == HPE_OK");
}

void sub_10024CAEC()
{
}

void sub_10024CB18()
{
}

void sub_10024CB44()
{
}

void sub_10024CB70()
{
  __assert_rtn("c_nio_http_parser_parse_url", "c_nio_http_parser.c", 2531, "(size_t) (off + len) <= buflen && \"Port number overflow\"");
}

void sub_10024CB9C()
{
}

void sub_10024CBC8()
{
  sub_100008130();
  sub_100008148((void *)&_mh_execute_header, v0, v1, "Failed to append path component %{public}@ to base URL %{public}@");
}

void sub_10024CC30()
{
  sub_100008130();
  sub_100008148((void *)&_mh_execute_header, v0, v1, "Creating directory %{public}@ failed and directory does not exist: %{public}@");
}

void sub_10024CC98()
{
  sub_100008130();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to create directory: %{public}@ error: %{public}@", v1, 0x16u);
}

void sub_10024CD10(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Failed to determine container path error: %llu", (uint8_t *)&v3, 0xCu);
}

void sub_10024CD8C()
{
  sub_100008130();
  sub_100008148((void *)&_mh_execute_header, v0, v1, "Failed to set attributes for: %{public}@ error: %{public}@");
}

void sub_10024CDF4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10024CE64(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10024CED4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10024CF44(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(*(void *)a1 + 8);
  uint64_t v5 = a2;
  char v6 = [v4 options];
  uint64_t v7 = [v6 databasePath];
  uint64_t v8 = *(void *)(a3 + 56);
  int v9 = 138543618;
  uint64_t v10 = v7;
  __int16 v11 = 2048;
  uint64_t v12 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Migrating %{public}@ to %llu failed!", (uint8_t *)&v9, 0x16u);
}

void sub_10024D01C()
{
  __assert_rtn("CNIODarwin_CMSG_FIRSTHDR", "shim.c", 57, "mhdr != NULL");
}

void sub_10024D048()
{
  __assert_rtn("CNIODarwin_CMSG_NXTHDR", "shim.c", 62, "mhdr != NULL");
}

void sub_10024D074()
{
  __assert_rtn("CNIODarwin_CMSG_NXTHDR", "shim.c", 63, "cmsg != NULL");
}

void sub_10024D0A0()
{
  __assert_rtn("CNIODarwin_CMSG_DATA", "shim.c", 68, "cmsg != NULL");
}

void sub_10024D0CC()
{
  __assert_rtn("CNIODarwin_CMSG_DATA_MUTABLE", "shim.c", 73, "cmsg != NULL");
}

void sub_10024D0F8(void *a1, void *a2)
{
  int v3 = a1;
  uint64_t v4 = [a2 options];
  uint64_t v5 = [v4 databasePath];
  int v6 = 138543362;
  uint64_t v7 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Requring all stores to migrate after truncating corrupt database at: %{public}@", (uint8_t *)&v6, 0xCu);
}

void sub_10024D1B8(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
}

void sub_10024D220(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 64);
  id v3 = a2;
  uint64_t v4 = [v2 databasePath];
  sub_100015248((void *)&_mh_execute_header, v5, v6, "Connection taken down HARD, please call close before deallocating: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_10024D2B8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_100012F54(7u);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_100015248((void *)&_mh_execute_header, v3, v4, "Encountered exception while executing query: %{public}@", v5, v6, v7, v8, 2u);
  }

  objc_end_catch();
}

void sub_10024D364(void *a1)
{
  id v1 = objc_begin_catch(a1);
  uint64_t v2 = sub_100012F54(7u);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_100015248((void *)&_mh_execute_header, v3, v4, "Encountered exception while in transaction: %{public}@", v5, v6, v7, v8, 2u);
  }

  objc_end_catch();
}

void sub_10024D418(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 64);
  id v3 = a2;
  uint64_t v4 = [v2 databasePath];
  sub_100015248((void *)&_mh_execute_header, v5, v6, "Can't define application function since the connection is not open: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_10024D4B0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "SQL application functions aren't supported in this process", v1, 2u);
}

void sub_10024D4F4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 64);
  id v3 = a2;
  uint64_t v4 = [v2 databasePath];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Can't remove client function since the connection is not open: %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_10024D59C(void *a1)
{
  id v2 = a1;
  id v3 = (id)objc_opt_class();
  uint64_t v4 = [(id)sub_1000152A0() databasePath];
  sub_100015268();
  sub_100015280((void *)&_mh_execute_header, v5, v6, "[%@]: Asking delegate to reset database after corruption: %{public}@", v7, v8, v9, v10, v11);
}

void sub_10024D650(void *a1)
{
  id v2 = a1;
  id v3 = objc_opt_class();
  id v4 = v3;
  uint64_t v5 = [(id)sub_1000152A0() databasePath];
  int v6 = 138412546;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "[%@]: Truncating database after corruption: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_10024D728(void *a1)
{
  id v2 = a1;
  id v3 = (id)objc_opt_class();
  id v4 = [(id)sub_1000152A0() databasePath];
  sub_100015268();
  sub_100015280((void *)&_mh_execute_header, v5, v6, "[%@]: Asking delegate to reset database after reopen: %{public}@", v7, v8, v9, v10, v11);
}

void sub_10024D7DC(void *a1)
{
  id v2 = a1;
  id v3 = (id)objc_opt_class();
  id v4 = [(id)sub_1000152A0() databasePath];
  sub_100015268();
  sub_100015280((void *)&_mh_execute_header, v5, v6, "[%@]: Reopening database after IO error: %{public}@", v7, v8, v9, v10, v11);
}

void sub_10024D890(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error: %@", (uint8_t *)&v6, 0x16u);
}

uint64_t sub_10024D950()
{
  return NSNotFound.getter();
}

uint64_t sub_10024D960()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_10024D970()
{
  return JSONDecoder.init()();
}

uint64_t sub_10024D980()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_10024D990()
{
  return static JSONEncoder.OutputFormatting.prettyPrinted.getter();
}

uint64_t sub_10024D9A0()
{
  return type metadata accessor for JSONEncoder.OutputFormatting();
}

uint64_t sub_10024D9B0()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter();
}

uint64_t sub_10024D9C0()
{
  return type metadata accessor for JSONEncoder.DateEncodingStrategy();
}

uint64_t sub_10024D9D0()
{
  return dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
}

uint64_t sub_10024D9E0()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_10024D9F0()
{
  return JSONEncoder.init()();
}

uint64_t sub_10024DA00()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_10024DA10()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t sub_10024DA20()
{
  return static CharacterSet.decimalDigits.getter();
}

uint64_t sub_10024DA30()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_10024DA40()
{
  return CharacterSet.inverted.getter();
}

uint64_t sub_10024DA50()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_10024DA60()
{
  return dispatch thunk of DataProtocol.regions.getter();
}

uint64_t sub_10024DA70()
{
  return dispatch thunk of DataProtocol.copyBytes(to:count:)();
}

uint64_t sub_10024DAC0()
{
  return DataProtocol.copyBytes(to:count:)();
}

uint64_t sub_10024DAE0()
{
  return URLQueryItem.name.getter();
}

uint64_t sub_10024DAF0()
{
  return URLQueryItem.value.getter();
}

uint64_t sub_10024DB00()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_10024DB10()
{
  return URLComponents.queryItems.getter();
}

uint64_t sub_10024DB20()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_10024DB30()
{
  return URLComponents.path.getter();
}

uint64_t sub_10024DB40()
{
  return URLComponents.init(string:)();
}

uint64_t sub_10024DB50()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_10024DB60()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t sub_10024DB70()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t sub_10024DB80()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_10024DB90()
{
  return __DataStorage._length.getter();
}

uint64_t sub_10024DBA0()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_10024DBB0()
{
  return type metadata accessor for __DataStorage();
}

NSDateComponents sub_10024DBC0()
{
  return DateComponents._bridgeToObjectiveC()();
}

uint64_t sub_10024DBD0()
{
  return DateComponents.day.getter();
}

uint64_t sub_10024DBE0()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t sub_10024DBF0()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_10024DC00()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_10024DC10()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_10024DC20()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_10024DC30()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t sub_10024DC40()
{
  return IntegerFormatStyle.init(locale:)();
}

uint64_t sub_10024DC60()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_10024DC70()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_10024DC80()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_10024DC90()
{
  return dispatch thunk of PropertyListEncoder.outputFormat.setter();
}

uint64_t sub_10024DCA0()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_10024DCB0()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_10024DCC0()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_10024DCD0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10024DCE0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10024DCF0()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_10024DD00()
{
  return URL.absoluteString.getter();
}

uint64_t sub_10024DD10()
{
  return URL.pathComponents.getter();
}

uint64_t sub_10024DD20()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t sub_10024DD30()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t sub_10024DD40()
{
  return URL.lastPathComponent.getter();
}

void sub_10024DD50(NSURL *retstr@<X8>)
{
}

uint64_t sub_10024DD60()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_10024DD70()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10024DD80(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_10024DD90()
{
  return URL.init(string:)();
}

uint64_t sub_10024DDA0()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_10024DDB0()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_10024DDC0()
{
  return type metadata accessor for URL();
}

uint64_t sub_10024DDD0()
{
  return Data.InlineData.init(_:)();
}

void sub_10024DDE0()
{
}

uint64_t sub_10024DDF0()
{
  return Data.LargeSlice.init(_:)();
}

uint64_t sub_10024DE00()
{
  return Data.init(contentsOf:options:)();
}

uint64_t sub_10024DE10()
{
  return type metadata accessor for Data.Deallocator();
}

uint64_t sub_10024DE20()
{
  return Data.InlineSlice.init(_:)();
}

uint64_t sub_10024DE30()
{
  return Data.init(bytesNoCopy:count:deallocator:)();
}

uint64_t sub_10024DE40()
{
  return Data.description.getter();
}

uint64_t sub_10024DE60()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t sub_10024DE70()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t sub_10024DE80()
{
  return Data._Representation.resetBytes(in:)();
}

uint64_t sub_10024DE90()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

void sub_10024DEA0(Swift::Int a1)
{
}

uint64_t sub_10024DEB0()
{
  return Data._Representation.init(count:)();
}

uint64_t sub_10024DEC0()
{
  return Data._Representation.append(contentsOf:)();
}

uint64_t sub_10024DED0()
{
  return Data._Representation.subscript.getter();
}

uint64_t sub_10024DEE0()
{
  return Data._Representation.init(_:)();
}

NSData sub_10024DEF0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10024DF00(NSDataBase64EncodingOptions options)
{
  return Data.base64EncodedString(options:)(options)._countAndFlagsBits;
}

uint64_t sub_10024DF10()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10024DF20()
{
  return Data.init(bytes:count:)();
}

uint64_t sub_10024DF30()
{
  return Data.count.getter();
}

uint64_t sub_10024DF40()
{
  return Data.write(to:options:)();
}

uint64_t sub_10024DF50()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t sub_10024DF60()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t sub_10024DF70()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_10024DF80()
{
  return static Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_10024DF90()
{
  return static Date.distantPast.getter();
}

uint64_t sub_10024DFA0()
{
  return static Date.distantFuture.getter();
}

NSDate sub_10024DFB0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10024DFC0()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_10024DFD0()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_10024DFE0()
{
  return static Date.+ infix(_:_:)();
}

uint64_t sub_10024DFF0()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_10024E000()
{
  return static Date.+= infix(_:_:)();
}

uint64_t sub_10024E010()
{
  return static Date.now.getter();
}

uint64_t sub_10024E020()
{
  return Date.init()();
}

uint64_t sub_10024E030()
{
  return type metadata accessor for Date();
}

uint64_t sub_10024E040()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_10024E050()
{
  return UUID.uuidString.getter();
}

NSUUID sub_10024E060()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_10024E070()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_10024E080()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10024E090()
{
  return UUID.init()();
}

uint64_t sub_10024E0A0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10024E0B0()
{
  return Locale.init(identifier:)();
}

NSLocale sub_10024E0C0()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_10024E0D0()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_10024E0F0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10024E100()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t sub_10024E110()
{
  return Calendar.init(identifier:)();
}

uint64_t sub_10024E120()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t sub_10024E130()
{
  return Calendar.date(byAdding:to:wrappingComponents:)();
}

uint64_t sub_10024E140()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_10024E150()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_10024E170()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_10024E180()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_10024E190()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_10024E1A0()
{
  return Regex.init(_regexString:version:)();
}

uint64_t sub_10024E1B0()
{
  return Regex.wholeMatch(in:)();
}

uint64_t sub_10024E1C0()
{
  return Regex.Match.subscript.getter();
}

uint64_t sub_10024E1D0()
{
  return Logger.logObject.getter();
}

uint64_t sub_10024E1E0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10024E1F0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10024E200()
{
  return open(_:_:_:)();
}

uint64_t sub_10024E210()
{
  return errno.getter();
}

uint64_t sub_10024E220(Swift::Int32 a1, Swift::Int32 a2, Swift::Int32 a3)
{
  return fcntl(_:_:_:)(a1, a2, a3);
}

uint64_t sub_10024E230()
{
  return S_IFMT.getter();
}

uint64_t sub_10024E240()
{
  return S_IFBLK.getter();
}

uint64_t sub_10024E250()
{
  return S_IFDIR.getter();
}

uint64_t sub_10024E260()
{
  return S_IFLNK.getter();
}

uint64_t sub_10024E270()
{
  return S_IFREG.getter();
}

uint64_t sub_10024E280()
{
  return S_IFSOCK.getter();
}

uint64_t sub_10024E290()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_10024E2A0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10024E2B0()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_10024E2C0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10024E2D0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10024E2E0()
{
  return DispatchData.init(bytes:)();
}

uint64_t sub_10024E2F0()
{
  return DispatchData.count.getter();
}

uint64_t sub_10024E300()
{
  return DispatchData.copyBytes(to:count:)();
}

uint64_t sub_10024E310()
{
  return type metadata accessor for DispatchData();
}

uint64_t sub_10024E320()
{
  return DispatchTime.uptimeNanoseconds.getter();
}

uint64_t sub_10024E330()
{
  return static DispatchTime.now()();
}

uint64_t sub_10024E340()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10024E350()
{
  return dispatch thunk of DispatchWorkItem.wait()();
}

uint64_t sub_10024E360()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_10024E370()
{
  return dispatch thunk of DispatchWorkItem.perform()();
}

uint64_t sub_10024E380()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_10024E390()
{
  return + infix(_:_:)();
}

uint64_t sub_10024E3A0()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t sub_10024E3B0()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t sub_10024E3C0()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t sub_10024E3D0()
{
  return type metadata accessor for SHA384Digest();
}

uint64_t sub_10024E3E0()
{
  return P256.Signing.PrivateKey.publicKey.getter();
}

uint64_t sub_10024E3F0()
{
  return P256.Signing.PrivateKey.init<A>(derRepresentation:)();
}

uint64_t sub_10024E400()
{
  return P256.Signing.PrivateKey.rawRepresentation.getter();
}

uint64_t sub_10024E410()
{
  return P256.Signing.PrivateKey.init<A>(rawRepresentation:)();
}

uint64_t sub_10024E420()
{
  return P256.Signing.PrivateKey.x963Representation.getter();
}

uint64_t sub_10024E430()
{
  return P256.Signing.PrivateKey.init(compactRepresentable:)();
}

uint64_t sub_10024E440()
{
  return P256.Signing.PrivateKey.signature<A>(for:)();
}

uint64_t sub_10024E450()
{
  return type metadata accessor for P256.Signing.PrivateKey();
}

uint64_t sub_10024E460()
{
  return P256.Signing.ECDSASignature.derRepresentation.getter();
}

uint64_t sub_10024E470()
{
  return P256.Signing.ECDSASignature.init<A>(derRepresentation:)();
}

uint64_t sub_10024E480()
{
  return P256.Signing.ECDSASignature.rawRepresentation.getter();
}

uint64_t sub_10024E490()
{
  return type metadata accessor for P256.Signing.ECDSASignature();
}

uint64_t sub_10024E4A0()
{
  return P256.Signing.PublicKey.isValidSignature<A>(_:for:)();
}

uint64_t sub_10024E4B0()
{
  return P256.Signing.PublicKey.init<A>(derRepresentation:)();
}

uint64_t sub_10024E4C0()
{
  return type metadata accessor for P256.Signing.PublicKey();
}

uint64_t sub_10024E4D0()
{
  return type metadata accessor for SHA384();
}

NSDictionary sub_10024E4E0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10024E4F0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10024E500()
{
  return Dictionary.description.getter();
}

uint64_t sub_10024E510()
{
  return Dictionary.init(dictionaryLiteral:)();
}

void sub_10024E520(Swift::Bool keepingCapacity)
{
}

uint64_t sub_10024E530()
{
  return type metadata accessor for Dictionary();
}

uint64_t sub_10024E540()
{
  return Dictionary.subscript.setter();
}

uint64_t sub_10024E550()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_10024E560()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_10024E570()
{
  return type metadata accessor for DefaultIndices();
}

uint64_t sub_10024E580()
{
  return Character.uppercased()()._countAndFlagsBits;
}

uint64_t sub_10024E590()
{
  return Character.isWhitespace.getter();
}

uint64_t sub_10024E5A0()
{
  return Character.isCurrencySymbol.getter();
}

uint64_t sub_10024E5B0()
{
  return BidirectionalCollection.last.getter();
}

uint64_t sub_10024E5C0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_10024E5D0()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_10024E5E0()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t sub_10024E5F0()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_10024E600()
{
  return static Comparable.> infix(_:_:)();
}

uint64_t sub_10024E610()
{
  return static Comparable.>= infix(_:_:)();
}

uint64_t sub_10024E620()
{
  return static Comparable.<= infix(_:_:)();
}

uint64_t sub_10024E630()
{
  return MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)();
}

uint64_t sub_10024E640()
{
  return MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)();
}

uint64_t sub_10024E650()
{
  return MutableCollection.swapAt(_:_:)();
}

uint64_t sub_10024E660()
{
  return MutableCollection.subscript.getter();
}

uint64_t sub_10024E670()
{
  return MutableCollection<>.partition(by:)();
}

uint64_t sub_10024E680()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_10024E690()
{
  return String.init(contentsOf:)();
}

NSString sub_10024E6A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10024E6B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10024E6C0()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_10024E6D0()
{
  return String.init(data:encoding:)();
}

uint64_t sub_10024E6E0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_10024E6F0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_10024E700()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10024E710()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_10024E720()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_10024E730()
{
  return String.utf8CString.getter();
}

uint64_t sub_10024E740()
{
  return static String._fromSubstring(_:)();
}

void sub_10024E750(Swift::Int a1)
{
}

uint64_t sub_10024E760()
{
  return static String._fromUTF8Repairing(_:)();
}

uint64_t sub_10024E770()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_10024E780()
{
  return String.hash(into:)();
}

uint64_t sub_10024E790()
{
  return String.count.getter();
}

uint64_t sub_10024E7A0()
{
  return String.index(after:)();
}

uint64_t sub_10024E7B0()
{
  return String.index(before:)();
}

uint64_t sub_10024E7C0()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t sub_10024E7D0()
{
  return String.index(_:offsetBy:)();
}

uint64_t sub_10024E7E0()
{
  return String.append<A>(contentsOf:)();
}

void sub_10024E7F0(Swift::String a1)
{
}

void sub_10024E800(Swift::String a1)
{
}

uint64_t sub_10024E820()
{
  return String.init(cString:)();
}

uint64_t sub_10024E830()
{
  return String.init(cString:)();
}

uint64_t sub_10024E840()
{
  return String.Iterator.next()().value._countAndFlagsBits;
}

Swift::Int sub_10024E850()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10024E860()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_10024E870()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_10024E880()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t sub_10024E890()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_10024E8A0()
{
  return String.UTF16View.index(_:offsetBy:)();
}

BOOL sub_10024E8B0(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

BOOL sub_10024E8C0(Swift::String a1)
{
  return String.hasSuffix(_:)(a1);
}

uint64_t sub_10024E8D0(Swift::String repeating, Swift::Int count)
{
  return String.init(repeating:count:)(repeating, count)._countAndFlagsBits;
}

uint64_t sub_10024E8E0()
{
  return String.init<A>(_:radix:uppercase:)();
}

uint64_t sub_10024E8F0()
{
  return String.subscript.getter();
}

uint64_t sub_10024E900()
{
  return String.init<A>(_:)();
}

uint64_t sub_10024E910()
{
  return String.init<A>(_:)();
}

uint64_t sub_10024E920()
{
  return String.subscript.getter();
}

uint64_t sub_10024E930()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_10024E940()
{
  return dispatch thunk of Sequence.underestimatedCount.getter();
}

uint64_t sub_10024E950()
{
  return dispatch thunk of Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t sub_10024E960()
{
  return Sequence.allSatisfy(_:)();
}

uint64_t sub_10024E970()
{
  return Sequence.enumerated()();
}

uint64_t sub_10024E980()
{
  return Sequence._copyContents(initializing:)();
}

uint64_t sub_10024E990()
{
  return Sequence.underestimatedCount.getter();
}

uint64_t sub_10024E9A0()
{
  return Sequence._copyToContiguousArray()();
}

uint64_t sub_10024E9B0()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t sub_10024E9C0()
{
  return Sequence.lazy.getter();
}

uint64_t sub_10024E9D0()
{
  return Sequence.reduce<A>(_:_:)();
}

uint64_t sub_10024E9E0()
{
  return Sequence<>.elementsEqual<A>(_:)();
}

uint64_t sub_10024E9F0()
{
  return Sequence<>.contains(_:)();
}

uint64_t sub_10024EA00()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_10024EA10()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_10024EA50()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10024EA60()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10024EA70()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10024EA80()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10024EA90()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10024EAA0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10024EAB0()
{
  return Array.description.getter();
}

uint64_t sub_10024EAC0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10024EAD0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

void sub_10024EAE0()
{
}

uint64_t sub_10024EAF0()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t sub_10024EB00()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10024EB10()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10024EB20()
{
  return Array.count.getter();
}

uint64_t sub_10024EB30()
{
  return Array.init(repeating:count:)();
}

uint64_t sub_10024EB40()
{
  return type metadata accessor for Array();
}

uint64_t sub_10024EB50()
{
  return Array.init<A>(_:)();
}

NSNumber sub_10024EB60()
{
  return Bool._bridgeToObjectiveC()();
}

Swift::Bool_optional sub_10024EB70(Swift::String a1)
{
  return Bool.init(_:)(a1);
}

uint64_t sub_10024EB80()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10024EB90()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_10024EBA0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_10024EBB0()
{
  return static TaskPriority.background.getter();
}

uint64_t sub_10024EBC0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10024EBD0()
{
  return type metadata accessor for TaskPriority();
}

void sub_10024EBE0()
{
}

uint64_t sub_10024EBF0()
{
  return static Task<>.isCancelled.getter();
}

uint64_t sub_10024EC10()
{
  return Double.description.getter();
}

uint64_t sub_10024EC20()
{
  return Double.write<A>(to:)();
}

uint64_t sub_10024EC30()
{
  return Set.description.getter();
}

uint64_t sub_10024EC40()
{
  return Set.init(minimumCapacity:)();
}

NSNumber sub_10024EC50()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_10024EC60()
{
  return dispatch thunk of Numeric.init<A>(exactly:)();
}

uint64_t sub_10024EC70()
{
  return RandomAccessCollection.index(_:offsetBy:limitedBy:)();
}

uint64_t sub_10024EC80()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_10024EC90()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_10024ECA0()
{
  return dispatch thunk of Collection.isEmpty.getter();
}

uint64_t sub_10024ECB0()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_10024ECD0()
{
  return Collection._failEarlyRangeCheck(_:bounds:)();
}

uint64_t sub_10024ECE0()
{
  return Collection._failEarlyRangeCheck(_:bounds:)();
}

uint64_t sub_10024ECF0()
{
  return Collection._failEarlyRangeCheck(_:bounds:)();
}

uint64_t sub_10024ED10()
{
  return Collection.first.getter();
}

uint64_t sub_10024ED20()
{
  return Collection.isEmpty.getter();
}

uint64_t sub_10024ED30()
{
  return Collection<>.indices.getter();
}

uint64_t sub_10024ED40()
{
  return Collection<>.firstIndex(of:)();
}

uint64_t sub_10024ED50()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_10024ED80()
{
  return RangeReplaceableCollection.insert(_:at:)();
}

uint64_t sub_10024ED90()
{
  return RangeReplaceableCollection.init(repeating:count:)();
}

uint64_t sub_10024EDA0()
{
  return RangeReplaceableCollection.init<A>(_:)();
}

uint64_t sub_10024EDD0()
{
  return RangeReplaceableCollection<>.removeLast()();
}

uint64_t sub_10024EDE0()
{
  return RangeReplaceableCollection<>.removeAll(where:)();
}

uint64_t sub_10024EDF0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10024EE00()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10024EE10()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10024EE20()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10024EE30()
{
  return static os_log_type_t.default.getter();
}

void sub_10024EE40()
{
}

uint64_t sub_10024EE50()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t sub_10024EE60()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10024EE70()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_10024EE80()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10024EE90()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10024EEB0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10024EEC0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10024EED0()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_10024EEE0()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t sub_10024EEF0()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

void sub_10024EF00()
{
}

void sub_10024EF10()
{
}

Swift::Int sub_10024EF20()
{
  return OS_dispatch_semaphore.signal()();
}

NSNumber sub_10024EF30(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber sub_10024EF40(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_10024EF50()
{
  return NSDecimal.FormatStyle.Currency.init(code:locale:)();
}

uint64_t sub_10024EF60()
{
  return type metadata accessor for NSDecimal.FormatStyle.Currency();
}

uint64_t sub_10024EF70()
{
  return NSDecimal.description.getter();
}

void sub_10024EF80(NSDecimal *retstr@<X8>, Swift::Double floatLiteral@<D0>)
{
}

void sub_10024EF90(NSDecimal *retstr@<X8>, Swift::Int integerLiteral@<X0>)
{
}

void sub_10024EFA0(NSDecimalNumber *retstr@<X8>)
{
}

uint64_t sub_10024EFB0()
{
  return static NSDecimal.* infix(_:_:)();
}

uint64_t sub_10024EFC0()
{
  return NSDecimal.init(string:locale:)();
}

uint64_t sub_10024EFD0()
{
  return NSDecimal.formatted<A>(_:)();
}

void sub_10024EFE0(NSDecimal *retstr@<X8>, Swift::Double a2@<D0>)
{
}

void sub_10024EFF0(NSDecimal *retstr@<X8>, Swift::Int a2@<X0>)
{
}

uint64_t sub_10024F010()
{
  return UnsafeMutablePointer.deinitialize(count:)();
}

uint64_t sub_10024F020()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_10024F030()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10024F040()
{
  return UnsafeMutableBufferPointer.initialize<A>(from:)();
}

uint64_t sub_10024F050()
{
  return UnsafeMutableBufferPointer.baseAddress.getter();
}

uint64_t sub_10024F060()
{
  return Substring.lowercased()()._countAndFlagsBits;
}

uint64_t sub_10024F070()
{
  return Substring.index(after:)();
}

uint64_t sub_10024F080()
{
  return Substring.index(before:)();
}

uint64_t sub_10024F090()
{
  return Substring.index(_:offsetBy:limitedBy:)();
}

uint64_t sub_10024F0A0()
{
  return Substring.UTF8View.subscript.getter();
}

uint64_t sub_10024F0B0()
{
  return Substring.distance(from:to:)();
}

uint64_t sub_10024F0C0()
{
  return Substring.subscript.getter();
}

uint64_t sub_10024F0D0()
{
  return Substring.subscript.getter();
}

uint64_t sub_10024F0E0()
{
  return dispatch thunk of IteratorProtocol.next()();
}

NSNumber sub_10024F0F0()
{
  return UInt._bridgeToObjectiveC()();
}

uint64_t sub_10024F100()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10024F110()
{
  return static UnsafeMutableRawBufferPointer.allocate(byteCount:alignment:)();
}

uint64_t sub_10024F120()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10024F130()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_10024F140()
{
  return StringProtocol.capitalized.getter();
}

uint64_t sub_10024F150()
{
  return StringProtocol.localizedLowercase.getter();
}

uint64_t sub_10024F160()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_10024F170()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_10024F180()
{
  return StringProtocol.removingPercentEncoding.getter();
}

uint64_t sub_10024F190()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_10024F1A0()
{
  return BinaryInteger.init(_:format:lenient:)();
}

uint64_t sub_10024F1C0()
{
  return dispatch thunk of static BinaryInteger.& infix(_:_:)();
}

uint64_t sub_10024F1D0()
{
  return dispatch thunk of static BinaryInteger.| infix(_:_:)();
}

uint64_t sub_10024F1E0()
{
  return dispatch thunk of static BinaryInteger.>> infix<A>(_:_:)();
}

uint64_t sub_10024F1F0()
{
  return dispatch thunk of static BinaryInteger.<< infix<A>(_:_:)();
}

uint64_t sub_10024F200()
{
  return dispatch thunk of BinaryInteger._lowWord.getter();
}

uint64_t sub_10024F210()
{
  return dispatch thunk of BinaryInteger.bitWidth.getter();
}

uint64_t sub_10024F220()
{
  return dispatch thunk of static BinaryInteger.isSigned.getter();
}

uint64_t sub_10024F230()
{
  return BinaryInteger.description.getter();
}

uint64_t sub_10024F240()
{
  return dispatch thunk of BinaryInteger.init<A>(_:)();
}

uint64_t sub_10024F250()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10024F260()
{
  return type metadata accessor for ArraySlice();
}

uint64_t sub_10024F280()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10024F290()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10024F2A0()
{
  return _HashTable.occupiedBucket(after:)();
}

uint64_t sub_10024F2B0()
{
  return _expectEnd<A>(of:is:)();
}

Swift::Int sub_10024F2C0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10024F2D0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10024F2E0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10024F2F0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10024F300()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10024F310()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_10024F320()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

void sub_10024F330(Swift::Int a1)
{
}

uint64_t sub_10024F340()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10024F350()
{
  return type metadata accessor for LazySequence();
}

uint64_t sub_10024F360()
{
  return StaticString.description.getter();
}

uint64_t sub_10024F370()
{
  return type metadata accessor for Zip2Sequence();
}

uint64_t sub_10024F380()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10024F390()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10024F3A0()
{
  return static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)();
}

uint64_t sub_10024F3B0()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_10024F3C0()
{
  return type metadata accessor for DecodingError.Context();
}

uint64_t sub_10024F3D0()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_10024F3E0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10024F3F0()
{
  return repeatElement<A>(_:count:)();
}

uint64_t sub_10024F400()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t _s25ASOctaneSupportXPCService4HeapV10startIndexSivg_0()
{
  return ContiguousArray.startIndex.getter();
}

uint64_t sub_10024F420()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10024F430()
{
  return ContiguousArray.init(arrayLiteral:)();
}

void sub_10024F440(Swift::Int a1)
{
}

uint64_t sub_10024F450()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10024F460()
{
  return specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

void sub_10024F470()
{
}

uint64_t sub_10024F480()
{
  return static ContiguousArray._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10024F490()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10024F4A0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _s25ASOctaneSupportXPCService4HeapV19underestimatedCountSivg_0()
{
  return ContiguousArray.count.getter();
}

uint64_t sub_10024F4C0()
{
  return ContiguousArray.append<A>(contentsOf:)();
}

uint64_t sub_10024F4D0()
{
  return ContiguousArray.append(_:)();
}

void sub_10024F4E0(Swift::Bool keepingCapacity)
{
}

uint64_t sub_10024F4F0()
{
  return ContiguousArray.init(repeating:count:)();
}

uint64_t sub_10024F500()
{
  return ContiguousArray.init()();
}

uint64_t sub_10024F510()
{
  return type metadata accessor for ContiguousArray();
}

uint64_t sub_10024F520()
{
  return ContiguousArray.subscript.getter();
}

uint64_t _s25ASOctaneSupportXPCService4HeapVyxSicig_0()
{
  return ContiguousArray.subscript.getter();
}

uint64_t sub_10024F540()
{
  return static ContinuousClock.Instant.now.getter();
}

uint64_t sub_10024F550()
{
  return ContinuousClock.Instant.advanced(by:)();
}

uint64_t sub_10024F560()
{
  return ContinuousClock.Instant.duration(to:)();
}

uint64_t sub_10024F570()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t sub_10024F580()
{
  return ContinuousClock.init()();
}

uint64_t sub_10024F590()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t sub_10024F5A0()
{
  return type metadata accessor for LazyMapSequence();
}

uint64_t sub_10024F5B0()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_10024F5C0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10024F5D0()
{
  return dispatch thunk of static FixedWidthInteger.bitWidth.getter();
}

uint64_t sub_10024F5E0()
{
  return dispatch thunk of FixedWidthInteger.littleEndian.getter();
}

uint64_t sub_10024F5F0()
{
  return dispatch thunk of FixedWidthInteger.leadingZeroBitCount.getter();
}

uint64_t sub_10024F600()
{
  return dispatch thunk of static FixedWidthInteger.max.getter();
}

uint64_t sub_10024F610()
{
  return dispatch thunk of FixedWidthInteger.bigEndian.getter();
}

uint64_t sub_10024F620()
{
  return dispatch thunk of _AnyCollectionBox.subscript.getter();
}

BOOL sub_10024F630(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

void sub_10024F640()
{
}

uint64_t sub_10024F650()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_10024F660()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10024F670()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10024F680()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_10024F690()
{
  return dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
}

uint64_t sub_10024F6A0()
{
  return dispatch thunk of static AdditiveArithmetic.zero.getter();
}

uint64_t sub_10024F6B0()
{
  return EnumeratedSequence.makeIterator()();
}

uint64_t sub_10024F6C0()
{
  return EnumeratedSequence.Iterator.next()();
}

uint64_t sub_10024F6D0()
{
  return type metadata accessor for EnumeratedSequence.Iterator();
}

uint64_t sub_10024F6E0()
{
  return type metadata accessor for EnumeratedSequence();
}

uint64_t sub_10024F6F0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10024F700()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10024F710()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10024F720()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10024F730()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10024F740()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

uint64_t sub_10024F750()
{
  return LazySequenceProtocol.map<A>(_:)();
}

uint64_t sub_10024F760()
{
  return ManagedBufferPointer.init(unsafeBufferObject:)();
}

uint64_t sub_10024F770()
{
  return ManagedBufferPointer.init(bufferClass:minimumCapacity:makingHeaderWith:)();
}

uint64_t sub_10024F780()
{
  return ManagedBufferPointer.buffer.getter();
}

Swift::Int sub_10024F790(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10024F7A0()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_10024F7B0()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_10024F7C0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10024F7D0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10024F7E0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10024F7F0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10024F800()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_10024F810()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10024F820()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10024F830()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10024F840()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10024F850()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10024F860()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10024F870()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_10024F880()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10024F890()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_10024F8A0()
{
  return type metadata accessor for KeyedDecodingContainer();
}

uint64_t sub_10024F8B0()
{
  return KeyedEncodingContainer.nestedUnkeyedContainer(forKey:)();
}

uint64_t sub_10024F8C0()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_10024F8D0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10024F8E0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10024F8F0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10024F900()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10024F910()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_10024F920()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10024F930()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10024F940()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10024F950()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10024F960()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10024F970()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10024F980()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_10024F990()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10024F9A0()
{
  return type metadata accessor for KeyedEncodingContainer();
}

Swift::Int sub_10024F9C0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_10024F9D0()
{
  return _stringCompareInternal(_:_:_:_:expecting:)();
}

uint64_t sub_10024F9E0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10024F9F0()
{
  return dispatch thunk of UnkeyedEncodingContainer.nestedContainer<A>(keyedBy:)();
}

uint64_t sub_10024FA00()
{
  return dispatch thunk of UnkeyedEncodingContainer.encode<A>(_:)();
}

uint64_t sub_10024FA10()
{
  return _getErrorEmbeddedNSError<A>(_:)();
}

uint64_t sub_10024FA20()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_10024FA30()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_10024FA40()
{
  return dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
}

uint64_t sub_10024FA50()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_10024FA60()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10024FA70()
{
  return dispatch thunk of SingleValueDecodingContainer.decode(_:)();
}

uint64_t sub_10024FA80()
{
  return dispatch thunk of SingleValueDecodingContainer.decode(_:)();
}

uint64_t sub_10024FA90()
{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

uint64_t sub_10024FAA0()
{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

uint64_t sub_10024FAB0()
{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

uint64_t sub_10024FAC0()
{
  return dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
}

uint64_t sub_10024FAD0()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_10024FAE0()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_10024FB00()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_10024FB20()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_10024FB30()
{
  return dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
}

uint64_t sub_10024FB40()
{
  return zip<A, B>(_:_:)();
}

uint64_t sub_10024FB50()
{
  return swap<A>(_:_:)();
}

uint64_t sub_10024FB60()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10024FB70()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10024FB80()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10024FB90()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10024FBA0()
{
  return Error._code.getter();
}

uint64_t sub_10024FBB0()
{
  return Error._domain.getter();
}

uint64_t sub_10024FBC0()
{
  return Error._userInfo.getter();
}

uint64_t sub_10024FBE0()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_10024FBF0()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_10024FC00()
{
  return Hasher.init(_seed:)();
}

uint64_t sub_10024FC10()
{
  return Hasher.combine(bytes:)();
}

void sub_10024FC20(Swift::UInt a1)
{
}

void sub_10024FC30(Swift::UInt8 a1)
{
}

void sub_10024FC40(Swift::UInt16 a1)
{
}

void sub_10024FC50(Swift::UInt32 a1)
{
}

void sub_10024FC60(Swift::UInt64 a1)
{
}

Swift::Int sub_10024FC70()
{
  return Hasher._finalize()();
}

uint64_t sub_10024FC80()
{
  return Mirror.init(reflecting:)();
}

uint64_t sub_10024FC90()
{
  return Mirror.subjectType.getter();
}

uint64_t sub_10024FCA0()
{
  return type metadata accessor for Mirror.DisplayStyle();
}

uint64_t sub_10024FCB0()
{
  return type metadata accessor for Mirror.AncestorRepresentation();
}

uint64_t sub_10024FCC0()
{
  return Mirror.children.getter();
}

uint64_t sub_10024FCD0()
{
  return type metadata accessor for Mirror();
}

uint64_t sub_10024FCE0()
{
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

uint64_t sub_10024FCF0()
{
  return type metadata accessor for Result();
}

uint64_t sub_10024FD00()
{
  return dispatch thunk of Decoder.codingPath.getter();
}

uint64_t sub_10024FD10()
{
  return dispatch thunk of Decoder.singleValueContainer()();
}

uint64_t sub_10024FD20()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10024FD30()
{
  return dispatch thunk of Encoder.singleValueContainer()();
}

uint64_t sub_10024FD40()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_10024FD50()
{
  return static AnyIndex.== infix(_:_:)();
}

uint64_t sub_10024FD60()
{
  return Duration.formatted()()._countAndFlagsBits;
}

uint64_t sub_10024FD70()
{
  return static Duration.zero.getter();
}

uint64_t sub_10024FD80()
{
  return static Duration.seconds(_:)();
}

uint64_t sub_10024FD90()
{
  return type metadata accessor for Repeated();
}

uint64_t sub_10024FDC0()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return _CFNumberGetType(number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return _CFStringGetCharactersPtr(theString);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return _CFStringGetFastestEncoding(theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

uint64_t CGSVGAttributeCreateWithColor()
{
  return _CGSVGAttributeCreateWithColor();
}

uint64_t CGSVGAttributeCreateWithFloat()
{
  return _CGSVGAttributeCreateWithFloat();
}

uint64_t CGSVGAttributeCreateWithString()
{
  return _CGSVGAttributeCreateWithString();
}

uint64_t CGSVGAttributeMapCreate()
{
  return _CGSVGAttributeMapCreate();
}

uint64_t CGSVGAttributeMapSetAttribute()
{
  return _CGSVGAttributeMapSetAttribute();
}

uint64_t CGSVGColorCreateDisplayP3()
{
  return _CGSVGColorCreateDisplayP3();
}

uint64_t CGSVGDocumentAddNamedStyle()
{
  return _CGSVGDocumentAddNamedStyle();
}

uint64_t CGSVGDocumentCreateFromData()
{
  return _CGSVGDocumentCreateFromData();
}

uint64_t CGSVGDocumentWriteToData()
{
  return _CGSVGDocumentWriteToData();
}

OSStatus CMSEncoderAddSigners(CMSEncoderRef cmsEncoder, CFTypeRef signerOrArray)
{
  return _CMSEncoderAddSigners(cmsEncoder, signerOrArray);
}

OSStatus CMSEncoderCopyEncodedContent(CMSEncoderRef cmsEncoder, CFDataRef *encodedContentOut)
{
  return _CMSEncoderCopyEncodedContent(cmsEncoder, encodedContentOut);
}

OSStatus CMSEncoderCreate(CMSEncoderRef *cmsEncoderOut)
{
  return _CMSEncoderCreate(cmsEncoderOut);
}

OSStatus CMSEncoderSetSignerAlgorithm(CMSEncoderRef cmsEncoder, CFStringRef digestAlgorithm)
{
  return _CMSEncoderSetSignerAlgorithm(cmsEncoder, digestAlgorithm);
}

OSStatus CMSEncoderUpdateContent(CMSEncoderRef cmsEncoder, const void *content, size_t contentLen)
{
  return _CMSEncoderUpdateContent(cmsEncoder, content, contentLen);
}

void NSDecimalRound(NSDecimal *result, const NSDecimal *number, NSInteger scale, NSRoundingMode roundingMode)
{
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return _NSHashGet(table, pointer);
}

void NSHashInsert(NSHashTable *table, const void *pointer)
{
}

void NSLog(NSString *format, ...)
{
}

void NSResetHashTable(NSHashTable *table)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

OSStatus SecAsn1AllocCopy(SecAsn1CoderRef coder, const void *src, size_t len, SecAsn1Item *dest)
{
  return _SecAsn1AllocCopy(coder, src, len, dest);
}

OSStatus SecAsn1CoderCreate(SecAsn1CoderRef *coder)
{
  return _SecAsn1CoderCreate(coder);
}

OSStatus SecAsn1CoderRelease(SecAsn1CoderRef coder)
{
  return _SecAsn1CoderRelease(coder);
}

OSStatus SecAsn1EncodeItem(SecAsn1CoderRef coder, const void *src, const SecAsn1Template *templates, SecAsn1Item *dest)
{
  return _SecAsn1EncodeItem(coder, src, templates, dest);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return _SecCopyErrorMessageString(status, reserved);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return _SecGenerateSelfSignedCertificate();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return _SecKeyCreateWithData(keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return _SecKeyVerifySignature(key, algorithm, signedData, signature, error);
}

OSStatus SecPKCS12Import(CFDataRef pkcs12_data, CFDictionaryRef options, CFArrayRef *items)
{
  return _SecPKCS12Import(pkcs12_data, options, items);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

{
}

{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return __swift_isClassOrObjCExistentialType();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

uint32_t arc4random(void)
{
  return _arc4random();
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

uint64_t container_system_path_for_identifier()
{
  return _container_system_path_for_identifier();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dup(int a1)
{
  return _dup(a1);
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getpeername(a1, a2, a3);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getsockname(a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return _getsockopt(a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return _if_nametoindex(a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return _kevent(kq, changelist, nchanges, eventlist, nevents, timeout);
}

int kqueue(void)
{
  return _kqueue();
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

long double log2(long double __x)
{
  return _log2(__x);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

Class object_getClass(id a1)
{
  return _object_getClass(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return _pthread_cond_broadcast(a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return _pthread_cond_timedwait(a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return _pthread_detach(a1);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return _pthread_equal(a1, a2);
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return _pthread_getname_np(a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return _pthread_getspecific(a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return _pthread_key_create(a1, a2);
}

int pthread_key_delete(pthread_key_t a1)
{
  return _pthread_key_delete(a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return _pthread_mutexattr_settype(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

void pthread_yield_np(void)
{
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return _realloc(__ptr, __size);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return _recvmsg(a1, a2, a3);
}

int sendfile(int a1, int a2, off_t a3, off_t *a4, sf_hdtr *a5, int a6)
{
  return _sendfile(a1, a2, a3, a4, a5, a6);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return _sendmsg(a1, a2, a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int shutdown(int a1, int a2)
{
  return _shutdown(a1, a2);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_bind_text16(sqlite3_stmt *a1, int a2, const void *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text16(a1, a2, a3, a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return _sqlite3_changes(a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return _sqlite3_clear_bindings(a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return _sqlite3_close_v2(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

const char *__cdecl sqlite3_column_decltype(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_column_decltype(a1, a2);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return _sqlite3_column_name(a1, N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return _sqlite3_create_function(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return _sqlite3_create_function_v2(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal, xDestroy);
}

int sqlite3_errcode(sqlite3 *db)
{
  return _sqlite3_errcode(db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return _sqlite3_extended_result_codes(a1, onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return _sqlite3_file_control(a1, zDbName, op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return _sqlite3_next_stmt(pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return _sqlite3_sql(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return _sqlite3_stmt_readonly(pStmt);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_bufferAllocate()
{
  return _swift_bufferAllocate();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return _swift_getFunctionTypeMetadata1();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassFromObject()
{
  return _swift_getObjCClassFromObject();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return _swift_isUniquelyReferenced_nonNull();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_modifyAtReferenceWritableKeyPath()
{
  return _swift_modifyAtReferenceWritableKeyPath();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return _swift_setAtReferenceWritableKeyPath();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_unownedRelease()
{
  return _swift_unownedRelease();
}

uint64_t swift_unownedRetain()
{
  return _swift_unownedRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

uint64_t sysconf(int a1)
{
  return _sysconf(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return _writev(a1, a2, a3);
}

id objc_msgSend_JSONObjectForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectForColumnIndex:");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_SQL(void *a1, const char *a2, ...)
{
  return _[a1 SQL];
}

id objc_msgSend_SQLForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SQLForEntityClass:");
}

id objc_msgSend_SQLJoinClausesForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SQLJoinClausesForEntityClass:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForColumnIndex:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDForColumnIndex:");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__addKnownDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addKnownDatabasePath:");
}

id objc_msgSend__aggregateValueForProperty_function_predicate_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aggregateValueForProperty:function:predicate:onConnection:");
}

id objc_msgSend__baseQueryForKeyID_additionalCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_baseQueryForKeyID:additionalCapacity:");
}

id objc_msgSend__close(void *a1, const char *a2, ...)
{
  return _[a1 _close];
}

id objc_msgSend__columnTypeForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_columnTypeForColumnIndex:");
}

id objc_msgSend__comparisonTypeString(void *a1, const char *a2, ...)
{
  return _[a1 _comparisonTypeString];
}

id objc_msgSend__containerURL(void *a1, const char *a2, ...)
{
  return _[a1 _containerURL];
}

id objc_msgSend__copyErrorForOSStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyErrorForOSStatus:");
}

id objc_msgSend__copyTableClusteredValuesWithValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyTableClusteredValuesWithValues:");
}

id objc_msgSend__createDirectoryAtBaseURL_withPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createDirectoryAtBaseURL:withPathComponent:");
}

id objc_msgSend__dateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _dateFormatter];
}

id objc_msgSend__declaredTypeForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_declaredTypeForColumnIndex:");
}

id objc_msgSend__deleteRowFromTable_usingColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteRowFromTable:usingColumn:");
}

id objc_msgSend__encodePayload(void *a1, const char *a2, ...)
{
  return _[a1 _encodePayload];
}

id objc_msgSend__encodePayloadForIAPReceipt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encodePayloadForIAPReceipt:");
}

id objc_msgSend__executeStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeStatement:error:");
}

id objc_msgSend__executeWithError_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeWithError:usingBlock:");
}

id objc_msgSend__finalizeAllStatements(void *a1, const char *a2, ...)
{
  return _[a1 _finalizeAllStatements];
}

id objc_msgSend__flushAfterTransactionBlocks(void *a1, const char *a2, ...)
{
  return _[a1 _flushAfterTransactionBlocks];
}

id objc_msgSend__insertValues_intoTable_withPersistentID_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertValues:intoTable:withPersistentID:onConnection:");
}

id objc_msgSend__isKnownDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isKnownDatabasePath:");
}

id objc_msgSend__modifyUsingTransactionClass_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_modifyUsingTransactionClass:withBlock:");
}

id objc_msgSend__newSelectSQLWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSelectSQLWithProperties:");
}

id objc_msgSend__newSelectSQLWithProperties_columns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSelectSQLWithProperties:columns:");
}

id objc_msgSend__open(void *a1, const char *a2, ...)
{
  return _[a1 _open];
}

id objc_msgSend__performMigrationIfNeededForStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performMigrationIfNeededForStore:");
}

id objc_msgSend__performResetAfterCorruptionError(void *a1, const char *a2, ...)
{
  return _[a1 _performResetAfterCorruptionError];
}

id objc_msgSend__prepareStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareStatement:error:");
}

id objc_msgSend__readUsingSession_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readUsingSession:withBlock:");
}

id objc_msgSend__receiptAttributeWithCoder_type_version_IA5String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receiptAttributeWithCoder:type:version:IA5String:");
}

id objc_msgSend__receiptAttributeWithCoder_type_version_UTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receiptAttributeWithCoder:type:version:UTF8String:");
}

id objc_msgSend__receiptAttributeWithCoder_type_version_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receiptAttributeWithCoder:type:version:data:");
}

id objc_msgSend__receiptAttributeWithCoder_type_version_integer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receiptAttributeWithCoder:type:version:integer:");
}

id objc_msgSend__reentrantSafePerformBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reentrantSafePerformBlock:");
}

id objc_msgSend__removeKnownDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeKnownDatabasePath:");
}

id objc_msgSend__resetAfterCorruptionError(void *a1, const char *a2, ...)
{
  return _[a1 _resetAfterCorruptionError];
}

id objc_msgSend__resetAfterIOError(void *a1, const char *a2, ...)
{
  return _[a1 _resetAfterIOError];
}

id objc_msgSend__saveValueToKeychain_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveValueToKeychain:forKey:error:");
}

id objc_msgSend__setUserVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUserVersion:");
}

id objc_msgSend__smallestInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_smallestInt:");
}

id objc_msgSend__statementForPreparedStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_statementForPreparedStatement:error:");
}

id objc_msgSend__transformedSQLForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformedSQLForEntityClass:");
}

id objc_msgSend__valueFromKeychainForKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_valueFromKeychainForKey:error:");
}

id objc_msgSend__verifiedStatementForPreparedStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifiedStatementForPreparedStatement:error:");
}

id objc_msgSend__verifiedStatementForSQL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifiedStatementForSQL:error:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applyBinding_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyBinding:atIndex:");
}

id objc_msgSend_applyTransformBinding_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyTransformBinding:atIndex:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bindArray_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindArray:atPosition:");
}

id objc_msgSend_bindData_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindData:atPosition:");
}

id objc_msgSend_bindDictionary_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindDictionary:atPosition:");
}

id objc_msgSend_bindDouble_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindDouble:atPosition:");
}

id objc_msgSend_bindInt64_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindInt64:atPosition:");
}

id objc_msgSend_bindNullAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindNullAtPosition:");
}

id objc_msgSend_bindNumber_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindNumber:atPosition:");
}

id objc_msgSend_bindString_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindString:atPosition:");
}

id objc_msgSend_bindUUID_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindUUID:atPosition:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cacheSize(void *a1, const char *a2, ...)
{
  return _[a1 cacheSize];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_clearBindings(void *a1, const char *a2, ...)
{
  return _[a1 clearBindings];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_columnIndexForColumnName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columnIndexForColumnName:");
}

id objc_msgSend_comparisonType(void *a1, const char *a2, ...)
{
  return _[a1 comparisonType];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionNeedsResetForCorruption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionNeedsResetForCorruption:");
}

id objc_msgSend_connectionNeedsResetForReopen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionNeedsResetForReopen:");
}

id objc_msgSend_connectionPointer(void *a1, const char *a2, ...)
{
  return _[a1 connectionPointer];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copySelectSQLWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copySelectSQLWithProperties:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createOrMigrateStoreUsingSchema_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOrMigrateStoreUsingSchema:");
}

id objc_msgSend_currentSchemaVersion(void *a1, const char *a2, ...)
{
  return _[a1 currentSchemaVersion];
}

id objc_msgSend_dataForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForColumnIndex:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_databaseEntityClass(void *a1, const char *a2, ...)
{
  return _[a1 databaseEntityClass];
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return _[a1 databaseID];
}

id objc_msgSend_databasePath(void *a1, const char *a2, ...)
{
  return _[a1 databasePath];
}

id objc_msgSend_databaseTable(void *a1, const char *a2, ...)
{
  return _[a1 databaseTable];
}

id objc_msgSend_dateForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateForColumnIndex:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultProperties(void *a1, const char *a2, ...)
{
  return _[a1 defaultProperties];
}

id objc_msgSend_deleteFromDatabase(void *a1, const char *a2, ...)
{
  return _[a1 deleteFromDatabase];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return _[a1 deviceID];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithSharedKeySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithSharedKeySet:");
}

id objc_msgSend_disambiguatedSQLForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disambiguatedSQLForProperty:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_doubleForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleForColumnIndex:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_encryptionKeyId(void *a1, const char *a2, ...)
{
  return _[a1 encryptionKeyId];
}

id objc_msgSend_entityClass(void *a1, const char *a2, ...)
{
  return _[a1 entityClass];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateMemoryEntitiesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateMemoryEntitiesUsingBlock:");
}

id objc_msgSend_enumerateMemoryEntitiesWithProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateMemoryEntitiesWithProperties:usingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratePersistentIDsAndProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratePersistentIDsAndProperties:usingBlock:");
}

id objc_msgSend_enumeratePersistentIDsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratePersistentIDsUsingBlock:");
}

id objc_msgSend_enumerateRowsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateRowsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_executeQuery_withResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:withResults:");
}

id objc_msgSend_executeStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeStatement:error:");
}

id objc_msgSend_executeStatement_error_bindings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeStatement:error:bindings:");
}

id objc_msgSend_executeWithError_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeWithError:usingBlock:");
}

id objc_msgSend_externalPropertyValues(void *a1, const char *a2, ...)
{
  return _[a1 externalPropertyValues];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_finalizeStatement(void *a1, const char *a2, ...)
{
  return _[a1 finalizeStatement];
}

id objc_msgSend_firstInt64Value(void *a1, const char *a2, ...)
{
  return _[a1 firstInt64Value];
}

id objc_msgSend_foreignDatabaseColumnForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignDatabaseColumnForProperty:");
}

id objc_msgSend_foreignDatabaseTableForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignDatabaseTableForProperty:");
}

id objc_msgSend_foreignDatabaseTablesToDelete(void *a1, const char *a2, ...)
{
  return _[a1 foreignDatabaseTablesToDelete];
}

id objc_msgSend_foreignKeyColumnForTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignKeyColumnForTable:");
}

id objc_msgSend_getValuesForProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValuesForProperties:");
}

id objc_msgSend_hasRows(void *a1, const char *a2, ...)
{
  return _[a1 hasRows];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashTableWithOptions:");
}

id objc_msgSend_inMemoryDatabaseFlag(void *a1, const char *a2, ...)
{
  return _[a1 inMemoryDatabaseFlag];
}

id objc_msgSend_inMemoryDatabaseSharedCacheFlag(void *a1, const char *a2, ...)
{
  return _[a1 inMemoryDatabaseSharedCacheFlag];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initOnConnection_descriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOnConnection:descriptor:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithConnection_SQL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:SQL:");
}

id objc_msgSend_initWithConnection_schemaName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:schemaName:");
}

id objc_msgSend_initWithDatabaseEntity_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseEntity:properties:");
}

id objc_msgSend_initWithDatabaseID_propertyValues_externalPropertyValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseID:propertyValues:externalPropertyValues:");
}

id objc_msgSend_initWithDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabasePath:");
}

id objc_msgSend_initWithEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityClass:");
}

id objc_msgSend_initWithEntityClass_memoryEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityClass:memoryEntityClass:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLongLong:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithPersistentID_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersistentID:onConnection:");
}

id objc_msgSend_initWithStatement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStatement:");
}

id objc_msgSend_initWithStatement_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStatement:onConnection:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_int64ForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "int64ForColumnIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isNegative(void *a1, const char *a2, ...)
{
  return _[a1 isNegative];
}

id objc_msgSend_isReadOnly(void *a1, const char *a2, ...)
{
  return _[a1 isReadOnly];
}

id objc_msgSend_joinClauseForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinClauseForProperty:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_limitCount(void *a1, const char *a2, ...)
{
  return _[a1 limitCount];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_matchesNull(void *a1, const char *a2, ...)
{
  return _[a1 matchesNull];
}

id objc_msgSend_memoryEntityClass(void *a1, const char *a2, ...)
{
  return _[a1 memoryEntityClass];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberForColumnIndex:");
}

id objc_msgSend_numberValueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberValueForProperty:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return _[a1 objCType];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oct_dataWithHexString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oct_dataWithHexString:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performSavepoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSavepoint:");
}

id objc_msgSend_performTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTransaction:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _[a1 persistentID];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _[a1 predicate];
}

id objc_msgSend_predicateMatchingAnyPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingAnyPredicates:");
}

id objc_msgSend_predicateWithProperty_equalToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithProperty:equalToValue:");
}

id objc_msgSend_predicateWithProperty_value_comparisonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithProperty:value:comparisonType:");
}

id objc_msgSend_predicates(void *a1, const char *a2, ...)
{
  return _[a1 predicates];
}

id objc_msgSend_property(void *a1, const char *a2, ...)
{
  return _[a1 property];
}

id objc_msgSend_propertyValues(void *a1, const char *a2, ...)
{
  return _[a1 propertyValues];
}

id objc_msgSend_protectionType(void *a1, const char *a2, ...)
{
  return _[a1 protectionType];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _[a1 query];
}

id objc_msgSend_queryOnConnection_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryOnConnection:predicate:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_reloadFromDatabaseEntity_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadFromDatabaseEntity:properties:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_schemaName(void *a1, const char *a2, ...)
{
  return _[a1 schemaName];
}

id objc_msgSend_sessionClass(void *a1, const char *a2, ...)
{
  return _[a1 sessionClass];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setCacheSizeWithNumberOfKilobytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheSizeWithNumberOfKilobytes:");
}

id objc_msgSend_setDatabaseID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabaseID:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOrderingDirections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrderingDirections:");
}

id objc_msgSend_setOrderingProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrderingProperties:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setReadOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReadOnly:");
}

id objc_msgSend_setResourceValues_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResourceValues:error:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTransporterConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransporterConfiguration:");
}

id objc_msgSend_setValues_forExternalProperties_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:forExternalProperties:count:");
}

id objc_msgSend_setValues_forProperties_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:forProperties:count:");
}

id objc_msgSend_setValuesWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValuesWithDictionary:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_sharedKeySetForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedKeySetForKeys:");
}

id objc_msgSend_sqlite3_stmt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sqlite3_stmt");
}

id objc_msgSend_storeDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 storeDescriptor];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_stringForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForColumnIndex:");
}

id objc_msgSend_stringForColumnName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForColumnName:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return _[a1 success];
}

id objc_msgSend_tableExists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableExists:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_transactionClass(void *a1, const char *a2, ...)
{
  return _[a1 transactionClass];
}

id objc_msgSend_transactions(void *a1, const char *a2, ...)
{
  return _[a1 transactions];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _[a1 transform];
}

id objc_msgSend_transformSQLWithRoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformSQLWithRoot:");
}

id objc_msgSend_transporterConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 transporterConfiguration];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _[a1 values];
}