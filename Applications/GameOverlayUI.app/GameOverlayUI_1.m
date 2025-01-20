uint64_t storeEnumTagSinglePayload for Game(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000AE110);
}

uint64_t sub_1000AE110(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100005B18(&qword_100140C48);
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1000AE1BC()
{
  sub_1000AE27C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000AE27C()
{
  if (!qword_100143ED8)
  {
    type metadata accessor for Date();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100143ED8);
    }
  }
}

ValueMetadata *type metadata accessor for SupportedPlatforms()
{
  return &type metadata for SupportedPlatforms;
}

uint64_t getEnumTagSinglePayload for Game.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Game.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *result = a2 + 11;
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
        JUMPOUT(0x1000AE440);
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
          *result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Game.CodingKeys()
{
  return &type metadata for Game.CodingKeys;
}

unint64_t sub_1000AE47C()
{
  unint64_t result = qword_100143F30;
  if (!qword_100143F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100143F30);
  }
  return result;
}

unint64_t sub_1000AE4D4()
{
  unint64_t result = qword_100143F38;
  if (!qword_100143F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100143F38);
  }
  return result;
}

unint64_t sub_1000AE52C()
{
  unint64_t result = qword_100143F40;
  if (!qword_100143F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100143F40);
  }
  return result;
}

uint64_t sub_1000AE580(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4449656C646E7562 && a2 == 0xE800000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x44496D616461 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x79616C507473616CLL && a2 == 0xEC00000074416465 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001000FD7E0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6C6174736E497369 && a2 == 0xEB0000000064656CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6564616372417369 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001000FD800 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001000FD820 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000001000FD840 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001000FD860 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x706D65546E6F6369 && a2 == 0xEC0000006574616CLL)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

uint64_t sub_1000AEA58(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  unsigned int v4 = (uint64_t *)(a1 + 32);
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

uint64_t sub_1000AEA90(unint64_t *a1)
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

uint64_t sub_1000AEAD4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000AEB30()
{
  uint64_t v1 = sub_100005B18(&qword_100143F58);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_1000AEBC4(unint64_t a1, uint64_t a2)
{
  sub_100005B18(&qword_100143F58);

  sub_1000ACB5C(a1, a2);
}

uint64_t sub_1000AEC48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000AEC58()
{
  return swift_release();
}

unint64_t sub_1000AEC60()
{
  unint64_t result = qword_100143F60;
  if (!qword_100143F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100143F60);
  }
  return result;
}

unsigned char *_s11GKGameErrorOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000AED50);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s11GKGameErrorOMa()
{
  return &_s11GKGameErrorON;
}

unint64_t sub_1000AED8C()
{
  unint64_t result = qword_100143F68;
  if (!qword_100143F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100143F68);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessPointPageIntentImplementation()
{
  return &type metadata for AccessPointPageIntentImplementation;
}

uint64_t sub_1000AEDF4()
{
  return sub_1000B6264(&qword_100143280, (void (*)(uint64_t))type metadata accessor for AccessPointPageIntent);
}

uint64_t sub_1000AEE3C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100005B18(&qword_100142A90);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_1000B630C();
    **(void **)(*(void *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    return _swift_continuation_throwingResume(v3);
  }
}

unint64_t *sub_1000AEF08(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AccessPointHighlight(0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  id v7 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v6)
  {
    v17 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_1000B5C90(0, v6, 0);
    id v7 = v17;
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v9 = *(void *)(v3 + 72);
    do
    {
      sub_1000B61FC(v8, (uint64_t)v5, type metadata accessor for AccessPointHighlight);
      v17 = v7;
      unint64_t v11 = v7[2];
      unint64_t v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        sub_1000B5C90(v10 > 1, v11 + 1, 1);
        id v7 = v17;
      }
      uint64_t v15 = v2;
      uint64_t v16 = sub_1000B6264(&qword_1001437C8, (void (*)(uint64_t))type metadata accessor for AccessPointHighlight);
      v12 = sub_1000082EC((uint64_t *)&v14);
      sub_1000B61FC((uint64_t)v5, (uint64_t)v12, type metadata accessor for AccessPointHighlight);
      v7[2] = v11 + 1;
      sub_100069BBC(&v14, (uint64_t)&v7[5 * v11 + 4]);
      sub_1000B62AC((uint64_t)v5, type metadata accessor for AccessPointHighlight);
      v8 += v9;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_1000AF10C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[65] = a5;
  v5[63] = a3;
  v5[64] = a4;
  v5[61] = a1;
  v5[62] = a2;
  v5[66] = type metadata accessor for AccessPointRequiredData();
  v5[67] = swift_task_alloc();
  v5[68] = type metadata accessor for AccessPointDataIntent();
  v5[69] = swift_task_alloc();
  return _swift_task_switch(sub_1000AF1D8, 0, 0);
}

uint64_t sub_1000AF1D8()
{
  uint64_t v1 = *(void *)(v0 + 552);
  uint64_t v2 = *(void *)(v0 + 544);
  uint64_t v3 = *(char **)(v0 + 496);
  char v4 = *v3;
  char v5 = v3[1];
  long long v6 = *(_OWORD *)(v3 + 24);
  *(_OWORD *)(v0 + 80) = *(_OWORD *)(v3 + 8);
  *(_OWORD *)(v0 + 96) = v6;
  long long v7 = *(_OWORD *)(v3 + 56);
  long long v8 = *(_OWORD *)(v3 + 88);
  long long v9 = *(_OWORD *)(v3 + 40);
  *(_OWORD *)(v0 + 144) = *(_OWORD *)(v3 + 72);
  *(_OWORD *)(v0 + 160) = v8;
  *(_OWORD *)(v0 + 112) = v9;
  *(_OWORD *)(v0 + 128) = v7;
  long long v10 = *(_OWORD *)(v3 + 120);
  long long v11 = *(_OWORD *)(v3 + 136);
  long long v12 = *(_OWORD *)(v3 + 104);
  *(void *)(v0 + 224) = *((void *)v3 + 19);
  *(_OWORD *)(v0 + 192) = v10;
  *(_OWORD *)(v0 + 208) = v11;
  *(_OWORD *)(v0 + 176) = v12;
  uint64_t v13 = type metadata accessor for AccessPointPageIntent();
  sub_1000B61FC((uint64_t)&v3[*(int *)(v13 + 32)], v1 + *(int *)(v2 + 28), (uint64_t (*)(void))type metadata accessor for Game);
  *(unsigned char *)uint64_t v1 = v4;
  *(unsigned char *)(v1 + 1) = v5;
  long long v14 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v1 + 8) = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v1 + 24) = v14;
  long long v15 = *(_OWORD *)(v0 + 144);
  long long v16 = *(_OWORD *)(v0 + 160);
  long long v17 = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v1 + 40) = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v1 + 88) = v16;
  *(_OWORD *)(v1 + 72) = v15;
  *(_OWORD *)(v1 + 56) = v17;
  long long v19 = *(_OWORD *)(v0 + 192);
  long long v18 = *(_OWORD *)(v0 + 208);
  uint64_t v20 = *(void *)(v0 + 224);
  *(_OWORD *)(v1 + 104) = *(_OWORD *)(v0 + 176);
  *(void *)(v1 + 152) = v20;
  *(_OWORD *)(v1 + 136) = v18;
  *(_OWORD *)(v1 + 120) = v19;
  uint64_t v21 = sub_100005B18(&qword_100140008);
  sub_1000249B4(v0 + 80);
  v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 560) = v22;
  void *v22 = v0;
  v22[1] = sub_1000AF380;
  return BaseObjectGraph.inject<A>(_:)(v0 + 384, v21, v21);
}

uint64_t sub_1000AF380()
{
  *(void *)(*(void *)v1 + 568) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000AF6A8;
  }
  else {
    uint64_t v2 = sub_1000AF494;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000AF494()
{
  uint64_t v1 = v0[51];
  uint64_t v2 = v0[52];
  sub_100006650(v0 + 48, v1);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[72] = v3;
  uint64_t v4 = sub_1000B6264((unint64_t *)&qword_100142B30, (void (*)(uint64_t))type metadata accessor for AccessPointDataIntent);
  *uint64_t v3 = v0;
  v3[1] = sub_1000AF594;
  uint64_t v5 = v0[69];
  uint64_t v6 = v0[68];
  uint64_t v7 = v0[67];
  uint64_t v8 = v0[63];
  return dispatch thunk of IntentDispatcher.dispatch<A>(_:objectGraph:)(v7, v5, v8, v6, v4, v1, v2);
}

uint64_t sub_1000AF594()
{
  *(void *)(*(void *)v1 + 584) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000AFB20;
  }
  else {
    uint64_t v2 = sub_1000AF740;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000AF6A8()
{
  sub_1000B62AC(*(void *)(v0 + 552), (uint64_t (*)(void))type metadata accessor for AccessPointDataIntent);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000AF740()
{
  uint64_t v1 = *(void *)(v0 + 536);
  uint64_t v2 = *(void *)(v0 + 528);
  sub_100007188(v0 + 384);
  uint64_t v3 = *(void *)(v1 + *(int *)(v2 + 32));
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain_n();
    long long v5 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(v0 + 232) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v0 + 248) = v5;
    long long v6 = *(_OWORD *)(v3 + 112);
    long long v8 = *(_OWORD *)(v3 + 64);
    long long v7 = *(_OWORD *)(v3 + 80);
    *(_OWORD *)(v0 + 296) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v0 + 312) = v6;
    *(_OWORD *)(v0 + 264) = v8;
    *(_OWORD *)(v0 + 280) = v7;
    long long v10 = *(_OWORD *)(v3 + 144);
    long long v9 = *(_OWORD *)(v3 + 160);
    long long v11 = *(_OWORD *)(v3 + 128);
    *(void *)(v0 + 376) = *(void *)(v3 + 176);
    *(_OWORD *)(v0 + 344) = v10;
    *(_OWORD *)(v0 + 360) = v9;
    *(_OWORD *)(v0 + 328) = v11;
    uint64_t v12 = v4 - 1;
    uint64_t v43 = v3;
    for (uint64_t i = 184; ; i += 152)
    {
      uint64_t v45 = v12;
      if (*(void *)(v0 + 288))
      {
        uint64_t v13 = *(void *)(v0 + 280);
        uint64_t v14 = *(void *)(v0 + 288);
      }
      else
      {
        uint64_t v13 = *(void *)(v0 + 264);
        uint64_t v14 = *(void *)(v0 + 272);
        swift_bridgeObjectRetain();
      }
      uint64_t v16 = *(void *)(v0 + 232);
      uint64_t v15 = *(void *)(v0 + 240);
      sub_1000249B4(v0 + 232);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v19 = sub_1000DC324(v16, v15);
      uint64_t v20 = _swiftEmptyDictionarySingleton[2];
      BOOL v21 = (v18 & 1) == 0;
      uint64_t v22 = v20 + v21;
      if (__OFADD__(v20, v21))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        return _swift_continuation_await(v22);
      }
      char v23 = v18;
      if (_swiftEmptyDictionarySingleton[3] >= v22)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if (v18) {
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v22 = (uint64_t)sub_10006FD40();
          if (v23) {
            goto LABEL_13;
          }
        }
      }
      else
      {
        sub_10006E098(v22, isUniquelyReferenced_nonNull_native);
        uint64_t v22 = sub_1000DC324(v16, v15);
        if ((v23 & 1) != (v24 & 1))
        {
          return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
        }
        unint64_t v19 = v22;
        if (v23)
        {
LABEL_13:
          v25 = (void *)(_swiftEmptyDictionarySingleton[7] + 16 * v19);
          swift_bridgeObjectRelease();
          void *v25 = v13;
          v25[1] = v14;
          goto LABEL_17;
        }
      }
      _swiftEmptyDictionarySingleton[(v19 >> 6) + 8] |= 1 << v19;
      v26 = (uint64_t *)(_swiftEmptyDictionarySingleton[6] + 16 * v19);
      uint64_t *v26 = v16;
      v26[1] = v15;
      v27 = (void *)(_swiftEmptyDictionarySingleton[7] + 16 * v19);
      void *v27 = v13;
      v27[1] = v14;
      uint64_t v28 = _swiftEmptyDictionarySingleton[2];
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29) {
        goto LABEL_28;
      }
      _swiftEmptyDictionarySingleton[2] = v30;
      swift_bridgeObjectRetain();
LABEL_17:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10008AED0(v0 + 232);
      if (!v45)
      {
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
      long long v31 = *(_OWORD *)(v43 + i + 16);
      *(_OWORD *)(v0 + 232) = *(_OWORD *)(v43 + i);
      *(_OWORD *)(v0 + 248) = v31;
      long long v32 = *(_OWORD *)(v43 + i + 32);
      long long v33 = *(_OWORD *)(v43 + i + 48);
      long long v34 = *(_OWORD *)(v43 + i + 80);
      *(_OWORD *)(v0 + 296) = *(_OWORD *)(v43 + i + 64);
      *(_OWORD *)(v0 + 312) = v34;
      *(_OWORD *)(v0 + 264) = v32;
      *(_OWORD *)(v0 + 280) = v33;
      long long v35 = *(_OWORD *)(v43 + i + 96);
      long long v36 = *(_OWORD *)(v43 + i + 112);
      long long v37 = *(_OWORD *)(v43 + i + 128);
      *(void *)(v0 + 376) = *(void *)(v43 + i + 144);
      *(_OWORD *)(v0 + 344) = v36;
      *(_OWORD *)(v0 + 360) = v37;
      *(_OWORD *)(v0 + 328) = v35;
      uint64_t v12 = v45 - 1;
    }
  }
  swift_bridgeObjectRetain();
LABEL_21:
  *(void *)(v0 + 592) = _swiftEmptyDictionarySingleton;
  swift_bridgeObjectRelease();
  v38 = self;
  uint64_t v39 = swift_bridgeObjectRetain();
  sub_1000B5BA8(v39);
  swift_bridgeObjectRelease();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 600) = isa;
  swift_release();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 464;
  *(void *)(v0 + 24) = sub_1000AFBC0;
  uint64_t v41 = swift_continuation_init();
  *(void *)(v0 + 424) = _NSConcreteStackBlock;
  *(void *)(v0 + 432) = 0x40000000;
  *(void *)(v0 + 440) = sub_1000AEE3C;
  *(void *)(v0 + 448) = &unk_1001341B0;
  *(void *)(v0 + 456) = v41;
  [v38 loadPlayersForIdentifiersPrivate:isa withCompletionHandler:v0 + 424];
  uint64_t v22 = v0 + 16;
  return _swift_continuation_await(v22);
}

uint64_t sub_1000AFB20()
{
  sub_100007188(v0 + 384);
  sub_1000B62AC(*(void *)(v0 + 552), (uint64_t (*)(void))type metadata accessor for AccessPointDataIntent);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000AFBC0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 608) = v1;
  if (v1) {
    uint64_t v2 = sub_1000B0354;
  }
  else {
    uint64_t v2 = sub_1000AFCD0;
  }
  return _swift_task_switch(v2, 0, 0);
}

void sub_1000AFCD0()
{
  uint64_t v49 = v0;
  unint64_t v1 = *(void *)(v0 + 464);

  unint64_t v2 = v1 >> 62;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v3 < 1)
  {
    swift_bridgeObjectRelease();
    if (qword_10013FBB0 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100007D4C(v8, (uint64_t)qword_100156CF8);
    swift_bridgeObjectRetain();
    long long v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      long long v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      *(_DWORD *)long long v11 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v12 = Dictionary.Keys.description.getter();
      unint64_t v14 = v13;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 472) = sub_100036BF8(v12, v14, &v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Error encountered loading players for friend requests highlight using: %s.", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

LABEL_39:
    uint64_t v38 = 0;
    uint64_t v16 = 0;
    unint64_t v19 = (char *)_swiftEmptyArrayStorage;
LABEL_40:
    uint64_t v39 = *(void *)(v0 + 552);
    v40 = *(char **)(v0 + 536);
    uint64_t v41 = *(void *)(v0 + 488);
    sub_1000B0654(v40, *(unsigned __int8 **)(v0 + 496), v38, v16, (uint64_t)v19, *(void *)(v0 + 512), *(void *)(v0 + 520), v41);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000B62AC((uint64_t)v40, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
    sub_1000B62AC(v39, (uint64_t (*)(void))type metadata accessor for AccessPointDataIntent);
    uint64_t v42 = type metadata accessor for AccessPointContainer(0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v41, 0, 1, v42);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v43 = *(void (**)(void))(v0 + 8);
    v43();
    return;
  }
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007D4C(v4, (uint64_t)qword_100156CF8);
  swift_bridgeObjectRetain();
  long long v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  unint64_t v47 = v1;
  if (os_log_type_enabled(v5, v6))
  {
    long long v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)long long v7 = 134217984;
    *(void *)(v0 + 480) = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Successfuly loaded %ld player(s) for friend requests highlight.", v7, 0xCu);
    unint64_t v1 = v47;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
  uint64_t v15 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v15)
  {
LABEL_36:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_39;
  }
LABEL_15:
  if (v15 >= 1)
  {
    uint64_t v44 = v0;
    uint64_t v45 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v46 = *(void *)(v0 + 592);
    unint64_t v18 = v1 & 0xC000000000000001;
    unint64_t v19 = (char *)_swiftEmptyArrayStorage;
    while (1)
    {
      if (v18)
      {
        id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        if (!v16) {
          goto LABEL_23;
        }
      }
      else
      {
        id v20 = *(id *)(v1 + 8 * v17 + 32);
        if (!v16)
        {
LABEL_23:
          id v21 = [v20 internal];
          id v22 = [v21 playerID];

          uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v25 = v24;

          if (*(void *)(v46 + 16) && (unint64_t v26 = sub_1000DC324(v23, v25), (v27 & 1) != 0))
          {
            uint64_t v28 = (uint64_t *)(*(void *)(v46 + 56) + 16 * v26);
            uint64_t v16 = v28[1];
            uint64_t v45 = *v28;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            id v29 = [v20 displayName];
            uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v16 = v30;
          }
          unint64_t v1 = v47;
        }
      }
      uint64_t v31 = sub_100024524(v20);
      if (v32 >> 60 == 15)
      {
      }
      else
      {
        uint64_t v33 = v31;
        unint64_t v34 = v32;
        sub_1000244CC(v31, v32);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v19 = sub_1000363CC(0, *((void *)v19 + 2) + 1, 1, v19);
        }
        unint64_t v36 = *((void *)v19 + 2);
        unint64_t v35 = *((void *)v19 + 3);
        if (v36 >= v35 >> 1) {
          unint64_t v19 = sub_1000363CC((char *)(v35 > 1), v36 + 1, 1, v19);
        }
        *((void *)v19 + 2) = v36 + 1;
        long long v37 = &v19[16 * v36];
        *((void *)v37 + 4) = v33;
        *((void *)v37 + 5) = v34;

        sub_1000247B8(v33, v34);
        unint64_t v1 = v47;
      }
      if (v15 == ++v17)
      {
        uint64_t v0 = v44;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v38 = v45;
        goto LABEL_40;
      }
    }
  }
  __break(1u);
}

uint64_t sub_1000B0354()
{
  uint64_t v16 = v0;
  unint64_t v1 = *(void **)(v0 + 600);
  swift_willThrow();
  swift_errorRelease();

  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007D4C(v2, (uint64_t)qword_100156CF8);
  swift_bridgeObjectRetain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    long long v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)long long v5 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v6 = Dictionary.Keys.description.getter();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 472) = sub_100036BF8(v6, v8, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Error encountered loading players for friend requests highlight using: %s.", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v9 = *(void *)(v0 + 552);
  os_log_type_t v10 = *(char **)(v0 + 536);
  uint64_t v11 = *(void *)(v0 + 488);
  sub_1000B0654(v10, *(unsigned __int8 **)(v0 + 496), 0, 0, (uint64_t)_swiftEmptyArrayStorage, *(void *)(v0 + 512), *(void *)(v0 + 520), v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000B62AC((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
  sub_1000B62AC(v9, (uint64_t (*)(void))type metadata accessor for AccessPointDataIntent);
  uint64_t v12 = type metadata accessor for AccessPointContainer(0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_1000B0654@<X0>(char *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X8>)
{
  unint64_t v149 = a7;
  uint64_t v131 = a5;
  uint64_t v133 = a4;
  uint64_t v126 = a3;
  uint64_t v146 = a8;
  uint64_t v11 = type metadata accessor for PageID();
  uint64_t v144 = *(void *)(v11 - 8);
  uint64_t v145 = v11;
  __chkstk_darwin(v11);
  v143 = (char *)&v122 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AccessPointHighlight(0);
  uint64_t v154 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v138 = (uint64_t)&v122 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  v136 = (char *)&v122 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v127 = (uint64_t)&v122 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  v124 = (uint64_t *)((char *)&v122 - v21);
  uint64_t v22 = __chkstk_darwin(v20);
  v123 = (uint64_t *)((char *)&v122 - v23);
  uint64_t v24 = __chkstk_darwin(v22);
  v128 = (uint64_t *)((char *)&v122 - v25);
  uint64_t v26 = __chkstk_darwin(v24);
  v139 = (uint64_t *)((char *)&v122 - v27);
  __chkstk_darwin(v26);
  id v29 = (char *)&v122 - v28;
  v152 = (int *)type metadata accessor for AccessPointRequiredData();
  uint64_t v30 = __chkstk_darwin(v152);
  unint64_t v32 = (char *)&v122 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __chkstk_darwin(v30);
  v147 = (char *)&v122 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  uint64_t v130 = (uint64_t)&v122 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  v125 = (char *)&v122 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v134 = (uint64_t)&v122 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v135 = (uint64_t)&v122 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  uint64_t v45 = (char *)&v122 - v44;
  __chkstk_darwin(v43);
  unint64_t v47 = (char *)&v122 - v46;
  uint64_t v140 = type metadata accessor for PageMetrics();
  uint64_t v142 = *(void *)(v140 - 8);
  uint64_t v48 = __chkstk_darwin(v140);
  v141 = (char *)&v122 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v48);
  v51 = (char *)&v122 - v50;
  v137 = (int *)type metadata accessor for Game();
  __chkstk_darwin(v137);
  v53 = (char *)&v122 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v150 = a2[1];
  uint64_t v54 = (uint64_t)&a2[*(int *)(type metadata accessor for AccessPointPageIntent() + 32)];
  v151 = v53;
  sub_1000B61FC(v54, (uint64_t)v53, (uint64_t (*)(void))type metadata accessor for Game);
  v132 = a2;
  uint64_t v55 = *a2;
  uint64_t v56 = 0x80000001000FD880;
  int v57 = 1;
  uint64_t v58 = 0xD000000000000011;
  uint64_t v153 = a6;
  v148 = v51;
  v129 = v32;
  switch(v55)
  {
    case 1:
      int v57 = 0;
      uint64_t v56 = 0xEF65676150746E69;
      uint64_t v58 = 0x6F50737365636361;
      goto LABEL_4;
    case 3:
    case 4:
    case 5:
    case 6:
      static PageMetrics.notInstrumented.getter();
      break;
    default:
LABEL_4:
      id v59 = [self stringForOrigin:3];
      uint64_t v60 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v62 = v61;

      sub_1000920E8(v58, v56, v57, 1, v60, v62, (uint64_t)v148);
      swift_bridgeObjectRelease();
      a6 = v153;
      swift_bridgeObjectRelease();
      break;
  }
  unint64_t v63 = PageMetrics.pageFields.getter();
  unint64_t v64 = v149;
  if (!v63) {
    unint64_t v63 = sub_1000B96AC((uint64_t)_swiftEmptyArrayStorage);
  }
  uint64_t v65 = v63;
  sub_1000B61FC((uint64_t)a1, (uint64_t)v47, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
  if (!v150)
  {
    sub_1000B62AC((uint64_t)v47, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
    sub_1000B61FC((uint64_t)a1, (uint64_t)v45, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
    goto LABEL_11;
  }
  int v66 = v47[v152[7]];
  sub_1000B62AC((uint64_t)v47, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
  sub_1000B61FC((uint64_t)a1, (uint64_t)v45, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
  if (v66 != 1)
  {
LABEL_11:
    switch(*v45)
    {
      case 1:
        swift_bridgeObjectRelease();
        sub_1000B62AC((uint64_t)v45, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
        break;
      default:
        char v67 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        sub_1000B62AC((uint64_t)v45, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
        if ((v67 & 1) == 0) {
          goto LABEL_15;
        }
        break;
    }
    v68 = _swiftEmptyArrayStorage;
    goto LABEL_18;
  }
  sub_1000B62AC((uint64_t)v45, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
LABEL_15:
  sub_1000B1BE4((uint64_t)a1, 1, v65, a6, v64, (uint64_t)v29, 1.5);
  v68 = (void *)sub_1000363A8(0, 1, 1, (unint64_t)_swiftEmptyArrayStorage);
  unint64_t v70 = v68[2];
  unint64_t v69 = v68[3];
  if (v70 >= v69 >> 1) {
    v68 = (void *)sub_1000363A8(v69 > 1, v70 + 1, 1, (unint64_t)v68);
  }
  v68[2] = v70 + 1;
  sub_1000248E4((uint64_t)v29, (uint64_t)v68+ ((*(unsigned __int8 *)(v154 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v154 + 80))+ *(void *)(v154 + 72) * v70, type metadata accessor for AccessPointHighlight);
LABEL_18:
  uint64_t v71 = (uint64_t)v147;
  switch(*a1)
  {
    case 1:
      swift_bridgeObjectRelease();
      goto LABEL_21;
    default:
      char v72 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v72)
      {
LABEL_21:
        uint64_t v73 = 1;
        int v74 = 1;
        break;
      }
      uint64_t v75 = v152[7];
      int v76 = a1[v75];
      uint64_t v77 = v135;
      sub_1000B61FC((uint64_t)a1, v135, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
      if (v76 == 1)
      {
        uint64_t v122 = v75;
        uint64_t v78 = *(void *)(v131 + 16);
        uint64_t v79 = v134;
        sub_1000B61FC(v77, v134, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
        if (v78)
        {
          char v80 = 0;
        }
        else
        {
          uint64_t v81 = v79;
          v82 = v125;
          sub_1000B61FC(v81, (uint64_t)v125, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
          if (v150)
          {
            char v80 = 1;
            switch(*v82)
            {
              case 1:
              case 2:
              case 4:
              case 5:
              case 6:
                goto LABEL_30;
              case 3:
                if (0x80000001000FC100 != 0x80000001000FC0B0) {
LABEL_30:
                }
                  char v80 = _stringCompareWithSmolCheck(_:_:expecting:)();
                break;
              default:
                break;
            }
            swift_bridgeObjectRelease();
            uint64_t v77 = v135;
          }
          else
          {
            char v80 = 1;
          }
          sub_1000B62AC((uint64_t)v82, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
        }
        sub_1000B62AC(v134, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
        uint64_t v75 = v122;
      }
      else
      {
        char v80 = 1;
      }
      sub_1000B62AC(v77, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
      sub_1000B2400((uint64_t)a1, v80 & 1, v132[2], 1, v65, a6, v64, v139);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v68 = (void *)sub_1000363A8(0, v68[2] + 1, 1, (unint64_t)v68);
      }
      unint64_t v84 = v68[2];
      unint64_t v83 = v68[3];
      if (v84 >= v83 >> 1) {
        v68 = (void *)sub_1000363A8(v83 > 1, v84 + 1, 1, (unint64_t)v68);
      }
      v68[2] = v84 + 1;
      unint64_t v85 = (*(unsigned __int8 *)(v154 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v154 + 80);
      uint64_t v86 = *(void *)(v154 + 72);
      sub_1000248E4((uint64_t)v139, (uint64_t)v68 + v85 + v86 * v84, type metadata accessor for AccessPointHighlight);
      if (v133)
      {
        unint64_t v64 = v149;
        if (a1[v75] != 1 || !*(void *)(v131 + 16))
        {
          int v74 = 0;
          uint64_t v73 = 2;
          uint64_t v71 = (uint64_t)v147;
          break;
        }
        sub_1000B2D34((uint64_t)a1, v126, v131, 1, 2, v65, v153, v128, v149);
        unint64_t v88 = v68[2];
        unint64_t v87 = v68[3];
        if (v88 >= v87 >> 1) {
          v68 = (void *)sub_1000363A8(v87 > 1, v88 + 1, 1, (unint64_t)v68);
        }
        v68[2] = v88 + 1;
        sub_1000248E4((uint64_t)v128, (uint64_t)v68 + v85 + v88 * v86, type metadata accessor for AccessPointHighlight);
        int v74 = 0;
        uint64_t v73 = 3;
      }
      else
      {
        int v74 = 0;
        uint64_t v73 = 2;
        unint64_t v64 = v149;
      }
      uint64_t v71 = (uint64_t)v147;
      break;
  }
  switch(*a1)
  {
    case 1:
    case 2:
    case 4:
    case 5:
    case 6:
      goto LABEL_50;
    case 3:
      if (0x80000001000FC100 == 0x80000001000FC0B0) {
        goto LABEL_49;
      }
LABEL_50:
      char v89 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v89) {
        goto LABEL_51;
      }
      if ((a1[v152[7]] & v150) != 1)
      {
        uint64_t v100 = v153;
        uint64_t v91 = v140;
LABEL_79:
        uint64_t v90 = (uint64_t)v136;
        goto LABEL_82;
      }
      int v92 = v151[v137[11]];
      uint64_t v93 = v130;
      sub_1000B61FC((uint64_t)a1, v130, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
      uint64_t v90 = (uint64_t)v136;
      if (v92 == 1)
      {
        uint64_t v94 = *(void *)(v93 + v152[11]);
        sub_1000B62AC(v93, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
        uint64_t v95 = (uint64_t)v129;
        if (v94 > 0)
        {
          int v96 = v74 ^ 1;
          v97 = v123;
          sub_1000B3490((uint64_t)a1, v96, v73, v65, v153, v64, v123);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v68 = (void *)sub_1000363A8(0, v68[2] + 1, 1, (unint64_t)v68);
          }
          unint64_t v99 = v68[2];
          unint64_t v98 = v68[3];
          if (v99 >= v98 >> 1) {
            v68 = (void *)sub_1000363A8(v98 > 1, v99 + 1, 1, (unint64_t)v68);
          }
          v68[2] = v99 + 1;
          sub_1000248E4((uint64_t)v97, (uint64_t)v68+ ((*(unsigned __int8 *)(v154 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v154 + 80))+ *(void *)(v154 + 72) * v99, type metadata accessor for AccessPointHighlight);
          int v74 = 0;
          ++v73;
          uint64_t v90 = (uint64_t)v136;
        }
      }
      else
      {
        sub_1000B62AC(v93, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
        uint64_t v95 = (uint64_t)v129;
      }
      int v101 = v151[v137[14]];
      sub_1000B61FC((uint64_t)a1, v71, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
      if (v101 == 1)
      {
        uint64_t v102 = *(void *)(v71 + v152[12]);
        sub_1000B62AC(v71, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
        if (v102 > 0)
        {
          char v103 = v74 ^ 1;
          v104 = v124;
          sub_1000B3C30((uint64_t)a1, v103, v73, v65, v153, v64, v124);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v68 = (void *)sub_1000363A8(0, v68[2] + 1, 1, (unint64_t)v68);
          }
          unint64_t v106 = v68[2];
          unint64_t v105 = v68[3];
          if (v106 >= v105 >> 1) {
            v68 = (void *)sub_1000363A8(v105 > 1, v106 + 1, 1, (unint64_t)v68);
          }
          v68[2] = v106 + 1;
          sub_1000248E4((uint64_t)v104, (uint64_t)v68+ ((*(unsigned __int8 *)(v154 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v154 + 80))+ *(void *)(v154 + 72) * v106, type metadata accessor for AccessPointHighlight);
          int v74 = 0;
          ++v73;
          uint64_t v90 = (uint64_t)v136;
        }
      }
      else
      {
        sub_1000B62AC(v71, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
      }
      int v107 = v151[v137[10]];
      sub_1000B61FC((uint64_t)a1, v95, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
      if (v107 == 1)
      {
        uint64_t v108 = *(void *)(v95 + v152[18] + 8);
        sub_1000B62AC(v95, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
        if (v108)
        {
          uint64_t v100 = v153;
          sub_1000B4448((uint64_t)a1, v74 ^ 1, v73, v153, v64, v127);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v68 = (void *)sub_1000363A8(0, v68[2] + 1, 1, (unint64_t)v68);
          }
          unint64_t v110 = v68[2];
          unint64_t v109 = v68[3];
          uint64_t v91 = v140;
          if (v110 >= v109 >> 1) {
            v68 = (void *)sub_1000363A8(v109 > 1, v110 + 1, 1, (unint64_t)v68);
          }
          v68[2] = v110 + 1;
          sub_1000248E4(v127, (uint64_t)v68+ ((*(unsigned __int8 *)(v154 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v154 + 80))+ *(void *)(v154 + 72) * v110, type metadata accessor for AccessPointHighlight);
          ++v73;
          goto LABEL_79;
        }
      }
      else
      {
        sub_1000B62AC(v95, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
      }
      uint64_t v100 = v153;
      uint64_t v91 = v140;
LABEL_82:
      sub_1000B5094((uint64_t)a1, v73, v65, v100, v64, v90);
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v68 = (void *)sub_1000363A8(0, v68[2] + 1, 1, (unint64_t)v68);
      }
LABEL_84:
      unint64_t v112 = v68[2];
      unint64_t v111 = v68[3];
      if (v112 >= v111 >> 1) {
        v68 = (void *)sub_1000363A8(v111 > 1, v112 + 1, 1, (unint64_t)v68);
      }
      v68[2] = v112 + 1;
      sub_1000248E4(v90, (uint64_t)v68+ ((*(unsigned __int8 *)(v154 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v154 + 80))+ *(void *)(v154 + 72) * v112, type metadata accessor for AccessPointHighlight);
      swift_bridgeObjectRetain();
      v113 = v143;
      PageID.init(with:)();
      v115 = v141;
      uint64_t v114 = v142;
      uint64_t v116 = (uint64_t)v148;
      (*(void (**)(char *, char *, uint64_t))(v142 + 16))(v141, v148, v91);
      char v117 = *a1;
      v118 = sub_1000AEF08((uint64_t)v68);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v116, v91);
      sub_1000B62AC((uint64_t)v151, (uint64_t (*)(void))type metadata accessor for Game);
      uint64_t v119 = v146;
      (*(void (**)(uint64_t, char *, uint64_t))(v144 + 32))(v146, v113, v145);
      v120 = (int *)type metadata accessor for AccessPointContainer(0);
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v114 + 32))(v119 + v120[5], v115, v91);
      *(unsigned char *)(v119 + v120[6]) = v117;
      *(void *)(v119 + v120[7]) = v118;
      return result;
    default:
LABEL_49:
      swift_bridgeObjectRelease();
LABEL_51:
      uint64_t v90 = v138;
      sub_1000B1BE4((uint64_t)a1, 0, v65, v153, v64, v138, 0.5);
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v68 = (void *)sub_1000363A8(0, v68[2] + 1, 1, (unint64_t)v68);
      }
      uint64_t v91 = v140;
      goto LABEL_84;
  }
}

uint64_t sub_1000B1BE4@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>)
{
  uint64_t v76 = a4;
  uint64_t v77 = a5;
  uint64_t v73 = a3;
  int v74 = a2;
  uint64_t v81 = a1;
  uint64_t v9 = sub_100005B18(&qword_1001402E0);
  __chkstk_darwin(v9 - 8);
  uint64_t v79 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005B18(&qword_100140B40);
  __chkstk_darwin(v11 - 8);
  uint64_t v78 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005B18(&qword_100140B38);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v82 = (uint64_t *)((char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v14);
  uint64_t v17 = (uint64_t *)((char *)&v69 - v16);
  uint64_t v18 = type metadata accessor for ActionMetrics();
  uint64_t v71 = *(void *)(v18 - 8);
  uint64_t v72 = v18;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for Game();
  __chkstk_darwin(v21 - 8);
  uint64_t v23 = (char *)&v69 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100005B18(&qword_100140B50);
  uint64_t v25 = __chkstk_darwin(v24 - 8);
  uint64_t v75 = (uint64_t)&v69 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __chkstk_darwin(v25);
  id v29 = (char *)&v69 - v28;
  __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v69 - v30;
  unint64_t v32 = (int *)type metadata accessor for LaunchDashboardAction();
  uint64_t v33 = *((void *)v32 - 1);
  unint64_t v70 = *(void (**)(char *, uint64_t, uint64_t, int *))(v33 + 56);
  v70(v31, 1, 1, v32);
  char v80 = v31;
  if (v74)
  {
    uint64_t v34 = type metadata accessor for AccessPointRequiredData();
    uint64_t v35 = v81;
    sub_1000B61FC(v81 + *(int *)(v34 + 24), (uint64_t)v23, (uint64_t (*)(void))type metadata accessor for Game);
    long long v36 = *(_OWORD *)(v35 + 120);
    long long v89 = *(_OWORD *)(v35 + 104);
    long long v90 = v36;
    long long v91 = *(_OWORD *)(v35 + 136);
    uint64_t v92 = *(void *)(v35 + 152);
    long long v37 = *(_OWORD *)(v35 + 56);
    long long v85 = *(_OWORD *)(v35 + 40);
    long long v86 = v37;
    long long v38 = *(_OWORD *)(v35 + 88);
    long long v87 = *(_OWORD *)(v35 + 72);
    long long v88 = v38;
    long long v39 = *(_OWORD *)(v35 + 8);
    long long v40 = *(_OWORD *)(v35 + 24);
    uint64_t v31 = v80;
    long long v83 = v39;
    long long v84 = v40;
    sub_1000249B4((uint64_t)&v83);
    sub_100092534(v73, 9, (uint64_t)v20);
    sub_100017388((uint64_t)v31, &qword_100140B50);
    sub_1000248E4((uint64_t)v23, (uint64_t)v29, (uint64_t (*)(void))type metadata accessor for Game);
    uint64_t v41 = &v29[v32[5]];
    long long v42 = v84;
    *(_OWORD *)uint64_t v41 = v83;
    *((_OWORD *)v41 + 1) = v42;
    long long v43 = v88;
    *((_OWORD *)v41 + 4) = v87;
    *((_OWORD *)v41 + 5) = v43;
    long long v44 = v86;
    *((_OWORD *)v41 + 2) = v85;
    *((_OWORD *)v41 + 3) = v44;
    *((void *)v41 + 18) = v92;
    long long v45 = v91;
    long long v46 = v89;
    *((_OWORD *)v41 + 7) = v90;
    *((_OWORD *)v41 + 8) = v45;
    *((_OWORD *)v41 + 6) = v46;
    unint64_t v47 = &v29[v32[6]];
    *(void *)unint64_t v47 = 0;
    *((void *)v47 + 1) = 0;
    v47[16] = 3;
    (*(void (**)(char *, char *, uint64_t))(v71 + 32))(&v29[v32[7]], v20, v72);
    v70(v29, 0, 1, v32);
    sub_100024A74((uint64_t)v29, (uint64_t)v31, &qword_100140B50);
  }
  *(void *)&long long v83 = 0;
  *((void *)&v83 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(20);
  uint64_t v48 = v77;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&long long v83 = v76;
  *((void *)&v83 + 1) = v48;
  v49._object = (void *)0x80000001000FDAA0;
  v49._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v49);
  long long v96 = v83;
  AnyHashable.init<A>(_:)();
  void *v17 = 0x65766E6F63696367;
  v17[1] = 0xE900000000000063;
  v17[2] = 0x4041000000000000;
  uint64_t v50 = type metadata accessor for AccessPointIconType(0);
  swift_storeEnumTagMultiPayload();
  v51 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56);
  v51(v17, 0, 1, v50);
  v51(v82, 1, 1, v50);
  uint64_t v52 = v75;
  sub_1000170C8((uint64_t)v31, v75, &qword_100140B50);
  if ((*(unsigned int (**)(uint64_t, uint64_t, int *))(v33 + 48))(v52, 1, v32) == 1)
  {
    sub_100017388(v52, &qword_100140B50);
    long long v96 = 0u;
    long long v97 = 0u;
    uint64_t v98 = 0;
  }
  else
  {
    *((void *)&v97 + 1) = v32;
    uint64_t v98 = sub_1000B6264(&qword_100140B58, (void (*)(uint64_t))type metadata accessor for LaunchDashboardAction);
    v53 = sub_1000082EC((uint64_t *)&v96);
    sub_1000248E4(v52, (uint64_t)v53, (uint64_t (*)(void))type metadata accessor for LaunchDashboardAction);
  }
  uint64_t v54 = type metadata accessor for PageMetrics();
  uint64_t v55 = (uint64_t)v78;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v78, 1, 1, v54);
  uint64_t v56 = type metadata accessor for ImpressionMetrics();
  uint64_t v57 = (uint64_t)v79;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v79, 1, 1, v56);
  uint64_t v58 = (uint64_t *)(v81 + *(int *)(type metadata accessor for AccessPointRequiredData() + 24));
  uint64_t v60 = *v58;
  uint64_t v59 = v58[1];
  *(void *)(a6 + 32) = v85;
  long long v61 = v84;
  *(_OWORD *)a6 = v83;
  *(_OWORD *)(a6 + 16) = v61;
  uint64_t v62 = (int *)type metadata accessor for AccessPointHighlight(0);
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  sub_100024A74((uint64_t)v17, a6 + v62[7], &qword_100140B38);
  sub_100024A74((uint64_t)v82, a6 + v62[8], &qword_100140B38);
  uint64_t v63 = a6 + v62[9];
  *(double *)uint64_t v63 = a7;
  *(unsigned char *)(v63 + 8) = 0;
  *(unsigned char *)(a6 + v62[10]) = 2;
  *(unsigned char *)(a6 + v62[11]) = 2;
  *(unsigned char *)(a6 + v62[12]) = 2;
  uint64_t v64 = a6 + v62[13];
  uint64_t v95 = 0;
  long long v93 = 0u;
  long long v94 = 0u;
  swift_bridgeObjectRetain();
  sub_1000158AC((uint64_t)&v96, (uint64_t)&v93);
  long long v65 = v94;
  *(_OWORD *)uint64_t v64 = v93;
  *(_OWORD *)(v64 + 16) = v65;
  *(void *)(v64 + 32) = v95;
  sub_100017388((uint64_t)&v96, &qword_1001401E8);
  sub_100024A74(v55, a6 + v62[14], &qword_100140B40);
  sub_100024A74(v57, a6 + v62[15], &qword_1001402E0);
  int v66 = (void *)(a6 + v62[16]);
  *int v66 = v60;
  v66[1] = v59;
  *(void *)(a6 + v62[17]) = 1;
  char v67 = (void *)(a6 + v62[18]);
  *char v67 = 0;
  v67[1] = 0;
  return sub_100017388((uint64_t)v80, &qword_100140B50);
}

uint64_t sub_1000B2400@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v73 = (void *)a7;
  uint64_t v72 = a6;
  uint64_t v71 = a4;
  LODWORD(v70) = a3;
  int v75 = a2;
  uint64_t v11 = sub_100005B18(&qword_1001402E0);
  __chkstk_darwin(v11 - 8);
  uint64_t v79 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005B18(&qword_100140B40);
  __chkstk_darwin(v13 - 8);
  uint64_t v77 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = type metadata accessor for ImpressionMetrics();
  uint64_t v76 = *(void *)(v78 - 8);
  __chkstk_darwin(v78);
  uint64_t v81 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for AccessPointIconType(0);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (uint64_t *)((char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = (int *)type metadata accessor for LaunchDashboardAction();
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for AccessPointRequiredData();
  int v74 = (uint64_t *)(a1 + *(int *)(v23 + 24));
  sub_1000B61FC((uint64_t)v74, (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for Game);
  long long v24 = *(_OWORD *)(a1 + 120);
  long long v95 = *(_OWORD *)(a1 + 104);
  long long v96 = v24;
  long long v97 = *(_OWORD *)(a1 + 136);
  uint64_t v98 = *(void *)(a1 + 152);
  long long v25 = *(_OWORD *)(a1 + 56);
  long long v91 = *(_OWORD *)(a1 + 40);
  long long v92 = v25;
  long long v26 = *(_OWORD *)(a1 + 88);
  long long v93 = *(_OWORD *)(a1 + 72);
  long long v94 = v26;
  long long v27 = *(_OWORD *)(a1 + 24);
  long long v89 = *(_OWORD *)(a1 + 8);
  long long v90 = v27;
  uint64_t v28 = (uint64_t)&v22[v20[7]];
  sub_1000249B4((uint64_t)&v89);
  sub_100092534(a5, 9, v28);
  id v29 = &v22[v20[5]];
  long long v30 = v94;
  *((_OWORD *)v29 + 4) = v93;
  *((_OWORD *)v29 + 5) = v30;
  long long v31 = v92;
  *((_OWORD *)v29 + 2) = v91;
  *((_OWORD *)v29 + 3) = v31;
  *((void *)v29 + 18) = v98;
  long long v32 = v97;
  long long v33 = v95;
  *((_OWORD *)v29 + 7) = v96;
  *((_OWORD *)v29 + 8) = v32;
  *((_OWORD *)v29 + 6) = v33;
  long long v34 = v90;
  *(_OWORD *)id v29 = v89;
  *((_OWORD *)v29 + 1) = v34;
  uint64_t v35 = v20[6];
  char v80 = v22;
  long long v36 = &v22[v35];
  *(void *)long long v36 = 0;
  *((void *)v36 + 1) = 0;
  v36[16] = 3;
  int v37 = *(unsigned __int8 *)(a1 + *(int *)(v23 + 28));
  if (v37 == 1)
  {
    uint64_t v38 = *((void *)&v90 + 1);
    *uint64_t v19 = v90;
    v19[1] = v38;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
  }
  else
  {
    *uint64_t v19 = 0x65766E6F63696367;
    v19[1] = 0xE900000000000063;
    v19[2] = 0x4041000000000000;
    swift_storeEnumTagMultiPayload();
  }
  if (qword_10013FC30 != -1)
  {
    swift_once();
    if (v37) {
      goto LABEL_6;
    }
LABEL_15:
    uint64_t v69 = 0;
    uint64_t v67 = 0;
    uint64_t v41 = qword_100156D50;
    uint64_t v70 = qword_100156D48;
    long long v42 = (char *)&v93;
    goto LABEL_16;
  }
  if (!v37) {
    goto LABEL_15;
  }
LABEL_6:
  if (v70)
  {
    if (qword_10013FC20 != -1) {
      swift_once();
    }
    long long v39 = &qword_100156D28;
  }
  else
  {
    if (qword_10013FC28 != -1) {
      swift_once();
    }
    long long v39 = &qword_100156D38;
  }
  uint64_t v40 = v39[1];
  uint64_t v70 = *v39;
  uint64_t v68 = v40;
  swift_bridgeObjectRetain();
  uint64_t v41 = *((void *)&v91 + 1);
  uint64_t v69 = v91;
  long long v42 = (char *)&v92 + 8;
LABEL_16:
  *((void *)v42 - 32) = v41;
  swift_bridgeObjectRetain();
  long long v43 = v81;
  sub_100092B70(0x42656D6F636C6557, 0xED000072656E6E61, 0, 0, v71, 0x42656D6F636C6577, 0xED000072656E6E61, 0x636974617473, 0xE600000000000000, 0x20656D6F636C6557, 0xEE0072656E6E6142);
  uint64_t v85 = 0;
  unint64_t v86 = 0xE000000000000000;
  _StringGuts.grow(_:)(22);
  uint64_t v44 = (uint64_t)v73;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v85 = v72;
  unint64_t v86 = v44;
  v45._object = (void *)0x80000001000FDA80;
  v45._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v45);
  AnyHashable.init<A>(_:)();
  long long v46 = (int *)type metadata accessor for AccessPointHighlight(0);
  uint64_t v47 = (uint64_t)a8 + v46[7];
  sub_1000B61FC((uint64_t)v19, v47, type metadata accessor for AccessPointIconType);
  uint64_t v73 = v19;
  uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v48(v47, 0, 1, v16);
  v48((uint64_t)a8 + v46[8], 1, 1, v16);
  char v49 = v75 & 1;
  long long v87 = v20;
  uint64_t v88 = sub_1000B6264(&qword_100140B58, (void (*)(uint64_t))type metadata accessor for LaunchDashboardAction);
  uint64_t v50 = sub_1000082EC(&v85);
  sub_1000B61FC((uint64_t)v80, (uint64_t)v50, (uint64_t (*)(void))type metadata accessor for LaunchDashboardAction);
  uint64_t v51 = type metadata accessor for PageMetrics();
  uint64_t v52 = (uint64_t)v77;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v77, 1, 1, v51);
  uint64_t v53 = v76;
  uint64_t v54 = (uint64_t)v79;
  uint64_t v55 = v78;
  (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v79, v43, v78);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v53 + 56))(v54, 0, 1, v55);
  uint64_t v57 = *v74;
  uint64_t v56 = v74[1];
  uint64_t v58 = v68;
  a8[5] = v70;
  a8[6] = v58;
  uint64_t v59 = v67;
  a8[7] = v69;
  a8[8] = v59;
  uint64_t v60 = (char *)a8 + v46[9];
  *(void *)uint64_t v60 = 0x4008000000000000;
  v60[8] = 0;
  *((unsigned char *)a8 + v46[10]) = 0;
  *((unsigned char *)a8 + v46[11]) = v49;
  *((unsigned char *)a8 + v46[12]) = 2;
  long long v61 = (char *)a8 + v46[13];
  uint64_t v84 = 0;
  long long v83 = 0u;
  long long v82 = 0u;
  swift_bridgeObjectRetain();
  sub_1000158AC((uint64_t)&v85, (uint64_t)&v82);
  long long v62 = v83;
  *(_OWORD *)long long v61 = v82;
  *((_OWORD *)v61 + 1) = v62;
  *((void *)v61 + 4) = v84;
  sub_100017388((uint64_t)&v85, &qword_1001401E8);
  sub_100024A74(v52, (uint64_t)a8 + v46[14], &qword_100140B40);
  sub_100024A74(v54, (uint64_t)a8 + v46[15], &qword_1001402E0);
  uint64_t v63 = (void *)((char *)a8 + v46[16]);
  *uint64_t v63 = v57;
  v63[1] = v56;
  *(void *)((char *)a8 + v46[17]) = 1;
  uint64_t v64 = (void *)((char *)a8 + v46[18]);
  *uint64_t v64 = 0;
  v64[1] = 0;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v81, v55);
  sub_1000B62AC((uint64_t)v73, type metadata accessor for AccessPointIconType);
  return sub_1000B62AC((uint64_t)v80, (uint64_t (*)(void))type metadata accessor for LaunchDashboardAction);
}

uint64_t sub_1000B2D34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, int a4@<W4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, void *a8@<X8>, unint64_t a9)
{
  uint64_t v62 = a7;
  uint64_t v61 = a5;
  int v69 = a4;
  uint64_t v63 = a2;
  uint64_t v13 = sub_100005B18(&qword_1001402E0);
  __chkstk_darwin(v13 - 8);
  uint64_t v68 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005B18(&qword_100140B40);
  __chkstk_darwin(v15 - 8);
  uint64_t v66 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = type metadata accessor for ImpressionMetrics();
  uint64_t v65 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v60 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (int *)type metadata accessor for LaunchDashboardAction();
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = (uint64_t *)(a1 + *(int *)(type metadata accessor for AccessPointRequiredData() + 24));
  sub_1000B61FC((uint64_t)v64, (uint64_t)v20, (uint64_t (*)(void))type metadata accessor for Game);
  long long v21 = *(_OWORD *)(a1 + 120);
  long long v83 = *(_OWORD *)(a1 + 104);
  long long v84 = v21;
  long long v85 = *(_OWORD *)(a1 + 136);
  uint64_t v86 = *(void *)(a1 + 152);
  long long v22 = *(_OWORD *)(a1 + 56);
  long long v79 = *(_OWORD *)(a1 + 40);
  long long v80 = v22;
  long long v23 = *(_OWORD *)(a1 + 88);
  long long v81 = *(_OWORD *)(a1 + 72);
  long long v82 = v23;
  long long v24 = *(_OWORD *)(a1 + 24);
  long long v77 = *(_OWORD *)(a1 + 8);
  long long v78 = v24;
  uint64_t v25 = (uint64_t)&v20[v18[7]];
  sub_1000249B4((uint64_t)&v77);
  sub_100092534(a6, 9, v25);
  long long v26 = &v20[v18[5]];
  long long v27 = v84;
  *((_OWORD *)v26 + 6) = v83;
  *((_OWORD *)v26 + 7) = v27;
  *((_OWORD *)v26 + 8) = v85;
  *((void *)v26 + 18) = v86;
  long long v28 = v80;
  *((_OWORD *)v26 + 2) = v79;
  *((_OWORD *)v26 + 3) = v28;
  long long v29 = v82;
  *((_OWORD *)v26 + 4) = v81;
  *((_OWORD *)v26 + 5) = v29;
  long long v30 = v78;
  *(_OWORD *)long long v26 = v77;
  *((_OWORD *)v26 + 1) = v30;
  long long v31 = &v20[v18[6]];
  uint64_t v59 = v20;
  v31[16] = 3;
  *(_OWORD *)long long v31 = xmmword_1001119E0;
  sub_100092B70(0xD000000000000014, 0x80000001000FD8A0, 0, 0, v61, 0xD000000000000016, 0x80000001000FD6E0, 0x636974617473, 0xE600000000000000, 0xD000000000000016, 0x80000001000FD8C0);
  uint64_t v73 = 0;
  unint64_t v74 = 0xE000000000000000;
  _StringGuts.grow(_:)(23);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v73 = v62;
  unint64_t v74 = a9;
  v32._countAndFlagsBits = 0xD000000000000015;
  v32._object = (void *)0x80000001000FD8E0;
  String.append(_:)(v32);
  AnyHashable.init<A>(_:)();
  uint64_t v58 = a3;
  type metadata accessor for GCUILocalizedStrings();
  uint64_t v62 = static GCUILocalizedStrings.OVERLAY_FRIEND_REQUESTS_HIGHLIGHT_TITLE(count:)();
  uint64_t v61 = v33;
  uint64_t v34 = static GCUILocalizedStrings.OVERLAY_FRIEND_REQUESTS_HIGHLIGHT_SUBTITLE(alias:count:)();
  uint64_t v63 = v35;
  long long v36 = (int *)type metadata accessor for AccessPointHighlight(0);
  int v37 = (void *)((char *)a8 + v36[7]);
  *int v37 = a3;
  uint64_t v38 = type metadata accessor for AccessPointIconType(0);
  swift_storeEnumTagMultiPayload();
  long long v39 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56);
  v39(v37, 0, 1, v38);
  v39((void *)((char *)a8 + v36[8]), 1, 1, v38);
  int v75 = v18;
  uint64_t v76 = sub_1000B6264(&qword_100140B58, (void (*)(uint64_t))type metadata accessor for LaunchDashboardAction);
  uint64_t v40 = sub_1000082EC(&v73);
  sub_1000B61FC((uint64_t)v20, (uint64_t)v40, (uint64_t (*)(void))type metadata accessor for LaunchDashboardAction);
  uint64_t v41 = type metadata accessor for PageMetrics();
  uint64_t v42 = (uint64_t)v66;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v66, 1, 1, v41);
  uint64_t v43 = v65;
  uint64_t v44 = (uint64_t)v68;
  Swift::String v45 = v60;
  uint64_t v46 = v67;
  (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v68, v60, v67);
  uint64_t v47 = v43;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v43 + 56))(v44, 0, 1, v46);
  uint64_t v49 = *v64;
  uint64_t v48 = v64[1];
  uint64_t v50 = v61;
  a8[5] = v62;
  a8[6] = v50;
  uint64_t v51 = v63;
  a8[7] = v34;
  a8[8] = v51;
  uint64_t v52 = (char *)a8 + v36[9];
  *(void *)uint64_t v52 = 0x4000000000000000;
  v52[8] = 0;
  *((unsigned char *)a8 + v36[10]) = v69;
  *((unsigned char *)a8 + v36[11]) = 2;
  *((unsigned char *)a8 + v36[12]) = 2;
  uint64_t v53 = (char *)a8 + v36[13];
  uint64_t v72 = 0;
  long long v71 = 0u;
  long long v70 = 0u;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000158AC((uint64_t)&v73, (uint64_t)&v70);
  long long v54 = v71;
  *(_OWORD *)uint64_t v53 = v70;
  *((_OWORD *)v53 + 1) = v54;
  *((void *)v53 + 4) = v72;
  sub_100017388((uint64_t)&v73, &qword_1001401E8);
  sub_100024A74(v42, (uint64_t)a8 + v36[14], &qword_100140B40);
  sub_100024A74(v44, (uint64_t)a8 + v36[15], &qword_1001402E0);
  uint64_t v55 = (void *)((char *)a8 + v36[16]);
  *uint64_t v55 = v49;
  v55[1] = v48;
  *(void *)((char *)a8 + v36[17]) = 2;
  uint64_t v56 = (void *)((char *)a8 + v36[18]);
  *uint64_t v56 = 0;
  v56[1] = 0;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v45, v46);
  return sub_1000B62AC((uint64_t)v59, (uint64_t (*)(void))type metadata accessor for LaunchDashboardAction);
}

uint64_t sub_1000B3490@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v63 = a5;
  uint64_t v62 = a3;
  LODWORD(v66) = a2;
  uint64_t v11 = sub_100005B18(&qword_1001402E0);
  __chkstk_darwin(v11 - 8);
  uint64_t v68 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005B18(&qword_100140B40);
  __chkstk_darwin(v13 - 8);
  uint64_t v64 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = type metadata accessor for ImpressionMetrics();
  uint64_t v15 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v17 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (int *)type metadata accessor for LaunchDashboardAction();
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for AccessPointRequiredData();
  uint64_t v65 = (uint64_t *)(a1 + *(int *)(v21 + 24));
  sub_1000B61FC((uint64_t)v65, (uint64_t)v20, (uint64_t (*)(void))type metadata accessor for Game);
  long long v22 = *(_OWORD *)(a1 + 120);
  long long v82 = *(_OWORD *)(a1 + 104);
  long long v83 = v22;
  long long v84 = *(_OWORD *)(a1 + 136);
  uint64_t v85 = *(void *)(a1 + 152);
  long long v23 = *(_OWORD *)(a1 + 56);
  long long v78 = *(_OWORD *)(a1 + 40);
  long long v79 = v23;
  long long v24 = *(_OWORD *)(a1 + 88);
  long long v80 = *(_OWORD *)(a1 + 72);
  long long v81 = v24;
  long long v25 = *(_OWORD *)(a1 + 24);
  long long v76 = *(_OWORD *)(a1 + 8);
  long long v77 = v25;
  uint64_t v26 = (uint64_t)&v20[v18[7]];
  sub_1000249B4((uint64_t)&v76);
  sub_100092534(a4, 9, v26);
  long long v27 = &v20[v18[5]];
  long long v28 = v81;
  *((_OWORD *)v27 + 4) = v80;
  *((_OWORD *)v27 + 5) = v28;
  long long v29 = v79;
  *((_OWORD *)v27 + 2) = v78;
  *((_OWORD *)v27 + 3) = v29;
  *((void *)v27 + 18) = v85;
  long long v30 = v84;
  long long v31 = v82;
  *((_OWORD *)v27 + 7) = v83;
  *((_OWORD *)v27 + 8) = v30;
  *((_OWORD *)v27 + 6) = v31;
  long long v32 = v77;
  *(_OWORD *)long long v27 = v76;
  *((_OWORD *)v27 + 1) = v32;
  uint64_t v33 = (uint64_t)v20;
  uint64_t v34 = &v20[v18[6]];
  *(void *)uint64_t v34 = 0;
  *((void *)v34 + 1) = 0;
  v34[16] = 0;
  uint64_t v35 = *(void *)(a1 + *(int *)(v21 + 40));
  type metadata accessor for GCUILocalizedStrings();
  if (v35 < 1) {
    uint64_t v36 = static GCUILocalizedStrings.OVERLAY_ACHIEVEMENT_HIGHLIGHT_SUBTITLE(total:)();
  }
  else {
    uint64_t v36 = static GCUILocalizedStrings.OVERLAY_ACHIEVEMENT_HIGHLIGHT_SUBTITLE_INPROGRESS(completed:total:)();
  }
  uint64_t v61 = v36;
  uint64_t v60 = v37;
  sub_100092B70(0xD000000000000014, 0x80000001000FD900, 0, 0, v62, 0xD000000000000014, 0x80000001000FC580, 0x636974617473, 0xE600000000000000, 0xD000000000000015, 0x80000001000FD920);
  uint64_t v72 = 0;
  unint64_t v73 = 0xE000000000000000;
  _StringGuts.grow(_:)(20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v72 = v63;
  unint64_t v73 = a6;
  v38._countAndFlagsBits = 0xD000000000000012;
  v38._object = (void *)0x80000001000FD940;
  String.append(_:)(v38);
  AnyHashable.init<A>(_:)();
  if (qword_10013FC40 != -1) {
    swift_once();
  }
  uint64_t v63 = qword_100156D68;
  uint64_t v62 = qword_100156D70;
  long long v39 = (int *)type metadata accessor for AccessPointHighlight(0);
  uint64_t v40 = (void *)((char *)a7 + v39[7]);
  void *v40 = 0xD00000000000002FLL;
  v40[1] = 0x80000001000FD960;
  uint64_t v41 = type metadata accessor for AccessPointIconType(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v42 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56);
  v42(v40, 0, 1, v41);
  v42((void *)((char *)a7 + v39[8]), 1, 1, v41);
  LOBYTE(v41) = v66 & 1;
  unint64_t v74 = v18;
  uint64_t v75 = sub_1000B6264(&qword_100140B58, (void (*)(uint64_t))type metadata accessor for LaunchDashboardAction);
  uint64_t v43 = sub_1000082EC(&v72);
  uint64_t v59 = v33;
  sub_1000B61FC(v33, (uint64_t)v43, (uint64_t (*)(void))type metadata accessor for LaunchDashboardAction);
  uint64_t v44 = type metadata accessor for PageMetrics();
  uint64_t v45 = (uint64_t)v64;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v64, 1, 1, v44);
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  uint64_t v47 = (uint64_t)v68;
  uint64_t v66 = v17;
  uint64_t v48 = v67;
  v46(v68, v17, v67);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v47, 0, 1, v48);
  uint64_t v50 = *v65;
  uint64_t v49 = v65[1];
  uint64_t v51 = v62;
  a7[5] = v63;
  a7[6] = v51;
  uint64_t v52 = v60;
  a7[7] = v61;
  a7[8] = v52;
  uint64_t v53 = (char *)a7 + v39[9];
  *(void *)uint64_t v53 = 0x4000000000000000;
  v53[8] = 0;
  *((unsigned char *)a7 + v39[10]) = v41;
  *((unsigned char *)a7 + v39[11]) = 2;
  *((unsigned char *)a7 + v39[12]) = 2;
  long long v54 = (char *)a7 + v39[13];
  uint64_t v71 = 0;
  long long v70 = 0u;
  long long v69 = 0u;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000158AC((uint64_t)&v72, (uint64_t)&v69);
  long long v55 = v70;
  *(_OWORD *)long long v54 = v69;
  *((_OWORD *)v54 + 1) = v55;
  *((void *)v54 + 4) = v71;
  sub_100017388((uint64_t)&v72, &qword_1001401E8);
  sub_100024A74(v45, (uint64_t)a7 + v39[14], &qword_100140B40);
  sub_100024A74(v47, (uint64_t)a7 + v39[15], &qword_1001402E0);
  uint64_t v56 = (void *)((char *)a7 + v39[16]);
  *uint64_t v56 = v50;
  v56[1] = v49;
  *(void *)((char *)a7 + v39[17]) = 3;
  uint64_t v57 = (void *)((char *)a7 + v39[18]);
  *uint64_t v57 = 0;
  v57[1] = 0;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v66, v48);
  return sub_1000B62AC(v59, (uint64_t (*)(void))type metadata accessor for LaunchDashboardAction);
}

uint64_t sub_1000B3C30@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v62 = a6;
  uint64_t v61 = a5;
  uint64_t v65 = (char *)a3;
  uint64_t v11 = sub_100005B18(&qword_1001402E0);
  __chkstk_darwin(v11 - 8);
  long long v70 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005B18(&qword_100140B40);
  __chkstk_darwin(v13 - 8);
  uint64_t v67 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for ImpressionMetrics();
  uint64_t v68 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (int *)type metadata accessor for LaunchDashboardAction();
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for AccessPointRequiredData();
  uint64_t v66 = (uint64_t *)(a1 + *(int *)(v20 + 24));
  sub_1000B61FC((uint64_t)v66, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for Game);
  long long v21 = *(_OWORD *)(a1 + 120);
  long long v85 = *(_OWORD *)(a1 + 104);
  long long v86 = v21;
  long long v87 = *(_OWORD *)(a1 + 136);
  uint64_t v88 = *(void *)(a1 + 152);
  long long v22 = *(_OWORD *)(a1 + 56);
  long long v81 = *(_OWORD *)(a1 + 40);
  long long v82 = v22;
  long long v23 = *(_OWORD *)(a1 + 88);
  long long v83 = *(_OWORD *)(a1 + 72);
  long long v84 = v23;
  long long v24 = *(_OWORD *)(a1 + 24);
  long long v79 = *(_OWORD *)(a1 + 8);
  long long v80 = v24;
  uint64_t v25 = (uint64_t)&v19[v17[7]];
  sub_1000249B4((uint64_t)&v79);
  sub_100092534(a4, 9, v25);
  uint64_t v26 = &v19[v17[5]];
  long long v27 = v84;
  *((_OWORD *)v26 + 4) = v83;
  *((_OWORD *)v26 + 5) = v27;
  long long v28 = v82;
  *((_OWORD *)v26 + 2) = v81;
  *((_OWORD *)v26 + 3) = v28;
  *((void *)v26 + 18) = v88;
  long long v29 = v87;
  long long v30 = v85;
  *((_OWORD *)v26 + 7) = v86;
  *((_OWORD *)v26 + 8) = v29;
  *((_OWORD *)v26 + 6) = v30;
  long long v31 = v80;
  *(_OWORD *)uint64_t v26 = v79;
  *((_OWORD *)v26 + 1) = v31;
  uint64_t v32 = v17[6];
  uint64_t v71 = v19;
  uint64_t v33 = &v19[v32];
  *(void *)uint64_t v33 = 0;
  *((void *)v33 + 1) = 0;
  v33[16] = 1;
  if (*(uint64_t *)(a1 + *(int *)(v20 + 56)) < 1)
  {
    unint64_t v35 = v62;
    uint64_t v36 = v61;
    type metadata accessor for GCUILocalizedStrings();
    swift_bridgeObjectRetain();
    uint64_t v64 = static GCUILocalizedStrings.OVERLAY_LEADERBOARD_HIGHLIGHT_SUBTITLE_GET_STARTED(leaderboardName:)();
    uint64_t v63 = v37;
    swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for GCUILocalizedStrings();
    uint64_t v64 = static GCUILocalizedStrings.OVERLAY_LEADERBOARD_HIGHLIGHT_SUBTITLE_FRIEND_RANK(rank:total:)();
    uint64_t v63 = v34;
    unint64_t v35 = v62;
    uint64_t v36 = v61;
  }
  sub_100092B70(0xD000000000000014, 0x80000001000FD990, 0, 0, (uint64_t)v65, 0xD000000000000014, 0x80000001000FC580, 0x636974617473, 0xE600000000000000, 0xD000000000000015, 0x80000001000FD9B0);
  uint64_t v75 = 0;
  unint64_t v76 = 0xE000000000000000;
  _StringGuts.grow(_:)(20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v75 = v36;
  unint64_t v76 = v35;
  v38._countAndFlagsBits = 0xD000000000000012;
  v38._object = (void *)0x80000001000FD9D0;
  String.append(_:)(v38);
  AnyHashable.init<A>(_:)();
  uint64_t v65 = v16;
  if (qword_10013FC48 != -1) {
    swift_once();
  }
  uint64_t v62 = qword_100156D78;
  uint64_t v61 = qword_100156D80;
  long long v39 = (int *)type metadata accessor for AccessPointHighlight(0);
  uint64_t v40 = (void *)((char *)a7 + v39[7]);
  void *v40 = 0xD00000000000001DLL;
  v40[1] = 0x80000001000FD9F0;
  uint64_t v41 = type metadata accessor for AccessPointIconType(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v42 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56);
  v42(v40, 0, 1, v41);
  v42((void *)((char *)a7 + v39[8]), 1, 1, v41);
  LOBYTE(v40) = a2 & 1;
  long long v77 = v17;
  uint64_t v78 = sub_1000B6264(&qword_100140B58, (void (*)(uint64_t))type metadata accessor for LaunchDashboardAction);
  uint64_t v43 = sub_1000082EC(&v75);
  sub_1000B61FC((uint64_t)v71, (uint64_t)v43, (uint64_t (*)(void))type metadata accessor for LaunchDashboardAction);
  uint64_t v44 = type metadata accessor for PageMetrics();
  uint64_t v45 = (uint64_t)v67;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v67, 1, 1, v44);
  uint64_t v46 = v68;
  uint64_t v47 = (uint64_t)v70;
  uint64_t v48 = (uint64_t)v65;
  uint64_t v49 = v69;
  (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v70, v65, v69);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v46 + 56))(v47, 0, 1, v49);
  uint64_t v51 = *v66;
  uint64_t v50 = v66[1];
  uint64_t v52 = v61;
  a7[5] = v62;
  a7[6] = v52;
  uint64_t v53 = v63;
  a7[7] = v64;
  a7[8] = v53;
  long long v54 = (char *)a7 + v39[9];
  *(void *)long long v54 = 0x4000000000000000;
  v54[8] = 0;
  *((unsigned char *)a7 + v39[10]) = (_BYTE)v40;
  *((unsigned char *)a7 + v39[11]) = 2;
  *((unsigned char *)a7 + v39[12]) = 2;
  long long v55 = (char *)a7 + v39[13];
  uint64_t v74 = 0;
  long long v73 = 0u;
  long long v72 = 0u;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000158AC((uint64_t)&v75, (uint64_t)&v72);
  long long v56 = v73;
  *(_OWORD *)long long v55 = v72;
  *((_OWORD *)v55 + 1) = v56;
  *((void *)v55 + 4) = v74;
  sub_100017388((uint64_t)&v75, &qword_1001401E8);
  sub_100024A74(v45, (uint64_t)a7 + v39[14], &qword_100140B40);
  sub_100024A74(v47, (uint64_t)a7 + v39[15], &qword_1001402E0);
  uint64_t v57 = (void *)((char *)a7 + v39[16]);
  *uint64_t v57 = v51;
  v57[1] = v50;
  *(void *)((char *)a7 + v39[17]) = 4;
  uint64_t v58 = (void *)((char *)a7 + v39[18]);
  *uint64_t v58 = 0;
  v58[1] = 0;
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v48, v49);
  return sub_1000B62AC((uint64_t)v71, (uint64_t (*)(void))type metadata accessor for LaunchDashboardAction);
}

uint64_t sub_1000B4448@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  *((void *)&v89 + 1) = a5;
  *(void *)&long long v89 = a4;
  uint64_t v88 = a3;
  int v90 = a2;
  uint64_t v8 = sub_100005B18(&qword_1001402E0);
  __chkstk_darwin(v8 - 8);
  long long v94 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005B18(&qword_100140B40);
  __chkstk_darwin(v10 - 8);
  long long v91 = (char *)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = type metadata accessor for ImpressionMetrics();
  uint64_t v92 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  v104 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005B18(&qword_100142B48);
  __chkstk_darwin(v13 - 8);
  uint64_t v84 = (uint64_t)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = type metadata accessor for MediaArtwork();
  uint64_t v82 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v16 = (char *)&v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005B18(&qword_100140B38);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v98 = (uint64_t)&v82 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v97 = (uint64_t)&v82 - v21;
  __chkstk_darwin(v20);
  uint64_t v99 = (uint64_t)&v82 - v22;
  uint64_t v96 = type metadata accessor for AccessPointIconType(0);
  uint64_t v87 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  uint64_t v102 = (uint64_t *)((char *)&v82 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v24 = sub_100005B18(&qword_100142C28);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (char *)&v82 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for ActionMetrics();
  __chkstk_darwin(v27 - 8);
  uint64_t v28 = sub_100005B18(&qword_100143F80);
  uint64_t v29 = __chkstk_darwin(v28 - 8);
  uint64_t v86 = (uint64_t)&v82 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v33 = (char *)&v82 - v32;
  __chkstk_darwin(v31);
  unint64_t v35 = (char *)&v82 - v34;
  uint64_t v36 = type metadata accessor for Models.ExternalURLAction();
  uint64_t v85 = *(void *)(v36 - 8);
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 56);
  uint64_t v100 = v35;
  uint64_t v95 = v36;
  v37(v35, 1, 1);
  int v101 = (int *)type metadata accessor for AccessPointRequiredData();
  uint64_t v38 = v101[16];
  uint64_t v103 = a1;
  long long v39 = (uint64_t *)(a1 + v38);
  uint64_t v40 = (void *)v39[1];
  if (v40)
  {
    uint64_t v41 = *v39;
    static ActionMetrics.notInstrumented.getter();
    *(void *)&long long v111 = 0;
    *((void *)&v111 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(42);
    swift_bridgeObjectRelease();
    *(void *)&long long v111 = 0xD000000000000023;
    *((void *)&v111 + 1) = 0x80000001000FDA30;
    v42._countAndFlagsBits = v41;
    v42._object = v40;
    String.append(_:)(v42);
    v43._countAndFlagsBits = 0x383D746D3FLL;
    v43._object = (void *)0xE500000000000000;
    String.append(_:)(v43);
    URL.init(string:)();
    swift_bridgeObjectRelease();
    uint64_t v44 = type metadata accessor for URL();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v44 - 8) + 48))(v26, 1, v44);
    if (result == 1)
    {
      __break(1u);
      return result;
    }
    Models.ExternalURLAction.init(actionMetrics:url:isSensitive:)();
    uint64_t v46 = (uint64_t)v100;
    sub_100017388((uint64_t)v100, &qword_100143F80);
    ((void (*)(char *, void, uint64_t, uint64_t))v37)(v33, 0, 1, v95);
    sub_100024A74((uint64_t)v33, v46, &qword_100143F80);
  }
  uint64_t v47 = v102;
  *uint64_t v102 = 0x656461637261;
  v47[1] = 0xE600000000000000;
  v47[2] = 0xBFF0000000000000;
  uint64_t v48 = v96;
  swift_storeEnumTagMultiPayload();
  uint64_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v87 + 56);
  uint64_t v50 = v99;
  v49(v99, 1, 1, v48);
  uint64_t v51 = v84;
  sub_1000170C8(v103 + v101[17], v84, &qword_100142B48);
  uint64_t v52 = v82;
  uint64_t v53 = v83;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v82 + 48))(v51, 1, v83) == 1)
  {
    sub_100017388(v51, &qword_100142B48);
  }
  else
  {
    sub_100017388(v50, &qword_100140B38);
    long long v54 = *(void (**)(char *, uint64_t, uint64_t))(v52 + 32);
    v54(v16, v51, v53);
    v54((char *)v50, (uint64_t)v16, v53);
    swift_storeEnumTagMultiPayload();
    v49(v50, 0, 1, v48);
  }
  uint64_t v55 = v95;
  sub_100092B70(0x6948656461637241, 0xEF746867696C6867, 0, 0, v88, 0xD000000000000014, 0x80000001000FC580, 0x636974617473, 0xE600000000000000, 0xD000000000000010, 0x80000001000FDA10);
  long long v111 = v89;
  swift_bridgeObjectRetain();
  v56._countAndFlagsBits = 0x2D6564616372612DLL;
  v56._object = (void *)0xEC00000064726163;
  String.append(_:)(v56);
  long long v108 = v111;
  AnyHashable.init<A>(_:)();
  if (qword_10013FC38 != -1) {
    swift_once();
  }
  uint64_t v57 = qword_100156D60;
  uint64_t v95 = qword_100156D58;
  uint64_t v58 = (uint64_t *)(v103 + v101[18]);
  uint64_t v60 = *v58;
  uint64_t v59 = v58[1];
  uint64_t v61 = v97;
  sub_1000B61FC((uint64_t)v102, v97, type metadata accessor for AccessPointIconType);
  v49(v61, 0, 1, v96);
  sub_1000170C8(v50, v98, &qword_100140B38);
  uint64_t v62 = v86;
  sub_1000170C8((uint64_t)v100, v86, &qword_100143F80);
  uint64_t v63 = v85;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v85 + 48))(v62, 1, v55) == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100017388(v62, &qword_100143F80);
    long long v108 = 0u;
    long long v109 = 0u;
    unint64_t v110 = 0;
  }
  else
  {
    *((void *)&v109 + 1) = v55;
    unint64_t v110 = &protocol witness table for Models.ExternalURLAction;
    uint64_t v64 = sub_1000082EC((uint64_t *)&v108);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v63 + 32))(v64, v62, v55);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  char v65 = v90 & 1;
  uint64_t v66 = type metadata accessor for PageMetrics();
  uint64_t v67 = (uint64_t)v91;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v91, 1, 1, v66);
  uint64_t v68 = v92;
  uint64_t v69 = (uint64_t)v94;
  uint64_t v70 = v93;
  (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v94, v104, v93);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v68 + 56))(v69, 0, 1, v70);
  uint64_t v71 = (uint64_t *)(v103 + v101[6]);
  uint64_t v72 = v71[1];
  uint64_t v103 = *v71;
  long long v73 = v112;
  *(_OWORD *)a6 = v111;
  *(_OWORD *)(a6 + 16) = v73;
  uint64_t v74 = v95;
  *(void *)(a6 + 32) = v113;
  *(void *)(a6 + 40) = v74;
  *(void *)(a6 + 48) = v57;
  *(void *)(a6 + 56) = v60;
  *(void *)(a6 + 64) = v59;
  uint64_t v75 = (int *)type metadata accessor for AccessPointHighlight(0);
  sub_100024A74(v97, a6 + v75[7], &qword_100140B38);
  sub_100024A74(v98, a6 + v75[8], &qword_100140B38);
  uint64_t v76 = a6 + v75[9];
  *(void *)uint64_t v76 = 0x4000000000000000;
  *(unsigned char *)(v76 + 8) = 0;
  *(unsigned char *)(a6 + v75[10]) = v65;
  *(unsigned char *)(a6 + v75[11]) = 2;
  *(unsigned char *)(a6 + v75[12]) = 1;
  uint64_t v77 = a6 + v75[13];
  uint64_t v107 = 0;
  long long v105 = 0u;
  long long v106 = 0u;
  swift_bridgeObjectRetain();
  sub_1000158AC((uint64_t)&v108, (uint64_t)&v105);
  long long v78 = v106;
  *(_OWORD *)uint64_t v77 = v105;
  *(_OWORD *)(v77 + 16) = v78;
  *(void *)(v77 + 32) = v107;
  sub_100017388((uint64_t)&v108, &qword_1001401E8);
  sub_100024A74(v67, a6 + v75[14], &qword_100140B40);
  sub_100024A74(v69, a6 + v75[15], &qword_1001402E0);
  long long v79 = (void *)(a6 + v75[16]);
  long long v80 = v104;
  *long long v79 = v103;
  v79[1] = v72;
  *(void *)(a6 + v75[17]) = 5;
  long long v81 = (void *)(a6 + v75[18]);
  *long long v81 = 0;
  v81[1] = 0;
  (*(void (**)(char *, uint64_t))(v68 + 8))(v80, v70);
  sub_100017388(v99, &qword_100140B38);
  sub_1000B62AC((uint64_t)v102, type metadata accessor for AccessPointIconType);
  return sub_100017388((uint64_t)v100, &qword_100143F80);
}

uint64_t sub_1000B5094@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  unint64_t v74 = a5;
  uint64_t v73 = a4;
  long long v81 = (char *)a3;
  uint64_t v70 = a2;
  uint64_t v8 = sub_100005B18(&qword_1001402E0);
  __chkstk_darwin(v8 - 8);
  long long v79 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005B18(&qword_100140B40);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  long long v80 = (char *)&v68 - v14;
  uint64_t v78 = type metadata accessor for ImpressionMetrics();
  uint64_t v76 = *(void *)(v78 - 8);
  __chkstk_darwin(v78);
  uint64_t v16 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for AccessPointIconType(0);
  uint64_t v71 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v19 = (char **)((char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = (int *)type metadata accessor for LaunchDashboardAction();
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v68 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for AccessPointRequiredData();
  uint64_t v75 = (uint64_t *)(a1 + *(int *)(v23 + 24));
  sub_1000B61FC((uint64_t)v75, (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for Game);
  long long v24 = *(_OWORD *)(a1 + 120);
  long long v95 = *(_OWORD *)(a1 + 104);
  long long v96 = v24;
  long long v97 = *(_OWORD *)(a1 + 136);
  uint64_t v98 = *(void *)(a1 + 152);
  long long v25 = *(_OWORD *)(a1 + 56);
  long long v91 = *(_OWORD *)(a1 + 40);
  long long v92 = v25;
  long long v26 = *(_OWORD *)(a1 + 88);
  long long v93 = *(_OWORD *)(a1 + 72);
  long long v94 = v26;
  long long v27 = *(_OWORD *)(a1 + 24);
  long long v89 = *(_OWORD *)(a1 + 8);
  long long v90 = v27;
  uint64_t v28 = (uint64_t)&v22[v20[7]];
  sub_1000249B4((uint64_t)&v89);
  sub_100092534((uint64_t)v81, 9, v28);
  uint64_t v29 = &v22[v20[5]];
  long long v30 = v94;
  *((_OWORD *)v29 + 4) = v93;
  *((_OWORD *)v29 + 5) = v30;
  long long v31 = v92;
  *((_OWORD *)v29 + 2) = v91;
  *((_OWORD *)v29 + 3) = v31;
  *((void *)v29 + 18) = v98;
  long long v32 = v97;
  long long v33 = v95;
  *((_OWORD *)v29 + 7) = v96;
  *((_OWORD *)v29 + 8) = v32;
  *((_OWORD *)v29 + 6) = v33;
  long long v34 = v90;
  *(_OWORD *)uint64_t v29 = v89;
  *((_OWORD *)v29 + 1) = v34;
  uint64_t v35 = v20[6];
  long long v81 = v22;
  uint64_t v36 = &v22[v35];
  *(void *)uint64_t v36 = 0;
  *((void *)v36 + 1) = 0;
  v36[16] = 3;
  BOOL v37 = *(unsigned char *)(a1 + *(int *)(v23 + 28)) == 1;
  uint64_t v72 = v17;
  if (v37)
  {
    uint64_t v38 = *((void *)&v90 + 1);
    *uint64_t v19 = v90;
    v19[1] = v38;
    uint64_t v39 = (uint64_t)v19;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
  }
  else
  {
    *uint64_t v19 = 0x65766E6F63696367;
    v19[1] = 0xE900000000000063;
    v19[2] = 0x4041000000000000;
    uint64_t v39 = (uint64_t)v19;
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v77 = v16;
  sub_100092B70(0x6F50737365636341, 0xEB00000000746E69, 0, 0, v70, 0x6F50737365636361, 0xEB00000000746E69, 0x636974617473, 0xE600000000000000, 0x5020737365636341, 0xEC000000746E696FLL);
  uint64_t v40 = type metadata accessor for PageMetrics();
  uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56);
  uint64_t v42 = (uint64_t)v80;
  v41(v80, 1, 1, v40);
  switch(*(unsigned char *)a1)
  {
    case 2:
      swift_bridgeObjectRelease();
      goto LABEL_7;
    default:
      char v43 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v43)
      {
LABEL_7:
        id v44 = [self stringForOrigin:3];
        uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v47 = v46;

        sub_1000920E8(0x6F50737365636361, 0xEF65676150746E69, 0, 1, v45, v47, (uint64_t)v13);
        uint64_t v42 = (uint64_t)v80;
        swift_bridgeObjectRelease();
        sub_100017388(v42, &qword_100140B40);
        v41(v13, 0, 1, v40);
        sub_100024A74((uint64_t)v13, v42, &qword_100140B40);
      }
      uint64_t v85 = 0;
      unint64_t v86 = 0xE000000000000000;
      _StringGuts.grow(_:)(21);
      unint64_t v48 = v74;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v85 = v73;
      unint64_t v86 = v48;
      v49._countAndFlagsBits = 0xD000000000000013;
      v49._object = (void *)0x80000001000FDA60;
      String.append(_:)(v49);
      AnyHashable.init<A>(_:)();
      uint64_t v50 = (int *)type metadata accessor for AccessPointHighlight(0);
      uint64_t v51 = a6 + v50[7];
      uint64_t v69 = v39;
      sub_1000B61FC(v39, v51, type metadata accessor for AccessPointIconType);
      uint64_t v68 = v13;
      uint64_t v52 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 56);
      uint64_t v53 = v72;
      v52(v51, 0, 1, v72);
      v52(a6 + v50[8], 1, 1, v53);
      uint64_t v87 = v20;
      uint64_t v88 = sub_1000B6264(&qword_100140B58, (void (*)(uint64_t))type metadata accessor for LaunchDashboardAction);
      long long v54 = sub_1000082EC(&v85);
      sub_1000B61FC((uint64_t)v81, (uint64_t)v54, (uint64_t (*)(void))type metadata accessor for LaunchDashboardAction);
      sub_1000170C8(v42, (uint64_t)v13, &qword_100140B40);
      uint64_t v55 = v76;
      uint64_t v56 = (uint64_t)v79;
      uint64_t v57 = v77;
      uint64_t v58 = v78;
      (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v79, v77, v78);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v55 + 56))(v56, 0, 1, v58);
      *(_OWORD *)(a6 + 40) = 0u;
      *(_OWORD *)(a6 + 56) = 0u;
      uint64_t v59 = a6 + v50[9];
      *(void *)uint64_t v59 = 0;
      *(unsigned char *)(v59 + 8) = 0;
      *(unsigned char *)(a6 + v50[10]) = 2;
      *(unsigned char *)(a6 + v50[11]) = 2;
      *(unsigned char *)(a6 + v50[12]) = 2;
      uint64_t v61 = *v75;
      uint64_t v60 = v75[1];
      uint64_t v62 = v42;
      uint64_t v63 = a6 + v50[13];
      uint64_t v84 = 0;
      long long v83 = 0u;
      long long v82 = 0u;
      swift_bridgeObjectRetain();
      sub_1000158AC((uint64_t)&v85, (uint64_t)&v82);
      long long v64 = v83;
      *(_OWORD *)uint64_t v63 = v82;
      *(_OWORD *)(v63 + 16) = v64;
      *(void *)(v63 + 32) = v84;
      sub_100017388((uint64_t)&v85, &qword_1001401E8);
      sub_100024A74((uint64_t)v68, a6 + v50[14], &qword_100140B40);
      sub_100024A74(v56, a6 + v50[15], &qword_1001402E0);
      char v65 = (void *)(a6 + v50[16]);
      *char v65 = v61;
      v65[1] = v60;
      *(void *)(a6 + v50[17]) = 1;
      uint64_t v66 = (void *)(a6 + v50[18]);
      *uint64_t v66 = 0;
      v66[1] = 0;
      sub_100017388(v62, &qword_100140B40);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v58);
      sub_1000B62AC(v69, type metadata accessor for AccessPointIconType);
      return sub_1000B62AC((uint64_t)v81, (uint64_t (*)(void))type metadata accessor for LaunchDashboardAction);
  }
}

uint64_t sub_1000B5AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *v3;
  uint64_t v8 = v3[1];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_1000243C4;
  return sub_1000AF10C(a1, a2, a3, v9, v8);
}

void *sub_1000B5BA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100005B18(&qword_100143F90);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1000B5FFC((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100092098();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_1000B5C90(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000B5CD0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1000B5CB0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000B5E74(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000B5CD0(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005B18(&qword_100143F88);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    sub_100005B18(&qword_1001413E0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000B5E74(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005B18(&qword_100143F98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 152);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[152 * v8]) {
      memmove(v12, v13, 152 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[152 * v8] || v12 >= &v13[152 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000B5FFC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  size_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *size_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000B61FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000B6264(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000B62AC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000B630C()
{
  unint64_t result = qword_100142268;
  if (!qword_100142268)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100142268);
  }
  return result;
}

uint64_t AccessPointPageView.init(what:anchor:dashboardLaunchContext:objectGraph:flowAuthority:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int64_t v12 = (int *)type metadata accessor for AccessPointPageView();
  uint64_t v13 = (void *)(a6 + v12[9]);
  sub_100005B18(&qword_10013FD08);
  swift_allocObject();
  LRUMultiCache.init(keyLimit:valueLimit:)();
  State.init(wrappedValue:)();
  *uint64_t v13 = v17;
  v13[1] = v18;
  sub_100069BBC(a1, a6);
  uint64_t v14 = a6 + v12[5];
  uint64_t v15 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14, a2, v15);
  *(void *)(a6 + v12[6]) = a3;
  *(void *)(a6 + v12[7]) = a4;
  return sub_1000B6518(a5, a6 + v12[8]);
}

uint64_t type metadata accessor for AccessPointPageView()
{
  uint64_t result = qword_100144080;
  if (!qword_100144080) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t property wrapper backing initializer of AccessPointPageView.imageCache()
{
  State.init(wrappedValue:)();
  return v1;
}

uint64_t sub_1000B6518(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005B18(&qword_100140C50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t AccessPointPageView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v27 = sub_100005B18(&qword_100143FA0);
  __chkstk_darwin(v27);
  long long v25 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for IntentViewConfiguration();
  uint64_t v3 = *(void *)(v26 - 8);
  uint64_t v4 = __chkstk_darwin(v26);
  long long v24 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - v6;
  uint64_t v8 = type metadata accessor for AccessPointPageView();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8 - 8);
  int64_t v12 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v22 - v13;
  sub_10003D160(v1, (uint64_t)v29);
  sub_1000B93A0(v1, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for AccessPointPageView);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v23 = swift_allocObject();
  sub_1000B9338((uint64_t)v14, v23 + v15, (uint64_t (*)(void))type metadata accessor for AccessPointPageView);
  sub_1000B93A0(v1, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for AccessPointPageView);
  uint64_t v16 = swift_allocObject();
  sub_1000B9338((uint64_t)v12, v16 + v15, (uint64_t (*)(void))type metadata accessor for AccessPointPageView);
  static Transaction._loading.getter();
  IntentViewConfiguration.init()();
  uint64_t v17 = sub_100006650(v29, v29[3]);
  __chkstk_darwin(v17);
  (*(void (**)(char *))(v19 + 16))((char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for AccessPointContainer(0);
  AnyIntentModel.init<A>(_:)();
  uint64_t v20 = v26;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v24, v7, v26);
  sub_100005B18(&qword_100143FA8);
  sub_10001758C(&qword_100143FB0, &qword_100143FA0);
  sub_1000B798C();
  IntentView.init(what:transaction:configuration:working:failed:content:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v20);
  return sub_100007188((uint64_t)v29);
}

uint64_t sub_1000B69F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Color.clear.getter();
  *a1 = result;
  return result;
}

void sub_1000B6A1C()
{
}

void sub_1000B6A80()
{
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100007D4C(v0, (uint64_t)qword_100156CF8);
  swift_errorRetain();
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v3 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Jet View with Startup coordinator failed with error: %@", v2, 0xCu);
    sub_100005B18(&qword_100142A40);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t sub_1000B6C5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v97 = a3;
  uint64_t v5 = sub_100005B18(&qword_1001440D8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&OpaqueTypeConformance2 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AutomationSemantics();
  uint64_t v93 = *(void *)(v8 - 8);
  uint64_t v94 = v8;
  __chkstk_darwin(v8);
  long long v92 = (char *)&OpaqueTypeConformance2 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005B18(&qword_100143FD0);
  uint64_t v89 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v87 = (char *)&OpaqueTypeConformance2 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_100005B18(&qword_100143FE0);
  uint64_t v83 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  uint64_t v13 = (char *)&OpaqueTypeConformance2 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_100005B18(&qword_100143FD8);
  __chkstk_darwin(v95);
  unint64_t v15 = (char *)&OpaqueTypeConformance2 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100005B18(&qword_100143FC8);
  uint64_t v84 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v100 = (char *)&OpaqueTypeConformance2 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100005B18(&qword_100143FC0);
  uint64_t v88 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  unint64_t v86 = (char *)&OpaqueTypeConformance2 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100005B18(&qword_1001440E0);
  uint64_t v91 = *(void *)(v20 - 8);
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v85 = (char *)&OpaqueTypeConformance2 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  long long v90 = (char *)&OpaqueTypeConformance2 - v23;
  uint64_t v24 = *(void *)(*(void *)(a1 + *(int *)(type metadata accessor for AccessPointContainer(0) + 28)) + 16);
  uint64_t v98 = v18;
  uint64_t v99 = v20;
  if (v24)
  {
    uint64_t v80 = a1;
    sub_1000B7DC0(a1, a2, (uint64_t)v15);
    uint64_t v25 = *(int *)(type metadata accessor for AccessPointPageView() + 36);
    long long v82 = v7;
    uint64_t v26 = (uint64_t *)(a2 + v25);
    uint64_t v27 = *(void *)(a2 + v25 + 8);
    *(void *)&long long v102 = *(void *)(a2 + v25);
    *((void *)&v102 + 1) = v27;
    sub_100005B18(&qword_1001440E8);
    State.wrappedValue.getter();
    uint64_t v28 = sub_100005B18(&qword_10013FD08);
    uint64_t v79 = v10;
    uint64_t v29 = v28;
    unint64_t v30 = sub_1000B7D08();
    uint64_t v81 = v5;
    unint64_t v31 = v30;
    uint64_t v32 = sub_10001758C(&qword_100144018, &qword_10013FD08);
    MediaArtworkProtocol.cache<A>(_:allowStandaloneFetches:)();
    swift_release();
    unint64_t v33 = sub_1000B7BB8();
    uint64_t v78 = v16;
    unint64_t v76 = v33;
    *(void *)&long long v102 = &type metadata for PlayerMonogramProtocol;
    *((void *)&v102 + 1) = v29;
    *(void *)&long long v103 = v31;
    *((void *)&v103 + 1) = v32;
    uint64_t v77 = &opaque type descriptor for <<opaque return type of MediaArtworkProtocol.cache<A>(_:allowStandaloneFetches:)>>;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v34 = v95;
    uint64_t v35 = v96;
    View.mediaArtworkProtocol<A>(_:)();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v13, v35);
    sub_100017388((uint64_t)v15, &qword_100143FD8);
    uint64_t v36 = type metadata accessor for MediaArtwork.URLImageProtocol();
    uint64_t v37 = MediaArtwork.URLImageProtocol.__allocating_init()();
    uint64_t v38 = *v26;
    uint64_t v39 = v26[1];
    uint64_t v101 = v37;
    *(void *)&long long v102 = v38;
    *((void *)&v102 + 1) = v39;
    State.wrappedValue.getter();
    uint64_t v40 = sub_1000B7D5C(&qword_100144020, (void (*)(uint64_t))&type metadata accessor for MediaArtwork.URLImageProtocol);
    uint64_t v41 = v87;
    MediaArtworkProtocol.cache<A>(_:allowStandaloneFetches:)();
    swift_release();
    swift_release();
    *(void *)&long long v102 = v34;
    *((void *)&v102 + 1) = v35;
    *(void *)&long long v103 = v76;
    *((void *)&v103 + 1) = OpaqueTypeConformance2;
    uint64_t v42 = swift_getOpaqueTypeConformance2();
    *(void *)&long long v102 = v36;
    *((void *)&v102 + 1) = v29;
    *(void *)&long long v103 = v40;
    *((void *)&v103 + 1) = v32;
    uint64_t v43 = swift_getOpaqueTypeConformance2();
    id v44 = v86;
    uint64_t v45 = v78;
    uint64_t v46 = v79;
    uint64_t v47 = v100;
    View.mediaArtworkProtocol<A>(_:)();
    (*(void (**)(char *, uint64_t))(v89 + 8))(v41, v46);
    (*(void (**)(char *, uint64_t))(v84 + 8))(v47, v45);
    *(void *)&long long v102 = 0;
    *((void *)&v102 + 1) = 0xE000000000000000;
    type metadata accessor for PageID();
    _print_unlocked<A, B>(_:_:)();
    long long v102 = 0u;
    long long v103 = 0u;
    unint64_t v48 = v92;
    static AutomationSemantics.page(name:id:)();
    swift_bridgeObjectRelease();
    sub_100017388((uint64_t)&v102, &qword_100142A70);
    *(void *)&long long v102 = v45;
    *((void *)&v102 + 1) = v46;
    *(void *)&long long v103 = v42;
    *((void *)&v103 + 1) = v43;
    uint64_t v49 = swift_getOpaqueTypeConformance2();
    uint64_t v50 = v85;
    uint64_t v51 = v98;
    View.automationSemantics(_:)();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v48, v94);
    uint64_t v52 = v44;
    uint64_t v53 = v51;
    (*(void (**)(char *, uint64_t))(v88 + 8))(v52, v51);
    uint64_t v55 = v90;
    uint64_t v54 = v91;
    uint64_t v56 = v99;
    (*(void (**)(char *, char *, uint64_t))(v91 + 32))(v90, v50, v99);
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v82, v55, v56);
    swift_storeEnumTagMultiPayload();
    *(void *)&long long v102 = v53;
    *((void *)&v102 + 1) = v49;
    swift_getOpaqueTypeConformance2();
    _ConditionalContent<>.init(storage:)();
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v55, v56);
  }
  else
  {
    uint64_t v59 = v95;
    uint64_t v58 = v96;
    if (qword_10013FBB0 != -1) {
      swift_once();
    }
    uint64_t v60 = v16;
    uint64_t v61 = type metadata accessor for Logger();
    sub_100007D4C(v61, (uint64_t)qword_100156CF8);
    uint64_t v62 = Logger.logObject.getter();
    os_log_type_t v63 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v62, v63))
    {
      long long v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v64 = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "AccessPointContainer did not contain any items to show", v64, 2u);
      swift_slowDealloc();
    }

    swift_storeEnumTagMultiPayload();
    unint64_t v65 = sub_1000B7BB8();
    uint64_t v66 = sub_10000B448(&qword_10013FD08);
    unint64_t v67 = sub_1000B7D08();
    uint64_t v68 = sub_10001758C(&qword_100144018, &qword_10013FD08);
    *(void *)&long long v102 = &type metadata for PlayerMonogramProtocol;
    *((void *)&v102 + 1) = v66;
    *(void *)&long long v103 = v67;
    *((void *)&v103 + 1) = v68;
    uint64_t v69 = swift_getOpaqueTypeConformance2();
    *(void *)&long long v102 = v59;
    *((void *)&v102 + 1) = v58;
    *(void *)&long long v103 = v65;
    *((void *)&v103 + 1) = v69;
    uint64_t v70 = swift_getOpaqueTypeConformance2();
    uint64_t v71 = type metadata accessor for MediaArtwork.URLImageProtocol();
    uint64_t v72 = sub_1000B7D5C(&qword_100144020, (void (*)(uint64_t))&type metadata accessor for MediaArtwork.URLImageProtocol);
    *(void *)&long long v102 = v71;
    *((void *)&v102 + 1) = v66;
    *(void *)&long long v103 = v72;
    *((void *)&v103 + 1) = v68;
    uint64_t v73 = swift_getOpaqueTypeConformance2();
    *(void *)&long long v102 = v60;
    *((void *)&v102 + 1) = v10;
    *(void *)&long long v103 = v70;
    *((void *)&v103 + 1) = v73;
    uint64_t v74 = swift_getOpaqueTypeConformance2();
    *(void *)&long long v102 = v98;
    *((void *)&v102 + 1) = v74;
    swift_getOpaqueTypeConformance2();
    return _ConditionalContent<>.init(storage:)();
  }
}

uint64_t sub_1000B7780()
{
  os_log_type_t v1 = (int *)(type metadata accessor for AccessPointPageView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  sub_100007188(v0 + v3);
  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_release();
  uint64_t v9 = v6 + v1[10];
  swift_release();
  swift_release();
  uint64_t v10 = v9 + *(int *)(sub_100005B18(&qword_100140C50) + 32);
  uint64_t v11 = sub_100005B18(&qword_100140C58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_1000B790C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AccessPointPageView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000B6C5C(a1, v6, a2);
}

unint64_t sub_1000B798C()
{
  unint64_t result = qword_100143FB8;
  if (!qword_100143FB8)
  {
    sub_10000B448(&qword_100143FA8);
    sub_10000B448(&qword_100143FC0);
    sub_10000B448(&qword_100143FC8);
    sub_10000B448(&qword_100143FD0);
    sub_10000B448(&qword_100143FD8);
    sub_10000B448(&qword_100143FE0);
    sub_1000B7BB8();
    sub_10000B448(&qword_10013FD08);
    sub_1000B7D08();
    sub_10001758C(&qword_100144018, &qword_10013FD08);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    type metadata accessor for MediaArtwork.URLImageProtocol();
    sub_1000B7D5C(&qword_100144020, (void (*)(uint64_t))&type metadata accessor for MediaArtwork.URLImageProtocol);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100143FB8);
  }
  return result;
}

unint64_t sub_1000B7BB8()
{
  unint64_t result = qword_100143FE8;
  if (!qword_100143FE8)
  {
    sub_10000B448(&qword_100143FD8);
    sub_1000B7C2C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100143FE8);
  }
  return result;
}

unint64_t sub_1000B7C2C()
{
  unint64_t result = qword_100143FF0;
  if (!qword_100143FF0)
  {
    sub_10000B448(&qword_100143FF8);
    sub_1000B7D5C(&qword_100144000, (void (*)(uint64_t))type metadata accessor for AccessPointShaderTransitionView);
    sub_1000B7D5C(&qword_100144008, (void (*)(uint64_t))type metadata accessor for AccessPointAnimationView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100143FF0);
  }
  return result;
}

unint64_t sub_1000B7D08()
{
  unint64_t result = qword_100144010;
  if (!qword_100144010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144010);
  }
  return result;
}

uint64_t sub_1000B7D5C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000B7DA4()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_1000B7DC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v36 = a3;
  uint64_t v37 = type metadata accessor for AccessPointAnimationView(0);
  __chkstk_darwin(v37);
  unint64_t v31 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100005B18(&qword_1001440F0);
  __chkstk_darwin(v34);
  uint64_t v35 = (uint64_t)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005B18(&qword_100140C50);
  __chkstk_darwin(v7 - 8);
  uint64_t v32 = (uint64_t)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005B18(&qword_100140B48);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AccessPointAnchoring();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  unint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for AccessPointContainer(0);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = type metadata accessor for AccessPointShaderTransitionView(0);
  __chkstk_darwin(v33);
  uint64_t v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [self shared];
  if (result)
  {
    uint64_t v22 = result;
    unsigned int v23 = [result accessPointCustomTransition];

    sub_1000B93A0(a1, (uint64_t)v18, type metadata accessor for AccessPointContainer);
    uint64_t v24 = (int *)type metadata accessor for AccessPointPageView();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a2 + v24[5], v12);
    sub_1000B8304((uint64_t)v11);
    uint64_t v25 = *(void *)(a2 + v24[6]);
    uint64_t v26 = *(void *)(a2 + v24[7]);
    uint64_t v27 = a2 + v24[8];
    uint64_t v28 = v32;
    sub_1000170C8(v27, v32, &qword_100140C50);
    swift_retain();
    swift_retain();
    if (v23)
    {
      sub_10002AE10((uint64_t)v18, (uint64_t)v15, (uint64_t)v11, v25, v26, v28, (uint64_t)v20);
      sub_1000B93A0((uint64_t)v20, v35, type metadata accessor for AccessPointShaderTransitionView);
      swift_storeEnumTagMultiPayload();
      sub_1000B7D5C(&qword_100144000, (void (*)(uint64_t))type metadata accessor for AccessPointShaderTransitionView);
      sub_1000B7D5C(&qword_100144008, (void (*)(uint64_t))type metadata accessor for AccessPointAnimationView);
      _ConditionalContent<>.init(storage:)();
      uint64_t v29 = type metadata accessor for AccessPointShaderTransitionView;
    }
    else
    {
      uint64_t v20 = v31;
      sub_10004A3E4((uint64_t)v18, v15, (uint64_t)v11, v25, v26, v28, (uint64_t)v31);
      sub_1000B93A0((uint64_t)v20, v35, type metadata accessor for AccessPointAnimationView);
      swift_storeEnumTagMultiPayload();
      sub_1000B7D5C(&qword_100144000, (void (*)(uint64_t))type metadata accessor for AccessPointShaderTransitionView);
      sub_1000B7D5C(&qword_100144008, (void (*)(uint64_t))type metadata accessor for AccessPointAnimationView);
      _ConditionalContent<>.init(storage:)();
      uint64_t v29 = type metadata accessor for AccessPointAnimationView;
    }
    return (id)sub_1000B9408((uint64_t)v20, v29);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000B8304@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v27 = a1;
  uint64_t v3 = sub_100005B18(&qword_1001440F8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = &v28[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v6 = type metadata accessor for InGameBannerPageIntent();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v28[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v10 = sub_100005B18(&qword_100144100);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = &v28[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v13 = type metadata accessor for AccessPointPageIntent();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = &v28[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_10003D160(v2, (uint64_t)v28);
  sub_100005B18(&qword_100144108);
  int v17 = swift_dynamicCast();
  uint64_t v18 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  if (v17)
  {
    v18(v12, 0, 1, v13);
    sub_1000B9338((uint64_t)v12, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for AccessPointPageIntent);
    uint64_t v19 = v27;
    sub_1000B93A0((uint64_t)&v16[*(int *)(v13 + 32)], v27, (uint64_t (*)(void))type metadata accessor for Game);
    sub_1000B9408((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for AccessPointPageIntent);
    uint64_t v20 = type metadata accessor for Game();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 0, 1, v20);
  }
  else
  {
    uint64_t v22 = v27;
    v18(v12, 1, 1, v13);
    sub_100017388((uint64_t)v12, &qword_100144100);
    sub_10003D160(v2, (uint64_t)v28);
    int v23 = swift_dynamicCast();
    uint64_t v24 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    if (v23)
    {
      v24(v5, 0, 1, v6);
      sub_1000B9338((uint64_t)v5, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for InGameBannerPageIntent);
      uint64_t v25 = type metadata accessor for InGameBannerRequiredData();
      sub_1000170C8((uint64_t)&v9[*(int *)(v25 + 40)], v22, &qword_100140B48);
      return sub_1000B9408((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for InGameBannerRequiredData);
    }
    else
    {
      v24(v5, 1, 1, v6);
      sub_100017388((uint64_t)v5, &qword_1001440F8);
      uint64_t v26 = type metadata accessor for Game();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v22, 1, 1, v26);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AccessPointPageView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *a2;
    *(void *)a1 = *a2;
    uint64_t v4 = v25 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = a3[5];
    uint64_t v9 = v4 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = type metadata accessor for AccessPointAnchoring();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[7];
    *(void *)(v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(void *)(v4 + v12) = *(uint64_t *)((char *)a2 + v12);
    uint64_t v13 = a3[8];
    uint64_t v14 = (void *)(v4 + v13);
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v13 + 8);
    *uint64_t v14 = *(uint64_t *)((char *)a2 + v13);
    v14[1] = v16;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v17 = *(int *)(sub_100005B18(&qword_100140C50) + 32);
    uint64_t v18 = (char *)v14 + v17;
    uint64_t v19 = v15 + v17;
    uint64_t v20 = sub_100005B18(&qword_100140C58);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    uint64_t v21 = a3[9];
    uint64_t v22 = (void *)(v4 + v21);
    int v23 = (uint64_t *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    void *v22 = *v23;
    v22[1] = v24;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for AccessPointPageView(uint64_t a1, uint64_t a2)
{
  sub_100007188(a1);
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  swift_release();
  swift_release();
  uint64_t v7 = v6 + *(int *)(sub_100005B18(&qword_100140C50) + 32);
  uint64_t v8 = sub_100005B18(&qword_100140C58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for AccessPointPageView(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)(a2 + v12 + 8);
  *uint64_t v13 = *(void *)(a2 + v12);
  v13[1] = v15;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v16 = *(int *)(sub_100005B18(&qword_100140C50) + 32);
  uint64_t v17 = (char *)v13 + v16;
  uint64_t v18 = v14 + v16;
  uint64_t v19 = sub_100005B18(&qword_100140C58);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for AccessPointPageView(uint64_t *a1, uint64_t *a2, int *a3)
{
  sub_100019BC0(a1, a2);
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(uint64_t *)((char *)a1 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
  swift_retain();
  swift_release();
  *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  swift_retain();
  swift_release();
  uint64_t v10 = a3[8];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  uint64_t v13 = *(int *)(sub_100005B18(&qword_100140C50) + 32);
  uint64_t v14 = &v11[v13];
  uint64_t v15 = &v12[v13];
  uint64_t v16 = sub_100005B18(&qword_100140C58);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = a3[9];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *(uint64_t *)((char *)a1 + v17) = *(uint64_t *)((char *)a2 + v17);
  swift_retain();
  swift_release();
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for AccessPointPageView(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)(a2 + v12 + 8);
  *uint64_t v13 = *(void *)(a2 + v12);
  v13[1] = v15;
  uint64_t v16 = *(int *)(sub_100005B18(&qword_100140C50) + 32);
  uint64_t v17 = (char *)v13 + v16;
  uint64_t v18 = v14 + v16;
  uint64_t v19 = sub_100005B18(&qword_100140C58);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for AccessPointPageView(uint64_t a1, uint64_t a2, int *a3)
{
  sub_100007188(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  swift_release();
  *(void *)(v12 + 8) = *(void *)(v13 + 8);
  swift_release();
  uint64_t v14 = *(int *)(sub_100005B18(&qword_100140C50) + 32);
  uint64_t v15 = v12 + v14;
  uint64_t v16 = v13 + v14;
  uint64_t v17 = sub_100005B18(&qword_100140C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  uint64_t v18 = a3[9];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = (void *)(a2 + v18);
  *(void *)(a1 + v18) = *v20;
  swift_release();
  *(void *)(v19 + 8) = v20[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessPointPageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000B8F9C);
}

uint64_t sub_1000B8F9C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for AccessPointAnchoring();
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
      uint64_t v13 = sub_100005B18(&qword_100140C50);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for AccessPointPageView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000B90E0);
}

uint64_t sub_1000B90E0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for AccessPointAnchoring();
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
      uint64_t v13 = sub_100005B18(&qword_100140C50);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_1000B9210()
{
  type metadata accessor for AccessPointAnchoring();
  if (v0 <= 0x3F)
  {
    sub_100028B90();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_1000B92FC()
{
  return sub_10001758C(&qword_1001440C8, &qword_1001440D0);
}

uint64_t sub_1000B9338(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000B93A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000B9408(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *Bag.metricsTopicKey.unsafeMutableAddressor()
{
  if (qword_10013FC90 != -1) {
    swift_once();
  }
  return &static Bag.metricsTopicKey;
}

unint64_t sub_1000B94B4(uint64_t a1)
{
  uint64_t v2 = sub_100005B18(&qword_100144200);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (void *)((char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B18(&qword_100144208);
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
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1000170C8(v12, (uint64_t)v5, &qword_100144200);
    uint64_t v14 = *v5;
    unint64_t result = sub_1000DC320(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v7[6] + 8 * result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = type metadata accessor for Bag.ValueOverride();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
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

unint64_t sub_1000B96AC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B18((uint64_t *)&unk_1001441C0);
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
    sub_1000170C8(v6, (uint64_t)&v15, &qword_100143318);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000DC324(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100074BB4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1000B97E4(uint64_t a1)
{
  return sub_1000B980C(a1, &qword_100144220, &qword_100144228);
}

unint64_t sub_1000B97F8(uint64_t a1)
{
  return sub_1000B980C(a1, &qword_100144210, &qword_100144218);
}

unint64_t sub_1000B980C(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005B18(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    unint64_t v11 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B18(a3);
  uint64_t v10 = static _DictionaryStorage.allocate(capacity:)();
  unint64_t v11 = (void *)v10;
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  uint64_t v13 = *(int *)(v6 + 48);
  uint64_t v14 = v10 + 64;
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v26[1] = a1;
  uint64_t v16 = a1 + v15;
  uint64_t v17 = *(void *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_1000170C8(v16, (uint64_t)v9, a2);
    unint64_t result = sub_1000DC39C((uint64_t)v9);
    if (v19) {
      break;
    }
    unint64_t v20 = result;
    *(void *)(v14 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v21 = v11[6];
    uint64_t v22 = type metadata accessor for MetricsEventType();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v21 + *(void *)(*(void *)(v22 - 8) + 72) * v20, v9, v22);
    *(void *)(v11[7] + 8 * v20) = *(void *)&v9[v13];
    uint64_t v23 = v11[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_11;
    }
    v11[2] = v25;
    v16 += v17;
    if (!--v12)
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

unint64_t sub_1000B99F8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B18((uint64_t *)&unk_1001441F0);
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
    unint64_t result = sub_1000DC324(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
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

unint64_t sub_1000B9B1C(uint64_t a1)
{
  return sub_1000B9B34(a1, &qword_1001441D0);
}

unint64_t sub_1000B9B28(uint64_t a1)
{
  return sub_1000B9B34(a1, &qword_1001441D8);
}

unint64_t sub_1000B9B34(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B18(a2);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_1000DC324(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
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

unint64_t sub_1000B9C4C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B18(&qword_1001441B0);
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
    sub_1000170C8(v6, (uint64_t)v15, &qword_1001441B8);
    unint64_t result = sub_1000DC420((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_100074BB4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1000B9D90(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B18(&qword_1001441E0);
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
    sub_1000170C8(v6, (uint64_t)&v13, &qword_1001441E8);
    uint64_t v7 = v13;
    unint64_t result = sub_1000DC320(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100074BB4(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_1000B9EC0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B18(&qword_100142600);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    long long v13 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000DC324(v5, v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v9 = (uint64_t *)(v2[6] + 16 * result);
    *char v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

uint64_t BagProfile.init(name:version:overrides:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  uint64_t v8 = type metadata accessor for BagProfile();
  uint64_t result = Bag.Stubs.init()();
  *(void *)((char *)a6 + *(int *)(v8 + 28)) = a5;
  return result;
}

NSString sub_1000BA034()
{
  NSString result = String._bridgeToObjectiveC()();
  static Bag.metricsTopicKey = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for BagProfile()
{
  uint64_t result = qword_100144170;
  if (!qword_100144170) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id static Bag.metricsTopicKey.getter()
{
  if (qword_10013FC90 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)static Bag.metricsTopicKey;

  return v0;
}

uint64_t Bag.metricsTopic.getter()
{
  uint64_t v0 = sub_100005B18(&qword_100144110);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10013FC90 != -1) {
    swift_once();
  }
  Bag.subscript.getter();
  Bag.Value.current(or:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

void sub_1000BA248(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

uint64_t BagProfile.stubs.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BagProfile() + 24);
  uint64_t v4 = type metadata accessor for Bag.Stubs();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t BagProfile.overrides.getter()
{
  type metadata accessor for BagProfile();

  return swift_bridgeObjectRetain();
}

uint64_t BagProfile.init(name:version:stubs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  uint64_t v8 = type metadata accessor for BagProfile();
  char v9 = (char *)a6 + *(int *)(v8 + 24);
  uint64_t v10 = type metadata accessor for Bag.Stubs();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a5, v10);
  unint64_t v12 = sub_1000B94B4((uint64_t)_swiftEmptyArrayStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(a5, v10);
  *(void *)((char *)a6 + *(int *)(v8 + 28)) = v12;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for BagProfile(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for Bag.Stubs();
    long long v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 28));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for BagProfile(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for Bag.Stubs();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for BagProfile(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for Bag.Stubs();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  *(void *)((char *)a1 + *(int *)(a3 + 28)) = *(void *)((char *)a2 + *(int *)(a3 + 28));
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for BagProfile(void *a1, void *a2, uint64_t a3)
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
  uint64_t v9 = type metadata accessor for Bag.Stubs();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 28)) = *(void *)((char *)a2 + *(int *)(a3 + 28));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for BagProfile(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Bag.Stubs();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 28)) = *(void *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

void *assignWithTake for BagProfile(void *a1, void *a2, uint64_t a3)
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
  uint64_t v11 = type metadata accessor for Bag.Stubs();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  *(void *)((char *)a1 + *(int *)(a3 + 28)) = *(void *)((char *)a2 + *(int *)(a3 + 28));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BagProfile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000BA890);
}

uint64_t sub_1000BA890(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for Bag.Stubs();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for BagProfile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000BA954);
}

uint64_t sub_1000BA954(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Bag.Stubs();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1000BA9FC()
{
  uint64_t result = type metadata accessor for Bag.Stubs();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000BAAA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v4 = sub_100005B18(&qword_1001444C8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  if (*v1)
  {
    uint64_t v9 = (char *)*v1;
  }
  else
  {
    unint64_t v10 = sub_1000B9B1C((uint64_t)_swiftEmptyArrayStorage);
    id v11 = objc_allocWithZone((Class)type metadata accessor for DashboardRequest());
    uint64_t v9 = DashboardRequest.init(initialState:)(v10);
  }
  swift_unknownObjectWeakLoadStrong();
  uint64_t v12 = *(void *)(v2 + 56);
  uint64_t v13 = *(void *)(v2 + 64);
  v22[0] = v9;
  swift_unknownObjectWeakInit();
  id v14 = v8;
  sub_100026018(v12);
  swift_unknownObjectRelease();
  v22[2] = v12;
  uint64_t v23 = v13;
  uint64_t v15 = static SafeAreaRegions.all.getter();
  char v16 = static Edge.Set.all.getter();
  sub_1000C06BC((uint64_t)v22, v26);
  v26[4] = v15;
  char v27 = v16;
  sub_1000C06F4((uint64_t)v22);
  sub_100072E54(v2 + 16, (uint64_t)v22);
  uint64_t v17 = v23;
  if (v23)
  {
    uint64_t v18 = v24;
    sub_100006650(v22, v23);
    char v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 24))(v17, v18) & 1;
    sub_100007188((uint64_t)v22);
  }
  else
  {
    sub_100017388((uint64_t)v22, &qword_1001444D0);
    char v19 = 2;
  }
  char v25 = v19;
  sub_10005FC94(v2, (uint64_t)v22);
  uint64_t v20 = swift_allocObject();
  sub_1000C0784((uint64_t)v22, v20 + 16);
  sub_100005B18(&qword_1001444D8);
  sub_100005B18(&qword_1001444E0);
  sub_1000C07FC();
  sub_1000C08CC();
  View.onChange<A>(of:initial:_:)();
  swift_release();
  sub_100017388((uint64_t)v26, &qword_1001444D8);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v7, v4);
}

void sub_1000BAD4C(uint64_t a1, char *a2, uint64_t a3)
{
  char v4 = *a2;
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100007D4C(v5, (uint64_t)qword_100156CF8);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 67109376;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v8 + 8) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "GameCenterDashboard: Observed a change of remoteAlertContext.dismissDashboardRequested (%{BOOL}d -> %{BOOL}d)", (uint8_t *)v8, 0xEu);
    swift_slowDealloc();

    if ((v4 & 1) == 0) {
      return;
    }
  }
  else
  {

    if ((v4 & 1) == 0) {
      return;
    }
  }
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "GameCenterDashboard: Calling dismissHandler..", v11, 2u);
    swift_slowDealloc();
  }

  uint64_t v12 = *(void (**)(void))(a3 + 56);
  if (v12) {
    v12();
  }
}

char *sub_1000BAF30()
{
  unint64_t v1 = v0;
  uint64_t v2 = (void *)*v0;
  id v3 = objc_allocWithZone((Class)type metadata accessor for DashboardContentViewController());
  char v4 = (char *)sub_1000BBA84(v2);
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  os_log_type_t v7 = (uint64_t *)&v4[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler];
  uint64_t v8 = *(void *)&v4[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler];
  *os_log_type_t v7 = v5;
  v7[1] = v6;
  sub_100026018(v5);
  sub_100039104(v8);
  swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  uint64_t v9 = *(void **)(*v1 + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_currentGame);
  if (v9)
  {
    os_log_type_t v10 = self;
    id v11 = v9;
    id v12 = [v11 internal];
    [v10 setCurrentGameFromInternal:v12 serverEnvironment:[v11 environment]];
  }
  return v4;
}

uint64_t sub_1000BB050()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_1000BB08C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000C0CF4();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000BB0F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000C0CF4();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000BB154()
{
}

id sub_1000BB228(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v49 = a2;
  uint64_t v50 = a3;
  uint64_t v4 = sub_100005B18(&qword_1001444B8);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DashboardLaunchContext();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  id v14 = (char *)&v48 - v13;
  __chkstk_darwin(v12);
  char v16 = (char *)&v48 - v15;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v51 = [self bundleForClass:ObjCClassFromMetadata];
  if (a1)
  {
    id v18 = [a1 launchContext];
    if (v18)
    {
      char v19 = v18;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
  }
  DashboardLaunchContext.init(rawValue:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    uint64_t v20 = *(void (**)(char *, void, uint64_t))(v8 + 104);
    v20(v16, enum case for DashboardLaunchContext.inGame(_:), v7);
    sub_100017388((uint64_t)v6, &qword_1001444B8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v16, v6, v7);
    uint64_t v20 = *(void (**)(char *, void, uint64_t))(v8 + 104);
  }
  v20(v14, enum case for DashboardLaunchContext.contacts(_:), v7);
  sub_1000C0158();
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  if (v52 == v55) {
    char v21 = 1;
  }
  else {
    char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v22 = v14;
  uint64_t v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  v23(v22, v7);
  if ((v21 & 1) == 0)
  {
    id v36 = [self currentDevice];
    id v37 = [v36 userInterfaceIdiom];

    if (v37 == (id)1 || GKIsXRUIIdiomShouldUsePadUI())
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v16, v7);
      uint64_t v38 = (objc_class *)type metadata accessor for DashboardSplitViewController();
      long long v52 = 0u;
      long long v53 = 0u;
      uint64_t v54 = 0;
      id v39 = objc_allocWithZone(v38);
      id v40 = a1;
      id v27 = (id)DashboardSplitViewController.init(launchContext:request:navigationProxy:)();
      uint64_t v41 = swift_allocObject();
      uint64_t v42 = v49;
      uint64_t v43 = v50;
      *(void *)(v41 + 16) = v49;
      *(void *)(v41 + 24) = v43;
      sub_100026018(v42);
      DashboardSplitViewController.dismissHandler.setter();
    }
    else
    {
      type metadata accessor for JetDashboardViewController();
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v16, v7);
      id v44 = a1;
      id v45 = v51;
      uint64_t v46 = (void *)JetDashboardViewController.__allocating_init(nibName:bundle:launchContext:request:)();
      sub_100026018(v49);
      id v27 = v46;
      dispatch thunk of BaseJetCollectionViewController.dismissHandler.setter();
    }
LABEL_24:
    v23(v16, v7);
    return v27;
  }
  if (!a1 || (id v24 = [a1 playerID]) == 0)
  {
    id v25 = [self localPlayer];
    id v26 = [v25 internal];

    id v24 = [v26 playerID];
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  type metadata accessor for PlayerProfileViewController();
  uint64_t v54 = 0;
  long long v52 = 0u;
  long long v53 = 0u;
  id v27 = (id)PlayerProfileViewController.__allocating_init(playerId:navigationProxy:objectGraph:)();
  id v28 = [self currentDevice];
  id v29 = [v28 userInterfaceIdiom];

  if (v29 == (id)1 || GKIsXRUIIdiomShouldUsePadUI())
  {
    id v30 = [self _gkXmarkedCloseButtonWithTarget:v27 action:"donePressed:"];
    if (v30)
    {
      id v31 = v30;
      NSString v32 = String._bridgeToObjectiveC()();
      [v31 setAccessibilityIdentifier:v32];

      id v33 = [v27 navigationItem];
      id v34 = [objc_allocWithZone((Class)UIBarButtonItem) initWithCustomView:v31];
      [v33 setRightBarButtonItem:v34];
    }
    id v35 = v27;
    sub_100026018(v49);
    dispatch thunk of BaseJetCollectionViewController.dismissHandler.setter();

    id v27 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v35];
    goto LABEL_24;
  }
  v23(v16, v7);

  return v27;
}

id sub_1000BBA34()
{
  return sub_1000BFAB4(type metadata accessor for GameCenterDashboardLaunchManager);
}

uint64_t type metadata accessor for GameCenterDashboardLaunchManager()
{
  return self;
}

id sub_1000BBA84(void *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler];
  *id v3 = 0;
  v3[1] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController__navigationController] = 0;
  v1[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_alwaysShowDoneButton] = 1;
  v1[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_requiresNavigationController] = 1;
  *(void *)&v1[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_contentViewController] = 0;
  uint64_t v4 = OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_effectView;
  id v5 = objc_allocWithZone((Class)UIVisualEffectView);
  unint64_t v6 = v1;
  *(void *)&v1[v4] = [v5 init];
  v6[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_adjustTopConstraint] = 1;
  uint64_t v7 = OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_daemonProxy;
  *(void *)&v6[v7] = [objc_allocWithZone((Class)GKDaemonProxy) init];
  *(void *)&v6[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_GKScrollToTopViewTag] = 8400;
  swift_unknownObjectWeakInit();
  *(void *)&v6[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dashboardAssetNames] = _swiftEmptyDictionarySingleton;
  *(void *)&v6[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_leaderboardSetAssetNames] = _swiftEmptyDictionarySingleton;
  *(void *)&v6[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_leaderboardAssetNames] = _swiftEmptyDictionarySingleton;
  *(void *)&v6[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_request] = a1;
  id v8 = a1;

  v15.receiver = v6;
  v15.super_class = (Class)type metadata accessor for DashboardContentViewController();
  [super initWithNibName:0 bundle:0];
  uint64_t v10 = self;
  id v11 = v9;
  [v10 setForCurrentProcessAllowingPDF:1];
  GKUISetRemote();
  if (sub_1000BFBE0()) {
    sub_1000C0D48();
  }
  [v11 setModalPresentationStyle:5];
  id v12 = [self currentDevice];
  id v13 = [v12 userInterfaceIdiom];

  if (v13 == (id)1) {
    *((unsigned char *)v11 + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_requiresNavigationController) = 0;
  }
  return v11;
}

void sub_1000BBCC4()
{
  v32.receiver = v0;
  v32.super_class = (Class)type metadata accessor for DashboardContentViewController();
  [super viewDidLoad];
  [v0 setOverrideUserInterfaceStyle:2];
  uint64_t v1 = OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_effectView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_effectView];
  id v3 = self;
  id v4 = v2;
  Class isa = (Class)[v3 _gkGameLayerBackgroundVisualEffect];
  if (!isa)
  {
    sub_100069708(0, (unint64_t *)&qword_100144440);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  [v4 setBackgroundEffects:isa];

  [*(id *)&v0[v1] _setGroupName:GKExtensionVisualEffectGroupName];
  sub_1000BD0B4();
  uint64_t v6 = OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_request;
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_request];
  id v8 = *(void **)(v7 + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_localPlayer);
  if (v8)
  {
    id v9 = self;
    id v10 = v8;
    id v11 = [v9 local];
    [v11 updateFromLocalPlayer:v10];

    uint64_t v7 = *(void *)&v0[v6];
  }
  [*(id *)&v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_daemonProxy] setHostPID:*(unsigned int *)(v7 + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_hostPID)];
  sub_1000C0120(*(unsigned __int8 *)(*(void *)&v0[v6]
                                   + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_shouldLayoutRTL));
  id v12 = *(id *)&v0[v1];
  id v13 = [v0 view];
  if (!v13)
  {
    __break(1u);
    goto LABEL_17;
  }
  id v14 = v13;
  [v13 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  [v12 setFrame:v16, v18, v20, v22];
  [*(id *)&v0[v1] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v23 = [v0 parentViewController];
  if (!v23) {
    goto LABEL_11;
  }
  id v24 = v23;
  id v25 = [v23 view];

  if (!v25)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v26 = [v25 window];

  if (!v26
    || (id v27 = [v26 rootViewController], v26, !v27)
    || (id v28 = [v27 view], v27, !v28))
  {
LABEL_11:
    id v29 = [v0 parentViewController];
    if (!v29) {
      return;
    }
    id v30 = v29;
    id v31 = [v29 view];

    if (v31)
    {
      id v28 = [v31 window];

      if (!v28) {
        return;
      }
      goto LABEL_14;
    }
LABEL_18:
    __break(1u);
    return;
  }
LABEL_14:
  sub_1000BC8D8(v28);
}

void sub_1000BC080(char a1)
{
  [*(id *)&v1[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_daemonProxy] setDataUpdateDelegate:v1];
  v23.receiver = v1;
  v23.super_class = (Class)type metadata accessor for DashboardContentViewController();
  [super viewWillAppear:a1 & 1];
  uint64_t v3 = OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_effectView;
  id v4 = [*(id *)&v1[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_effectView] backgroundEffects];
  sub_100069708(0, (unint64_t *)&qword_100144440);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v6 = *(id *)&v1[v3];
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v6 setBackgroundEffects:isa];

  id v8 = [v1 view];
  if (v8)
  {
    id v9 = v8;
    id v10 = [v8 layer];

    [v10 setOpacity:0.0];
    id v11 = objc_allocWithZone((Class)CAMediaTimingFunction);
    LODWORD(v12) = 1050253722;
    LODWORD(v13) = 1045220557;
    LODWORD(v14) = 1061997773;
    LODWORD(v15) = 0.75;
    id v16 = [v11 initWithControlPoints:v12 :v13 :v15 :v14];
    double v17 = self;
    [v17 begin];
    [v16 doubleValueSafe];
    [v17 setAnimationDuration:];
    double v18 = self;
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v1;
    *(void *)(v19 + 24) = v5;
    v22[4] = sub_1000C0118;
    v22[5] = v19;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 1107296256;
    v22[2] = sub_1000DCCB0;
    void v22[3] = &unk_100134268;
    double v20 = _Block_copy(v22);
    double v21 = v1;
    swift_release();
    [v18 animateWithDuration:v20 animations:0.33];
    _Block_release(v20);
    [v17 commit];
  }
  else
  {
    __break(1u);
  }
}

void sub_1000BC32C(char *a1)
{
  id v2 = [a1 view];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [v2 layer];

    LODWORD(v5) = 1.0;
    [v4 setOpacity:v5];

    id v6 = *(void **)&a1[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_effectView];
    sub_100069708(0, (unint64_t *)&qword_100144440);
    id v7 = v6;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    [v7 setBackgroundEffects:isa];
  }
  else
  {
    __break(1u);
  }
}

id sub_1000BC474()
{
  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for DashboardContentViewController();
  [super viewWillLayoutSubviews];
  id v1 = [v0 childViewControllers];
  sub_100069708(0, &qword_100144438);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
    return (id)swift_bridgeObjectRelease();
  }
LABEL_13:
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3) {
    return (id)swift_bridgeObjectRelease();
  }
LABEL_3:
  for (uint64_t i = 4; ; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v5 = *(id *)(v2 + 8 * i);
    }
    id v6 = v5;
    uint64_t v7 = i - 3;
    if (__OFADD__(i - 4, 1))
    {
      __break(1u);
      goto LABEL_13;
    }
    id result = [v5 view];
    if (!result) {
      break;
    }
    id v9 = result;
    id result = [v0 view];
    if (!result) {
      goto LABEL_16;
    }
    id v10 = result;
    [result bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    [v9 setFrame:v12, v14, v16, v18];
    if (v7 == v3) {
      return (id)swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

void sub_1000BC69C(char a1)
{
  unint64_t v2 = v1;
  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for DashboardContentViewController();
  [super viewWillAppear:a1 & 1];
  [v2 becomeFirstResponder];
  if (*((unsigned char *)v2 + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_requiresNavigationController) != 1) {
    goto LABEL_6;
  }
  id v4 = [objc_allocWithZone((Class)UIFocusGuide) init];
  id v5 = [v2 navigationController];
  if (!v5)
  {
LABEL_5:

LABEL_6:
    sub_1000BCB04();
    return;
  }
  id v6 = v5;
  sub_100005B18(&qword_100144420);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100111BA0;
  *(void *)(v7 + 32) = [v6 navigationBar];
  specialized Array._endMutation()();
  sub_100005B18(&qword_1001444B0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v4 setPreferredFocusEnvironments:isa];

  id v9 = [v6 view];
  if (v9)
  {
    id v10 = v9;
    [v9 addLayoutGuide:v4];

    double v11 = self;
    id v12 = v4;
    id v13 = [v6 navigationBar];
    [v11 _gkInstallEdgeConstraintsForLayoutGuide:v12 containedWithinParentView:v13];

    goto LABEL_5;
  }
  __break(1u);
}

void sub_1000BC8D8(void *a1)
{
  id v3 = [a1 viewWithTag:678];
  [v3 removeFromSuperview];

  id v5 = [objc_allocWithZone((Class)UIVisualEffectView) init];
  Class isa = (Class)[self _gkGameLayerBackgroundVisualEffect];
  if (!isa)
  {
    sub_100069708(0, (unint64_t *)&qword_100144440);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  [v5 setBackgroundEffects:isa];

  [*(id *)(v1 + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_effectView) _setGroupName:GKExtensionVisualEffectGroupName];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setTag:678];
  [a1 insertSubview:v5 atIndex:0];
  [self _gkInstallEdgeConstraintsForView:v5 containedWithinParentView:a1];
}

void sub_1000BCB04()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.trace.getter();
  id v5 = v0;
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v14 = v1;
    uint64_t v9 = v8;
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    [v5 classForCoder];
    swift_getObjCClassMetadata();
    uint64_t v10 = _typeName(_:qualified:)();
    uint64_t v15 = sub_100036BF8(v10, v11, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v15 = sub_100036BF8(0xD000000000000027, 0x80000001000FDD90, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "GameController: %s::%s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v14);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  id v12 = [self defaultCenter];
  [v12 addObserver:v5 selector:"dismissNotificationCallback:" name:GKDashboardNeedsToDismiss object:0];
}

void sub_1000BCE10()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.trace.getter();
  id v5 = v0;
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v14 = v1;
    uint64_t v9 = v8;
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    [v5 classForCoder];
    swift_getObjCClassMetadata();
    uint64_t v10 = _typeName(_:qualified:)();
    uint64_t v15 = sub_100036BF8(v10, v11, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v15 = sub_100036BF8(0xD000000000000029, 0x80000001000FDD60, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "GameController: %s::%s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v14);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  id v12 = [self defaultCenter];
  [v12 removeObserver:v5 name:GKDashboardNeedsToDismiss object:0];
}

void sub_1000BD0B4()
{
  uint64_t v1 = v0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_adjustTopConstraint) = 0;
  id v2 = [objc_allocWithZone((Class)GKDashboardRequest) init];
  uint64_t v3 = OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_request;
  [v2 setState:*(void *)(*(void *)(v1 + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_request)+ OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_viewState)];
  if (*(void *)(*(void *)(v1 + v3) + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardIdentifier + 8))
  {
    swift_bridgeObjectRetain();
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  [v2 setLeaderboardID:v4];

  if (*(void *)(*(void *)(v1 + v3) + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardSetID + 8))
  {
    swift_bridgeObjectRetain();
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  [v2 setLeaderboardSetID:v5];

  if (*(void *)(*(void *)(v1 + v3) + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardTitle + 8))
  {
    swift_bridgeObjectRetain();
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  [v2 setLeaderboardTitle:v6];

  uint64_t v7 = *(void *)(v1 + v3);
  uint64_t v8 = *(void **)(v7 + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardInternal);
  if (v8)
  {
    id v9 = objc_allocWithZone((Class)GKLeaderboard);
    id v10 = v8;
    id v11 = [v9 initWithInternalRepresentation:v10];
    [v2 setLeaderboard:v11];

    uint64_t v7 = *(void *)(v1 + v3);
  }
  if (*(void *)(v7 + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_gameBundleID + 8))
  {
    swift_bridgeObjectRetain();
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  [v2 setGameBundleID:v12];

  if (*(void *)(*(void *)(v1 + v3) + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_achievementIdentifier + 8))
  {
    swift_bridgeObjectRetain();
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  [v2 setAchievementID:v13];

  if (*(void *)(*(void *)(v1 + v3) + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_activityIdentifier + 8))
  {
    swift_bridgeObjectRetain();
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v14 = 0;
  }
  [v2 setActivityIdentifier:v14];

  if (*(void *)(*(void *)(v1 + v3) + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_playerIdentifier + 8))
  {
    swift_bridgeObjectRetain();
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v15 = 0;
  }
  [v2 setPlayerID:v15];

  if (*(void *)(*(void *)(v1 + v3) + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_playerAlias + 8))
  {
    swift_bridgeObjectRetain();
    NSString v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v16 = 0;
  }
  [v2 setPlayerAlias:v16];

  [v2 setLeaderboardTimeScope:*(void *)(*(void *)(v1 + v3) + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardTimeScope)];
  [v2 setLeaderboardPlayerScope:*(void *)(*(void *)(v1 + v3) + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardPlayerScope)];
  [v2 setShouldShowPlayForChallenge:*(unsigned __int8 *)(*(void *)(v1 + v3)+ OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_shouldShowPlayForChallenge)];
  [v2 setShouldShowPlayForTurnBasedMatch:*(unsigned __int8 *)(*(void *)(v1 + v3)+ OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_shouldShowPlayForTurnBasedMatch)];
  [v2 setShouldShowQuitForTurnBasedMatch:*(unsigned __int8 *)(*(void *)(v1 + v3)+ OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_shouldShowQuitForTurnBasedMatch)];
  uint64_t v17 = *(void *)(v1 + v3);
  double v18 = *(void **)(v17 + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_currentGame);
  if (v18)
  {
    objc_super v19 = self;
    id v20 = v18;
    id v21 = [v19 local];
    id v22 = [self gameRecordForPlayer:v21 game:v20];

    [v2 setGameRecord:v22];
    uint64_t v17 = *(void *)(v1 + v3);
  }
  [v2 setIsArcade:*(unsigned __int8 *)(v17 + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_isArcade)];
  if (*(void *)(*(void *)(v1 + v3) + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_launchContext + 8))
  {
    swift_bridgeObjectRetain();
    NSString v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v23 = 0;
  }
  [v2 setLaunchContext:v23];

  [v2 setDeepLinkDestination:*(void *)(*(void *)(v1 + v3) + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_deepLinkDestination)];
  type metadata accessor for GameCenterDashboardLaunchManager();
  uint64_t v24 = *(void *)(v1 + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler);
  uint64_t v25 = *(void *)(v1 + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler + 8);
  id v26 = v2;
  sub_100026018(v24);
  id v27 = sub_1000BB228(v2, v24, v25);
  sub_100039104(v24);

  id v28 = *(void **)(v1 + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_contentViewController);
  *(void *)(v1 + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_contentViewController) = v27;

  id v29 = [self proxyForLocalPlayer];
  id v30 = [v29 profileServicePrivate];

  v32[4] = sub_1000BD7D4;
  v32[5] = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 1107296256;
  v32[2] = sub_1000BDA00;
  v32[3] = &unk_100134218;
  id v31 = _Block_copy(v32);
  [v30 startContactsIntegrationSyncWithOptions:2 completionHandler:v31];
  _Block_release(v31);
  swift_unknownObjectRelease();
  sub_1000BDA6C();
}

uint64_t sub_1000BD7D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = __chkstk_darwin(v2);
  NSString v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    static GKLog.general.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      v13[0] = v2;
      id v10 = (uint8_t *)v9;
      id v11 = (void *)swift_slowAlloc();
      *(_DWORD *)id v10 = 138412290;
      swift_errorRetain();
      uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
      v13[1] = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v11 = v12;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Error starting contacts integration sync: %@", v10, 0xCu);
      sub_100005B18(&qword_100142A40);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v2 = v13[0];
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

void sub_1000BDA00(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_1000BDA6C()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_contentViewController];
  if (!v1) {
    return;
  }
  uint64_t v2 = v0;
  id v3 = v1;
  if (sub_1000BFBE0())
  {
    [v0 setModalPresentationStyle:2];
    id v4 = [self sharedTheme];
    if (!v4)
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    uint64_t v5 = v4;
    [v4 formSheetSize];
    double v7 = v6;
    double v9 = v8;

    [v2 setPreferredContentSize:v7, v9];
  }
  else
  {
    [v0 setModalPresentationStyle:5];
  }
  id v10 = [v2 view];
  if (!v10)
  {
    __break(1u);
    goto LABEL_31;
  }
  id v11 = v10;
  [v10 setClipsToBounds:0];

  id v12 = [v2 view];
  if (!v12)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  NSString v13 = v12;
  NSString v14 = self;
  id v15 = [v14 sharedPalette];
  if (!v15)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  NSString v16 = v15;
  id v17 = [v15 systemInteractionColor];

  [v13 setTintColor:v17];
  if (v2[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_alwaysShowDoneButton] == 1)
  {
    id v18 = [self _gkXmarkedCloseButtonWithTarget:v2 action:"donePressed:"];
    if (v18)
    {
      objc_super v19 = v18;
      id v20 = [v3 navigationItem];
      id v21 = [objc_allocWithZone((Class)UIBarButtonItem) initWithCustomView:v19];
      [v20 setRightBarButtonItem:v21];
    }
  }
  if (v2[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_requiresNavigationController] == 1)
  {
    uint64_t v22 = OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController__navigationController;
    if (!*(void *)&v2[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController__navigationController])
    {
      self;
      uint64_t v29 = swift_dynamicCastObjCClass();
      if (v29)
      {
        id v30 = *(void **)&v2[v22];
        *(void *)&v2[v22] = v29;
        id v31 = v3;
      }
      else
      {
        id v32 = [objc_allocWithZone((Class)UINavigationController) init];
        [v32 setDelegate:v2];
        [v32 _setClipUnderlapWhileTransitioning:1];
        [v32 _setPositionBarsExclusivelyWithSafeArea:1];
        id v33 = [v32 navigationBar];
        [v33 setBarStyle:0];

        id v34 = [v32 navigationBar];
        [v34 setTranslucent:1];

        [v32 beginAppearanceTransition:1 animated:0];
        [v2 addChildViewController:v32];
        id v35 = [v2 view];
        if (!v35)
        {
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
        id v36 = v35;
        id v37 = [v32 view];
        if (!v37)
        {
LABEL_37:
          __break(1u);
          goto LABEL_38;
        }
        uint64_t v38 = v37;
        [v36 addSubview:v37];

        id v39 = [v32 view];
        if (!v39)
        {
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        id v40 = v39;
        id v41 = [v2 view];
        if (!v41)
        {
LABEL_39:
          __break(1u);
          return;
        }
        uint64_t v42 = v41;
        [v41 bounds];
        double v44 = v43;
        double v46 = v45;
        double v48 = v47;
        double v50 = v49;

        [v40 setFrame:v44, v46, v48, v50];
        [v32 endAppearanceTransition];
        id v30 = *(void **)&v2[v22];
        *(void *)&v2[v22] = v32;
      }

      if (*(double *)(*(void *)&v2[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_request]
                     + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_statusBarHeight) == 0.0)
      {
        id v51 = [v2 navigationController];
        if (v51)
        {
          long long v52 = v51;
          [v51 setAdditionalSafeAreaInsets:5.0, 0.0, 0.0, 0.0];
        }
      }
    }
  }
  sub_100005B18(&qword_100144420);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_100111BA0;
  *(void *)(v23 + 32) = v3;
  unint64_t v54 = v23;
  specialized Array._endMutation()();
  id v24 = v3;
  sub_1000BE05C(v54, 0);
  swift_bridgeObjectRelease();
  id v25 = [v2 view];
  if (!v25) {
    goto LABEL_33;
  }
  id v26 = v25;
  id v27 = [v14 sharedPalette];
  if (!v27)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  id v28 = v27;
  id v53 = [v27 emphasizedTextColor];

  [v26 setTintColor:v53];
}

void sub_1000BE05C(unint64_t a1, char a2)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v5 = &qword_100144000;
    if (v4) {
      goto LABEL_3;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    if (v2[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_requiresNavigationController] != 1) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v5 = &qword_100144000;
  if (!v4) {
    goto LABEL_26;
  }
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v6 = 0;
  uint64_t v7 = OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_alwaysShowDoneButton;
  unint64_t v8 = a1 & 0xC000000000000001;
  do
  {
    if (v8) {
      id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v9 = *(id *)(a1 + 8 * v6 + 32);
    }
    id v10 = v9;
    if (v2[v7] == 1)
    {
      id v11 = [self _gkXmarkedCloseButtonWithTarget:v2 action:"donePressed:"];
      if (v11)
      {
        id v12 = v11;
        id v13 = [v10 navigationItem];
        id v14 = [objc_allocWithZone((Class)UIBarButtonItem) initWithCustomView:v12];
        [v13 setRightBarButtonItem:v14];

        id v10 = v14;
      }
    }
    ++v6;
  }
  while (v4 != v6);
  swift_bridgeObjectRelease();
  uint64_t v5 = &qword_100144000;
  if ((v2[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_requiresNavigationController] & 1) == 0)
  {
    uint64_t v15 = OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_request;
    swift_bridgeObjectRetain();
    uint64_t v16 = 0;
    while (1)
    {
      if (v8) {
        id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v17 = *(id *)(a1 + 8 * v16 + 32);
      }
      id v18 = v17;
      [v17 beginAppearanceTransition:1 animated:a2 & 1];
      if (*(double *)(*(void *)&v2[v15] + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_statusBarHeight) == 0.0) {
        [v18 setAdditionalSafeAreaInsets:5.0, 0.0, 0.0, 0.0];
      }
      [v2 addChildViewController:v18];
      id v19 = [v2 view];
      if (!v19) {
        goto LABEL_38;
      }
      id v20 = v19;
      id v21 = [v18 view];
      if (!v21) {
        goto LABEL_39;
      }
      uint64_t v22 = v21;
      [v20 addSubview:v21];

      id v23 = [v18 view];
      if (!v23) {
        goto LABEL_40;
      }
      id v24 = v23;
      id v25 = [v2 view];
      if (!v25) {
        goto LABEL_41;
      }
      id v26 = v25;
      ++v16;
      [v25 bounds];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;

      [v24 setFrame:v28, v30, v32, v34];
      [v18 endAppearanceTransition];

      if (v4 == v16)
      {
        swift_bridgeObjectRelease();
        uint64_t v5 = &qword_100144000;
        goto LABEL_29;
      }
    }
  }
LABEL_27:
  id v35 = [v2 navigationController];
  if (v35)
  {
    id v36 = v35;
    sub_100069708(0, &qword_100144438);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    [v36 setViewControllers:isa animated:a2 & 1];
  }
LABEL_29:
  if (*(double *)(*(void *)&v2[v5[85]] + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_statusBarHeight) == 0.0)
  {
    id v38 = [v2 view];
    if (!v38)
    {
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    id v39 = v38;
    id v40 = [v38 viewWithTag:8400];

    if (!v40)
    {
      id v41 = [objc_allocWithZone((Class)UIView) init];
      [v41 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v41 setTag:8400];
      id v45 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v2 action:"scrollToTopPressed:"];
      [v45 setNumberOfTapsRequired:1];
      [v41 addGestureRecognizer:v45];
      id v42 = [v2 view];
      if (!v42)
      {
LABEL_43:
        __break(1u);
        return;
      }
      double v43 = v42;
      [v42 addSubview:v41];

      sub_1000BE864();
    }
  }
}

void sub_1000BE5C0()
{
  if (v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_requiresNavigationController] != 1) {
    return;
  }
  id v1 = [v0 navigationController];
  if (!v1) {
    return;
  }
  uint64_t v2 = v1;
  id v3 = [v1 topViewController];

  if (!v3) {
    return;
  }
  id v4 = [v3 view];
  if (!v4) {
    goto LABEL_22;
  }
  uint64_t v5 = v4;
  id v6 = [v4 subviews];

  sub_100069708(0, &qword_100144430);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v8)
    {
LABEL_7:
      if (v8 >= 1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if ((v7 & 0xC000000000000001) != 0) {
            id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v10 = *(id *)(v7 + 8 * i + 32);
          }
          id v11 = v10;
          self;
          id v12 = (void *)swift_dynamicCastObjCClass();
          if (v12)
          {
            id v13 = v12;
            if ([v12 scrollsToTop])
            {
              [v13 adjustedContentInset];
              [v13 setContentOffset:1 animated:0.0 -v14];
            }
          }
        }
        goto LABEL_18;
      }
      __break(1u);
LABEL_22:
      __break(1u);
      return;
    }
  }
LABEL_18:

  swift_bridgeObjectRelease();
}

void sub_1000BE864()
{
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v2 = v1;
  id v32 = [v1 viewWithTag:8400];

  if (!v32) {
    return;
  }
  [v32 _gkRemoveAllConstraints];
  id v3 = [v0 view];
  if (!v3) {
    goto LABEL_18;
  }
  id v4 = v3;
  id v5 = [v3 traitCollection];

  id v6 = [v5 userInterfaceIdiom];
  if (v6)
  {
    double v7 = 100.0;
  }
  else
  {
    id v8 = [v0 view];
    if (!v8)
    {
LABEL_22:
      __break(1u);
      return;
    }
    id v9 = v8;
    id v10 = [v8 traitCollection];

    id v11 = [v10 verticalSizeClass];
    if (v11 == (id)1) {
      double v7 = 150.0;
    }
    else {
      double v7 = 50.0;
    }
  }
  sub_100005B18(&qword_100144420);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100111BB0;
  id v13 = [v32 leadingAnchor];
  id v14 = [v0 view];
  if (!v14) {
    goto LABEL_19;
  }
  uint64_t v15 = v14;
  id v16 = [v14 leadingAnchor];

  id v17 = [v13 constraintEqualToAnchor:v16 constant:v7];
  *(void *)(v12 + 32) = v17;
  id v18 = [v32 trailingAnchor];
  id v19 = [v0 view];
  if (!v19)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v20 = v19;
  id v21 = [v19 trailingAnchor];

  id v22 = [v18 constraintEqualToAnchor:v21 constant:-v7];
  *(void *)(v12 + 40) = v22;
  id v23 = [v32 topAnchor];
  id v24 = [v0 view];
  if (!v24)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v25 = v24;
  id v26 = self;
  id v27 = [v25 topAnchor];

  id v28 = [v23 constraintEqualToAnchor:v27];
  *(void *)(v12 + 48) = v28;
  id v29 = [v32 heightAnchor];
  id v30 = [v29 constraintEqualToConstant:20.0];

  *(void *)(v12 + 56) = v30;
  specialized Array._endMutation()();
  sub_100069708(0, &qword_100144428);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v26 activateConstraints:isa];

  [v32 setNeedsLayout];
}

void sub_1000BEE00(uint64_t a1)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  unsigned int v4 = [v1 _gkShouldRefreshContentsForDataType:a1 userInfo:isa];

  if (v4)
  {
    Class v5 = Dictionary._bridgeToObjectiveC()().super.isa;
    [v1 _gkRefreshContentsForDataType:a1 userInfo:v5];
  }
  if (a1 == 16)
  {
    id v6 = [self local];
    [v6 clearInMemoryCachedAvatars];
  }
}

void sub_1000BEFB4()
{
  id v0 = [objc_allocWithZone((Class)GKReporter) init];
  id v1 = (void *)GKReporterDomainGameControllerSupport;
  uint64_t v2 = (void *)GKReporterGameControllerUsedInGameLayer;
  id v3 = self;
  id v4 = v1;
  id v5 = v2;
  id v6 = [v3 currentGame];
  NSString v7 = [v6 bundleIdentifier];

  if (!v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  [v0 reportEvent:v4 type:v5 bundleID:v7];
}

void sub_1000BF150(void *a1)
{
  sub_1000BF358(a1, (SEL *)&selRef_finishAndPlay_, "Failed to serialize GKChallenge: %@");
}

void sub_1000BF220(void *a1)
{
  sub_1000BF358(a1, (SEL *)&selRef_finishWith_, "Failed to serialize GKTurnBasedMatch: %@");
}

void sub_1000BF2F0(void *a1)
{
  sub_1000BF358(a1, (SEL *)&selRef_quitTurnBasedMatch_, "Failed to serialize GKTurnBasedMatch: %@");
}

void sub_1000BF358(void *a1, SEL *a2, const char *a3)
{
  id v6 = [a1 internal];
  if (v6)
  {
    NSString v7 = v6;
    id v24 = 0;
    id v8 = [self archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v24];
    id v9 = v24;
    if (v8)
    {
      uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v12 = v11;

      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        id v14 = (void *)Strong;
        Class isa = Data._bridgeToObjectiveC()().super.isa;
        [v14 *a2];

        sub_1000247CC(v10, v12);
        swift_unknownObjectRelease();
      }
      else
      {

        sub_1000247CC(v10, v12);
      }
      return;
    }
    id v16 = v9;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
  }
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v17 = type metadata accessor for Logger();
  sub_100007D4C(v17, (uint64_t)qword_100156CF8);
  id v18 = a1;
  id v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    id v21 = (uint8_t *)swift_slowAlloc();
    id v22 = (void *)swift_slowAlloc();
    *(_DWORD *)id v21 = 138412290;
    id v24 = v18;
    id v23 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v22 = v18;

    _os_log_impl((void *)&_mh_execute_header, v19, v20, a3, v21, 0xCu);
    sub_100005B18(&qword_100142A40);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_1000BF6B0(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(result + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_request);
  if (*(void *)(v4 + *a4) != a3) {
    *(void *)(v4 + *a4) = a3;
  }
  return result;
}

uint64_t sub_1000BF6D4(uint64_t a1, uint64_t a2)
{
  id v5 = (uint64_t *)(*(void *)(v2 + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_request)
                 + OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardIdentifier);
  uint64_t v6 = v5[1];
  if (!v6
    || ((result = *v5, *v5 == a1) ? (BOOL v8 = v6 == a2) : (BOOL v8 = 0),
        !v8 && (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) == 0)))
  {
    *id v5 = a1;
    v5[1] = a2;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000BF7EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.trace.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    BOOL v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "GameController: Game Overlay dashboard was dismissed by the game controller.", v8, 2u);
    swift_slowDealloc();
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = *(void (**)(uint64_t))(v1
                                       + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler);
  if (v10)
  {
    uint64_t v11 = swift_retain();
    v10(v11);
    return sub_100039104((uint64_t)v10);
  }
  return result;
}

void sub_1000BF9B8(char *a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)&a1[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_effectView];
  uint64_t v6 = self;
  os_log_type_t v7 = a1;
  id v8 = v5;
  id v9 = [v6 effectWithStyle:a3];
  [v8 setEffect:v9];
}

id sub_1000BFA9C()
{
  return sub_1000BFAB4(type metadata accessor for DashboardContentViewController);
}

id sub_1000BFAB4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for DashboardContentViewController()
{
  return self;
}

BOOL sub_1000BFBE0()
{
  uint64_t v0 = +[UIDevice currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  return v1 == (id)1;
}

uint64_t sub_1000BFC24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000BFC34()
{
  return swift_release();
}

void sub_1000BFC3C()
{
  id v1 = &v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler];
  *id v1 = 0;
  v1[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController__navigationController] = 0;
  v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_alwaysShowDoneButton] = 1;
  v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_requiresNavigationController] = 1;
  *(void *)&v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_contentViewController] = 0;
  uint64_t v2 = OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_effectView;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)UIVisualEffectView) init];
  v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_adjustTopConstraint] = 1;
  uint64_t v3 = OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_daemonProxy;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)GKDaemonProxy) init];
  *(void *)&v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_GKScrollToTopViewTag] = 8400;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dashboardAssetNames] = _swiftEmptyDictionarySingleton;
  *(void *)&v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_leaderboardSetAssetNames] = _swiftEmptyDictionarySingleton;
  *(void *)&v0[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_leaderboardAssetNames] = _swiftEmptyDictionarySingleton;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_1000BFD88()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)&v19 - v7;
  static GKLog.trace.getter();
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "GameController: Game Overlay dashboard was notified to dismiss.", v11, 2u);
    swift_slowDealloc();
  }

  uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v8, v2);
  sub_1000BCE10();
  if (qword_10013FC98 != -1) {
    swift_once();
  }
  static GKLog.trace.getter();
  id v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "GameController: Game Overlay dashboard was dismissed by the game controller.", v15, 2u);
    swift_slowDealloc();
  }

  uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v6, v2);
  uint64_t v17 = *(void (**)(uint64_t))(v1
                                       + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler);
  if (v17)
  {
    uint64_t v18 = swift_retain();
    v17(v18);
    return sub_100039104((uint64_t)v17);
  }
  return result;
}

void sub_1000BFFE0(void *a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_alwaysShowDoneButton) == 1)
  {
    id v3 = [self _gkXmarkedCloseButtonWithTarget:v1 action:"donePressed:"];
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = [a1 navigationItem];
      id v6 = [objc_allocWithZone((Class)UIBarButtonItem) initWithCustomView:v4];
      [v5 setRightBarButtonItem:v6];
    }
  }
}

uint64_t sub_1000C00D8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000C0118()
{
  sub_1000BC32C(*(char **)(v0 + 16));
}

uint64_t sub_1000C0120(uint64_t result)
{
  _GKIsClientAppUsingRTL = result;
  return result;
}

uint64_t sub_1000C0130(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000C0158()
{
  unint64_t result = qword_1001444C0;
  if (!qword_1001444C0)
  {
    type metadata accessor for DashboardLaunchContext();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001444C0);
  }
  return result;
}

uint64_t sub_1000C01B0()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000C01F0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000C0228()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t destroy for GameCenterDashboard(uint64_t a1)
{
  uint64_t result = swift_unknownObjectWeakDestroy();
  if (*(void *)(a1 + 40)) {
    uint64_t result = sub_100007188(a1 + 16);
  }
  if (*(void *)(a1 + 56))
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for GameCenterDashboard(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  *a1 = *(void *)a2;
  id v5 = a1 + 2;
  id v6 = v4;
  swift_unknownObjectWeakCopyInit();
  uint64_t v7 = (_OWORD *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 40);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 48);
    a1[5] = v8;
    a1[6] = v9;
    (**(void (***)(void *, _OWORD *))(v8 - 8))(v5, v7);
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)id v5 = *v7;
    *((_OWORD *)v5 + 1) = v10;
    v5[4] = *(void *)(a2 + 48);
  }
  uint64_t v11 = *(void *)(a2 + 56);
  if (v11)
  {
    uint64_t v12 = *(void *)(a2 + 64);
    a1[7] = v11;
    a1[8] = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 56);
  }
  return a1;
}

uint64_t assignWithCopy for GameCenterDashboard(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  swift_unknownObjectWeakCopyAssign();
  uint64_t v7 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v7)
    {
      sub_100019BC0((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
      goto LABEL_8;
    }
    sub_100007188(a1 + 16);
  }
  else if (v7)
  {
    *(void *)(a1 + 40) = v7;
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 16, a2 + 16);
    goto LABEL_8;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  long long v9 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v8;
  *(_OWORD *)(a1 + 32) = v9;
LABEL_8:
  uint64_t v10 = *(void *)(a2 + 56);
  if (!*(void *)(a1 + 56))
  {
    if (v10)
    {
      uint64_t v12 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v10;
      *(void *)(a1 + 64) = v12;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    return a1;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v11 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for GameCenterDashboard(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectWeakTakeInit();
  uint64_t v4 = *(void *)(a2 + 56);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  if (v4)
  {
    uint64_t v6 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v4;
    *(void *)(a1 + 64) = v6;
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  return a1;
}

uint64_t assignWithTake for GameCenterDashboard(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  long long v5 = a2 + 2;
  *(void *)a1 = *a2;

  swift_unknownObjectWeakTakeAssign();
  if (*(void *)(a1 + 40)) {
    sub_100007188(a1 + 16);
  }
  long long v6 = *((_OWORD *)v5 + 1);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = v5[4];
  uint64_t v7 = a2[7];
  if (!*(void *)(a1 + 56))
  {
    if (v7)
    {
      uint64_t v9 = a2[8];
      *(void *)(a1 + 56) = v7;
      *(void *)(a1 + 64) = v9;
      return a1;
    }
LABEL_9:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_9;
  }
  uint64_t v8 = a2[8];
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GameCenterDashboard(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 72)) {
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

uint64_t storeEnumTagSinglePayload for GameCenterDashboard(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GameCenterDashboard()
{
  return &type metadata for GameCenterDashboard;
}

uint64_t sub_1000C06A0()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_1000C06BC(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t sub_1000C06F4(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000C0724()
{
  swift_unknownObjectWeakDestroy();
  if (*(void *)(v0 + 56)) {
    sub_100007188(v0 + 32);
  }
  if (*(void *)(v0 + 72)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_1000C0784(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)a1;
  swift_unknownObjectWeakTakeInit();
  long long v4 = *(_OWORD *)(a1 + 16);
  long long v5 = *(_OWORD *)(a1 + 32);
  *(void *)(a2 + 48) = *(void *)(a1 + 48);
  *(_OWORD *)(a2 + 16) = v4;
  *(_OWORD *)(a2 + 32) = v5;
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 64);
    *(void *)(a2 + 56) = v6;
    *(void *)(a2 + 64) = v7;
  }
  else
  {
    *(_OWORD *)(a2 + 56) = *(_OWORD *)(a1 + 56);
  }
  return a2;
}

void sub_1000C07F4(uint64_t a1, char *a2)
{
  sub_1000BAD4C(a1, a2, v2 + 16);
}

unint64_t sub_1000C07FC()
{
  unint64_t result = qword_1001444E8;
  if (!qword_1001444E8)
  {
    sub_10000B448(&qword_1001444D8);
    sub_1000C0878();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001444E8);
  }
  return result;
}

unint64_t sub_1000C0878()
{
  unint64_t result = qword_1001444F0;
  if (!qword_1001444F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001444F0);
  }
  return result;
}

unint64_t sub_1000C08CC()
{
  unint64_t result = qword_1001444F8;
  if (!qword_1001444F8)
  {
    sub_10000B448(&qword_1001444E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001444F8);
  }
  return result;
}

uint64_t destroy for GameCenterDashboardViewController(uint64_t a1)
{
  uint64_t result = swift_unknownObjectWeakDestroy();
  if (*(void *)(a1 + 16))
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for GameCenterDashboardViewController(void *a1, uint64_t a2)
{
  long long v4 = *(void **)a2;
  *a1 = *(void *)a2;
  long long v5 = a1 + 2;
  id v6 = v4;
  swift_unknownObjectWeakCopyInit();
  uint64_t v7 = *(void *)(a2 + 16);
  if (v7)
  {
    uint64_t v8 = *(void *)(a2 + 24);
    a1[2] = v7;
    a1[3] = v8;
    swift_retain();
  }
  else
  {
    *long long v5 = *(_OWORD *)(a2 + 16);
  }
  return a1;
}

uint64_t assignWithCopy for GameCenterDashboardViewController(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a2;
  long long v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  swift_unknownObjectWeakCopyAssign();
  uint64_t v7 = *(void *)(a2 + 16);
  if (!*(void *)(a1 + 16))
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v9;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v8 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for GameCenterDashboardViewController(void *a1, void *a2)
{
  *a1 = *a2;
  long long v4 = a1 + 2;
  swift_unknownObjectWeakTakeInit();
  uint64_t v5 = a2[2];
  if (v5)
  {
    uint64_t v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
  }
  else
  {
    *long long v4 = *((_OWORD *)a2 + 1);
  }
  return a1;
}

uint64_t assignWithTake for GameCenterDashboardViewController(uint64_t a1, void *a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *a2;

  swift_unknownObjectWeakTakeAssign();
  uint64_t v5 = a2[2];
  if (!*(void *)(a1 + 16))
  {
    if (v5)
    {
      uint64_t v7 = a2[3];
      *(void *)(a1 + 16) = v5;
      *(void *)(a1 + 24) = v7;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = a2[3];
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GameCenterDashboardViewController(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GameCenterDashboardViewController(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GameCenterDashboardViewController()
{
  return &type metadata for GameCenterDashboardViewController;
}

uint64_t sub_1000C0C64()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_1000C0CE8()
{
  return &protocol witness table for Never;
}

unint64_t sub_1000C0CF4()
{
  unint64_t result = qword_100144500;
  if (!qword_100144500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144500);
  }
  return result;
}

void sub_1000C0D48()
{
  _GKIsRemoteUIUsingPadIdiom = 0;
}

void *sub_1000C0D60@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  int v175 = a5;
  int v176 = a6;
  int v174 = a4;
  uint64_t v186 = a3;
  id v184 = a2;
  id v180 = a1;
  uint64_t v8 = sub_100005B18(&qword_100142610);
  __chkstk_darwin(v8 - 8);
  v167 = (char *)&v144 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v187 = sub_100005B18(&qword_10013FF50);
  __chkstk_darwin(v187);
  v168 = (char *)&v144 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = type metadata accessor for ActionMetrics();
  uint64_t v158 = *(void *)(v161 - 8);
  __chkstk_darwin(v161);
  v155 = (char *)&v144 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = type metadata accessor for FlowAction();
  __chkstk_darwin(v162);
  v160 = (char *)&v144 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = sub_100005B18(&qword_100142618);
  uint64_t v163 = *(void *)(v159 - 8);
  uint64_t v13 = __chkstk_darwin(v159);
  uint64_t v164 = v14;
  uint64_t v165 = (uint64_t)&v144 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v166 = (char *)&v144 - v15;
  uint64_t v16 = type metadata accessor for Game();
  uint64_t v185 = *(void *)(v16 - 8);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v147 = (uint64_t)&v144 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v146 = (uint64_t)&v144 - v19;
  uint64_t v20 = sub_100005B18(&qword_100145510);
  __chkstk_darwin(v20 - 8);
  uint64_t v170 = (uint64_t)&v144 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v173 = type metadata accessor for AccessPointAnchoring();
  uint64_t v179 = *(void *)(v173 - 8);
  __chkstk_darwin(v173);
  v171 = (char *)&v144 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100005B18(&qword_100140C48);
  __chkstk_darwin(v23 - 8);
  uint64_t v145 = (char *)&v144 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100005B18(&qword_100140B48);
  uint64_t v26 = __chkstk_darwin(v25 - 8);
  uint64_t v172 = (uint64_t)&v144 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  uint64_t v144 = (uint64_t *)((char *)&v144 - v28);
  uint64_t v29 = type metadata accessor for OverlayBootstrap();
  __chkstk_darwin(v29 - 8);
  double v31 = (char *)&v144 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t started = type metadata accessor for JetStartUpCoordinator();
  uint64_t v33 = *(void *)(started - 8);
  uint64_t v34 = __chkstk_darwin(started);
  id v36 = (char *)&v144 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  id v38 = (char *)&v144 - v37;
  id v39 = (int *)type metadata accessor for AccessPointView();
  uint64_t v40 = a7 + v39[5];
  if (qword_10013FCF0 != -1) {
    swift_once();
  }
  sub_1000C71A0(qword_100156E20 + OBJC_IVAR____TtC13GameOverlayUI24ConnectionContextManager_overlayBootstrap, (uint64_t)v31, (uint64_t (*)(void))type metadata accessor for OverlayBootstrap);
  State.wrappedValue.getter();
  v177 = v31;
  sub_100077428((uint64_t)v31, (uint64_t (*)(void))type metadata accessor for OverlayBootstrap);
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v36, v38, started);
  v152 = v36;
  uint64_t v153 = v40;
  State.init(wrappedValue:)();
  uint64_t v156 = v33;
  uint64_t v157 = started;
  id v41 = *(void (**)(char *, uint64_t))(v33 + 8);
  uint64_t v154 = v38;
  int v150 = v41;
  v41(v38, started);
  uint64_t v42 = a7 + v39[7];
  sub_100076F18((uint64_t)v219);
  uint64_t v183 = v42;
  sub_100024A74((uint64_t)v219, v42, &qword_100142620);
  double v43 = *(void (**)(void))(v185 + 56);
  uint64_t v181 = a7 + v39[8];
  uint64_t v182 = v16;
  v43();
  type metadata accessor for GameDashboardLaunchContext();
  uint64_t v44 = swift_allocObject();
  *(unsigned char *)(v44 + 16) = 0;
  uint64_t v45 = v44 + OBJC_IVAR____TtC13GameOverlayUI26GameDashboardLaunchContext__action;
  uint64_t v46 = type metadata accessor for LaunchDashboardAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v45, 1, 1, v46);
  ObservationRegistrar.init()();
  double v47 = (uint64_t *)(a7 + v39[6]);
  *double v47 = v44;
  v47[1] = 0;
  p_base_prots = &GameOverlayUIApp.base_prots;
  uint64_t v178 = a7;
  uint64_t v149 = v44;
  double v49 = v39;
  id v50 = v184;
  uint64_t v151 = v33 + 8;
  v169 = v49;
  if (v184)
  {
    id v51 = self;
    swift_retain();
    id v148 = v50;
    id v52 = [v148 internal];
    v218[0] = 0;
    id v53 = [v51 archivedDataWithRootObject:v52 requiringSecureCoding:1 error:v218];

    id v54 = v218[0];
    if (v53)
    {
      long long v55 = &GameOverlayUIApp.base_prots;
      uint64_t v56 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v58 = v57;

      sub_100069708(0, &qword_1001422B0);
      sub_100069708(0, &qword_1001422B8);
      unint64_t result = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
      uint64_t v70 = result;
      if (!result) {
        goto LABEL_44;
      }
      uint64_t v71 = type metadata accessor for Date();
      uint64_t v72 = (uint64_t)v145;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v145, 1, 1, v71);
      uint64_t v73 = v144;
      sub_1000AB30C(v70, v72, v144);
      sub_1000247CC(v56, v58);

      ((void (*)(uint64_t *, void, uint64_t, uint64_t))v43)(v73, 0, 1, v182);
      sub_10001712C((uint64_t)v73, v181, &qword_100140B48);
      uint64_t v60 = v186;
      id v61 = v180;
      p_base_prots = &GameOverlayUIApp.base_prots;
      if (!v180) {
        goto LABEL_17;
      }
LABEL_14:
      id v69 = v61;
      goto LABEL_19;
    }
    uint64_t v62 = v54;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_10013FBB0 != -1) {
      swift_once();
    }
    uint64_t v63 = type metadata accessor for Logger();
    sub_100007D4C(v63, (uint64_t)qword_100156CF8);
    swift_errorRetain();
    swift_errorRetain();
    long long v64 = Logger.logObject.getter();
    os_log_type_t v65 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      unint64_t v67 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v66 = 138412290;
      swift_errorRetain();
      uint64_t v68 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v218[0] = v68;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v67 = v68;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "Game could not be serialized: %@", v66, 0xCu);
      sub_100005B18(&qword_100142A40);
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
    uint64_t v60 = v186;
    id v61 = v180;
    p_base_prots = (__objc2_prot_list **)(&GameOverlayUIApp + 40);
    long long v55 = (__objc2_prot_list **)(&GameOverlayUIApp + 40);
    if (v180) {
      goto LABEL_14;
    }
  }
  else
  {
    swift_retain();
    uint64_t v60 = v186;
    id v61 = v180;
    long long v55 = &GameOverlayUIApp.base_prots;
    if (v180) {
      goto LABEL_14;
    }
  }
LABEL_17:
  uint64_t v74 = self;
  id v69 = [v74 currentLocalPlayer];
  if (!v69) {
    id v69 = [v74 local];
  }
LABEL_19:
  uint64_t v75 = self;
  id v148 = v61;
  id v76 = [v69 (SEL)v55[415]];
  v218[0] = 0;
  id v77 = [v75 p_base_prots[416]:v76:1:v218];

  id v78 = v218[0];
  id v180 = v69;
  if (!v77)
  {
    long long v82 = v78;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_10013FBB0 != -1) {
      swift_once();
    }
    uint64_t v83 = type metadata accessor for Logger();
    sub_100007D4C(v83, (uint64_t)qword_100156CF8);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v84 = Logger.logObject.getter();
    os_log_type_t v85 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v84, v85))
    {
      unint64_t v86 = (uint8_t *)swift_slowAlloc();
      uint64_t v87 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v86 = 138412290;
      swift_errorRetain();
      uint64_t v88 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v218[0] = v88;
      uint64_t v60 = v186;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v87 = v88;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v84, v85, "Player could not be serialized: %@", v86, 0xCu);
      sub_100005B18(&qword_100142A40);
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
    sub_100024A74((uint64_t)v219, (uint64_t)v215, &qword_100142620);
    char v90 = v175;
    char v89 = v176;
    uint64_t v91 = v179;
    goto LABEL_29;
  }
  uint64_t v79 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v81 = v80;

  sub_100069708(0, &qword_1001422B0);
  sub_100069708(0, &qword_100142648);
  unint64_t result = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  uint64_t v91 = v179;
  if (result)
  {
    sub_100084EB8(result, (uint64_t)v216);
    long long v198 = v216[6];
    long long v199 = v216[7];
    long long v200 = v216[8];
    uint64_t v201 = v217;
    long long v194 = v216[2];
    long long v195 = v216[3];
    long long v196 = v216[4];
    long long v197 = v216[5];
    long long v192 = v216[0];
    long long v193 = v216[1];
    sub_1000247CC(v79, v81);
    long long v208 = v198;
    long long v209 = v199;
    long long v210 = v200;
    uint64_t v211 = v201;
    long long v204 = v194;
    long long v205 = v195;
    long long v206 = v196;
    long long v207 = v197;
    long long v202 = v192;
    long long v203 = v193;
    property wrapper backing initializer of Shelf.items(&v202);
    uint64_t v92 = v183;
    sub_100024A74(v183, (uint64_t)v218, &qword_100142620);
    sub_1000249B4((uint64_t)v216);
    sub_1000C48E4(v218, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10007735C);
    sub_100024A74((uint64_t)&v202, v92, &qword_100142620);
    sub_100024A74((uint64_t)&v202, (uint64_t)v215, &qword_100142620);
    char v90 = v175;
    char v89 = v176;
LABEL_29:
    sub_100024A74((uint64_t)v215, (uint64_t)v218, &qword_100142620);
    uint64_t v93 = v170;
    sub_1000170C8(v60, v170, &qword_100145510);
    uint64_t v94 = v173;
    int v95 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v91 + 48))(v93, 1, v173);
    uint64_t v96 = v178;
    if (v95 == 1)
    {
      uint64_t v97 = v171;
      (*(void (**)(char *, void, uint64_t))(v91 + 104))(v171, enum case for AccessPointAnchoring.topLeading(_:), v94);
      sub_100017388(v93, &qword_100145510);
      uint64_t v98 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 32);
    }
    else
    {
      uint64_t v99 = v93;
      uint64_t v98 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 32);
      uint64_t v97 = v171;
      v98(v171, v99, v94);
    }
    uint64_t v100 = v169;
    v98((char *)(v96 + v169[9]), (uint64_t)v97, v94);
    if (v174 == 7) {
      char v101 = 1;
    }
    else {
      char v101 = v174;
    }
    *(unsigned char *)(v96 + v100[10]) = v101;
    *(unsigned char *)(v96 + v100[11]) = v90 & 1;
    *(unsigned char *)(v96 + v100[12]) = v89 & 1;
    uint64_t v102 = v172;
    sub_1000170C8(v181, v172, &qword_100140B48);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v185 + 48))(v102, 1, v182) == 1)
    {
      sub_100017388(v102, &qword_100140B48);
      sub_100024A74(v183, (uint64_t)&v192, &qword_100142620);
      sub_100024A74((uint64_t)&v192, (uint64_t)&v202, &qword_100142620);
      int v103 = sub_100076F38((uint64_t)&v202);
      uint64_t v104 = (uint64_t)v177;
      if (v103 != 1)
      {
        v190 = &type metadata for PlayNowPageIntent;
        unint64_t v191 = sub_100076F50();
        uint64_t v105 = swift_allocObject();
        *(void *)&long long v189 = v105;
        long long v106 = v209;
        *(_OWORD *)(v105 + 112) = v208;
        *(_OWORD *)(v105 + 128) = v106;
        *(_OWORD *)(v105 + 144) = v210;
        *(void *)(v105 + 160) = v211;
        long long v107 = v205;
        *(_OWORD *)(v105 + 48) = v204;
        *(_OWORD *)(v105 + 64) = v107;
        long long v108 = v207;
        *(_OWORD *)(v105 + 80) = v206;
        *(_OWORD *)(v105 + 96) = v108;
        long long v109 = v203;
        *(_OWORD *)(v105 + 16) = v202;
        *(_OWORD *)(v105 + 32) = v109;
        sub_100069BBC(&v189, (uint64_t)v212);
        sub_100024A74((uint64_t)&v192, (uint64_t)v188, &qword_100142620);
        sub_1000249B4((uint64_t)v188);
LABEL_40:
        v123 = v155;
        static ActionMetrics.notInstrumented.getter();
        uint64_t v124 = v213;
        uint64_t v125 = v214;
        uint64_t v126 = sub_100006650(v212, v213);
        uint64_t v127 = v162;
        v128 = v160;
        static FlowDestination.page<A>(whatPage:)((uint64_t)v126, v124, v125, (uint64_t *)&v160[*(int *)(v162 + 24)]);
        uint64_t v129 = static FlowActionPresentation.tabSelect.getter();
        uint64_t v131 = v130;
        *(void *)v128 = 0x7265764F656D6167;
        *((void *)v128 + 1) = 0xEB0000000079616CLL;
        (*(void (**)(char *, char *, uint64_t))(v158 + 32))(&v128[*(int *)(v127 + 20)], v123, v161);
        v132 = (uint64_t *)&v128[*(int *)(v127 + 28)];
        uint64_t *v132 = v129;
        v132[1] = v131;
        sub_1000C77D8(&qword_100142630, (void (*)(uint64_t))type metadata accessor for FlowAction);
        sub_1000C77D8(&qword_100142638, (void (*)(uint64_t))type metadata accessor for FlowAction);
        uint64_t v133 = (uint64_t)v166;
        FlowAuthority.init(content:)();
        *(void *)(v133 + *(int *)(v159 + 28)) = 0;
        sub_1000170C8(v133, v96, &qword_100142618);
        sub_1000C71A0(qword_100156E20 + OBJC_IVAR____TtC13GameOverlayUI24ConnectionContextManager_overlayBootstrap, v104, (uint64_t (*)(void))type metadata accessor for OverlayBootstrap);
        uint64_t v134 = v152;
        State.wrappedValue.getter();
        sub_100077428(v104, (uint64_t (*)(void))type metadata accessor for OverlayBootstrap);
        uint64_t v135 = type metadata accessor for JetStartUpProcedure();
        uint64_t v136 = (uint64_t)v167;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v135 - 8) + 56))(v167, 1, 1, v135);
        uint64_t v137 = v165;
        sub_1000170C8(v133, v165, &qword_100142618);
        unint64_t v138 = (*(unsigned __int8 *)(v163 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v163 + 80);
        unint64_t v139 = (v164 + v138 + 7) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v140 = swift_allocObject();
        sub_100024A74(v137, v140 + v138, &qword_100142618);
        sub_100024A74((uint64_t)v218, v140 + v139, &qword_100142620);
        *(void *)(v140 + ((v139 + 159) & 0xFFFFFFFFFFFFFFF8)) = v149;
        swift_retain();
        v141 = v154;
        JetStartUpCoordinator.extend(startUpProcedure:withDependencies:)();
        swift_release();

        swift_release();
        sub_100017388(v186, &qword_100145510);
        sub_100017388(v136, &qword_100142610);
        uint64_t v142 = v157;
        v150(v134, v157);
        sub_100017388(v133, &qword_100142618);
        uint64_t v143 = (uint64_t)v168;
        *(void *)&v168[*(int *)(v187 + 28)] = 0;
        (*(void (**)(uint64_t, char *, uint64_t))(v156 + 32))(v143, v141, v142);
        sub_100007188((uint64_t)v212);
        return (void *)sub_10001712C(v143, v153, &qword_10013FF50);
      }
      sub_1000C48E4(v215, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10007735C);
      __break(1u);
    }
    else
    {
      uint64_t v110 = v146;
      sub_1000C767C(v102, v146, (uint64_t (*)(void))type metadata accessor for Game);
      uint64_t v111 = v147;
      sub_1000C71A0(v110, v147, (uint64_t (*)(void))type metadata accessor for Game);
      sub_100024A74(v183, (uint64_t)&v192, &qword_100142620);
      sub_100024A74((uint64_t)&v192, (uint64_t)&v202, &qword_100142620);
      int v112 = sub_100076F38((uint64_t)&v202);
      uint64_t v104 = (uint64_t)v177;
      if (v112 != 1)
      {
        sub_100024A74((uint64_t)&v192, (uint64_t)v188, &qword_100142620);
        sub_1000249B4((uint64_t)v188);
        sub_100077428(v110, (uint64_t (*)(void))type metadata accessor for Game);
        uint64_t v113 = type metadata accessor for GameDashboardPageIntent();
        v190 = (ValueMetadata *)v113;
        unint64_t v191 = sub_1000C77D8(&qword_100142640, (void (*)(uint64_t))type metadata accessor for GameDashboardPageIntent);
        uint64_t v114 = sub_1000082EC((uint64_t *)&v189);
        sub_1000C767C(v111, (uint64_t)v114, (uint64_t (*)(void))type metadata accessor for Game);
        v115 = (char *)v114 + *(int *)(v113 + 20);
        long long v116 = v203;
        *(_OWORD *)v115 = v202;
        *((_OWORD *)v115 + 1) = v116;
        long long v117 = v204;
        long long v118 = v205;
        long long v119 = v207;
        *((_OWORD *)v115 + 4) = v206;
        *((_OWORD *)v115 + 5) = v119;
        *((_OWORD *)v115 + 2) = v117;
        *((_OWORD *)v115 + 3) = v118;
        long long v120 = v208;
        long long v121 = v209;
        long long v122 = v210;
        *((void *)v115 + 18) = v211;
        *((_OWORD *)v115 + 7) = v121;
        *((_OWORD *)v115 + 8) = v122;
        *((_OWORD *)v115 + 6) = v120;
        sub_100069BBC(&v189, (uint64_t)v212);
        goto LABEL_40;
      }
    }
    unint64_t result = sub_1000C48E4(v215, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10007735C);
    __break(1u);
  }
  __break(1u);
LABEL_44:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AccessPointView()
{
  uint64_t result = qword_1001445E0;
  if (!qword_1001445E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000C23C0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v39 = a3;
  uint64_t v37 = a2;
  uint64_t v40 = type metadata accessor for Dependency();
  uint64_t v36 = *(void *)(v40 - 8);
  id v38 = (char *)v36;
  __chkstk_darwin(v40);
  long long v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005B18(&qword_100140C50);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = __chkstk_darwin(v5 - 8);
  uint64_t v9 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v33 - v10;
  sub_100005B18(&qword_100142618);
  State.projectedValue.getter();
  sub_100005B18(&qword_100142650);
  sub_1000170C8((uint64_t)v11, (uint64_t)v9, &qword_100140C50);
  unint64_t v12 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = swift_allocObject();
  sub_100024A74((uint64_t)v9, v13 + v12, &qword_100140C50);
  Dependency.init<A>(satisfying:with:)();
  type metadata accessor for BaseObjectGraph();
  uint64_t v14 = sub_100005B18(&qword_100142658);
  uint64_t v15 = v38;
  uint64_t v16 = v38[80];
  uint64_t v17 = (v16 + 32) & ~v16;
  uint64_t v35 = v17 + *(void *)(v36 + 72);
  uint64_t v36 = v14;
  uint64_t v34 = v16 | 7;
  uint64_t v18 = swift_allocObject();
  long long v33 = xmmword_10010F300;
  *(_OWORD *)(v18 + 16) = xmmword_10010F300;
  uint64_t v19 = v15;
  uint64_t v20 = (void (*)(uint64_t, char *, uint64_t))*((void *)v15 + 2);
  uint64_t v21 = v40;
  v20(v18 + v17, v4, v40);
  BaseObjectGraph.__allocating_init(name:_:)();
  uint64_t v22 = (void (*)(char *, uint64_t))*((void *)v19 + 1);
  id v38 = v4;
  v22(v4, v21);
  uint64_t v23 = (uint64_t)v11;
  uint64_t v24 = v37;
  sub_100017388(v23, &qword_100140C50);
  sub_100024A74((uint64_t)v24, (uint64_t)v51, &qword_100142620);
  if (sub_100076F38((uint64_t)v51) == 1)
  {
    swift_retain();
    BaseObjectGraph.__allocating_init(name:_:)();
    uint64_t v25 = v40;
    uint64_t v26 = v38;
  }
  else
  {
    long long v47 = v51[6];
    long long v48 = v51[7];
    long long v49 = v51[8];
    uint64_t v50 = v52;
    long long v43 = v51[2];
    long long v44 = v51[3];
    long long v45 = v51[4];
    long long v46 = v51[5];
    long long v41 = v51[0];
    long long v42 = v51[1];
    swift_retain();
    sub_1000C48E4(v24, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_100077224);
    uint64_t v27 = v38;
    Dependency.init<A>(satisfying:with:)();
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = v33;
    uint64_t v29 = v28 + v17;
    uint64_t v25 = v40;
    v20(v29, v27, v40);
    BaseObjectGraph.__allocating_init(name:_:)();
    v22(v27, v25);
    uint64_t v26 = v27;
  }
  uint64_t v30 = v22;
  type metadata accessor for GameDashboardLaunchContext();
  *(void *)&long long v41 = v39;
  swift_retain();
  Dependency.init<A>(satisfying:with:)();
  swift_retain();
  dispatch thunk of BaseObjectGraph.adding(allDependenciesOf:)();
  swift_release();
  swift_retain();
  uint64_t v31 = dispatch thunk of BaseObjectGraph.adding(dependency:)();
  swift_release();
  swift_release_n();
  swift_release_n();
  v30(v26, v25);
  return v31;
}

uint64_t sub_1000C2858@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005B18(&qword_100142660);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - v8;
  uint64_t v10 = sub_100005B18(&qword_100142650);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BaseObjectGraph();
  ActionDispatcher.init()();
  sub_1000C3910(a1, (uint64_t)v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(a2, v13, v10);
  sub_1000170C8((uint64_t)v9, (uint64_t)v7, &qword_100142660);
  ActionDispatcher.next.setter();
  sub_100017388((uint64_t)v9, &qword_100142660);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_1000C2A20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v75 = a1;
  uint64_t v74 = sub_100005B18(&qword_100144638);
  __chkstk_darwin(v74);
  uint64_t v4 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t started = type metadata accessor for JetStartUpDecoration();
  uint64_t v69 = *(void *)(started - 8);
  uint64_t v70 = started;
  __chkstk_darwin(started);
  uint64_t v68 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AccessPointView();
  uint64_t v57 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v58 = v8;
  uint64_t v59 = (uint64_t)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for JetStartUpCoordinator();
  uint64_t v62 = *(void *)(v64 - 8);
  uint64_t v9 = __chkstk_darwin(v64);
  uint64_t v60 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v73 = (char *)&v53 - v11;
  uint64_t v12 = sub_100005B18(&qword_100142708);
  uint64_t v65 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v63 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005B18(&qword_100144640);
  uint64_t v67 = *(void *)(v14 - 8);
  uint64_t v15 = __chkstk_darwin(v14);
  id v61 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v66 = (char *)&v53 - v17;
  uint64_t v18 = sub_100005B18(&qword_100140B48);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for Game();
  uint64_t v71 = *(void *)(v21 - 8);
  uint64_t v22 = *(void *)(v71 + 64);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v56 = (uint64_t)&v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v72 = (uint64_t)&v53 - v24;
  sub_100024A74(v2 + *(int *)(v7 + 28), (uint64_t)v89, &qword_100142620);
  sub_100024A74((uint64_t)v89, (uint64_t)v90, &qword_100142620);
  if (sub_100076F38((uint64_t)v90) == 1) {
    goto LABEL_4;
  }
  uint64_t v53 = v12;
  id v54 = v4;
  uint64_t v55 = v14;
  long long v85 = v90[6];
  long long v86 = v90[7];
  long long v87 = v90[8];
  uint64_t v88 = v91;
  long long v81 = v90[2];
  long long v82 = v90[3];
  long long v83 = v90[4];
  long long v84 = v90[5];
  uint64_t v25 = *(int *)(v7 + 32);
  long long v79 = v90[0];
  long long v80 = v90[1];
  sub_1000170C8(v2 + v25, (uint64_t)v20, &qword_100140B48);
  uint64_t v26 = v71;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48))(v20, 1, v21) == 1)
  {
    sub_100017388((uint64_t)v20, &qword_100140B48);
    uint64_t v12 = v53;
LABEL_4:
    swift_storeEnumTagMultiPayload();
    uint64_t v27 = sub_10001758C((unint64_t *)&qword_100142728, &qword_100142708);
    v78[0] = v12;
    v78[1] = v27;
    swift_getOpaqueTypeConformance2();
    return _ConditionalContent<>.init(storage:)();
  }
  uint64_t v29 = v72;
  sub_1000C767C((uint64_t)v20, v72, (uint64_t (*)(void))type metadata accessor for Game);
  sub_100024A74((uint64_t)v89, (uint64_t)v78, &qword_100142620);
  sub_1000249B4((uint64_t)v78);
  sub_100005B18(&qword_10013FF50);
  State.wrappedValue.getter();
  uint64_t v30 = v59;
  sub_1000C71A0(v2, v59, (uint64_t (*)(void))type metadata accessor for AccessPointView);
  uint64_t v31 = v56;
  sub_1000C71A0(v29, v56, (uint64_t (*)(void))type metadata accessor for Game);
  unint64_t v32 = (*(unsigned __int8 *)(v57 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
  unint64_t v33 = (v58 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v34 = (*(unsigned __int8 *)(v26 + 80) + v33 + 152) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v35 = swift_allocObject();
  sub_1000C767C(v30, v35 + v32, (uint64_t (*)(void))type metadata accessor for AccessPointView);
  unint64_t v36 = v35 + v33;
  long long v37 = v86;
  *(_OWORD *)(v36 + 96) = v85;
  *(_OWORD *)(v36 + 112) = v37;
  *(_OWORD *)(v36 + 128) = v87;
  *(void *)(v36 + 144) = v88;
  long long v38 = v82;
  *(_OWORD *)(v36 + 32) = v81;
  *(_OWORD *)(v36 + 48) = v38;
  long long v39 = v84;
  *(_OWORD *)(v36 + 64) = v83;
  *(_OWORD *)(v36 + 80) = v39;
  long long v40 = v80;
  *(_OWORD *)unint64_t v36 = v79;
  *(_OWORD *)(v36 + 16) = v40;
  sub_1000C767C(v31, v35 + v34, (uint64_t (*)(void))type metadata accessor for Game);
  uint64_t v41 = v62;
  uint64_t v42 = v64;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v60, v73, v64);
  uint64_t v71 = type metadata accessor for AccessPointPageView();
  type metadata accessor for _JetViewDefaultWorking();
  type metadata accessor for _JetViewDefaultFailed();
  sub_1000C77D8(&qword_100142710, (void (*)(uint64_t))type metadata accessor for AccessPointPageView);
  sub_1000C77D8(&qword_100142718, (void (*)(uint64_t))&type metadata accessor for _JetViewDefaultWorking);
  sub_1000C77D8(&qword_100142720, (void (*)(uint64_t))&type metadata accessor for _JetViewDefaultFailed);
  long long v43 = v63;
  Jet.init(startUpWith:working:failed:content:)();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v73, v42);
  long long v45 = v68;
  uint64_t v44 = v69;
  uint64_t v46 = v70;
  (*(void (**)(char *, void, uint64_t))(v69 + 104))(v68, enum case for JetStartUpDecoration.none(_:), v70);
  uint64_t v47 = sub_10001758C((unint64_t *)&qword_100142728, &qword_100142708);
  long long v48 = v61;
  uint64_t v49 = v53;
  View.startUpDecoration(_:)();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v43, v49);
  id v51 = v66;
  uint64_t v50 = v67;
  uint64_t v52 = v55;
  (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v66, v48, v55);
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v54, v51, v52);
  swift_storeEnumTagMultiPayload();
  uint64_t v76 = v49;
  uint64_t v77 = v47;
  swift_getOpaqueTypeConformance2();
  _ConditionalContent<>.init(storage:)();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
  return sub_100077428(v72, (uint64_t (*)(void))type metadata accessor for Game);
}

uint64_t sub_1000C3438@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v9 = (int *)type metadata accessor for AccessPointView();
  char v10 = *(unsigned char *)(a2 + v9[10]);
  char v11 = *(unsigned char *)(a2 + v9[11]);
  char v12 = *(unsigned char *)(a2 + v9[12]);
  uint64_t v13 = type metadata accessor for AccessPointPageIntent();
  a5[3] = v13;
  a5[4] = sub_1000C77D8(&qword_100143280, (void (*)(uint64_t))type metadata accessor for AccessPointPageIntent);
  uint64_t v14 = sub_1000082EC(a5);
  sub_1000C71A0(a4, (uint64_t)v14 + *(int *)(v13 + 32), (uint64_t (*)(void))type metadata accessor for Game);
  *(unsigned char *)uint64_t v14 = v10;
  *((unsigned char *)v14 + 1) = v11;
  *((unsigned char *)v14 + 2) = v12;
  long long v15 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v14 + 1) = *(_OWORD *)a3;
  *(_OWORD *)(v14 + 3) = v15;
  long long v16 = *(_OWORD *)(a3 + 64);
  long long v17 = *(_OWORD *)(a3 + 80);
  long long v18 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v14 + 5) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v14 + 11) = v17;
  *(_OWORD *)(v14 + 9) = v16;
  *(_OWORD *)(v14 + 7) = v18;
  long long v20 = *(_OWORD *)(a3 + 112);
  long long v19 = *(_OWORD *)(a3 + 128);
  uint64_t v21 = *(void *)(a3 + 144);
  *(_OWORD *)(v14 + 13) = *(_OWORD *)(a3 + 96);
  v14[19] = v21;
  *(_OWORD *)(v14 + 17) = v19;
  *(_OWORD *)(v14 + 15) = v20;
  uint64_t v22 = a2 + v9[9];
  uint64_t v23 = (int *)type metadata accessor for AccessPointPageView();
  uint64_t v24 = (char *)a5 + v23[5];
  uint64_t v25 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(v24, v22, v25);
  uint64_t v26 = (uint64_t *)(a2 + v9[6]);
  uint64_t v30 = *v26;
  uint64_t v31 = v26[1];
  sub_1000249B4(a3);
  sub_100005B18(&qword_100142730);
  State.wrappedValue.getter();
  swift_retain();
  sub_100005B18(&qword_100142618);
  State.projectedValue.getter();
  uint64_t v27 = (uint64_t *)((char *)a5 + v23[9]);
  sub_100005B18(&qword_10013FD08);
  swift_allocObject();
  LRUMultiCache.init(keyLimit:valueLimit:)();
  uint64_t result = State.init(wrappedValue:)();
  void *v27 = v30;
  v27[1] = v31;
  *(uint64_t *)((char *)a5 + v23[6]) = v32;
  *(uint64_t *)((char *)a5 + v23[7]) = a1;
  return result;
}

uint64_t sub_1000C3690()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 112))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return _swift_deallocObject(v0, 168, 7);
}

uint64_t sub_1000C370C()
{
  uint64_t v1 = *(void *)(sub_100005B18(&qword_100142618) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  unint64_t v4 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_100005B18(&qword_100140C58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  if (*(void *)(v0 + v4 + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(void *)(v0 + v4 + 96))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_release();

  return _swift_deallocObject(v0, ((v4 + 159) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_1000C3874()
{
  uint64_t v1 = *(void *)(sub_100005B18(&qword_100142618) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(v0 + ((v3 + 159) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000C23C0(v0 + v2, (void *)(v0 + v3), v4);
}

uint64_t sub_1000C3910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v79 = a1;
  uint64_t v95 = a2;
  uint64_t v3 = sub_100005B18(&qword_100144510);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v93 = v3;
  uint64_t v94 = v4;
  __chkstk_darwin(v3);
  uint64_t v92 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005B18(&qword_100144518);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v90 = v6;
  uint64_t v91 = v7;
  __chkstk_darwin(v6);
  char v89 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_100005B18(&qword_100144520);
  uint64_t v87 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  long long v85 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_100005B18(&qword_100144528);
  uint64_t v84 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  long long v82 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_100005B18(&qword_100144530);
  uint64_t v81 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  id v78 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005B18(&qword_100140C50);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_100005B18(&qword_100144538);
  uint64_t v74 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  long long v16 = (char *)&v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005B18(&qword_100142650);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v88 = (char *)&v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v105 = (char *)&v72 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  int v103 = (char *)&v72 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v102 = (char *)&v72 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v104 = (char *)&v72 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  long long v106 = (char *)&v72 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  unint64_t v33 = (char *)&v72 - v32;
  __chkstk_darwin(v31);
  uint64_t v35 = (char *)&v72 - v34;
  uint64_t v75 = v14;
  sub_1000170C8(a1, (uint64_t)v14, &qword_100140C50);
  uint64_t v36 = type metadata accessor for BaseObjectGraph();
  uint64_t v76 = type metadata accessor for FlowAction();
  uint64_t v77 = sub_1000C77D8(&qword_100142630, (void (*)(uint64_t))type metadata accessor for FlowAction);
  uint64_t v98 = sub_1000C77D8(&qword_100142638, (void (*)(uint64_t))type metadata accessor for FlowAction);
  AlertActionImplementation.init<A>(following:)();
  long long v37 = v33;
  ActionDispatcher.init()();
  long long v107 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  uint64_t v100 = v35;
  v107(v35, v33, v17);
  sub_10001758C(&qword_100144540, &qword_100144538);
  uint64_t v38 = v73;
  ActionDispatcher.add<A>(_:)();
  long long v39 = *(void (**)(char *, uint64_t))(v18 + 8);
  v39(v37, v17);
  uint64_t v108 = v18 + 8;
  (*(void (**)(char *, uint64_t))(v74 + 8))(v16, v38);
  long long v40 = v78;
  CompoundActionImplementation.init()();
  uint64_t v41 = v106;
  ActionDispatcher.init()();
  uint64_t v99 = v37;
  uint64_t v42 = v41;
  v107(v37, v41, v17);
  uint64_t v96 = v18 + 16;
  sub_10001758C(&qword_100144548, &qword_100144530);
  long long v43 = v40;
  uint64_t v44 = v80;
  ActionDispatcher.add<A>(_:)();
  v39(v41, v17);
  (*(void (**)(char *, uint64_t))(v81 + 8))(v43, v44);
  long long v45 = v82;
  uint64_t v46 = v36;
  EmptyActionImplementation.init()();
  uint64_t v47 = v104;
  ActionDispatcher.init()();
  long long v48 = v107;
  v107(v42, v47, v17);
  sub_10001758C(&qword_100144550, &qword_100144528);
  uint64_t v49 = v83;
  ActionDispatcher.add<A>(_:)();
  char v101 = v39;
  v39(v47, v17);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v45, v49);
  uint64_t v50 = v85;
  ExternalURLActionImplementation.init()();
  id v51 = v102;
  ActionDispatcher.init()();
  v48(v47, v51, v17);
  sub_10001758C(&qword_100144558, &qword_100144520);
  uint64_t v52 = v86;
  ActionDispatcher.add<A>(_:)();
  v39(v51, v17);
  (*(void (**)(char *, uint64_t))(v87 + 8))(v50, v52);
  uint64_t v53 = v79;
  uint64_t v54 = (uint64_t)v75;
  sub_1000170C8(v79, (uint64_t)v75, &qword_100140C50);
  uint64_t v55 = v89;
  uint64_t v97 = v46;
  FlowActionImplementation.init(following:)();
  uint64_t v56 = v103;
  ActionDispatcher.init()();
  v107(v51, v56, v17);
  sub_10001758C(&qword_100144560, &qword_100144518);
  uint64_t v57 = v55;
  uint64_t v58 = v90;
  ActionDispatcher.add<A>(_:)();
  v101(v56, v17);
  (*(void (**)(char *, uint64_t))(v91 + 8))(v57, v58);
  sub_1000170C8(v53, v54, &qword_100140C50);
  uint64_t v59 = v92;
  FlowBackActionImplementation.init<A>(following:)();
  uint64_t v60 = v105;
  ActionDispatcher.init()();
  id v61 = v60;
  uint64_t v62 = (void (*)(void))v107;
  v107(v56, v60, v17);
  sub_10001758C(&qword_100144568, &qword_100144510);
  uint64_t v63 = v93;
  ActionDispatcher.add<A>(_:)();
  uint64_t v64 = v101;
  uint64_t v65 = v108;
  v101(v61, v17);
  (*(void (**)(char *, uint64_t))(v94 + 8))(v59, v63);
  uint64_t v66 = v88;
  ActionDispatcher.init()();
  ((void (*)(char *, char *, uint64_t))v62)(v61, v66, v17);
  sub_100005B18(&qword_100144570);
  sub_10001758C(&qword_100144578, &qword_100144570);
  ActionDispatcher.add<A>(_:)();
  v64(v66, v17);
  sub_100005B18(&qword_100144580);
  uint64_t v67 = *(void *)(v65 + 64);
  unint64_t v68 = (*(unsigned __int8 *)(v65 + 72) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 72);
  uint64_t v98 = swift_allocObject();
  unint64_t v69 = v98 + v68;
  ((void (*)(unint64_t, char *, uint64_t))v62)(v98 + v68, v100, v17);
  uint64_t v94 = v69 + v67;
  v62();
  ((void (*)(unint64_t, char *, uint64_t))v62)(v69 + 2 * v67, v106, v17);
  ((void (*)(unint64_t, char *, uint64_t))v62)(v69 + 3 * v67, v104, v17);
  ((void (*)(unint64_t, char *, uint64_t))v62)(v69 + 4 * v67, v102, v17);
  ((void (*)(unint64_t, char *, uint64_t))v62)(v69 + 5 * v67, v103, v17);
  ((void (*)(unint64_t, char *, uint64_t))v62)(v69 + 6 * v67, v105, v17);
  ActionDispatcher.init()();
  ActionDispatcher.add(contentsOf:)();
  ActionDispatcher.add(contentsOf:)();
  ActionDispatcher.add(contentsOf:)();
  ActionDispatcher.add(contentsOf:)();
  ActionDispatcher.add(contentsOf:)();
  ActionDispatcher.add(contentsOf:)();
  ActionDispatcher.add(contentsOf:)();
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v70 = v101;
  v101(v105, v17);
  v70(v103, v17);
  v70(v102, v17);
  v70(v104, v17);
  v70(v106, v17);
  v70(v99, v17);
  return ((uint64_t (*)(char *, uint64_t))v70)(v100, v17);
}

uint64_t sub_1000C46D0(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_1000C470C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_errorRetain();
  swift_retain();

  return _JetViewDefaultFailed.init(error:retry:)(a1, a2, a3);
}

uint64_t sub_1000C476C()
{
  uint64_t v1 = (int *)(sub_100005B18(&qword_100140C50) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_release();
  uint64_t v7 = v6 + v1[10];
  uint64_t v8 = sub_100005B18(&qword_100140C58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_1000C4870@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(sub_100005B18(&qword_100140C50) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1000C2858(v4, a1);
}

void *sub_1000C48E4(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

void *sub_1000C4950(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v31 = *a2;
    *a1 = *a2;
    a1 = (void *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a3;
    uint64_t v7 = sub_100005B18(&qword_100140C58);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = sub_100005B18(&qword_100142618);
    *(void *)((char *)a1 + *(int *)(v8 + 28)) = *(void *)((char *)a2 + *(int *)(v8 + 28));
    uint64_t v9 = v6[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t started = type metadata accessor for JetStartUpCoordinator();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(started - 8) + 16);
    swift_retain();
    v13(v10, v11, started);
    uint64_t v14 = sub_100005B18(&qword_10013FF50);
    *(void *)&v10[*(int *)(v14 + 28)] = *(void *)&v11[*(int *)(v14 + 28)];
    uint64_t v15 = v6[6];
    uint64_t v16 = v6[7];
    uint64_t v17 = (void *)((char *)a1 + v15);
    uint64_t v18 = (void *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = (char *)a1 + v16;
    uint64_t v21 = (char *)a2 + v16;
    uint64_t v22 = *(void *)((char *)a2 + v16 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v65 = v6;
    if (v22)
    {
      *(void *)uint64_t v20 = *(void *)v21;
      *((void *)v20 + 1) = v22;
      uint64_t v23 = *((void *)v21 + 3);
      *((void *)v20 + 2) = *((void *)v21 + 2);
      *((void *)v20 + 3) = v23;
      uint64_t v24 = *((void *)v21 + 5);
      *((void *)v20 + 4) = *((void *)v21 + 4);
      *((void *)v20 + 5) = v24;
      uint64_t v25 = *((void *)v21 + 7);
      *((void *)v20 + 6) = *((void *)v21 + 6);
      *((void *)v20 + 7) = v25;
      uint64_t v26 = *((void *)v21 + 9);
      *((void *)v20 + 8) = *((void *)v21 + 8);
      *((void *)v20 + 9) = v26;
      v20[80] = v21[80];
      uint64_t v27 = *((void *)v21 + 12);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v27)
      {
        *((void *)v20 + 11) = *((void *)v21 + 11);
        *((void *)v20 + 12) = v27;
        uint64_t v28 = *((void *)v21 + 14);
        *((void *)v20 + 13) = *((void *)v21 + 13);
        *((void *)v20 + 14) = v28;
        uint64_t v29 = *((void *)v21 + 16);
        *((void *)v20 + 15) = *((void *)v21 + 15);
        *((void *)v20 + 16) = v29;
        uint64_t v30 = *((void *)v21 + 18);
        *((void *)v20 + 17) = *((void *)v21 + 17);
        *((void *)v20 + 18) = v30;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v36 = *(_OWORD *)(v21 + 104);
        *(_OWORD *)(v20 + 88) = *(_OWORD *)(v21 + 88);
        *(_OWORD *)(v20 + 104) = v36;
        long long v37 = *(_OWORD *)(v21 + 136);
        *(_OWORD *)(v20 + 120) = *(_OWORD *)(v21 + 120);
        *(_OWORD *)(v20 + 136) = v37;
      }
      uint64_t v6 = v65;
    }
    else
    {
      long long v32 = *((_OWORD *)v21 + 7);
      *((_OWORD *)v20 + 6) = *((_OWORD *)v21 + 6);
      *((_OWORD *)v20 + 7) = v32;
      *((_OWORD *)v20 + 8) = *((_OWORD *)v21 + 8);
      *((void *)v20 + 18) = *((void *)v21 + 18);
      long long v33 = *((_OWORD *)v21 + 3);
      *((_OWORD *)v20 + 2) = *((_OWORD *)v21 + 2);
      *((_OWORD *)v20 + 3) = v33;
      long long v34 = *((_OWORD *)v21 + 5);
      *((_OWORD *)v20 + 4) = *((_OWORD *)v21 + 4);
      *((_OWORD *)v20 + 5) = v34;
      long long v35 = *((_OWORD *)v21 + 1);
      *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
      *((_OWORD *)v20 + 1) = v35;
    }
    uint64_t v38 = v6[8];
    long long v39 = (void *)((char *)a1 + v38);
    long long v40 = (void *)((char *)a2 + v38);
    uint64_t v41 = (int *)type metadata accessor for Game();
    uint64_t v42 = *((void *)v41 - 1);
    if ((*(unsigned int (**)(void *, uint64_t, int *))(v42 + 48))(v40, 1, v41))
    {
      uint64_t v43 = sub_100005B18(&qword_100140B48);
      memcpy(v39, v40, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      uint64_t v44 = v40[1];
      *long long v39 = *v40;
      v39[1] = v44;
      uint64_t v45 = v40[3];
      v39[2] = v40[2];
      v39[3] = v45;
      uint64_t v46 = v40[5];
      v39[4] = v40[4];
      v39[5] = v46;
      uint64_t v47 = v41[7];
      __dst = (char *)v39 + v47;
      uint64_t v64 = (char *)v40 + v47;
      uint64_t v48 = type metadata accessor for Date();
      uint64_t v61 = *(void *)(v48 - 8);
      uint64_t v63 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v63(v64, 1, v48))
      {
        uint64_t v49 = sub_100005B18(&qword_100140C48);
        memcpy(__dst, v64, *(void *)(*(void *)(v49 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v61 + 16))(__dst, v64, v48);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v61 + 56))(__dst, 0, 1, v48);
      }
      *(void *)((char *)v39 + v41[8]) = *(void *)((char *)v40 + v41[8]);
      *((unsigned char *)v39 + v41[9]) = *((unsigned char *)v40 + v41[9]);
      *((unsigned char *)v39 + v41[10]) = *((unsigned char *)v40 + v41[10]);
      *((unsigned char *)v39 + v41[11]) = *((unsigned char *)v40 + v41[11]);
      *((unsigned char *)v39 + v41[12]) = *((unsigned char *)v40 + v41[12]);
      *((unsigned char *)v39 + v41[13]) = *((unsigned char *)v40 + v41[13]);
      *((unsigned char *)v39 + v41[14]) = *((unsigned char *)v40 + v41[14]);
      uint64_t v50 = v41[15];
      id v51 = (void *)((char *)v39 + v50);
      uint64_t v52 = (void *)((char *)v40 + v50);
      uint64_t v53 = v52[1];
      void *v51 = *v52;
      v51[1] = v53;
      uint64_t v54 = *(void (**)(void *, void, uint64_t, int *))(v42 + 56);
      swift_bridgeObjectRetain();
      v54(v39, 0, 1, v41);
      uint64_t v6 = v65;
    }
    uint64_t v55 = v6[9];
    uint64_t v56 = (char *)a1 + v55;
    uint64_t v57 = (char *)a2 + v55;
    uint64_t v58 = type metadata accessor for AccessPointAnchoring();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 16))(v56, v57, v58);
    uint64_t v59 = v6[11];
    *((unsigned char *)a1 + v6[10]) = *((unsigned char *)a2 + v6[10]);
    *((unsigned char *)a1 + v59) = *((unsigned char *)a2 + v59);
    *((unsigned char *)a1 + v6[12]) = *((unsigned char *)a2 + v6[12]);
  }
  return a1;
}

uint64_t sub_1000C4EB0(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_100005B18(&qword_100140C58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_100005B18(&qword_100142618);
  swift_release();
  uint64_t v5 = a1 + a2[5];
  uint64_t started = type metadata accessor for JetStartUpCoordinator();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(v5, started);
  sub_100005B18(&qword_10013FF50);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = a1 + a2[7];
  if (*(void *)(v7 + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(void *)(v7 + 96))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v8 = a1 + a2[8];
  uint64_t v9 = type metadata accessor for Game();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v10 = v8 + *(int *)(v9 + 28);
    uint64_t v11 = type metadata accessor for Date();
    uint64_t v12 = *(void *)(v11 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v13 = a1 + a2[9];
  uint64_t v14 = type metadata accessor for AccessPointAnchoring();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);

  return v15(v13, v14);
}

uint64_t sub_1000C5144(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100005B18(&qword_100140C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = sub_100005B18(&qword_100142618);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t started = type metadata accessor for JetStartUpCoordinator();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(started - 8) + 16);
  swift_retain();
  v12(v9, v10, started);
  uint64_t v13 = sub_100005B18(&qword_10013FF50);
  *(void *)(v9 + *(int *)(v13 + 28)) = *(void *)(v10 + *(int *)(v13 + 28));
  uint64_t v14 = a3[6];
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v14);
  uint64_t v17 = (void *)(a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = a1 + v15;
  uint64_t v20 = a2 + v15;
  uint64_t v21 = *(void *)(a2 + v15 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v63 = a3;
  if (v21)
  {
    *(void *)uint64_t v19 = *(void *)v20;
    *(void *)(v19 + 8) = v21;
    uint64_t v22 = *(void *)(v20 + 24);
    *(void *)(v19 + 16) = *(void *)(v20 + 16);
    *(void *)(v19 + 24) = v22;
    uint64_t v23 = *(void *)(v20 + 40);
    *(void *)(v19 + 32) = *(void *)(v20 + 32);
    *(void *)(v19 + 40) = v23;
    uint64_t v24 = *(void *)(v20 + 56);
    *(void *)(v19 + 48) = *(void *)(v20 + 48);
    *(void *)(v19 + 56) = v24;
    uint64_t v25 = *(void *)(v20 + 72);
    *(void *)(v19 + 64) = *(void *)(v20 + 64);
    *(void *)(v19 + 72) = v25;
    *(unsigned char *)(v19 + 80) = *(unsigned char *)(v20 + 80);
    uint64_t v26 = *(void *)(v20 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v26)
    {
      *(void *)(v19 + 88) = *(void *)(v20 + 88);
      *(void *)(v19 + 96) = v26;
      uint64_t v27 = *(void *)(v20 + 112);
      *(void *)(v19 + 104) = *(void *)(v20 + 104);
      *(void *)(v19 + 112) = v27;
      uint64_t v28 = *(void *)(v20 + 128);
      *(void *)(v19 + 120) = *(void *)(v20 + 120);
      *(void *)(v19 + 128) = v28;
      uint64_t v29 = *(void *)(v20 + 144);
      *(void *)(v19 + 136) = *(void *)(v20 + 136);
      *(void *)(v19 + 144) = v29;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v34 = *(_OWORD *)(v20 + 104);
      *(_OWORD *)(v19 + 88) = *(_OWORD *)(v20 + 88);
      *(_OWORD *)(v19 + 104) = v34;
      long long v35 = *(_OWORD *)(v20 + 136);
      *(_OWORD *)(v19 + 120) = *(_OWORD *)(v20 + 120);
      *(_OWORD *)(v19 + 136) = v35;
    }
    a3 = v63;
  }
  else
  {
    long long v30 = *(_OWORD *)(v20 + 112);
    *(_OWORD *)(v19 + 96) = *(_OWORD *)(v20 + 96);
    *(_OWORD *)(v19 + 112) = v30;
    *(_OWORD *)(v19 + 128) = *(_OWORD *)(v20 + 128);
    *(void *)(v19 + 144) = *(void *)(v20 + 144);
    long long v31 = *(_OWORD *)(v20 + 48);
    *(_OWORD *)(v19 + 32) = *(_OWORD *)(v20 + 32);
    *(_OWORD *)(v19 + 48) = v31;
    long long v32 = *(_OWORD *)(v20 + 80);
    *(_OWORD *)(v19 + 64) = *(_OWORD *)(v20 + 64);
    *(_OWORD *)(v19 + 80) = v32;
    long long v33 = *(_OWORD *)(v20 + 16);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v33;
  }
  uint64_t v36 = a3[8];
  long long v37 = (void *)(a1 + v36);
  uint64_t v38 = (void *)(a2 + v36);
  long long v39 = (int *)type metadata accessor for Game();
  uint64_t v40 = *((void *)v39 - 1);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v40 + 48))(v38, 1, v39))
  {
    uint64_t v41 = sub_100005B18(&qword_100140B48);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    uint64_t v42 = v38[1];
    *long long v37 = *v38;
    v37[1] = v42;
    uint64_t v43 = v38[3];
    v37[2] = v38[2];
    v37[3] = v43;
    uint64_t v44 = v38[5];
    v37[4] = v38[4];
    v37[5] = v44;
    uint64_t v45 = v39[7];
    __dst = (char *)v37 + v45;
    uint64_t v61 = (char *)v38 + v45;
    uint64_t v46 = type metadata accessor for Date();
    uint64_t v59 = *(void *)(v46 - 8);
    uint64_t v60 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v60(v61, 1, v46))
    {
      uint64_t v47 = sub_100005B18(&qword_100140C48);
      memcpy(__dst, v61, *(void *)(*(void *)(v47 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v59 + 16))(__dst, v61, v46);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(__dst, 0, 1, v46);
    }
    *(void *)((char *)v37 + v39[8]) = *(void *)((char *)v38 + v39[8]);
    *((unsigned char *)v37 + v39[9]) = *((unsigned char *)v38 + v39[9]);
    *((unsigned char *)v37 + v39[10]) = *((unsigned char *)v38 + v39[10]);
    *((unsigned char *)v37 + v39[11]) = *((unsigned char *)v38 + v39[11]);
    *((unsigned char *)v37 + v39[12]) = *((unsigned char *)v38 + v39[12]);
    *((unsigned char *)v37 + v39[13]) = *((unsigned char *)v38 + v39[13]);
    *((unsigned char *)v37 + v39[14]) = *((unsigned char *)v38 + v39[14]);
    uint64_t v48 = v39[15];
    uint64_t v49 = (void *)((char *)v37 + v48);
    uint64_t v50 = (void *)((char *)v38 + v48);
    uint64_t v51 = v50[1];
    *uint64_t v49 = *v50;
    v49[1] = v51;
    uint64_t v52 = *(void (**)(void *, void, uint64_t, int *))(v40 + 56);
    swift_bridgeObjectRetain();
    v52(v37, 0, 1, v39);
    a3 = v63;
  }
  uint64_t v53 = a3[9];
  uint64_t v54 = a1 + v53;
  uint64_t v55 = a2 + v53;
  uint64_t v56 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 16))(v54, v55, v56);
  uint64_t v57 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v57) = *(unsigned char *)(a2 + v57);
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_1000C5654(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100005B18(&qword_100140C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = sub_100005B18(&qword_100142618);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  swift_retain();
  swift_release();
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t started = type metadata accessor for JetStartUpCoordinator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(started - 8) + 24))(v9, v10, started);
  uint64_t v12 = sub_100005B18(&qword_10013FF50);
  *(void *)(v9 + *(int *)(v12 + 28)) = *(void *)(v10 + *(int *)(v12 + 28));
  swift_retain();
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  swift_retain();
  swift_release();
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_retain();
  swift_release();
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = *(void *)(a1 + v16 + 8);
  uint64_t v20 = *(void *)(a2 + v16 + 8);
  if (!v19)
  {
    if (!v20)
    {
      long long v35 = *(_OWORD *)(v18 + 16);
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
      *(_OWORD *)(v17 + 16) = v35;
      long long v36 = *(_OWORD *)(v18 + 32);
      long long v37 = *(_OWORD *)(v18 + 48);
      long long v38 = *(_OWORD *)(v18 + 80);
      *(_OWORD *)(v17 + 64) = *(_OWORD *)(v18 + 64);
      *(_OWORD *)(v17 + 80) = v38;
      *(_OWORD *)(v17 + 32) = v36;
      *(_OWORD *)(v17 + 48) = v37;
      long long v39 = *(_OWORD *)(v18 + 96);
      long long v40 = *(_OWORD *)(v18 + 112);
      long long v41 = *(_OWORD *)(v18 + 128);
      *(void *)(v17 + 144) = *(void *)(v18 + 144);
      *(_OWORD *)(v17 + 112) = v40;
      *(_OWORD *)(v17 + 128) = v41;
      *(_OWORD *)(v17 + 96) = v39;
      goto LABEL_15;
    }
    *(void *)uint64_t v17 = *(void *)v18;
    *(void *)(v17 + 8) = *(void *)(v18 + 8);
    *(void *)(v17 + 16) = *(void *)(v18 + 16);
    *(void *)(v17 + 24) = *(void *)(v18 + 24);
    *(void *)(v17 + 32) = *(void *)(v18 + 32);
    *(void *)(v17 + 40) = *(void *)(v18 + 40);
    *(void *)(v17 + 48) = *(void *)(v18 + 48);
    *(void *)(v17 + 56) = *(void *)(v18 + 56);
    *(void *)(v17 + 64) = *(void *)(v18 + 64);
    *(void *)(v17 + 72) = *(void *)(v18 + 72);
    *(unsigned char *)(v17 + 80) = *(unsigned char *)(v18 + 80);
    uint64_t v24 = *(void *)(v18 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v24)
    {
      long long v25 = *(_OWORD *)(v18 + 88);
      long long v26 = *(_OWORD *)(v18 + 104);
      long long v27 = *(_OWORD *)(v18 + 136);
      *(_OWORD *)(v17 + 120) = *(_OWORD *)(v18 + 120);
      *(_OWORD *)(v17 + 136) = v27;
      *(_OWORD *)(v17 + 88) = v25;
      *(_OWORD *)(v17 + 104) = v26;
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  if (!v20)
  {
    sub_1000C6040(v17);
    long long v28 = *(_OWORD *)(v18 + 16);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    *(_OWORD *)(v17 + 16) = v28;
    long long v29 = *(_OWORD *)(v18 + 80);
    long long v31 = *(_OWORD *)(v18 + 32);
    long long v30 = *(_OWORD *)(v18 + 48);
    *(_OWORD *)(v17 + 64) = *(_OWORD *)(v18 + 64);
    *(_OWORD *)(v17 + 80) = v29;
    *(_OWORD *)(v17 + 32) = v31;
    *(_OWORD *)(v17 + 48) = v30;
    long long v33 = *(_OWORD *)(v18 + 112);
    long long v32 = *(_OWORD *)(v18 + 128);
    long long v34 = *(_OWORD *)(v18 + 96);
    *(void *)(v17 + 144) = *(void *)(v18 + 144);
    *(_OWORD *)(v17 + 112) = v33;
    *(_OWORD *)(v17 + 128) = v32;
    *(_OWORD *)(v17 + 96) = v34;
    goto LABEL_15;
  }
  *(void *)uint64_t v17 = *(void *)v18;
  *(void *)(v17 + 8) = *(void *)(v18 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v17 + 16) = *(void *)(v18 + 16);
  *(void *)(v17 + 24) = *(void *)(v18 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v17 + 32) = *(void *)(v18 + 32);
  *(void *)(v17 + 40) = *(void *)(v18 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v17 + 48) = *(void *)(v18 + 48);
  *(void *)(v17 + 56) = *(void *)(v18 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v17 + 64) = *(void *)(v18 + 64);
  *(void *)(v17 + 72) = *(void *)(v18 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v17 + 80) = *(unsigned char *)(v18 + 80);
  uint64_t v21 = (_OWORD *)(v17 + 88);
  uint64_t v22 = (long long *)(v18 + 88);
  uint64_t v23 = *(void *)(v18 + 96);
  if (!*(void *)(v17 + 96))
  {
    if (!v23)
    {
      long long v45 = *v22;
      long long v46 = *(_OWORD *)(v18 + 104);
      long long v47 = *(_OWORD *)(v18 + 136);
      *(_OWORD *)(v17 + 120) = *(_OWORD *)(v18 + 120);
      *(_OWORD *)(v17 + 136) = v47;
      *uint64_t v21 = v45;
      *(_OWORD *)(v17 + 104) = v46;
      goto LABEL_15;
    }
LABEL_11:
    *(void *)(v17 + 88) = *(void *)(v18 + 88);
    *(void *)(v17 + 96) = *(void *)(v18 + 96);
    *(void *)(v17 + 104) = *(void *)(v18 + 104);
    *(void *)(v17 + 112) = *(void *)(v18 + 112);
    *(void *)(v17 + 120) = *(void *)(v18 + 120);
    *(void *)(v17 + 128) = *(void *)(v18 + 128);
    *(void *)(v17 + 136) = *(void *)(v18 + 136);
    *(void *)(v17 + 144) = *(void *)(v18 + 144);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_15;
  }
  if (v23)
  {
    *(void *)(v17 + 88) = *(void *)(v18 + 88);
    *(void *)(v17 + 96) = *(void *)(v18 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v17 + 104) = *(void *)(v18 + 104);
    *(void *)(v17 + 112) = *(void *)(v18 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v17 + 120) = *(void *)(v18 + 120);
    *(void *)(v17 + 128) = *(void *)(v18 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v17 + 136) = *(void *)(v18 + 136);
    *(void *)(v17 + 144) = *(void *)(v18 + 144);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100006D1C(v17 + 88);
    long long v42 = *(_OWORD *)(v18 + 136);
    long long v44 = *v22;
    long long v43 = *(_OWORD *)(v18 + 104);
    *(_OWORD *)(v17 + 120) = *(_OWORD *)(v18 + 120);
    *(_OWORD *)(v17 + 136) = v42;
    *uint64_t v21 = v44;
    *(_OWORD *)(v17 + 104) = v43;
  }
LABEL_15:
  uint64_t v48 = a3[8];
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (void *)(a2 + v48);
  uint64_t v51 = (int *)type metadata accessor for Game();
  uint64_t v52 = *((void *)v51 - 1);
  uint64_t v53 = *(uint64_t (**)(void *, uint64_t, int *))(v52 + 48);
  int v54 = v53(v49, 1, v51);
  int v55 = v53(v50, 1, v51);
  if (!v54)
  {
    if (v55)
    {
      sub_100077428((uint64_t)v49, (uint64_t (*)(void))type metadata accessor for Game);
      goto LABEL_21;
    }
    uint64_t v87 = a3;
    *uint64_t v49 = *v50;
    v49[1] = v50[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v49[2] = v50[2];
    v49[3] = v50[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v49[4] = v50[4];
    v49[5] = v50[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v60 = v51[7];
    uint64_t v61 = (char *)v49 + v60;
    uint64_t v62 = (char *)v50 + v60;
    uint64_t v63 = type metadata accessor for Date();
    uint64_t v83 = *(void *)(v63 - 8);
    uint64_t v64 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v83 + 48);
    uint64_t v86 = v61;
    LODWORD(v61) = v64(v61, 1, v63);
    int v65 = v64(v62, 1, v63);
    if (v61)
    {
      if (!v65)
      {
        (*(void (**)(void *, char *, uint64_t))(v83 + 16))(v86, v62, v63);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v83 + 56))(v86, 0, 1, v63);
        goto LABEL_32;
      }
      size_t v66 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
      uint64_t v67 = v86;
    }
    else
    {
      if (!v65)
      {
        (*(void (**)(void *, char *, uint64_t))(v83 + 24))(v86, v62, v63);
        goto LABEL_32;
      }
      (*(void (**)(void *, uint64_t))(v83 + 8))(v86, v63);
      size_t v66 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
      uint64_t v67 = v86;
    }
    memcpy(v67, v62, v66);
LABEL_32:
    a3 = v87;
    *(void *)((char *)v49 + v51[8]) = *(void *)((char *)v50 + v51[8]);
    *((unsigned char *)v49 + v51[9]) = *((unsigned char *)v50 + v51[9]);
    *((unsigned char *)v49 + v51[10]) = *((unsigned char *)v50 + v51[10]);
    *((unsigned char *)v49 + v51[11]) = *((unsigned char *)v50 + v51[11]);
    *((unsigned char *)v49 + v51[12]) = *((unsigned char *)v50 + v51[12]);
    *((unsigned char *)v49 + v51[13]) = *((unsigned char *)v50 + v51[13]);
    *((unsigned char *)v49 + v51[14]) = *((unsigned char *)v50 + v51[14]);
    uint64_t v72 = v51[15];
    uint64_t v73 = (void *)((char *)v49 + v72);
    uint64_t v74 = (void *)((char *)v50 + v72);
    *uint64_t v73 = *v74;
    v73[1] = v74[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  if (v55)
  {
LABEL_21:
    uint64_t v59 = sub_100005B18(&qword_100140B48);
    memcpy(v49, v50, *(void *)(*(void *)(v59 - 8) + 64));
    goto LABEL_33;
  }
  uint64_t v85 = v52;
  *uint64_t v49 = *v50;
  v49[1] = v50[1];
  v49[2] = v50[2];
  v49[3] = v50[3];
  v49[4] = v50[4];
  v49[5] = v50[5];
  uint64_t v56 = v51[7];
  long long v82 = (char *)v50 + v56;
  __dst = (char *)v49 + v56;
  uint64_t v57 = type metadata accessor for Date();
  uint64_t v80 = *(void *)(v57 - 8);
  uint64_t v81 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v80 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v81(v82, 1, v57))
  {
    uint64_t v58 = sub_100005B18(&qword_100140C48);
    memcpy(__dst, v82, *(void *)(*(void *)(v58 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v80 + 16))(__dst, v82, v57);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v80 + 56))(__dst, 0, 1, v57);
  }
  *(void *)((char *)v49 + v51[8]) = *(void *)((char *)v50 + v51[8]);
  *((unsigned char *)v49 + v51[9]) = *((unsigned char *)v50 + v51[9]);
  *((unsigned char *)v49 + v51[10]) = *((unsigned char *)v50 + v51[10]);
  *((unsigned char *)v49 + v51[11]) = *((unsigned char *)v50 + v51[11]);
  *((unsigned char *)v49 + v51[12]) = *((unsigned char *)v50 + v51[12]);
  *((unsigned char *)v49 + v51[13]) = *((unsigned char *)v50 + v51[13]);
  *((unsigned char *)v49 + v51[14]) = *((unsigned char *)v50 + v51[14]);
  uint64_t v68 = v51[15];
  unint64_t v69 = (void *)((char *)v49 + v68);
  uint64_t v70 = (void *)((char *)v50 + v68);
  *unint64_t v69 = *v70;
  v69[1] = v70[1];
  uint64_t v71 = *(void (**)(void *, void, uint64_t, int *))(v85 + 56);
  swift_bridgeObjectRetain();
  v71(v49, 0, 1, v51);
LABEL_33:
  uint64_t v75 = a3[9];
  uint64_t v76 = a1 + v75;
  uint64_t v77 = a2 + v75;
  uint64_t v78 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v78 - 8) + 24))(v76, v77, v78);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_1000C6040(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000C6094(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100005B18(&qword_100140C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = sub_100005B18(&qword_100142618);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t started = type metadata accessor for JetStartUpCoordinator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(started - 8) + 32))(v9, v10, started);
  uint64_t v12 = sub_100005B18(&qword_10013FF50);
  *(void *)(v9 + *(int *)(v12 + 28)) = *(void *)(v10 + *(int *)(v12 + 28));
  uint64_t v13 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = (long long *)(a2 + v13);
  long long v16 = v15[7];
  *(_OWORD *)(v14 + 96) = v15[6];
  *(_OWORD *)(v14 + 112) = v16;
  *(_OWORD *)(v14 + 128) = v15[8];
  *(void *)(v14 + 144) = *((void *)v15 + 18);
  long long v17 = v15[3];
  *(_OWORD *)(v14 + 32) = v15[2];
  *(_OWORD *)(v14 + 48) = v17;
  long long v18 = v15[5];
  *(_OWORD *)(v14 + 64) = v15[4];
  *(_OWORD *)(v14 + 80) = v18;
  long long v19 = *v15;
  long long v20 = v15[1];
  uint64_t v21 = a3[8];
  uint64_t v22 = (_OWORD *)(a1 + v21);
  uint64_t v23 = (_OWORD *)(a2 + v21);
  *(_OWORD *)uint64_t v14 = v19;
  *(_OWORD *)(v14 + 16) = v20;
  uint64_t v24 = (int *)type metadata accessor for Game();
  uint64_t v25 = *((void *)v24 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = sub_100005B18(&qword_100140B48);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    long long v27 = v23[1];
    _OWORD *v22 = *v23;
    v22[1] = v27;
    v22[2] = v23[2];
    uint64_t v28 = v24[7];
    __dst = (char *)v22 + v28;
    long long v29 = (char *)v23 + v28;
    uint64_t v30 = type metadata accessor for Date();
    uint64_t v31 = *(void *)(v30 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
    {
      uint64_t v32 = sub_100005B18(&qword_100140C48);
      memcpy(__dst, v29, *(void *)(*(void *)(v32 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(__dst, v29, v30);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(__dst, 0, 1, v30);
    }
    *(void *)((char *)v22 + v24[8]) = *(void *)((char *)v23 + v24[8]);
    *((unsigned char *)v22 + v24[9]) = *((unsigned char *)v23 + v24[9]);
    *((unsigned char *)v22 + v24[10]) = *((unsigned char *)v23 + v24[10]);
    *((unsigned char *)v22 + v24[11]) = *((unsigned char *)v23 + v24[11]);
    *((unsigned char *)v22 + v24[12]) = *((unsigned char *)v23 + v24[12]);
    *((unsigned char *)v22 + v24[13]) = *((unsigned char *)v23 + v24[13]);
    *((unsigned char *)v22 + v24[14]) = *((unsigned char *)v23 + v24[14]);
    *(_OWORD *)((char *)v22 + v24[15]) = *(_OWORD *)((char *)v23 + v24[15]);
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v25 + 56))(v22, 0, 1, v24);
  }
  uint64_t v33 = a3[9];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  uint64_t v36 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
  uint64_t v37 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v37) = *(unsigned char *)(a2 + v37);
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_1000C6450(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100005B18(&qword_100140C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = sub_100005B18(&qword_100142618);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  swift_release();
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t started = type metadata accessor for JetStartUpCoordinator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(started - 8) + 40))(v9, v10, started);
  uint64_t v12 = sub_100005B18(&qword_10013FF50);
  *(void *)(v9 + *(int *)(v12 + 28)) = *(void *)(v10 + *(int *)(v12 + 28));
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  swift_release();
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_release();
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  if (!*(void *)(a1 + v16 + 8)) {
    goto LABEL_7;
  }
  uint64_t v19 = *(void *)(v18 + 8);
  if (!v19)
  {
    sub_1000C6040(v17);
LABEL_7:
    long long v28 = *(_OWORD *)(v18 + 112);
    *(_OWORD *)(v17 + 96) = *(_OWORD *)(v18 + 96);
    *(_OWORD *)(v17 + 112) = v28;
    *(_OWORD *)(v17 + 128) = *(_OWORD *)(v18 + 128);
    *(void *)(v17 + 144) = *(void *)(v18 + 144);
    long long v29 = *(_OWORD *)(v18 + 48);
    *(_OWORD *)(v17 + 32) = *(_OWORD *)(v18 + 32);
    *(_OWORD *)(v17 + 48) = v29;
    long long v30 = *(_OWORD *)(v18 + 80);
    *(_OWORD *)(v17 + 64) = *(_OWORD *)(v18 + 64);
    *(_OWORD *)(v17 + 80) = v30;
    long long v31 = *(_OWORD *)(v18 + 16);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    *(_OWORD *)(v17 + 16) = v31;
    goto LABEL_10;
  }
  *(void *)uint64_t v17 = *(void *)v18;
  *(void *)(v17 + 8) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v18 + 24);
  *(void *)(v17 + 16) = *(void *)(v18 + 16);
  *(void *)(v17 + 24) = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void *)(v18 + 40);
  *(void *)(v17 + 32) = *(void *)(v18 + 32);
  *(void *)(v17 + 40) = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void *)(v18 + 56);
  *(void *)(v17 + 48) = *(void *)(v18 + 48);
  *(void *)(v17 + 56) = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = *(void *)(v18 + 72);
  *(void *)(v17 + 64) = *(void *)(v18 + 64);
  *(void *)(v17 + 72) = v23;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v17 + 80) = *(unsigned char *)(v18 + 80);
  if (*(void *)(v17 + 96))
  {
    uint64_t v24 = *(void *)(v18 + 96);
    if (v24)
    {
      *(void *)(v17 + 88) = *(void *)(v18 + 88);
      *(void *)(v17 + 96) = v24;
      swift_bridgeObjectRelease();
      uint64_t v25 = *(void *)(v18 + 112);
      *(void *)(v17 + 104) = *(void *)(v18 + 104);
      *(void *)(v17 + 112) = v25;
      swift_bridgeObjectRelease();
      uint64_t v26 = *(void *)(v18 + 128);
      *(void *)(v17 + 120) = *(void *)(v18 + 120);
      *(void *)(v17 + 128) = v26;
      swift_bridgeObjectRelease();
      uint64_t v27 = *(void *)(v18 + 144);
      *(void *)(v17 + 136) = *(void *)(v18 + 136);
      *(void *)(v17 + 144) = v27;
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    sub_100006D1C(v17 + 88);
  }
  long long v32 = *(_OWORD *)(v18 + 104);
  *(_OWORD *)(v17 + 88) = *(_OWORD *)(v18 + 88);
  *(_OWORD *)(v17 + 104) = v32;
  long long v33 = *(_OWORD *)(v18 + 136);
  *(_OWORD *)(v17 + 120) = *(_OWORD *)(v18 + 120);
  *(_OWORD *)(v17 + 136) = v33;
LABEL_10:
  uint64_t v34 = a3[8];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (void *)(a2 + v34);
  uint64_t v37 = (int *)type metadata accessor for Game();
  uint64_t v38 = *((void *)v37 - 1);
  long long v39 = *(uint64_t (**)(void *, uint64_t, int *))(v38 + 48);
  int v40 = v39(v35, 1, v37);
  int v41 = v39(v36, 1, v37);
  if (!v40)
  {
    if (v41)
    {
      sub_100077428((uint64_t)v35, (uint64_t (*)(void))type metadata accessor for Game);
      goto LABEL_16;
    }
    uint64_t v49 = v36[1];
    *uint64_t v35 = *v36;
    v35[1] = v49;
    swift_bridgeObjectRelease();
    uint64_t v50 = v36[3];
    v35[2] = v36[2];
    v35[3] = v50;
    swift_bridgeObjectRelease();
    uint64_t v51 = v36[5];
    v35[4] = v36[4];
    v35[5] = v51;
    swift_bridgeObjectRelease();
    uint64_t v52 = v37[7];
    uint64_t v53 = (char *)v35 + v52;
    __dsta = (char *)v36 + v52;
    uint64_t v54 = type metadata accessor for Date();
    uint64_t v70 = *(void *)(v54 - 8);
    uint64_t v71 = v53;
    int v55 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v70 + 48);
    LODWORD(v53) = v55(v53, 1, v54);
    int v56 = v55(__dsta, 1, v54);
    if (v53)
    {
      if (!v56)
      {
        (*(void (**)(void *, char *, uint64_t))(v70 + 32))(v71, __dsta, v54);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v70 + 56))(v71, 0, 1, v54);
        goto LABEL_27;
      }
      size_t v57 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
      uint64_t v58 = v71;
    }
    else
    {
      if (!v56)
      {
        (*(void (**)(void *, char *, uint64_t))(v70 + 40))(v71, __dsta, v54);
        goto LABEL_27;
      }
      (*(void (**)(void *, uint64_t))(v70 + 8))(v71, v54);
      size_t v57 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
      uint64_t v58 = v71;
    }
    memcpy(v58, __dsta, v57);
LABEL_27:
    *(void *)((char *)v35 + v37[8]) = *(void *)((char *)v36 + v37[8]);
    *((unsigned char *)v35 + v37[9]) = *((unsigned char *)v36 + v37[9]);
    *((unsigned char *)v35 + v37[10]) = *((unsigned char *)v36 + v37[10]);
    *((unsigned char *)v35 + v37[11]) = *((unsigned char *)v36 + v37[11]);
    *((unsigned char *)v35 + v37[12]) = *((unsigned char *)v36 + v37[12]);
    *((unsigned char *)v35 + v37[13]) = *((unsigned char *)v36 + v37[13]);
    *((unsigned char *)v35 + v37[14]) = *((unsigned char *)v36 + v37[14]);
    uint64_t v59 = v37[15];
    uint64_t v60 = (void *)((char *)v35 + v59);
    uint64_t v61 = (void *)((char *)v36 + v59);
    uint64_t v63 = *v61;
    uint64_t v62 = v61[1];
    *uint64_t v60 = v63;
    v60[1] = v62;
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  if (v41)
  {
LABEL_16:
    uint64_t v48 = sub_100005B18(&qword_100140B48);
    memcpy(v35, v36, *(void *)(*(void *)(v48 - 8) + 64));
    goto LABEL_28;
  }
  long long v42 = *((_OWORD *)v36 + 1);
  *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
  *((_OWORD *)v35 + 1) = v42;
  *((_OWORD *)v35 + 2) = *((_OWORD *)v36 + 2);
  uint64_t v43 = v37[7];
  __dst = (char *)v35 + v43;
  long long v44 = (char *)v36 + v43;
  uint64_t v45 = type metadata accessor for Date();
  uint64_t v46 = *(void *)(v45 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45))
  {
    uint64_t v47 = sub_100005B18(&qword_100140C48);
    memcpy(__dst, v44, *(void *)(*(void *)(v47 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v46 + 32))(__dst, v44, v45);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(__dst, 0, 1, v45);
  }
  *(void *)((char *)v35 + v37[8]) = *(void *)((char *)v36 + v37[8]);
  *((unsigned char *)v35 + v37[9]) = *((unsigned char *)v36 + v37[9]);
  *((unsigned char *)v35 + v37[10]) = *((unsigned char *)v36 + v37[10]);
  *((unsigned char *)v35 + v37[11]) = *((unsigned char *)v36 + v37[11]);
  *((unsigned char *)v35 + v37[12]) = *((unsigned char *)v36 + v37[12]);
  *((unsigned char *)v35 + v37[13]) = *((unsigned char *)v36 + v37[13]);
  *((unsigned char *)v35 + v37[14]) = *((unsigned char *)v36 + v37[14]);
  *(_OWORD *)((char *)v35 + v37[15]) = *(_OWORD *)((char *)v36 + v37[15]);
  (*(void (**)(void *, void, uint64_t, int *))(v38 + 56))(v35, 0, 1, v37);
LABEL_28:
  uint64_t v64 = a3[9];
  uint64_t v65 = a1 + v64;
  uint64_t v66 = a2 + v64;
  uint64_t v67 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 40))(v65, v66, v67);
  uint64_t v68 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v68) = *(unsigned char *)(a2 + v68);
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_1000C6B80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C6B94);
}

uint64_t sub_1000C6B94(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100005B18(&qword_100142618);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_12:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100005B18(&qword_10013FF50);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_11:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_12;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[6]);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v16 = sub_100005B18(&qword_100140B48);
    if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
    {
      uint64_t v8 = v16;
      uint64_t v12 = *(void *)(v16 - 8);
      uint64_t v13 = a3[8];
      goto LABEL_11;
    }
    uint64_t v17 = type metadata accessor for AccessPointAnchoring();
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a3[9];
    return v18(v20, a2, v19);
  }
}

uint64_t sub_1000C6D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C6D80);
}

uint64_t sub_1000C6D80(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100005B18(&qword_100142618);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_100005B18(&qword_10013FF50);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[5];
LABEL_9:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6]) = (a2 - 1);
    return result;
  }
  uint64_t v16 = sub_100005B18(&qword_100140B48);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[8];
    goto LABEL_9;
  }
  uint64_t v17 = type metadata accessor for AccessPointAnchoring();
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a4[9];

  return v18(v20, a2, a2, v19);
}

void sub_1000C6F58()
{
  sub_100079B60();
  if (v0 <= 0x3F)
  {
    sub_1000C7120(319, (unint64_t *)&qword_10013FFC0, (uint64_t (*)(uint64_t))&type metadata accessor for JetStartUpCoordinator, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
    if (v1 <= 0x3F)
    {
      sub_1000C7120(319, (unint64_t *)&qword_100140CD0, (uint64_t (*)(uint64_t))type metadata accessor for Game, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v2 <= 0x3F)
      {
        type metadata accessor for AccessPointAnchoring();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_1000C7120(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1000C7184()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000C71A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000C7208()
{
  unint64_t v1 = (int *)type metadata accessor for AccessPointView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  unint64_t v4 = (*(void *)(*((void *)v1 - 1) + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = type metadata accessor for Game();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v25 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v24 = *(void *)(v6 + 64);
  uint64_t v7 = v0 + v3;
  uint64_t v8 = sub_100005B18(&qword_100140C58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  sub_100005B18(&qword_100142618);
  swift_release();
  uint64_t v9 = v7 + v1[5];
  uint64_t started = type metadata accessor for JetStartUpCoordinator();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(v9, started);
  sub_100005B18(&qword_10013FF50);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v11 = v7 + v1[7];
  if (*(void *)(v11 + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(void *)(v11 + 96))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v12 = v7 + v1[8];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v12, 1, v5))
  {
    uint64_t v23 = v2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v13 = v12 + *(int *)(v5 + 28);
    uint64_t v14 = type metadata accessor for Date();
    uint64_t v15 = *(void *)(v14 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    }
    swift_bridgeObjectRelease();
    uint64_t v2 = v23;
  }
  uint64_t v16 = (v4 + v25 + 152) & ~v25;
  uint64_t v17 = v7 + v1[9];
  uint64_t v18 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + v4 + 96))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v19 = v0 + v16 + *(int *)(v5 + 28);
  uint64_t v20 = type metadata accessor for Date();
  uint64_t v21 = *(void *)(v20 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20)) {
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
  }
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v16 + v24, v2 | v25 | 7);
}

uint64_t sub_1000C767C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000C76E4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AccessPointView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(type metadata accessor for Game() - 8);
  uint64_t v9 = v2 + ((v7 + *(unsigned __int8 *)(v8 + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));

  return sub_1000C3438(a1, v2 + v6, v2 + v7, v9, a2);
}

uint64_t sub_1000C77D8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000C7824()
{
  unint64_t result = qword_100144648;
  if (!qword_100144648)
  {
    sub_10000B448(&qword_100144650);
    sub_10000B448(&qword_100142708);
    sub_10001758C((unint64_t *)&qword_100142728, &qword_100142708);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144648);
  }
  return result;
}

uint64_t sub_1000C7930(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (a4)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v13 = a1;
  a5(v8, v10, v11, a4);

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_1000C79D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for GameOverlayUIConfig.ServiceKind();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [objc_allocWithZone((Class)FBSSystemService) init];
  unsigned __int8 v13 = [v12 isPasscodeLockedOrBlocked];

  if (v13)
  {
    if (qword_10013FBB0 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_100007D4C(v14, (uint64_t)qword_100156CF8);
    os_log_t v22 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v22, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v15, "Skipping onboarding flow request because device is locked or blocked.", v16, 2u);
      swift_slowDealloc();
    }
    os_log_t v17 = v22;
  }
  else
  {
    id v18 = [self currentContext];
    type metadata accessor for AuthenticationConnectionContext();
    uint64_t v19 = (void *)swift_allocObject();
    v19[15] = a1;
    v19[16] = a2;
    v19[17] = 0;
    v19[18] = 0;
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_1000E67FC(v18);
    *(void *)(v20 + 104) = a3;
    *(void *)(v20 + 112) = a4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for GameOverlayUIConfig.ServiceKind.auth(_:), v8);
    sub_100072354((uint64_t)v11, (void *)6, v20);
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_1000C7C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for GameOverlayUIConfig.ServiceKind();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [self currentContext];
  type metadata accessor for AuthenticationConnectionContext();
  unsigned __int8 v13 = (void *)swift_allocObject();
  v13[15] = 0;
  v13[16] = 0;
  v13[17] = a1;
  v13[18] = a2;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_1000E67FC(v12);
  *(void *)(v14 + 104) = a3;
  *(void *)(v14 + 112) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for GameOverlayUIConfig.ServiceKind.auth(_:), v8);
  sub_100072354((uint64_t)v11, (void *)7, v14);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

ValueMetadata *type metadata accessor for PlayerGroupView()
{
  return &type metadata for PlayerGroupView;
}

id sub_1000C7E2C()
{
  type metadata accessor for GKPlayerGroupView();
  uint64_t v0 = static GKPlayerGroupView.create()();
  if (v0)
  {
    uint64_t v1 = v0;
    GKPlayerGroupView.configure(players:messagesGroupIdentifier:playerSelectionProxy:)();
    return (id)v1;
  }
  else
  {
    if (qword_10013FBB0 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_100007D4C(v3, (uint64_t)qword_100156CF8);
    unint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      unint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "PlayerGroupView: Could not create GKPlayerGroupView.", v6, 2u);
      swift_slowDealloc();
    }

    id v7 = objc_allocWithZone((Class)UIView);
    return [v7 initWithFrame:0.0, 0.0, 0.0, 0.0];
  }
}

id sub_1000C7F7C()
{
  return sub_1000C7E2C();
}

uint64_t sub_1000C7F94()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_1000C7FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000C80C8();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000C803C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000C80C8();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000C80A0()
{
}

unint64_t sub_1000C80C8()
{
  unint64_t result = qword_100144658;
  if (!qword_100144658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144658);
  }
  return result;
}

const char *FlowAction.ID.gameOverlay.unsafeMutableAddressor()
{
  return "gameOverlay";
}

uint64_t FlowAction.init(id:actionMetrics:destination:presentation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, long long *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  id v12 = (int *)type metadata accessor for FlowAction();
  unsigned __int8 v13 = (char *)a7 + v12[5];
  uint64_t v14 = type metadata accessor for ActionMetrics();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v13, a3, v14);
  uint64_t result = sub_100069BBC(a4, (uint64_t)a7 + v12[6]);
  uint64_t v16 = (void *)((char *)a7 + v12[7]);
  *uint64_t v16 = a5;
  v16[1] = a6;
  return result;
}

uint64_t type metadata accessor for FlowAction()
{
  uint64_t result = qword_100144720;
  if (!qword_100144720) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t FlowAction.ID.init(from:)(void *a1)
{
  return sub_1000C9500(a1);
}

uint64_t FlowAction.ID.rawValue.getter(uint64_t a1)
{
  return a1;
}

void *sub_1000C8278@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_1000C8284@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1000C9500(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_1000C82B0()
{
  return RawRepresentable<>.encode(to:)();
}

Swift::Int sub_1000C8300()
{
  return Hasher._finalize()();
}

uint64_t sub_1000C835C()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000C83B4()
{
  return Hasher._finalize()();
}

uint64_t sub_1000C840C(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

uint64_t FlowAction.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t FlowAction.actionMetrics.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FlowAction() + 20);
  uint64_t v4 = type metadata accessor for ActionMetrics();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t FlowAction.actionMetrics.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FlowAction() + 20);
  uint64_t v4 = type metadata accessor for ActionMetrics();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*FlowAction.actionMetrics.modify())()
{
  return property wrapper backing initializer of Shelf.items;
}

uint64_t FlowAction.destination.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (long long *)(v1 + *(int *)(type metadata accessor for FlowAction() + 24));

  return sub_10007A230(v3, a1);
}

uint64_t FlowAction.destination.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FlowAction() + 24);

  return sub_1000C9688(a1, v3);
}

uint64_t (*FlowAction.destination.modify())()
{
  return property wrapper backing initializer of Shelf.items;
}

uint64_t FlowAction.presentation.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for FlowAction() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FlowAction.presentation.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for FlowAction() + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*FlowAction.presentation.modify())()
{
  return property wrapper backing initializer of Shelf.items;
}

uint64_t sub_1000C874C()
{
  uint64_t result = 25705;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x654D6E6F69746361;
      break;
    case 2:
      uint64_t result = 0x74616E6974736564;
      break;
    case 3:
      uint64_t result = 0x61746E6573657270;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000C87EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000CA60C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000C8814(uint64_t a1)
{
  unint64_t v2 = sub_1000C96E4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000C8850(uint64_t a1)
{
  unint64_t v2 = sub_1000C96E4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t FlowAction.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005B18(&qword_100144660);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006650(a1, a1[3]);
  sub_1000C96E4();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v9 = v3[1];
  uint64_t v17 = *v3;
  uint64_t v18 = v9;
  char v16 = 0;
  sub_1000C9738();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    uint64_t v10 = type metadata accessor for FlowAction();
    LOBYTE(v17) = 1;
    type metadata accessor for ActionMetrics();
    sub_1000CA804(&qword_100142DB0, (void (*)(uint64_t))&type metadata accessor for ActionMetrics);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v17) = 2;
    sub_1000C978C();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    uint64_t v11 = (uint64_t *)((char *)v3 + *(int *)(v10 + 28));
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    uint64_t v17 = v13;
    uint64_t v18 = v12;
    char v16 = 3;
    sub_1000C97E0();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t FlowAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v3 = type metadata accessor for ActionMetrics();
  uint64_t v21 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100005B18(&qword_100144688);
  uint64_t v20 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for FlowAction();
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006650(a1, a1[3]);
  sub_1000C96E4();
  uint64_t v23 = v7;
  uint64_t v11 = (uint64_t)v24;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v11) {
    return sub_100007188((uint64_t)a1);
  }
  uint64_t v24 = a1;
  uint64_t v12 = v21;
  char v26 = 0;
  sub_1000C9834();
  uint64_t v13 = v22;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v14 = *((void *)&v25 + 1);
  *(void *)uint64_t v10 = v25;
  *((void *)v10 + 1) = v14;
  LOBYTE(v25) = 1;
  sub_1000CA804(&qword_100142DC8, (void (*)(uint64_t))&type metadata accessor for ActionMetrics);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v10[v8[5]], v5, v3);
  char v26 = 2;
  sub_1000C98DC();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  sub_100069BBC(&v25, (uint64_t)&v10[v8[6]]);
  char v26 = 3;
  sub_1000C9930();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v13);
  uint64_t v15 = *((void *)&v25 + 1);
  char v16 = &v10[v8[7]];
  *(void *)char v16 = v25;
  *((void *)v16 + 1) = v15;
  sub_1000C9984((uint64_t)v10, v19);
  sub_100007188((uint64_t)v24);
  return sub_1000C99E8((uint64_t)v10);
}

uint64_t sub_1000C8F48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10007A230((long long *)(v2 + *(int *)(a1 + 24)), a2);
}

uint64_t sub_1000C8F58(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 28));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1000C8F90@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return FlowAction.init(from:)(a1, a2);
}

uint64_t sub_1000C8FA8(void *a1)
{
  return FlowAction.encode(to:)(a1);
}

uint64_t sub_1000C8FC0(uint64_t a1, uint64_t a2)
{
  return sub_1000C8FD8(a1, a2);
}

uint64_t sub_1000C8FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for DecodingError();
  uint64_t v30 = *(void *)(v5 - 8);
  uint64_t v31 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  long long v32 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = type metadata accessor for JSONContext();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for FlowAction();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
  Dictionary<>.init(jsonContext:)();
  sub_1000CA804(&qword_100144778, (void (*)(uint64_t))type metadata accessor for FlowAction);
  JSONObject.decode<A>(_:withUserInfo:)();
  if (v2)
  {
    uint64_t v29 = a2;
    swift_bridgeObjectRelease();
    uint64_t v33 = v2;
    swift_errorRetain();
    sub_100005B18(&qword_100142A90);
    uint64_t v15 = v31;
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v32, v9, v15);
      uint64_t v16 = type metadata accessor for JSONError();
      sub_1000CA804(&qword_100144780, (void (*)(uint64_t))&type metadata accessor for JSONError);
      swift_allocError();
      uint64_t v18 = v17;
      sub_100005B18(&qword_100144788);
      uint64_t v19 = swift_allocObject();
      uint64_t v28 = a1;
      uint64_t v20 = v19;
      *(_OWORD *)(v19 + 16) = xmmword_10010F300;
      *(void *)(v19 + 32) = swift_allocError();
      uint64_t v21 = v30;
      (*(void (**)(uint64_t, char *, uint64_t))(v30 + 16))(v22, v32, v15);
      *uint64_t v18 = v14;
      v18[1] = v20;
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, enum case for JSONError.malformedDocument(_:), v16);
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v29, v10);
      uint64_t v23 = type metadata accessor for JSONObject();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v28, v23);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v32, v15);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v29, v10);
      uint64_t v26 = type metadata accessor for JSONObject();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(a1, v26);
    }
    return swift_errorRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
    uint64_t v24 = type metadata accessor for JSONObject();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(a1, v24);
  }
}

uint64_t sub_1000C9470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = type metadata accessor for ActionMetrics();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t static FlowAction.ID.gameOverlay.getter()
{
  return 0x7265764F656D6167;
}

uint64_t sub_1000C9500(void *a1)
{
  uint64_t v3 = type metadata accessor for UUID();
  __chkstk_darwin(v3);
  uint64_t v4 = (uint64_t)sub_100006650(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (v1)
  {
    sub_100007188((uint64_t)a1);
  }
  else
  {
    sub_100006650(v6, v6[3]);
    uint64_t v4 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    sub_100007188((uint64_t)v6);
    sub_100007188((uint64_t)a1);
  }
  return v4;
}

uint64_t sub_1000C9688(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1000C96E4()
{
  unint64_t result = qword_100144668;
  if (!qword_100144668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144668);
  }
  return result;
}

unint64_t sub_1000C9738()
{
  unint64_t result = qword_100144670;
  if (!qword_100144670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144670);
  }
  return result;
}

unint64_t sub_1000C978C()
{
  unint64_t result = qword_100144678;
  if (!qword_100144678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144678);
  }
  return result;
}

unint64_t sub_1000C97E0()
{
  unint64_t result = qword_100144680;
  if (!qword_100144680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144680);
  }
  return result;
}

unint64_t sub_1000C9834()
{
  unint64_t result = qword_100144690;
  if (!qword_100144690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144690);
  }
  return result;
}

uint64_t sub_1000C9888(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000C98DC()
{
  unint64_t result = qword_100144698;
  if (!qword_100144698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144698);
  }
  return result;
}

unint64_t sub_1000C9930()
{
  unint64_t result = qword_1001446A0;
  if (!qword_1001446A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001446A0);
  }
  return result;
}

uint64_t sub_1000C9984(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FlowAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000C99E8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FlowAction();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000C9A48()
{
  unint64_t result = qword_1001446A8;
  if (!qword_1001446A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001446A8);
  }
  return result;
}

uint64_t sub_1000C9A9C()
{
  return sub_1000CA804(&qword_1001446B0, (void (*)(uint64_t))type metadata accessor for FlowAction);
}

unint64_t sub_1000C9AE8()
{
  unint64_t result = qword_1001446B8;
  if (!qword_1001446B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001446B8);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for FlowAction(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
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
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for ActionMetrics();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v13 + 24);
    if (v16)
    {
      uint64_t v17 = *((void *)v15 + 4);
      *((void *)v14 + 3) = v16;
      *((void *)v14 + 4) = v17;
      (**(void (***)(void))(v16 - 8))();
    }
    else
    {
      long long v19 = *((_OWORD *)v15 + 1);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
      *((_OWORD *)v14 + 1) = v19;
      *((void *)v14 + 4) = *((void *)v15 + 4);
    }
    uint64_t v20 = a3[7];
    uint64_t v21 = (uint64_t *)((char *)v4 + v20);
    uint64_t v22 = (uint64_t *)((char *)a2 + v20);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for FlowAction(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for ActionMetrics();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  if (*(void *)(v6 + 24)) {
    sub_100007188(v6);
  }

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for FlowAction(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for ActionMetrics();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = *(void *)((char *)a2 + v12 + 24);
  if (v15)
  {
    uint64_t v16 = *((void *)v14 + 4);
    *((void *)v13 + 3) = v15;
    *((void *)v13 + 4) = v16;
    (**(void (***)(void))(v15 - 8))();
  }
  else
  {
    long long v17 = *((_OWORD *)v14 + 1);
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
    *((_OWORD *)v13 + 1) = v17;
    *((void *)v13 + 4) = *((void *)v14 + 4);
  }
  uint64_t v18 = a3[7];
  long long v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v21 = v20[1];
  *long long v19 = *v20;
  v19[1] = v21;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for FlowAction(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ActionMetrics();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (uint64_t)a1 + v10;
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v13 = *(void *)((char *)a2 + v10 + 24);
  if (*(void *)((char *)a1 + v10 + 24))
  {
    if (v13)
    {
      sub_100019BC0((uint64_t *)v11, v12);
    }
    else
    {
      sub_1000C9FCC(v11);
      uint64_t v14 = v12[4];
      long long v15 = *((_OWORD *)v12 + 1);
      *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
      *(_OWORD *)(v11 + 16) = v15;
      *(void *)(v11 + 32) = v14;
    }
  }
  else if (v13)
  {
    *(void *)(v11 + 24) = v13;
    *(void *)(v11 + 32) = v12[4];
    (**(void (***)(uint64_t, char *))(v13 - 8))(v11, (char *)v12);
  }
  else
  {
    long long v16 = *(_OWORD *)v12;
    long long v17 = *((_OWORD *)v12 + 1);
    *(void *)(v11 + 32) = v12[4];
    *(_OWORD *)uint64_t v11 = v16;
    *(_OWORD *)(v11 + 16) = v17;
  }
  uint64_t v18 = a3[7];
  long long v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  *long long v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000C9FCC(uint64_t a1)
{
  uint64_t v2 = sub_100005B18(&qword_1001446C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *initializeWithTake for FlowAction(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ActionMetrics();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  uint64_t v13 = (char *)a2 + v10;
  long long v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((void *)v12 + 4) = *((void *)v13 + 4);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  return a1;
}

void *assignWithTake for FlowAction(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for ActionMetrics();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (uint64_t)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  if (*(void *)((char *)a1 + v11 + 24))
  {
    if (*((void *)v13 + 3)) {
      sub_100007188(v12);
    }
    else {
      sub_1000C9FCC(v12);
    }
  }
  long long v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + 16) = v14;
  *(void *)(v12 + 32) = *((void *)v13 + 4);
  uint64_t v15 = a3[7];
  long long v16 = (void *)((char *)a1 + v15);
  long long v17 = (void *)((char *)a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *long long v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FlowAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000CA1E0);
}

uint64_t sub_1000CA1E0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for ActionMetrics();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for FlowAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000CA2A4);
}

uint64_t sub_1000CA2A4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for ActionMetrics();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1000CA34C()
{
  uint64_t result = type metadata accessor for ActionMetrics();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for FlowAction.ID()
{
  return &type metadata for FlowAction.ID;
}

unsigned char *storeEnumTagSinglePayload for FlowAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000CA4CCLL);
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

ValueMetadata *type metadata accessor for FlowAction.CodingKeys()
{
  return &type metadata for FlowAction.CodingKeys;
}

unint64_t sub_1000CA508()
{
  unint64_t result = qword_100144760;
  if (!qword_100144760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144760);
  }
  return result;
}

unint64_t sub_1000CA560()
{
  unint64_t result = qword_100144768;
  if (!qword_100144768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144768);
  }
  return result;
}

unint64_t sub_1000CA5B8()
{
  unint64_t result = qword_100144770;
  if (!qword_100144770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144770);
  }
  return result;
}

uint64_t sub_1000CA60C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x654D6E6F69746361 && a2 == 0xED00007363697274 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74616E6974736564 && a2 == 0xEB000000006E6F69 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x61746E6573657270 && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_1000CA804(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000CA84C()
{
  unint64_t result = qword_100144790;
  if (!qword_100144790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144790);
  }
  return result;
}

void *InGameBannerPageIntent.kind.unsafeMutableAddressor()
{
  return &static InGameBannerPageIntent.kind;
}

unint64_t static InGameBannerPageIntent.kind.getter()
{
  return 0xD000000000000016;
}

uint64_t InGameBannerPageIntent.requiredData.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000A8C98(v1, a1);
}

uint64_t sub_1000CA8D4()
{
  return 0x6465726975716572;
}

uint64_t sub_1000CA8F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6465726975716572 && a2 == 0xEC00000061746144)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1000CA9A4(uint64_t a1)
{
  unint64_t v2 = sub_1000CAB7C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000CA9E0(uint64_t a1)
{
  unint64_t v2 = sub_1000CAB7C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t InGameBannerPageIntent.encode(to:)(void *a1)
{
  uint64_t v2 = sub_100005B18(&qword_100144798);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006650(a1, a1[3]);
  sub_1000CAB7C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  type metadata accessor for InGameBannerRequiredData();
  sub_1000CAE70(&qword_1001447A8);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_1000CAB7C()
{
  unint64_t result = qword_1001447A0;
  if (!qword_1001447A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001447A0);
  }
  return result;
}

uint64_t InGameBannerPageIntent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v13 = a2;
  uint64_t v4 = type metadata accessor for InGameBannerRequiredData();
  __chkstk_darwin(v4);
  uint64_t v15 = (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005B18(&qword_1001447B0);
  uint64_t v14 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for InGameBannerPageIntent();
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006650(a1, a1[3]);
  sub_1000CAB7C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    sub_1000CAE70(&qword_1001447B8);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
    sub_1000CAEB4(v15, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for InGameBannerRequiredData);
    sub_1000CAEB4((uint64_t)v11, v13, (uint64_t (*)(void))type metadata accessor for InGameBannerPageIntent);
  }
  return sub_100007188((uint64_t)a1);
}

uint64_t type metadata accessor for InGameBannerPageIntent()
{
  uint64_t result = qword_100144818;
  if (!qword_100144818) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000CAE70(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for InGameBannerRequiredData();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000CAEB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_1000CAF1C(void *a1@<X8>)
{
  *a1 = 0xD000000000000016;
  a1[1] = 0x80000001001122D0;
}

uint64_t sub_1000CAF3C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return InGameBannerPageIntent.init(from:)(a1, a2);
}

uint64_t initializeBufferWithCopyOfBuffer for InGameBannerPageIntent(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for InGameBannerRequiredData();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)a1 = *a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v7;
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v8;
    uint64_t v9 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v9;
    uint64_t v10 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v10;
    uint64_t v11 = a2[10];
    *(void *)(a1 + 72) = a2[9];
    *(void *)(a1 + 80) = v11;
    *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
    uint64_t v12 = a2[13];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12)
    {
      *(void *)(a1 + 96) = a2[12];
      *(void *)(a1 + 104) = v12;
      uint64_t v13 = a2[15];
      *(void *)(a1 + 112) = a2[14];
      *(void *)(a1 + 120) = v13;
      uint64_t v14 = a2[17];
      *(void *)(a1 + 128) = a2[16];
      *(void *)(a1 + 136) = v14;
      uint64_t v15 = a2[19];
      *(void *)(a1 + 144) = a2[18];
      *(void *)(a1 + 152) = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v17 = *((_OWORD *)a2 + 7);
      *(_OWORD *)(a1 + 96) = *((_OWORD *)a2 + 6);
      *(_OWORD *)(a1 + 112) = v17;
      long long v18 = *((_OWORD *)a2 + 9);
      *(_OWORD *)(a1 + 128) = *((_OWORD *)a2 + 8);
      *(_OWORD *)(a1 + 144) = v18;
    }
    uint64_t v19 = a2[21];
    *(void *)(a1 + 160) = a2[20];
    *(void *)(a1 + 168) = v19;
    uint64_t v20 = a2[23];
    *(void *)(a1 + 176) = a2[22];
    *(void *)(a1 + 184) = v20;
    uint64_t v21 = a2 + 24;
    unint64_t v22 = a2[25];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v22 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 192) = *(_OWORD *)v21;
    }
    else
    {
      uint64_t v23 = *v21;
      sub_1000244CC(*v21, v22);
      *(void *)(a1 + 192) = v23;
      *(void *)(a1 + 200) = v22;
    }
    uint64_t v24 = a2[27];
    *(void *)(a1 + 208) = a2[26];
    *(void *)(a1 + 216) = v24;
    uint64_t v25 = *(int *)(v6 + 40);
    uint64_t v26 = (void *)(a1 + v25);
    uint64_t v27 = (uint64_t *)((char *)a2 + v25);
    uint64_t v28 = (int *)type metadata accessor for Game();
    uint64_t v29 = *((void *)v28 - 1);
    uint64_t v30 = *(unsigned int (**)(void *, uint64_t, int *))(v29 + 48);
    swift_bridgeObjectRetain();
    if (v30(v27, 1, v28))
    {
      uint64_t v31 = sub_100005B18(&qword_100140B48);
      memcpy(v26, v27, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      uint64_t v46 = v29;
      uint64_t v32 = v27[1];
      void *v26 = *v27;
      v26[1] = v32;
      uint64_t v33 = v27[3];
      void v26[2] = v27[2];
      v26[3] = v33;
      uint64_t v34 = v27[5];
      v26[4] = v27[4];
      void v26[5] = v34;
      uint64_t v35 = v28[7];
      __dst = (char *)v26 + v35;
      uint64_t v48 = (char *)v27 + v35;
      uint64_t v49 = v6;
      uint64_t v36 = type metadata accessor for Date();
      uint64_t v44 = *(void *)(v36 - 8);
      uint64_t v47 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v47(v48, 1, v36))
      {
        uint64_t v37 = sub_100005B18(&qword_100140C48);
        memcpy(__dst, v48, *(void *)(*(void *)(v37 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v44 + 16))(__dst, v48, v36);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(__dst, 0, 1, v36);
      }
      *(void *)((char *)v26 + v28[8]) = *(void *)((char *)v27 + v28[8]);
      *((unsigned char *)v26 + v28[9]) = *((unsigned char *)v27 + v28[9]);
      *((unsigned char *)v26 + v28[10]) = *((unsigned char *)v27 + v28[10]);
      *((unsigned char *)v26 + v28[11]) = *((unsigned char *)v27 + v28[11]);
      *((unsigned char *)v26 + v28[12]) = *((unsigned char *)v27 + v28[12]);
      *((unsigned char *)v26 + v28[13]) = *((unsigned char *)v27 + v28[13]);
      *((unsigned char *)v26 + v28[14]) = *((unsigned char *)v27 + v28[14]);
      uint64_t v38 = v28[15];
      long long v39 = (void *)((char *)v26 + v38);
      int v40 = (void *)((char *)v27 + v38);
      uint64_t v41 = v40[1];
      *long long v39 = *v40;
      v39[1] = v41;
      long long v42 = *(void (**)(void *, void, uint64_t, int *))(v46 + 56);
      swift_bridgeObjectRetain();
      v42(v26, 0, 1, v28);
      uint64_t v6 = v49;
    }
    *(void *)(a1 + *(int *)(v6 + 44)) = *(uint64_t *)((char *)a2 + *(int *)(v6 + 44));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for InGameBannerPageIntent(void *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a1[13])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = a1[25];
  if (v2 >> 60 != 15) {
    sub_1000247CC(a1[24], v2);
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)a1 + *(int *)(type metadata accessor for InGameBannerRequiredData() + 40);
  uint64_t v4 = type metadata accessor for Game();
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v3, 1, v4))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v5 = &v3[*(int *)(v4 + 28)];
    uint64_t v6 = type metadata accessor for Date();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
    }
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InGameBannerPageIntent(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v9 = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9)
  {
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = v9;
    uint64_t v10 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = v10;
    uint64_t v11 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = v11;
    uint64_t v12 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v13 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v13;
    long long v14 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v14;
  }
  uint64_t v15 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v15;
  uint64_t v16 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v16;
  long long v17 = (uint64_t *)(a2 + 192);
  unint64_t v18 = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v18 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 192) = *(_OWORD *)v17;
  }
  else
  {
    uint64_t v19 = *v17;
    sub_1000244CC(*v17, v18);
    *(void *)(a1 + 192) = v19;
    *(void *)(a1 + 200) = v18;
  }
  uint64_t v20 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v20;
  uint64_t v21 = type metadata accessor for InGameBannerRequiredData();
  uint64_t v22 = *(int *)(v21 + 40);
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  uint64_t v25 = (int *)type metadata accessor for Game();
  uint64_t v26 = *((void *)v25 - 1);
  uint64_t v27 = *(unsigned int (**)(void *, uint64_t, int *))(v26 + 48);
  swift_bridgeObjectRetain();
  if (v27(v24, 1, v25))
  {
    uint64_t v28 = sub_100005B18(&qword_100140B48);
    memcpy(v23, v24, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    uint64_t v45 = v26;
    uint64_t v46 = v21;
    uint64_t v29 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v29;
    uint64_t v30 = v24[3];
    void v23[2] = v24[2];
    v23[3] = v30;
    uint64_t v31 = v24[5];
    v23[4] = v24[4];
    v23[5] = v31;
    uint64_t v32 = v25[7];
    uint64_t v43 = (char *)v24 + v32;
    __dst = (char *)v23 + v32;
    uint64_t v33 = type metadata accessor for Date();
    uint64_t v41 = *(void *)(v33 - 8);
    long long v42 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v42(v43, 1, v33))
    {
      uint64_t v34 = sub_100005B18(&qword_100140C48);
      memcpy(__dst, v43, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 16))(__dst, v43, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(__dst, 0, 1, v33);
    }
    *(void *)((char *)v23 + v25[8]) = *(void *)((char *)v24 + v25[8]);
    *((unsigned char *)v23 + v25[9]) = *((unsigned char *)v24 + v25[9]);
    *((unsigned char *)v23 + v25[10]) = *((unsigned char *)v24 + v25[10]);
    *((unsigned char *)v23 + v25[11]) = *((unsigned char *)v24 + v25[11]);
    *((unsigned char *)v23 + v25[12]) = *((unsigned char *)v24 + v25[12]);
    *((unsigned char *)v23 + v25[13]) = *((unsigned char *)v24 + v25[13]);
    *((unsigned char *)v23 + v25[14]) = *((unsigned char *)v24 + v25[14]);
    uint64_t v35 = v25[15];
    uint64_t v36 = (void *)((char *)v23 + v35);
    uint64_t v37 = (void *)((char *)v24 + v35);
    uint64_t v38 = v37[1];
    *uint64_t v36 = *v37;
    v36[1] = v38;
    long long v39 = *(void (**)(void *, void, uint64_t, int *))(v45 + 56);
    swift_bridgeObjectRetain();
    v39(v23, 0, 1, v25);
    uint64_t v21 = v46;
  }
  *(void *)(a1 + *(int *)(v21 + 44)) = *(void *)(a2 + *(int *)(v21 + 44));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InGameBannerPageIntent(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v4 = (_OWORD *)(a1 + 96);
  uint64_t v5 = (long long *)(a2 + 96);
  uint64_t v6 = *(void *)(a2 + 104);
  if (*(void *)(a1 + 104))
  {
    if (v6)
    {
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = *(void *)(a2 + 152);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_100006D1C(a1 + 96);
      long long v7 = *(_OWORD *)(a2 + 144);
      long long v9 = *v5;
      long long v8 = *(_OWORD *)(a2 + 112);
      *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
      *(_OWORD *)(a1 + 144) = v7;
      *uint64_t v4 = v9;
      *(_OWORD *)(a1 + 112) = v8;
    }
  }
  else if (v6)
  {
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v10 = *v5;
    long long v11 = *(_OWORD *)(a2 + 112);
    long long v12 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v12;
    *uint64_t v4 = v10;
    *(_OWORD *)(a1 + 112) = v11;
  }
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v13 = (uint64_t *)(a2 + 192);
  unint64_t v14 = *(void *)(a2 + 200);
  if (*(void *)(a1 + 200) >> 60 == 15)
  {
    if (v14 >> 60 != 15)
    {
      uint64_t v15 = *v13;
      sub_1000244CC(*v13, *(void *)(a2 + 200));
      *(void *)(a1 + 192) = v15;
      *(void *)(a1 + 200) = v14;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v14 >> 60 == 15)
  {
    sub_100078C08(a1 + 192);
LABEL_13:
    *(_OWORD *)(a1 + 192) = *(_OWORD *)v13;
    goto LABEL_15;
  }
  uint64_t v16 = *v13;
  sub_1000244CC(*v13, *(void *)(a2 + 200));
  uint64_t v17 = *(void *)(a1 + 192);
  unint64_t v18 = *(void *)(a1 + 200);
  *(void *)(a1 + 192) = v16;
  *(void *)(a1 + 200) = v14;
  sub_1000247CC(v17, v18);
LABEL_15:
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = type metadata accessor for InGameBannerRequiredData();
  uint64_t v20 = *(int *)(v19 + 40);
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = (int *)type metadata accessor for Game();
  uint64_t v24 = *((void *)v23 - 1);
  uint64_t v25 = *(uint64_t (**)(void *, uint64_t, int *))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (v27)
    {
      sub_1000AD3C0((uint64_t)v21);
      goto LABEL_21;
    }
    uint64_t v56 = v19;
    *uint64_t v21 = *v22;
    v21[1] = v22[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v21[2] = v22[2];
    v21[3] = v22[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v21[4] = v22[4];
    v21[5] = v22[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v33 = v23[7];
    uint64_t v34 = (char *)v21 + v33;
    uint64_t v35 = (char *)v22 + v33;
    uint64_t v36 = type metadata accessor for Date();
    uint64_t v51 = *(void *)(v36 - 8);
    uint64_t v37 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v51 + 48);
    __dsta = v34;
    LODWORD(v34) = v37(v34, 1, v36);
    int v38 = v37(v35, 1, v36);
    if (v34)
    {
      if (!v38)
      {
        (*(void (**)(void *, char *, uint64_t))(v51 + 16))(__dsta, v35, v36);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v51 + 56))(__dsta, 0, 1, v36);
        goto LABEL_32;
      }
      size_t v39 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
      int v40 = __dsta;
    }
    else
    {
      if (!v38)
      {
        (*(void (**)(void *, char *, uint64_t))(v51 + 24))(__dsta, v35, v36);
        goto LABEL_32;
      }
      (*(void (**)(void *, uint64_t))(v51 + 8))(__dsta, v36);
      size_t v39 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
      int v40 = __dsta;
    }
    memcpy(v40, v35, v39);
LABEL_32:
    uint64_t v19 = v56;
    *(void *)((char *)v21 + v23[8]) = *(void *)((char *)v22 + v23[8]);
    *((unsigned char *)v21 + v23[9]) = *((unsigned char *)v22 + v23[9]);
    *((unsigned char *)v21 + v23[10]) = *((unsigned char *)v22 + v23[10]);
    *((unsigned char *)v21 + v23[11]) = *((unsigned char *)v22 + v23[11]);
    *((unsigned char *)v21 + v23[12]) = *((unsigned char *)v22 + v23[12]);
    *((unsigned char *)v21 + v23[13]) = *((unsigned char *)v22 + v23[13]);
    *((unsigned char *)v21 + v23[14]) = *((unsigned char *)v22 + v23[14]);
    uint64_t v45 = v23[15];
    uint64_t v46 = (void *)((char *)v21 + v45);
    uint64_t v47 = (void *)((char *)v22 + v45);
    *uint64_t v46 = *v47;
    v46[1] = v47[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  if (v27)
  {
LABEL_21:
    uint64_t v32 = sub_100005B18(&qword_100140B48);
    memcpy(v21, v22, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_33;
  }
  uint64_t v55 = v19;
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  v21[2] = v22[2];
  v21[3] = v22[3];
  v21[4] = v22[4];
  v21[5] = v22[5];
  uint64_t v28 = v23[7];
  __src = (char *)v22 + v28;
  __dst = (char *)v21 + v28;
  uint64_t v29 = type metadata accessor for Date();
  uint64_t v49 = *(void *)(v29 - 8);
  uint64_t v50 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48);
  uint64_t v30 = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v50(__src, 1, v30))
  {
    uint64_t v31 = sub_100005B18(&qword_100140C48);
    memcpy(__dst, __src, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v49 + 16))(__dst, __src, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(__dst, 0, 1, v30);
  }
  uint64_t v19 = v55;
  *(void *)((char *)v21 + v23[8]) = *(void *)((char *)v22 + v23[8]);
  *((unsigned char *)v21 + v23[9]) = *((unsigned char *)v22 + v23[9]);
  *((unsigned char *)v21 + v23[10]) = *((unsigned char *)v22 + v23[10]);
  *((unsigned char *)v21 + v23[11]) = *((unsigned char *)v22 + v23[11]);
  *((unsigned char *)v21 + v23[12]) = *((unsigned char *)v22 + v23[12]);
  *((unsigned char *)v21 + v23[13]) = *((unsigned char *)v22 + v23[13]);
  *((unsigned char *)v21 + v23[14]) = *((unsigned char *)v22 + v23[14]);
  uint64_t v41 = v23[15];
  long long v42 = (void *)((char *)v21 + v41);
  uint64_t v43 = (void *)((char *)v22 + v41);
  *long long v42 = *v43;
  v42[1] = v43[1];
  uint64_t v44 = *(void (**)(void *, void, uint64_t, int *))(v24 + 56);
  swift_bridgeObjectRetain();
  v44(v21, 0, 1, v23);
LABEL_33:
  *(void *)(a1 + *(int *)(v19 + 44)) = *(void *)(a2 + *(int *)(v19 + 44));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for InGameBannerPageIntent(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  long long v4 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v4;
  long long v5 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v5;
  uint64_t v6 = type metadata accessor for InGameBannerRequiredData();
  uint64_t v7 = *(int *)(v6 + 40);
  long long v8 = (_OWORD *)(a1 + v7);
  long long v9 = (_OWORD *)(a2 + v7);
  long long v10 = (int *)type metadata accessor for Game();
  uint64_t v11 = *((void *)v10 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100005B18(&qword_100140B48);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    long long v13 = v9[1];
    *long long v8 = *v9;
    v8[1] = v13;
    v8[2] = v9[2];
    uint64_t v14 = v10[7];
    __dst = (char *)v8 + v14;
    uint64_t v15 = (char *)v9 + v14;
    uint64_t v16 = type metadata accessor for Date();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = sub_100005B18(&qword_100140C48);
      memcpy(__dst, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(__dst, v15, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 1, v16);
    }
    *(void *)((char *)v8 + v10[8]) = *(void *)((char *)v9 + v10[8]);
    *((unsigned char *)v8 + v10[9]) = *((unsigned char *)v9 + v10[9]);
    *((unsigned char *)v8 + v10[10]) = *((unsigned char *)v9 + v10[10]);
    *((unsigned char *)v8 + v10[11]) = *((unsigned char *)v9 + v10[11]);
    *((unsigned char *)v8 + v10[12]) = *((unsigned char *)v9 + v10[12]);
    *((unsigned char *)v8 + v10[13]) = *((unsigned char *)v9 + v10[13]);
    *((unsigned char *)v8 + v10[14]) = *((unsigned char *)v9 + v10[14]);
    *(_OWORD *)((char *)v8 + v10[15]) = *(_OWORD *)((char *)v9 + v10[15]);
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
  }
  *(void *)(a1 + *(int *)(v6 + 44)) = *(void *)(a2 + *(int *)(v6 + 44));
  return a1;
}

uint64_t assignWithTake for InGameBannerPageIntent(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  if (*(void *)(a1 + 104))
  {
    uint64_t v9 = *(void *)(a2 + 104);
    if (v9)
    {
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = v9;
      swift_bridgeObjectRelease();
      uint64_t v10 = *(void *)(a2 + 120);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = v10;
      swift_bridgeObjectRelease();
      uint64_t v11 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = v11;
      swift_bridgeObjectRelease();
      uint64_t v12 = *(void *)(a2 + 152);
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = v12;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_100006D1C(a1 + 96);
  }
  long long v13 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v13;
  long long v14 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v14;
LABEL_6:
  uint64_t v15 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = (_OWORD *)(a2 + 192);
  unint64_t v18 = *(void *)(a1 + 200);
  if (v18 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)(a1 + 192) = *v17;
    goto LABEL_11;
  }
  unint64_t v19 = *(void *)(a2 + 200);
  if (v19 >> 60 == 15)
  {
    sub_100078C08(a1 + 192);
    goto LABEL_9;
  }
  uint64_t v20 = *(void *)(a1 + 192);
  *(void *)(a1 + 192) = *(void *)v17;
  *(void *)(a1 + 200) = v19;
  sub_1000247CC(v20, v18);
LABEL_11:
  uint64_t v21 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = type metadata accessor for InGameBannerRequiredData();
  uint64_t v23 = *(int *)(v22 + 40);
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  int v26 = (int *)type metadata accessor for Game();
  uint64_t v27 = *((void *)v26 - 1);
  uint64_t v28 = *(uint64_t (**)(void *, uint64_t, int *))(v27 + 48);
  int v29 = v28(v24, 1, v26);
  int v30 = v28(v25, 1, v26);
  if (!v29)
  {
    if (v30)
    {
      sub_1000AD3C0((uint64_t)v24);
      goto LABEL_17;
    }
    uint64_t v56 = v22;
    uint64_t v38 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v38;
    swift_bridgeObjectRelease();
    uint64_t v39 = v25[3];
    v24[2] = v25[2];
    v24[3] = v39;
    swift_bridgeObjectRelease();
    uint64_t v40 = v25[5];
    v24[4] = v25[4];
    v24[5] = v40;
    swift_bridgeObjectRelease();
    uint64_t v41 = v26[7];
    long long v42 = (char *)v24 + v41;
    uint64_t v43 = (char *)v25 + v41;
    uint64_t v44 = type metadata accessor for Date();
    uint64_t v55 = *(void *)(v44 - 8);
    uint64_t v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v55 + 48);
    __dsta = v42;
    LODWORD(v42) = v45(v42, 1, v44);
    int v46 = v45(v43, 1, v44);
    if (v42)
    {
      if (!v46)
      {
        (*(void (**)(void *, char *, uint64_t))(v55 + 32))(__dsta, v43, v44);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v55 + 56))(__dsta, 0, 1, v44);
        goto LABEL_28;
      }
      size_t v47 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
      uint64_t v48 = __dsta;
    }
    else
    {
      if (!v46)
      {
        (*(void (**)(void *, char *, uint64_t))(v55 + 40))(__dsta, v43, v44);
        goto LABEL_28;
      }
      (*(void (**)(void *, uint64_t))(v55 + 8))(__dsta, v44);
      size_t v47 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
      uint64_t v48 = __dsta;
    }
    memcpy(v48, v43, v47);
LABEL_28:
    uint64_t v22 = v56;
    *(void *)((char *)v24 + v26[8]) = *(void *)((char *)v25 + v26[8]);
    *((unsigned char *)v24 + v26[9]) = *((unsigned char *)v25 + v26[9]);
    *((unsigned char *)v24 + v26[10]) = *((unsigned char *)v25 + v26[10]);
    *((unsigned char *)v24 + v26[11]) = *((unsigned char *)v25 + v26[11]);
    *((unsigned char *)v24 + v26[12]) = *((unsigned char *)v25 + v26[12]);
    *((unsigned char *)v24 + v26[13]) = *((unsigned char *)v25 + v26[13]);
    *((unsigned char *)v24 + v26[14]) = *((unsigned char *)v25 + v26[14]);
    uint64_t v49 = v26[15];
    uint64_t v50 = (void *)((char *)v24 + v49);
    uint64_t v51 = (void *)((char *)v25 + v49);
    uint64_t v53 = *v51;
    uint64_t v52 = v51[1];
    *uint64_t v50 = v53;
    v50[1] = v52;
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  if (v30)
  {
LABEL_17:
    uint64_t v37 = sub_100005B18(&qword_100140B48);
    memcpy(v24, v25, *(void *)(*(void *)(v37 - 8) + 64));
    goto LABEL_29;
  }
  long long v31 = *((_OWORD *)v25 + 1);
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  *((_OWORD *)v24 + 1) = v31;
  *((_OWORD *)v24 + 2) = *((_OWORD *)v25 + 2);
  uint64_t v32 = v26[7];
  __dst = (char *)v24 + v32;
  uint64_t v33 = (char *)v25 + v32;
  uint64_t v34 = type metadata accessor for Date();
  uint64_t v35 = *(void *)(v34 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
  {
    uint64_t v36 = sub_100005B18(&qword_100140C48);
    memcpy(__dst, v33, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(__dst, v33, v34);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(__dst, 0, 1, v34);
  }
  *(void *)((char *)v24 + v26[8]) = *(void *)((char *)v25 + v26[8]);
  *((unsigned char *)v24 + v26[9]) = *((unsigned char *)v25 + v26[9]);
  *((unsigned char *)v24 + v26[10]) = *((unsigned char *)v25 + v26[10]);
  *((unsigned char *)v24 + v26[11]) = *((unsigned char *)v25 + v26[11]);
  *((unsigned char *)v24 + v26[12]) = *((unsigned char *)v25 + v26[12]);
  *((unsigned char *)v24 + v26[13]) = *((unsigned char *)v25 + v26[13]);
  *((unsigned char *)v24 + v26[14]) = *((unsigned char *)v25 + v26[14]);
  *(_OWORD *)((char *)v24 + v26[15]) = *(_OWORD *)((char *)v25 + v26[15]);
  (*(void (**)(void *, void, uint64_t, int *))(v27 + 56))(v24, 0, 1, v26);
LABEL_29:
  *(void *)(a1 + *(int *)(v22 + 44)) = *(void *)(a2 + *(int *)(v22 + 44));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InGameBannerPageIntent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000CCA38);
}

uint64_t sub_1000CCA38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InGameBannerRequiredData();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for InGameBannerPageIntent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000CCAB8);
}

uint64_t sub_1000CCAB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InGameBannerRequiredData();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_1000CCB28()
{
  uint64_t result = type metadata accessor for InGameBannerRequiredData();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for InGameBannerPageIntent.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000CCC50);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for InGameBannerPageIntent.CodingKeys()
{
  return &type metadata for InGameBannerPageIntent.CodingKeys;
}

unint64_t sub_1000CCC8C()
{
  unint64_t result = qword_100144850;
  if (!qword_100144850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144850);
  }
  return result;
}

unint64_t sub_1000CCCE4()
{
  unint64_t result = qword_100144858;
  if (!qword_100144858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144858);
  }
  return result;
}

unint64_t sub_1000CCD3C()
{
  unint64_t result = qword_100144860;
  if (!qword_100144860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144860);
  }
  return result;
}

id sub_1000CCD90()
{
  id result = [objc_allocWithZone((Class)CNAvatarImageRenderer) init];
  qword_100144870 = (uint64_t)result;
  return result;
}

uint64_t sub_1000CCDC4()
{
  uint64_t v0 = type metadata accessor for URLExpression();
  sub_100007CE8(v0, qword_100144878);
  sub_100007D4C(v0, (uint64_t)qword_100144878);
  return URLExpression.init(schemePattern:hostPattern:pathPattern:queryPattern:)();
}

uint64_t static ContactAvatarProtocol.avatarTemplate(for:)(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for CharacterSet();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1;
  unint64_t v14 = (unint64_t)a2;
  static CharacterSet.urlHostAllowed.getter();
  sub_100025F34();
  uint64_t v8 = StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v10)
  {
    a1 = v8;
    a2 = v10;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v13 = 0x3A746361746E6F63;
  unint64_t v14 = 0xEA00000000002F2FLL;
  v11._countAndFlagsBits = a1;
  v11._object = a2;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t ContactAvatarProtocol.fetch(contentsOf:)(uint64_t a1)
{
  uint64_t v2 = sub_100005B18(&qword_1001448A0);
  __chkstk_darwin(v2);
  uint64_t v7 = a1;
  (*(void (**)(unsigned char *, void))(v4 + 104))(&v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], enum case for AsyncStream.Continuation.BufferingPolicy.unbounded<A>(_:));
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

void sub_1000CD0CC()
{
  uint64_t v0 = sub_100005B18(&qword_1001448B8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B18(&qword_1001448C0);
  MediaArtwork.ProtocolRequest.matchResult.getter();
  id v4 = sub_1000CD368(v18[0], v18[1]);
  swift_bridgeObjectRelease();
  if (v4)
  {
    uint64_t v5 = self;
    MediaArtwork.ProtocolRequest.size.getter();
    double v7 = v6;
    double v9 = v8;
    MediaArtwork.ProtocolRequest.scale.getter();
    id v11 = [v5 scopeWithPointSize:0 scale:0 rightToLeft:v7 style:v9];
    if (qword_10013FCA0 != -1) {
      swift_once();
    }
    uint64_t v12 = (void *)qword_100144870;
    sub_100005B18(&qword_100144420);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_100111BA0;
    *(void *)(v13 + 32) = v4;
    v18[0] = v13;
    specialized Array._endMutation()();
    sub_1000CDD98();
    id v14 = v4;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v16 = [v12 avatarImageForContacts:isa scope:v11];

    id v17 = v16;
    v18[0] = Image.init(uiImage:)();
    sub_100005B18((uint64_t *)&unk_1001448C8);
    AsyncStream.Continuation.yield(_:)();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    AsyncStream.Continuation.finish()();

    swift_unknownObjectRelease();
  }
  else
  {
    sub_100005B18((uint64_t *)&unk_1001448C8);
    AsyncStream.Continuation.finish()();
  }
}

id sub_1000CD368(uint64_t a1, unint64_t a2)
{
  sub_100005B18(&qword_100144420);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1001124D0;
  *(void *)(v4 + 32) = [self descriptorForRequiredKeysForStyle:0];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = objc_allocWithZone((Class)NSString);
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v7 = [v5 initWithString:v6];

  *(void *)(v4 + 40) = v7;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = objc_allocWithZone((Class)NSString);
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v10 = [v8 initWithString:v9];

  *(void *)(v4 + 48) = v10;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = objc_allocWithZone((Class)NSString);
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v13 = [v11 initWithString:v12];

  *(void *)(v4 + 56) = v13;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = objc_allocWithZone((Class)NSString);
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v16 = [v14 initWithString:v15];

  *(void *)(v4 + 64) = v16;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v17 = objc_allocWithZone((Class)NSString);
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v19 = [v17 initWithString:v18];

  *(void *)(v4 + 72) = v19;
  id v31 = (id)v4;
  specialized Array._endMutation()();
  if (qword_10013FCB0 != -1) {
    swift_once();
  }
  uint64_t v20 = (void *)qword_100144890;
  NSString v21 = String._bridgeToObjectiveC()();
  sub_100005B18(&qword_100144940);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v31 = 0;
  id v23 = [v20 unifiedContactWithIdentifier:v21 keysToFetch:isa error:&v31];

  id v24 = v31;
  if (!v23)
  {
    uint64_t v25 = v24;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_10013FBB0 != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    sub_100007D4C(v26, (uint64_t)qword_100156CF8);
    swift_bridgeObjectRetain_n();
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      int v29 = (uint8_t *)swift_slowAlloc();
      id v31 = (id)swift_slowAlloc();
      *(_DWORD *)int v29 = 136315138;
      swift_bridgeObjectRetain();
      sub_100036BF8(a1, a2, (uint64_t *)&v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Failed to fetch contact for identifier: %s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    swift_errorRelease();

    return 0;
  }
  return v23;
}

uint64_t sub_1000CD83C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s13GameOverlayUI21ContactAvatarProtocolV5matchyAC15MatchedResourceVSg10Foundation3URLVF_0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000CD864(uint64_t a1)
{
  uint64_t v2 = sub_100005B18(&qword_1001448A0);
  __chkstk_darwin(v2);
  uint64_t v7 = a1;
  (*(void (**)(unsigned char *, void))(v4 + 104))(&v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], enum case for AsyncStream.Continuation.BufferingPolicy.unbounded<A>(_:));
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

id sub_1000CD968()
{
  id result = [objc_allocWithZone((Class)CNContactStore) init];
  qword_100144890 = (uint64_t)result;
  return result;
}

uint64_t sub_1000CD99C(uint64_t a1)
{
  uint64_t matched = URLExpression.MatchResult.host.getter();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = matched & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v6 = URLExpression.MatchResult.host.getter();
    sub_100025F34();
    swift_bridgeObjectRetain();
    uint64_t v7 = StringProtocol.removingPercentEncoding.getter();
    uint64_t v9 = v8;
    uint64_t v10 = type metadata accessor for URLExpression.MatchResult();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
    swift_bridgeObjectRelease();
    if (v9)
    {
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  else
  {
    uint64_t v11 = type metadata accessor for URLExpression.MatchResult();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
    return 0;
  }
  return v6;
}

uint64_t _s13GameOverlayUI21ContactAvatarProtocolV5matchyAC15MatchedResourceVSg10Foundation3URLVF_0()
{
  uint64_t v0 = sub_100005B18(&qword_100144948);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t matched = type metadata accessor for URLExpression.MatchResult();
  uint64_t v4 = *(void *)(matched - 8);
  uint64_t v5 = __chkstk_darwin(matched);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v13 - v8;
  if (qword_10013FCA8 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for URLExpression();
  sub_100007D4C(v10, (uint64_t)qword_100144878);
  URLExpression.match(_:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, matched) == 1)
  {
    sub_1000CDDD8((uint64_t)v2);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, matched);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, matched);
    uint64_t v11 = sub_1000CD99C((uint64_t)v7);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, matched);
  }
  return v11;
}

void sub_1000CDCF8()
{
}

void *sub_1000CDD00()
{
  return &protocol witness table for Image;
}

unint64_t sub_1000CDD10()
{
  unint64_t result = qword_1001448A8;
  if (!qword_1001448A8)
  {
    sub_10000B448(&qword_1001448B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001448A8);
  }
  return result;
}

void *sub_1000CDD6C()
{
  return &protocol witness table for URL;
}

ValueMetadata *type metadata accessor for ContactAvatarProtocol()
{
  return &type metadata for ContactAvatarProtocol;
}

ValueMetadata *type metadata accessor for ContactAvatarProtocol.MatchedResource()
{
  return &type metadata for ContactAvatarProtocol.MatchedResource;
}

unint64_t sub_1000CDD98()
{
  unint64_t result = qword_1001448D8;
  if (!qword_1001448D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1001448D8);
  }
  return result;
}

uint64_t sub_1000CDDD8(uint64_t a1)
{
  uint64_t v2 = sub_100005B18(&qword_100144948);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for GameOverlayUIFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000CDF08);
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

ValueMetadata *type metadata accessor for GameOverlayUIFeatureFlags()
{
  return &type metadata for GameOverlayUIFeatureFlags;
}

unint64_t sub_1000CDF44()
{
  unint64_t result = qword_1001449B0;
  if (!qword_1001449B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001449B0);
  }
  return result;
}

const char *sub_1000CDF98()
{
  if (*v0 - 1 >= 3) {
    return "gseui";
  }
  else {
    return "GameCenter";
  }
}

const char *sub_1000CDFCC()
{
  unint64_t result = "de7bbd8e";
  switch(*v0)
  {
    case 1:
      unint64_t result = "gameoverlayui_with_oldui";
      break;
    case 2:
      unint64_t result = "gameoverlayui_with_newui";
      break;
    case 3:
      unint64_t result = "gameoverlayui_friend_inbox_banner";
      break;
    default:
      return result;
  }
  return result;
}

id sub_1000CE040()
{
  uint64_t v1 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  v1[14] = _swiftEmptyDictionarySingleton;
  v3.receiver = v1;
  v3.super_class = v0;
  return [super init];
}

id sub_1000CE0EC()
{
  uint64_t v0 = (objc_class *)type metadata accessor for RemoteAlertHandleObserver();
  uint64_t v1 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  v1[14] = &_swiftEmptyDictionarySingleton;
  v3.receiver = v1;
  v3.super_class = v0;
  id result = [super init];
  qword_100156DF8 = (uint64_t)result;
  return result;
}

uint64_t sub_1000CE154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 120) = a4;
  *(void *)(v5 + 128) = a5;
  return _swift_task_switch(sub_1000CE174, 0, 0);
}

uint64_t sub_1000CE174()
{
  uint64_t v1 = *(void *)(v0 + 120) + 24;
  sub_1000170C8(v1, v0 + 16, &qword_100142A70);
  if (!*(void *)(v0 + 40))
  {
    sub_100017388(v0 + 16, &qword_100142A70);
    goto LABEL_8;
  }
  sub_100005B18((uint64_t *)&unk_100144A90);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    sub_1000170C8(v1, v0 + 16, &qword_100142A70);
    if (!*(void *)(v0 + 40))
    {
      id v17 = &qword_100142A70;
      uint64_t v18 = v0 + 16;
      goto LABEL_24;
    }
    sub_100005B18((uint64_t *)&unk_100144A80);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_25;
    }
    uint64_t v7 = *(void *)(v0 + 120);
    uint64_t v8 = *(void **)(v0 + 56);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v9 = objc_allocWithZone((Class)NSError);
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v11 = [v9 initWithDomain:v10 code:2 userInfo:0];

    [v8 didFinishOnboardingWithError:v11];
    uint64_t v12 = *(void *)(v7 + 104);
    uint64_t v13 = *(void **)(v7 + 112);
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1000E61EC(6, v12, v13);
    uint64_t v16 = v15;
LABEL_17:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v30 = *(void *)(v0 + 120);
    *(void *)(v0 + 136) = v16;
    *(void *)(v0 + 144) = v14;
    uint64_t v31 = v30 + 64;
    swift_beginAccess();
    sub_1000170C8(v31, v0 + 56, &qword_1001444D0);
    if (*(void *)(v0 + 80))
    {
      sub_100069BBC((long long *)(v0 + 56), v0 + 16);
      if (qword_10013FC00 != -1) {
        swift_once();
      }
      uint64_t v24 = qword_100156D18;
      *(void *)(v0 + 152) = qword_100156D18;
      id v23 = sub_1000CE584;
      uint64_t v25 = 0;
      return _swift_task_switch(v23, v24, v25);
    }
    swift_bridgeObjectRelease();
    id v17 = &qword_1001444D0;
    uint64_t v18 = v0 + 56;
LABEL_24:
    sub_100017388(v18, v17);
    goto LABEL_25;
  }
  uint64_t v2 = *(__objc2_class ***)(v0 + 120);
  objc_super v3 = *(void **)(v0 + 56);
  sub_10003913C();
  v4.super.super.Class isa = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
  Class isa = v4.super.super.isa;
  unsigned int v6 = *v2;
  if (*v2 == _TtC13GameOverlayUI26DashboardConnectionContext)
  {
    uint64_t v19 = *(void *)(v0 + 120);
    [v3 didDismissDashboard];
    uint64_t v21 = *(void *)(v19 + 104);
    uint64_t v20 = *(void **)(v19 + 112);
    swift_bridgeObjectRetain();
    char v22 = 2;
LABEL_16:
    uint64_t v14 = sub_1000E61EC(v22, v21, v20);
    uint64_t v16 = v29;

    goto LABEL_17;
  }
  if (v6 == _TtC13GameOverlayUI28AccessPointConnectionContext)
  {
    [v3 isPresentingDashboardFromAccessPoint:v4.super.super.isa];
    id v23 = (uint64_t (*)())(id)BSValueWithRect();
    if (!v23)
    {
      __break(1u);
      return _swift_task_switch(v23, v24, v25);
    }
    uint64_t v26 = v23;
    uint64_t v27 = *(void *)(v0 + 120);
    [v3 updateAccessPointFrameCoordinates:v23];

    uint64_t v21 = *(void *)(v27 + 104);
    uint64_t v20 = *(void **)(v27 + 112);
    swift_bridgeObjectRetain();
    char v22 = 0;
    goto LABEL_16;
  }
  if (v6 == _TtC13GameOverlayUI29InGameBannerConnectionContext)
  {
    uint64_t v28 = *(void *)(v0 + 120);
    uint64_t v21 = *(void *)(v28 + 104);
    uint64_t v20 = *(void **)(v28 + 112);
    swift_bridgeObjectRetain();
    char v22 = 1;
    goto LABEL_16;
  }

  swift_unknownObjectRelease();
LABEL_25:
  uint64_t v32 = *(uint64_t (**)(void))(v0 + 8);
  return v32();
}

uint64_t sub_1000CE584()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  NSNumber v4 = sub_100006650(v0 + 2, v2);
  sub_10007158C((uint64_t)v4, 1, v1, v2, v3);
  return _swift_task_switch(sub_1000CE614, 0, 0);
}

uint64_t sub_1000CE614()
{
  uint64_t v1 = qword_100156D18;
  *(void *)(v0 + 160) = qword_100156D18;
  return _swift_task_switch(sub_1000CE638, v1, 0);
}

uint64_t sub_1000CE638()
{
  sub_10006A164(*(void *)(v0 + 144), *(void *)(v0 + 136));
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1000CE6B0, 0, 0);
}

uint64_t sub_1000CE6B0()
{
  sub_100007188(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000CE820(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005B18(&qword_100142A60);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100007D4C(v7, (uint64_t)qword_100156CF8);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    NSString v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "RemoteAlertHandle did deactivate.", v10, 2u);
    swift_slowDealloc();
  }

  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v2;
  v12[5] = a1;
  swift_retain();
  id v13 = a1;
  sub_10002C340((uint64_t)v6, (uint64_t)&unk_100144AA8, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_1000CE9E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  sub_100005B18(&qword_100142A60);
  v5[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000CEA7C, a4, 0);
}

uint64_t sub_1000CEA7C()
{
  unint64_t v1 = v0[6];
  swift_beginAccess();
  uint64_t v2 = sub_1000E139C(v1);
  swift_endAccess();
  if (v2)
  {
    uint64_t v3 = *(void **)(v2 + 16);
    if (v3)
    {
      uint64_t v4 = v0[7];
      uint64_t v5 = type metadata accessor for TaskPriority();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
      uint64_t v6 = (void *)swift_allocObject();
      v6[2] = 0;
      v6[3] = 0;
      void v6[4] = v2;
      v6[5] = v3;
      id v7 = v3;
      swift_retain();
      sub_10002C340(v4, (uint64_t)&unk_100144AB0, (uint64_t)v6);
      swift_release();
    }
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_1000CEC14(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005B18(&qword_100142A60);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100007D4C(v9, (uint64_t)qword_100156CF8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    id v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    if (a2)
    {
      swift_errorRetain();
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v19 = v14;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      uint64_t v19 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v14 = 0;
    }
    *id v13 = v14;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "RemoteAlertHandle did invalidate. Error: %@", v12, 0xCu);
    sub_100005B18(&qword_100142A40);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v8, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v3;
  v16[5] = a1;
  swift_retain();
  id v17 = a1;
  sub_10002C340((uint64_t)v8, (uint64_t)&unk_100144A58, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_1000CEEF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  sub_100005B18(&qword_100142A60);
  v5[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000CEF8C, a4, 0);
}

uint64_t sub_1000CEF8C()
{
  unint64_t v1 = v0[6];
  swift_beginAccess();
  uint64_t v2 = sub_1000E139C(v1);
  swift_endAccess();
  if (v2)
  {
    uint64_t v3 = *(void **)(v2 + 16);
    if (v3)
    {
      uint64_t v4 = v0[7];
      uint64_t v5 = type metadata accessor for TaskPriority();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
      uint64_t v6 = (void *)swift_allocObject();
      v6[2] = 0;
      v6[3] = 0;
      void v6[4] = v2;
      v6[5] = v3;
      id v7 = v3;
      swift_retain();
      sub_10002C340(v4, (uint64_t)&unk_100144A70, (uint64_t)v6);
      swift_release();
    }
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_1000CF14C()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for RemoteAlertHandleObserver()
{
  return self;
}

uint64_t sub_1000CF1A8(uint64_t (*a1)(void))
{
  uint64_t result = a1();
  if (result) {
    return _swift_stdlib_bridgeErrorToNSError();
  }
  return result;
}

uint64_t sub_1000CF1DC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1000243C4;
  return sub_1000CEEF4(a1, v4, v5, v7, v6);
}

uint64_t sub_1000CF2A0()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_10003E30C;
  *(_OWORD *)(v2 + 120) = v3;
  return _swift_task_switch(sub_1000CE174, 0, 0);
}

uint64_t sub_1000CF350(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10003E30C;
  return sub_1000CE9E4(a1, v4, v5, v7, v6);
}

uint64_t sub_1000CF414()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void Player.hash(into:)()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 56))
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    if (*(void *)(v0 + 72))
    {
LABEL_3:
      Hasher._combine(_:)(1u);
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    Hasher._combine(_:)(0);
    if (*(void *)(v0 + 72)) {
      goto LABEL_3;
    }
  }
  Hasher._combine(_:)(0);
LABEL_6:
  Hasher._combine(_:)(*(unsigned char *)(v0 + 80) & 1);
  uint64_t v1 = *(void *)(v0 + 96);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 88);
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    Player.FriendRequestInboxEntry.hash(into:)();
    sub_100015C9C(v2, v1);
  }
  else
  {
    Hasher._combine(_:)(0);
  }
}

unint64_t sub_1000CF67C(char a1)
{
  unint64_t result = 0x4449726579616C70;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x726174617661;
      break;
    case 2:
      unint64_t result = 1701667182;
      break;
    case 3:
      unint64_t result = 0x4E746361746E6F63;
      break;
    case 4:
      unint64_t result = 0x48746361746E6F63;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0x746E45786F626E69;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1000CF774()
{
  return sub_1000CF67C(*v0);
}

uint64_t sub_1000CF77C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000D0838(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000CF7A4(uint64_t a1)
{
  unint64_t v2 = sub_1000CFE70();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000CF7E0(uint64_t a1)
{
  unint64_t v2 = sub_1000CFE70();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t Player.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005B18(&qword_100144AC0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100006650(a1, a1[3]);
  sub_1000CFE70();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[0] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    v11[0] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[0] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[0] = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v11[0] = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v11[0] = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
    sub_1000CFEC4(v3 + 88, (uint64_t)v12);
    sub_1000CFEC4((uint64_t)v12, (uint64_t)v11);
    v10[15] = 6;
    sub_1000CFF2C();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int Player.hashValue.getter()
{
  return Hasher._finalize()();
}

double Player.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000CFF80(a1, (uint64_t)v9);
  if (!v2)
  {
    long long v5 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v9[8];
    *(void *)(a2 + 144) = v10;
    long long v6 = v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(_OWORD *)(a2 + 48) = v6;
    long long v7 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v7;
    double result = *(double *)v9;
    long long v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
  }
  return result;
}

uint64_t sub_1000CFB20(void *a1)
{
  return Player.encode(to:)(a1);
}

BOOL sub_1000CFB7C(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v2;
  v11[8] = *(_OWORD *)(a1 + 128);
  uint64_t v12 = *(void *)(a1 + 144);
  long long v3 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v3;
  long long v4 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v4;
  long long v5 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v5;
  long long v6 = *(_OWORD *)(a2 + 112);
  v13[6] = *(_OWORD *)(a2 + 96);
  v13[7] = v6;
  v13[8] = *(_OWORD *)(a2 + 128);
  uint64_t v14 = *(void *)(a2 + 144);
  long long v7 = *(_OWORD *)(a2 + 48);
  void v13[2] = *(_OWORD *)(a2 + 32);
  v13[3] = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  v13[4] = *(_OWORD *)(a2 + 64);
  v13[5] = v8;
  long long v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  return _s13GameOverlayUI6PlayerV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v11, (uint64_t)v13);
}

Swift::Int sub_1000CFC14()
{
  return Hasher._finalize()();
}

BOOL _s13GameOverlayUI6PlayerV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v7 || (char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v8 & 1) != 0))
    {
      if (*(void *)(a1 + 32) == *(void *)(a2 + 32) && *(void *)(a1 + 40) == *(void *)(a2 + 40)
        || (char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v9 & 1) != 0))
      {
        uint64_t v10 = *(void *)(a1 + 56);
        uint64_t v11 = *(void *)(a2 + 56);
        if (v10)
        {
          if (!v11) {
            return 0;
          }
          if (*(void *)(a1 + 48) != *(void *)(a2 + 48) || v10 != v11)
          {
            char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
            BOOL result = 0;
            if ((v12 & 1) == 0) {
              return result;
            }
          }
        }
        else if (v11)
        {
          return 0;
        }
        uint64_t v13 = *(void *)(a1 + 72);
        uint64_t v14 = *(void *)(a2 + 72);
        if (v13)
        {
          if (!v14) {
            return 0;
          }
          if (*(void *)(a1 + 64) != *(void *)(a2 + 64) || v13 != v14)
          {
            char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
            BOOL result = 0;
            if ((v15 & 1) == 0) {
              return result;
            }
          }
        }
        else if (v14)
        {
          return 0;
        }
        if ((*(unsigned __int8 *)(a1 + 80) ^ *(unsigned __int8 *)(a2 + 80))) {
          return 0;
        }
        uint64_t v16 = *(void *)(a1 + 88);
        uint64_t v17 = *(void *)(a1 + 96);
        uint64_t v18 = *(void *)(a1 + 104);
        uint64_t v19 = *(void *)(a1 + 112);
        uint64_t v20 = *(void *)(a1 + 120);
        uint64_t v21 = *(void *)(a1 + 128);
        uint64_t v22 = *(void *)(a1 + 136);
        uint64_t v23 = *(void *)(a1 + 144);
        uint64_t v25 = *(void *)(a2 + 88);
        uint64_t v24 = *(void *)(a2 + 96);
        uint64_t v27 = *(void *)(a2 + 104);
        uint64_t v26 = *(void *)(a2 + 112);
        uint64_t v29 = *(void *)(a2 + 120);
        uint64_t v28 = *(void *)(a2 + 128);
        uint64_t v31 = *(void *)(a2 + 136);
        uint64_t v30 = *(void *)(a2 + 144);
        if (v17)
        {
          if (v24)
          {
            v48[0] = v16;
            v48[1] = v17;
            v48[2] = v18;
            v48[3] = v19;
            v48[4] = v20;
            v48[5] = v21;
            v48[6] = v22;
            v48[7] = v23;
            uint64_t v32 = v25;
            uint64_t v33 = v24;
            uint64_t v34 = v27;
            uint64_t v35 = v26;
            uint64_t v36 = v29;
            uint64_t v37 = v28;
            uint64_t v38 = v31;
            uint64_t v39 = v30;
            return (_s13GameOverlayUI6PlayerV23FriendRequestInboxEntryV23__derived_struct_equalsySbAE_AEtFZ_0(v48, &v32) & 1) != 0;
          }
        }
        else if (!v24)
        {
          return 1;
        }
        uint64_t v32 = v16;
        uint64_t v33 = v17;
        uint64_t v34 = v18;
        uint64_t v35 = v19;
        uint64_t v36 = v20;
        uint64_t v37 = v21;
        uint64_t v38 = v22;
        uint64_t v39 = v23;
        uint64_t v40 = v25;
        uint64_t v41 = v24;
        uint64_t v42 = v27;
        uint64_t v43 = v26;
        uint64_t v44 = v29;
        uint64_t v45 = v28;
        uint64_t v46 = v31;
        uint64_t v47 = v30;
        sub_1000196DC(v16, v17);
        sub_1000196DC(v25, v24);
        sub_1000D0B9C(&v32);
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_1000CFE70()
{
  unint64_t result = qword_100144AC8;
  if (!qword_100144AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144AC8);
  }
  return result;
}

uint64_t sub_1000CFEC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005B18(&qword_100144AD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000CFF2C()
{
  unint64_t result = qword_100144AD8;
  if (!qword_100144AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144AD8);
  }
  return result;
}

uint64_t sub_1000CFF80@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v53 = a2;
  uint64_t v82 = sub_100005B18(&qword_100144B00);
  uint64_t v4 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  long long v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006650(a1, a1[3]);
  sub_1000CFE70();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100007188((uint64_t)a1);
  }
  uint64_t v51 = a1;
  uint64_t v52 = v4;
  uint64_t v7 = v53;
  LOBYTE(v64[0]) = 0;
  uint64_t v8 = v82;
  char v9 = v6;
  uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v12 = v11;
  LOBYTE(v64[0]) = 1;
  swift_bridgeObjectRetain();
  uint64_t v13 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v15 = v14;
  uint64_t v49 = v13;
  uint64_t v50 = v12;
  LOBYTE(v64[0]) = 2;
  swift_bridgeObjectRetain();
  uint64_t v16 = v15;
  uint64_t v17 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v48 = v16;
  LOBYTE(v64[0]) = 3;
  uint64_t v19 = v18;
  swift_bridgeObjectRetain();
  uint64_t v20 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v47 = v21;
  uint64_t v45 = v20;
  LOBYTE(v64[0]) = 4;
  swift_bridgeObjectRetain();
  uint64_t v46 = 0;
  uint64_t v44 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  LOBYTE(v64[0]) = 5;
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  LODWORD(v42) = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v43 = v17;
  uint64_t v24 = v10;
  uint64_t v25 = v23;
  char v75 = 6;
  sub_1000D0B48();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  int v36 = v42 & 1;
  (*(void (**)(char *, uint64_t))(v52 + 8))(v9, v8);
  uint64_t v82 = v76;
  uint64_t v46 = *((void *)&v77 + 1);
  uint64_t v52 = v77;
  uint64_t v41 = *((void *)&v78 + 1);
  uint64_t v42 = v78;
  uint64_t v39 = *((void *)&v79 + 1);
  uint64_t v40 = v79;
  uint64_t v37 = v24;
  uint64_t v38 = v80;
  uint64_t v26 = v50;
  *(void *)&long long v54 = v24;
  *((void *)&v54 + 1) = v50;
  uint64_t v28 = v47;
  uint64_t v27 = v48;
  *(void *)&long long v55 = v49;
  *((void *)&v55 + 1) = v48;
  *(void *)&long long v56 = v43;
  *((void *)&v56 + 1) = v19;
  *(void *)&long long v57 = v45;
  *((void *)&v57 + 1) = v47;
  *(void *)&long long v58 = v44;
  *((void *)&v58 + 1) = v25;
  uint64_t v29 = v25;
  LOBYTE(v25) = v36;
  LOBYTE(v59) = v36;
  *((void *)&v59 + 1) = v76;
  long long v60 = v77;
  long long v61 = v78;
  long long v62 = v79;
  uint64_t v63 = v80;
  sub_1000249B4((uint64_t)&v54);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100007188((uint64_t)v51);
  v64[0] = v37;
  v64[1] = v26;
  v64[2] = v49;
  v64[3] = v27;
  v64[4] = v43;
  v64[5] = v19;
  v64[6] = v45;
  v64[7] = v28;
  v64[8] = v44;
  v64[9] = v29;
  char v65 = v25;
  *(_DWORD *)uint64_t v66 = v81[0];
  *(_DWORD *)&v66[3] = *(_DWORD *)((char *)v81 + 3);
  uint64_t v67 = v82;
  uint64_t v68 = v52;
  uint64_t v69 = v46;
  uint64_t v70 = v42;
  uint64_t v71 = v41;
  uint64_t v72 = v40;
  uint64_t v73 = v39;
  uint64_t v74 = v38;
  uint64_t result = sub_10008AED0((uint64_t)v64);
  long long v31 = v61;
  *(_OWORD *)(v7 + 96) = v60;
  *(_OWORD *)(v7 + 112) = v31;
  *(_OWORD *)(v7 + 128) = v62;
  *(void *)(v7 + 144) = v63;
  long long v32 = v57;
  *(_OWORD *)(v7 + 32) = v56;
  *(_OWORD *)(v7 + 48) = v32;
  long long v33 = v59;
  *(_OWORD *)(v7 + 64) = v58;
  *(_OWORD *)(v7 + 80) = v33;
  long long v34 = v55;
  *(_OWORD *)uint64_t v7 = v54;
  *(_OWORD *)(v7 + 16) = v34;
  return result;
}

unint64_t sub_1000D05C8()
{
  unint64_t result = qword_100144AE0;
  if (!qword_100144AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144AE0);
  }
  return result;
}

ValueMetadata *type metadata accessor for Player()
{
  return &type metadata for Player;
}

unsigned char *storeEnumTagSinglePayload for Player.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x1000D06F8);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Player.CodingKeys()
{
  return &type metadata for Player.CodingKeys;
}

unint64_t sub_1000D0734()
{
  unint64_t result = qword_100144AE8;
  if (!qword_100144AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144AE8);
  }
  return result;
}

unint64_t sub_1000D078C()
{
  unint64_t result = qword_100144AF0;
  if (!qword_100144AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144AF0);
  }
  return result;
}

unint64_t sub_1000D07E4()
{
  unint64_t result = qword_100144AF8;
  if (!qword_100144AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144AF8);
  }
  return result;
}

uint64_t sub_1000D0838(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4449726579616C70 && a2 == 0xE800000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726174617661 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4E746361746E6F63 && a2 == 0xEB00000000656D61 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x48746361746E6F63 && a2 == 0xED0000656C646E61 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001000FE010 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x746E45786F626E69 && a2 == 0xEA00000000007972)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

unint64_t sub_1000D0B48()
{
  unint64_t result = qword_100144B08;
  if (!qword_100144B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144B08);
  }
  return result;
}

uint64_t *sub_1000D0B9C(uint64_t *a1)
{
  uint64_t v2 = a1[8];
  uint64_t v3 = a1[9];
  sub_100015C9C(*a1, a1[1]);
  sub_100015C9C(v2, v3);
  return a1;
}

unint64_t sub_1000D0C2C()
{
  sub_100005B18(&qword_100141030);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100110AF0;
  *(void *)(inited + 32) = 0x7463417974706D65;
  *(void *)(inited + 40) = 0xEB000000006E6F69;
  *(void *)(inited + 48) = type metadata accessor for EmptyAction();
  *(void *)(inited + 56) = &protocol witness table for EmptyAction;
  *(void *)(inited + 64) = 0x69746341776F6C66;
  *(void *)(inited + 72) = 0xEA00000000006E6FLL;
  uint64_t v1 = type metadata accessor for FlowAction();
  uint64_t v2 = sub_1000D30CC(&qword_1001446B0, (void (*)(uint64_t))type metadata accessor for FlowAction);
  *(void *)(inited + 80) = v1;
  *(void *)(inited + 88) = v2;
  strcpy((char *)(inited + 96), "flowBackAction");
  *(unsigned char *)(inited + 111) = -18;
  *(void *)(inited + 112) = type metadata accessor for Models.FlowBackAction();
  *(void *)(inited + 120) = &protocol witness table for Models.FlowBackAction;
  strcpy((char *)(inited + 128), "compoundAction");
  *(unsigned char *)(inited + 143) = -18;
  *(void *)(inited + 144) = type metadata accessor for CompoundAction();
  *(void *)(inited + 152) = &protocol witness table for CompoundAction;
  unint64_t result = sub_1000B9EC0(inited);
  qword_100144B10 = result;
  return result;
}

uint64_t sub_1000D0D78()
{
  sub_100005B18(&qword_100144B58);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10010F300;
  uint64_t v1 = type metadata accessor for LaunchDashboardAction();
  uint64_t result = sub_1000D30CC(&qword_100140B58, (void (*)(uint64_t))type metadata accessor for LaunchDashboardAction);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = result;
  off_100144B18 = (_UNKNOWN *)v0;
  return result;
}

uint64_t sub_1000D0E08()
{
  if (qword_10013FCC0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100144B10;
  uint64_t v1 = qword_10013FCC8;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = off_100144B18;
  uint64_t v3 = *((void *)off_100144B18 + 2);
  if (v3)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v4 = 0;
    uint64_t v5 = _swiftEmptyArrayStorage;
    do
    {
      long long v15 = v2[v4 + 2];
      long long v16 = v15;
      sub_100005B18(&qword_100144B50);
      uint64_t v6 = String.init<A>(describing:)();
      uint64_t v8 = v7;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v5 = sub_100036A04(0, v5[2] + 1, 1, v5);
      }
      unint64_t v10 = v5[2];
      unint64_t v9 = v5[3];
      if (v10 >= v9 >> 1) {
        uint64_t v5 = sub_100036A04((void *)(v9 > 1), v10 + 1, 1, v5);
      }
      ++v4;
      v5[2] = v10 + 1;
      uint64_t v11 = &v5[4 * v10];
      v11[4] = v6;
      v11[5] = v8;
      *((_OWORD *)v11 + 3) = v15;
    }
    while (v3 != v4);
    swift_bridgeObjectRelease_n();
    if (v5[2]) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v12 = _swiftEmptyDictionarySingleton;
    goto LABEL_16;
  }
  if (!_swiftEmptyArrayStorage[2]) {
    goto LABEL_15;
  }
LABEL_13:
  sub_100005B18(&qword_100142600);
  uint64_t v12 = (void *)static _DictionaryStorage.allocate(capacity:)();
LABEL_16:
  *(void *)&long long v16 = v12;
  uint64_t v13 = swift_bridgeObjectRetain();
  sub_1000D1FAC(v13, 1, &v16);
  swift_bridgeObjectRelease();
  uint64_t result = sub_1000D2340(v16, v0, (uint64_t)sub_1000D26F0, (void (*)(uint64_t, uint64_t, void, uint64_t, uint64_t *))sub_1000D1CB0);
  static ActionKinds.table = result;
  return result;
}

uint64_t *ActionKinds.table.unsafeMutableAddressor()
{
  if (qword_10013FCD0 != -1) {
    swift_once();
  }
  return &static ActionKinds.table;
}

uint64_t static ActionKinds.table.getter()
{
  if (qword_10013FCD0 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

unint64_t sub_1000D1114()
{
  unint64_t result = qword_100144B20;
  if (!qword_100144B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144B20);
  }
  return result;
}

unint64_t sub_1000D1168()
{
  if (qword_10013FCD0 != -1) {
    swift_once();
  }
  uint64_t v0 = static ActionKinds.table;
  swift_bridgeObjectRetain();
  uint64_t v1 = _defaultActionKindLookup.getter();
  uint64_t v2 = sub_1000D2340(v1, v0, (uint64_t)sub_1000D26F0, (void (*)(uint64_t, uint64_t, void, uint64_t, uint64_t *))sub_1000D26F4);
  unint64_t v3 = sub_1000D23D0(v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1000D1224@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1000D124C(a1, a2, a3);
}

ValueMetadata *type metadata accessor for ActionKinds()
{
  return &type metadata for ActionKinds;
}

uint64_t sub_1000D124C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v85 = a2;
  uint64_t v77 = a3;
  uint64_t v4 = type metadata accessor for JSONObject();
  __chkstk_darwin(v4 - 8);
  uint64_t v76 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = type metadata accessor for AnyActionTypes();
  uint64_t v75 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v72 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005B18(&qword_100144B28);
  __chkstk_darwin(v7 - 8);
  uint64_t v80 = (char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_100005B18(&qword_100144B30);
  uint64_t v73 = *(void *)(v78 - 8);
  uint64_t v9 = __chkstk_darwin(v78);
  uint64_t v11 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v69 - v12;
  uint64_t v14 = sub_100005B18(&qword_100144B38);
  uint64_t v82 = *(char **)(v14 - 8);
  uint64_t v83 = (char *)v14;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v74 = (char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v69 - v17;
  uint64_t v93 = type metadata accessor for JSONContext();
  uint64_t v86 = *(void *)(v93 - 8);
  uint64_t v19 = __chkstk_darwin(v93);
  uint64_t v21 = (char *)&v69 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v24 = (char *)&v69 - v23;
  uint64_t v25 = __chkstk_darwin(v22);
  *(void *)&long long v87 = (char *)&v69 - v26;
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v69 - v27;
  uint64_t v29 = sub_100091854(a1);
  if (v29)
  {
    uint64_t v32 = v29;
    uint64_t v80 = v30;
    uint64_t v81 = v31;
    long long v33 = v85;
    sub_100006650(v85, v85[3]);
    dispatch thunk of Decoder.userInfo.getter();
    JSONContext.init(userInfo:)();
    static JSONContext.Property<A>.actionKindTable.getter();
    sub_100005B18(&qword_100144B48);
    JSONContext.subscript.getter();
    long long v34 = v83;
    uint64_t v35 = (void (*)(char *, char *))*((void *)v82 + 1);
    v35(v18, v83);
    if (!v89)
    {
      unint64_t v36 = sub_1000D1C5C();
      uint64_t v89 = v79;
      unint64_t v90 = v36;
      uint64_t v37 = v74;
      static JSONContext.Property<A>.actionKindTable.getter();
      JSONContext.addingValue<A>(_:forProperty:)();
      v35(v37, v34);
      uint64_t v38 = v86;
      uint64_t v39 = v93;
      (*(void (**)(char *, uint64_t))(v86 + 8))(v28, v93);
      (*(void (**)(char *, void, uint64_t))(v38 + 32))(v28, v87, v39);
    }
    sub_100006650(v33, v33[3]);
    uint64_t v40 = v86;
    uint64_t v41 = v93;
    (*(void (**)(void, char *, uint64_t))(v86 + 16))(v87, v28, v93);
    Dictionary<>.init(jsonContext:)();
    Decoder.withUserInfo(_:)();
    swift_bridgeObjectRelease();
    *(void *)&long long v91 = v32;
    *((void *)&v91 + 1) = v80;
    uint64_t v92 = v81;
    sub_1000082EC(&v89);
    uint64_t v42 = v84;
    dispatch thunk of Decodable.init(from:)();
    if (v42)
    {
      (*(void (**)(char *, uint64_t))(v40 + 8))(v28, v41);
      return sub_10009193C((uint64_t)&v89);
    }
  }
  else
  {
    uint64_t v44 = (uint64_t)v80;
    uint64_t v82 = v11;
    uint64_t v74 = v21;
    uint64_t v83 = v24;
    uint64_t v45 = v81;
    uint64_t v46 = v85;
    uint64_t v47 = sub_100091854(a1);
    if (!v47)
    {
      uint64_t v60 = type metadata accessor for DecodingError();
      swift_allocError();
      long long v62 = v61;
      sub_100005B18(&qword_100140060);
      *long long v62 = a1;
      sub_100006650(v46, v46[3]);
      dispatch thunk of Decoder.codingPath.getter();
      uint64_t v89 = 0;
      unint64_t v90 = 0xE000000000000000;
      _StringGuts.grow(_:)(21);
      swift_bridgeObjectRelease();
      uint64_t v89 = 60;
      unint64_t v90 = 0xE100000000000000;
      v63._countAndFlagsBits = _typeName(_:qualified:)();
      String.append(_:)(v63);
      swift_bridgeObjectRelease();
      v64._object = (void *)0x80000001000FD660;
      v64._countAndFlagsBits = 0xD000000000000012;
      String.append(_:)(v64);
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v60 - 8) + 104))(v62, enum case for DecodingError.typeMismatch(_:), v60);
      return swift_willThrow();
    }
    uint64_t v69 = v48;
    uint64_t v70 = v49;
    uint64_t v71 = v47;
    sub_100006650(v46, v46[3]);
    dispatch thunk of Decoder.userInfo.getter();
    JSONContext.init(userInfo:)();
    static JSONContext.Property<A>.actionTypes.getter();
    JSONContext.subscript.getter();
    uint64_t v50 = *(void (**)(char *, uint64_t))(v73 + 8);
    v50(v13, v78);
    uint64_t v51 = v75;
    int v52 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v75 + 48))(v44, 1, v45);
    sub_1000D1BFC(v44);
    uint64_t v53 = v93;
    uint64_t v40 = v86;
    if (v52 == 1)
    {
      sub_1000D1C5C();
      long long v54 = v72;
      AnyActionTypes.init(_:)();
      long long v55 = v82;
      static JSONContext.Property<A>.actionTypes.getter();
      uint64_t v56 = v87;
      long long v57 = v83;
      JSONContext.addingValue<A>(_:forProperty:)();
      long long v58 = v55;
      uint64_t v53 = v93;
      v50(v58, v78);
      (*(void (**)(char *, uint64_t))(v51 + 8))(v54, v81);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v57, v53);
      (*(void (**)(char *, uint64_t, uint64_t))(v40 + 32))(v57, v56, v53);
    }
    sub_10003D160((uint64_t)v46, (uint64_t)v88);
    uint64_t v59 = v84;
    JSONObject.init(from:)();
    if (v59) {
      return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v83, v53);
    }
    uint64_t v28 = v83;
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v74, v83, v53);
    *(void *)&long long v91 = v71;
    *((void *)&v91 + 1) = v69;
    uint64_t v41 = v53;
    uint64_t v92 = v70;
    sub_1000082EC(&v89);
    dispatch thunk of ExpressibleByJSON.init(deserializing:using:)();
  }
  long long v87 = v91;
  uint64_t v65 = v91;
  uint64_t v66 = sub_100006650(&v89, v91);
  uint64_t v67 = (uint64_t *)v77;
  *(_OWORD *)(v77 + 24) = v87;
  uint64_t v68 = sub_1000082EC(v67);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v65 - 8) + 16))(v68, v66, v65);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v28, v41);
  return sub_100007188((uint64_t)&v89);
}

uint64_t sub_1000D1BFC(uint64_t a1)
{
  uint64_t v2 = sub_100005B18(&qword_100144B28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000D1C5C()
{
  unint64_t result = qword_100144B40;
  if (!qword_100144B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144B40);
  }
  return result;
}

uint64_t sub_1000D1CB0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_100094944();
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = v9;
  uint64_t v14 = v10;
  uint64_t v15 = (void *)*a5;
  unint64_t v17 = sub_1000DC324(v7, v8);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v21 = v16;
  if (v15[3] >= v20)
  {
    if (a4)
    {
      uint64_t v24 = (void *)*a5;
      if (v16) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_1000705E8();
      uint64_t v24 = (void *)*a5;
      if (v21) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v24[(v17 >> 6) + 8] |= 1 << v17;
    uint64_t v26 = (uint64_t *)(v24[6] + 16 * v17);
    uint64_t *v26 = v11;
    v26[1] = v12;
    uint64_t v27 = (void *)(v24[7] + 16 * v17);
    void *v27 = v13;
    v27[1] = v14;
    uint64_t v28 = v24[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v24[2] = v30;
LABEL_13:
    uint64_t v31 = sub_100094944();
    if (v32)
    {
      uint64_t v35 = v31;
      uint64_t v36 = v32;
      uint64_t v37 = v33;
      uint64_t v38 = v34;
      do
      {
        uint64_t v43 = (void *)*a5;
        unint64_t v45 = sub_1000DC324(v35, v36);
        uint64_t v46 = v43[2];
        BOOL v47 = (v44 & 1) == 0;
        uint64_t v48 = v46 + v47;
        if (__OFADD__(v46, v47)) {
          goto LABEL_25;
        }
        char v49 = v44;
        if (v43[3] < v48)
        {
          sub_10006EFE0(v48, 1);
          unint64_t v50 = sub_1000DC324(v35, v36);
          if ((v49 & 1) != (v51 & 1)) {
            goto LABEL_27;
          }
          unint64_t v45 = v50;
        }
        int v52 = (void *)*a5;
        if (v49)
        {
          swift_bridgeObjectRelease();
          uint64_t v39 = (void *)(v52[7] + 16 * v45);
          *uint64_t v39 = v37;
          v39[1] = v38;
        }
        else
        {
          v52[(v45 >> 6) + 8] |= 1 << v45;
          uint64_t v53 = (uint64_t *)(v52[6] + 16 * v45);
          uint64_t *v53 = v35;
          v53[1] = v36;
          long long v54 = (void *)(v52[7] + 16 * v45);
          *long long v54 = v37;
          v54[1] = v38;
          uint64_t v55 = v52[2];
          BOOL v29 = __OFADD__(v55, 1);
          uint64_t v56 = v55 + 1;
          if (v29) {
            goto LABEL_26;
          }
          v52[2] = v56;
        }
        uint64_t v35 = sub_100094944();
        uint64_t v36 = v40;
        uint64_t v37 = v41;
        uint64_t v38 = v42;
      }
      while (v40);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_100092098();
    return swift_release();
  }
  sub_10006EFE0(v20, a4 & 1);
  unint64_t v22 = sub_1000DC324(v11, v12);
  if ((v21 & 1) == (v23 & 1))
  {
    unint64_t v17 = v22;
    uint64_t v24 = (void *)*a5;
    if ((v21 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v25 = (void *)(v24[7] + 16 * v17);
    void *v25 = v13;
    v25[1] = v14;
    goto LABEL_13;
  }
LABEL_27:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_1000D1FAC(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  long long v42 = *(_OWORD *)(a1 + 48);
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_1000DC324(v8, v7);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_1000705E8();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    BOOL v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v20 = (uint64_t *)(v19[6] + 16 * v11);
    *uint64_t v20 = v8;
    v20[1] = v7;
    *(_OWORD *)(v19[7] + 16 * v11) = v42;
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v23;
    uint64_t v24 = v4 - 1;
    if (v4 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (uint64_t i = (_OWORD *)(a1 + 80); ; i += 2)
    {
      uint64_t v27 = *((void *)i - 2);
      uint64_t v26 = *((void *)i - 1);
      long long v43 = *i;
      uint64_t v28 = (void *)*a3;
      swift_bridgeObjectRetain();
      unint64_t v29 = sub_1000DC324(v27, v26);
      uint64_t v31 = v28[2];
      BOOL v32 = (v30 & 1) == 0;
      BOOL v22 = __OFADD__(v31, v32);
      uint64_t v33 = v31 + v32;
      if (v22) {
        break;
      }
      char v34 = v30;
      if (v28[3] < v33)
      {
        sub_10006EFE0(v33, 1);
        unint64_t v29 = sub_1000DC324(v27, v26);
        if ((v34 & 1) != (v35 & 1)) {
          goto LABEL_25;
        }
      }
      if (v34) {
        goto LABEL_10;
      }
      uint64_t v36 = (void *)*a3;
      *(void *)(*a3 + 8 * (v29 >> 6) + 64) |= 1 << v29;
      uint64_t v37 = (uint64_t *)(v36[6] + 16 * v29);
      *uint64_t v37 = v27;
      v37[1] = v26;
      *(_OWORD *)(v36[7] + 16 * v29) = v43;
      uint64_t v38 = v36[2];
      BOOL v22 = __OFADD__(v38, 1);
      uint64_t v39 = v38 + 1;
      if (v22) {
        goto LABEL_24;
      }
      v36[2] = v39;
      if (!--v24) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_10006EFE0(v14, a2 & 1);
  unint64_t v16 = sub_1000DC324(v8, v7);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    swift_allocError();
    swift_willThrow();
    swift_errorRetain();
    sub_100005B18(&qword_100142A90);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return swift_errorRelease();
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
LABEL_26:
  _StringGuts.grow(_:)(30);
  v40._object = (void *)0x80000001000FD6C0;
  v40._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v40);
  _print_unlocked<A, B>(_:_:)();
  v41._countAndFlagsBits = 39;
  v41._object = (void *)0xE100000000000000;
  String.append(_:)(v41);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000D2340(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, void, uint64_t, uint64_t *))
{
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = a2;
  a4(a1, a3, 0, isUniquelyReferenced_nonNull_native, &v12);
  uint64_t v10 = v12;
  swift_bridgeObjectRelease();
  if (v4) {
    swift_bridgeObjectRelease();
  }
  return v10;
}

unint64_t sub_1000D23D0(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100005B18(&qword_100143260);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = _swiftEmptyDictionarySingleton;
  }
  uint64_t v31 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v30 = (unint64_t)(63 - v3) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v8 = &qword_100144B50;
  uint64_t v9 = (uint64_t *)&unk_100143270;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v17 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_36;
  }
  if (v17 >= v30) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v31 + 8 * v17);
  int64_t v19 = i + 1;
  if (!v18)
  {
    int64_t v19 = i + 2;
    if (i + 2 >= v30) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v31 + 8 * v19);
    if (!v18)
    {
      int64_t v19 = i + 3;
      if (i + 3 >= v30) {
        goto LABEL_33;
      }
      unint64_t v18 = *(void *)(v31 + 8 * v19);
      if (!v18)
      {
        int64_t v19 = i + 4;
        if (i + 4 >= v30) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v31 + 8 * v19);
        if (!v18)
        {
          int64_t v19 = i + 5;
          if (i + 5 >= v30) {
            goto LABEL_33;
          }
          unint64_t v18 = *(void *)(v31 + 8 * v19);
          if (!v18)
          {
            int64_t v19 = i + 6;
            if (i + 6 >= v30) {
              goto LABEL_33;
            }
            unint64_t v18 = *(void *)(v31 + 8 * v19);
            int64_t v20 = i + 6;
            if (!v18)
            {
              while (1)
              {
                int64_t v19 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_37;
                }
                if (v19 >= v30) {
                  break;
                }
                unint64_t v18 = *(void *)(v31 + 8 * v19);
                ++v20;
                if (v18) {
                  goto LABEL_27;
                }
              }
LABEL_33:
              sub_100092098();
              return (unint64_t)v2;
            }
          }
        }
      }
    }
  }
LABEL_27:
  unint64_t v5 = (v18 - 1) & v18;
  unint64_t v16 = __clz(__rbit64(v18)) + (v19 << 6);
  for (i = v19; ; unint64_t v16 = v15 | (i << 6))
  {
    uint64_t v21 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v16);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    swift_bridgeObjectRetain();
    sub_100005B18(v8);
    sub_100005B18(v9);
    swift_dynamicCast();
    unint64_t result = sub_1000F708C(v23, v22);
    unint64_t v24 = result;
    if (v25)
    {
      unint64_t v32 = v5;
      uint64_t v10 = v1;
      int64_t v11 = i;
      uint64_t v12 = v9;
      BOOL v13 = v8;
      uint64_t v14 = (uint64_t *)(v2[6] + 16 * result);
      unint64_t result = swift_bridgeObjectRelease();
      *uint64_t v14 = v23;
      v14[1] = v22;
      uint64_t v8 = v13;
      uint64_t v9 = v12;
      int64_t i = v11;
      uint64_t v1 = v10;
      unint64_t v5 = v32;
      *(void *)(v2[7] + 8 * v24) = v33;
      if (!v32) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v26 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v26 = v23;
    v26[1] = v22;
    *(void *)(v2[7] + 8 * result) = v33;
    uint64_t v27 = v2[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_35;
    }
    v2[2] = v29;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v15 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000D26F4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_1000D2A10();
  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = v10;
  uint64_t v55 = v9;
  uint64_t v14 = (void *)*a5;
  unint64_t v16 = sub_1000F708C(v7, v8);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  char v20 = v15;
  if (v14[3] >= v19)
  {
    if (a4)
    {
      uint64_t v23 = (void *)*a5;
      if (v15) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_1000D2BC8();
      uint64_t v23 = (void *)*a5;
      if (v20) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v23[(v16 >> 6) + 8] |= 1 << v16;
    unint64_t v24 = (uint64_t *)(v23[6] + 16 * v16);
    *unint64_t v24 = v11;
    v24[1] = v12;
    char v25 = (void *)(v23[7] + 16 * v16);
    void *v25 = v55;
    v25[1] = v13;
    uint64_t v26 = v23[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    void v23[2] = v28;
LABEL_13:
    uint64_t v29 = sub_1000D2A10();
    if (v30)
    {
      uint64_t v33 = v29;
      uint64_t v34 = v30;
      uint64_t v35 = v31;
      uint64_t v36 = v32;
      do
      {
        Swift::String v41 = (void *)*a5;
        unint64_t v42 = sub_1000F708C(v33, v34);
        uint64_t v44 = v41[2];
        BOOL v45 = (v43 & 1) == 0;
        BOOL v27 = __OFADD__(v44, v45);
        uint64_t v46 = v44 + v45;
        if (v27) {
          goto LABEL_24;
        }
        char v47 = v43;
        if (v41[3] < v46)
        {
          sub_1000D2D84(v46, 1);
          unint64_t v42 = sub_1000F708C(v33, v34);
          if ((v47 & 1) != (v48 & 1)) {
            goto LABEL_26;
          }
        }
        char v49 = (void *)*a5;
        if (v47)
        {
          uint64_t v37 = 16 * v42;
          long long v57 = *(_OWORD *)(v49[7] + 16 * v42);
          swift_bridgeObjectRelease();
          *(_OWORD *)(v49[7] + v37) = v57;
        }
        else
        {
          v49[(v42 >> 6) + 8] |= 1 << v42;
          unint64_t v50 = (uint64_t *)(v49[6] + 16 * v42);
          *unint64_t v50 = v33;
          v50[1] = v34;
          char v51 = (void *)(v49[7] + 16 * v42);
          void *v51 = v35;
          v51[1] = v36;
          uint64_t v52 = v49[2];
          BOOL v27 = __OFADD__(v52, 1);
          uint64_t v53 = v52 + 1;
          if (v27) {
            goto LABEL_25;
          }
          v49[2] = v53;
        }
        uint64_t v33 = sub_1000D2A10();
        uint64_t v34 = v38;
        uint64_t v35 = v39;
        uint64_t v36 = v40;
      }
      while (v38);
    }
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    sub_100092098();
    return swift_release();
  }
  sub_1000D2D84(v19, a4 & 1);
  unint64_t v21 = sub_1000F708C(v11, v12);
  if ((v20 & 1) == (v22 & 1))
  {
    unint64_t v16 = v21;
    uint64_t v23 = (void *)*a5;
    if ((v20 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    long long v56 = *(_OWORD *)(v23[7] + 16 * v16);
    swift_bridgeObjectRelease();
    *(_OWORD *)(v23[7] + 16 * v16) = v56;
    goto LABEL_13;
  }
LABEL_26:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_1000D2A10()
{
  void (*v13)(uint64_t *__return_ptr, void *);
  long long v14;
  uint64_t result;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  void v24[2];
  long long v25;

  uint64_t v2 = *v1;
  int64_t v4 = v1[3];
  unint64_t v3 = v1[4];
  int64_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = (v3 - 1) & v3;
    unint64_t v7 = __clz(__rbit64(v3)) | (v4 << 6);
LABEL_3:
    uint64_t v8 = 16 * v7;
    uint64_t v10 = *(void *)(v2 + 48);
    uint64_t v9 = *(void *)(v2 + 56);
    uint64_t v11 = (void *)(v10 + v8);
    uint64_t v12 = v11[1];
    uint64_t v13 = (void (*)(uint64_t *__return_ptr, void *))v1[5];
    v24[0] = *v11;
    v24[1] = v12;
    uint64_t v14 = *(_OWORD *)(v9 + v8);
    v1[3] = v5;
    v1[4] = v6;
    char v25 = v14;
    swift_bridgeObjectRetain();
    v13(&v23, v24);
    swift_bridgeObjectRelease();
    return v23;
  }
  unint64_t v16 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
LABEL_25:
    uint64_t v1 = v0;
    goto LABEL_26;
  }
  uint64_t v17 = (unint64_t)(v1[2] + 64) >> 6;
  if (v16 < v17)
  {
    BOOL v18 = v1[1];
    uint64_t v19 = *(void *)(v18 + 8 * v16);
    if (v19)
    {
LABEL_7:
      uint64_t v6 = (v19 - 1) & v19;
      unint64_t v7 = __clz(__rbit64(v19)) + (v16 << 6);
      int64_t v5 = v16;
      goto LABEL_3;
    }
    char v20 = v4 + 2;
    int64_t v5 = v4 + 1;
    if (v4 + 2 < v17)
    {
      uint64_t v19 = *(void *)(v18 + 8 * v20);
      if (v19)
      {
LABEL_10:
        unint64_t v16 = v20;
        goto LABEL_7;
      }
      unint64_t v21 = v4 + 3;
      int64_t v5 = v4 + 2;
      if (v4 + 3 < v17)
      {
        uint64_t v19 = *(void *)(v18 + 8 * v21);
        if (v19)
        {
LABEL_13:
          unint64_t v16 = v21;
          goto LABEL_7;
        }
        char v20 = v4 + 4;
        int64_t v5 = v4 + 3;
        if (v4 + 4 < v17)
        {
          uint64_t v19 = *(void *)(v18 + 8 * v20);
          if (v19) {
            goto LABEL_10;
          }
          unint64_t v21 = v4 + 5;
          int64_t v5 = v4 + 4;
          if (v4 + 5 < v17)
          {
            uint64_t v19 = *(void *)(v18 + 8 * v21);
            if (v19) {
              goto LABEL_13;
            }
            unint64_t v16 = v4 + 6;
            int64_t v5 = v4 + 5;
            if (v4 + 6 < v17)
            {
              uint64_t v19 = *(void *)(v18 + 8 * v16);
              if (v19) {
                goto LABEL_7;
              }
              uint64_t v0 = v1;
              int64_t v5 = v17 - 1;
              char v22 = v4 + 7;
              while (v17 != v22)
              {
                uint64_t v19 = *(void *)(v18 + 8 * v22++);
                if (v19)
                {
                  unint64_t v16 = v22 - 1;
                  goto LABEL_7;
                }
              }
              goto LABEL_25;
            }
          }
        }
      }
    }
  }
LABEL_26:
  uint64_t result = 0;
  v1[3] = v5;
  v1[4] = 0;
  return result;
}

void *sub_1000D2BC8()
{
  uint64_t v1 = v0;
  sub_100005B18(&qword_100142600);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_27:
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
      goto LABEL_29;
    }
    if (v22 >= v13) {
      goto LABEL_27;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_27;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23)
      {
        int64_t v9 = v22 + 2;
        if (v22 + 2 >= v13) {
          goto LABEL_27;
        }
        unint64_t v23 = *(void *)(v6 + 8 * v9);
        if (!v23)
        {
          int64_t v9 = v22 + 3;
          if (v22 + 3 >= v13) {
            goto LABEL_27;
          }
          unint64_t v23 = *(void *)(v6 + 8 * v9);
          int64_t v24 = v22 + 3;
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_26:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_27;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_26;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1000D2D84(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005B18(&qword_100142600);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v35) {
          goto LABEL_34;
        }
        unint64_t v23 = v34[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v35) {
            goto LABEL_34;
          }
          unint64_t v23 = v34[v13];
          if (!v23)
          {
            int64_t v13 = v22 + 2;
            if (v22 + 2 >= v35) {
              goto LABEL_34;
            }
            unint64_t v23 = v34[v13];
            if (!v23)
            {
              int64_t v13 = v22 + 3;
              if (v22 + 3 >= v35)
              {
LABEL_34:
                swift_release();
                uint64_t v3 = v2;
                if (a2)
                {
                  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
                  if (v33 >= 64) {
                    bzero(v34, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                  }
                  else {
                    *uint64_t v34 = -1 << v33;
                  }
                  *(void *)(v5 + 16) = 0;
                }
                break;
              }
              unint64_t v23 = v34[v13];
              for (int64_t i = v22 + 3; !v23; ++i)
              {
                int64_t v13 = i + 1;
                if (__OFADD__(i, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v35) {
                  goto LABEL_34;
                }
                unint64_t v23 = v34[v13];
              }
            }
          }
        }
        unint64_t v10 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v25 = 16 * v21;
      uint64_t v26 = (uint64_t *)(*(void *)(v5 + 48) + v25);
      uint64_t v28 = *v26;
      uint64_t v27 = v26[1];
      long long v36 = *(_OWORD *)(*(void *)(v5 + 56) + v25);
      if ((a2 & 1) == 0) {
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
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v31 = v16 == v30;
          if (v16 == v30) {
            unint64_t v16 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v11 + 8 * v16);
        }
        while (v32 == -1);
        unint64_t v17 = __clz(__rbit64(~v32)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 16 * v17;
      uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
      *uint64_t v19 = v28;
      v19[1] = v27;
      *(_OWORD *)(*(void *)(v7 + 56) + v18) = v36;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000D30AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)a2 = *(void *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  *(void *)(a2 + 24) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000D30CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_1000D3114(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = type metadata accessor for MediaArtwork();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_100005B18(&qword_100142B48);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = *(int *)(a3 + 24);
    int64_t v13 = *(void **)((char *)a2 + v11);
    *(uint64_t *)((char *)a1 + v11) = (uint64_t)v13;
    *((unsigned char *)a1 + v12) = *((unsigned char *)a2 + v12);
    id v14 = v13;
  }
  return a1;
}

void sub_1000D3298(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MediaArtwork();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 20));
}

char *sub_1000D3364(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MediaArtwork();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100005B18(&qword_100142B48);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = *(void **)&a2[v9];
  *(void *)&a1[v9] = v11;
  a1[v10] = a2[v10];
  id v12 = v11;
  return a1;
}

char *sub_1000D3498(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MediaArtwork();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_100005B18(&qword_100142B48);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  int64_t v13 = *(void **)&a1[v12];
  id v14 = *(void **)&a2[v12];
  *(void *)&a1[v12] = v14;
  id v15 = v14;

  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

char *sub_1000D363C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MediaArtwork();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100005B18(&qword_100142B48);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  a1[v9] = a2[v9];
  return a1;
}

char *sub_1000D376C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MediaArtwork();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_100005B18(&qword_100142B48);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  int64_t v13 = *(void **)&a1[v12];
  *(void *)&a1[v12] = *(void *)&a2[v12];

  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_1000D390C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000D3920);
}

uint64_t sub_1000D3920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005B18(&qword_100142B48);
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
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_1000D39F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000D3A04);
}

uint64_t sub_1000D3A04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100005B18(&qword_100142B48);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t type metadata accessor for PlayerAvatarView()
{
  uint64_t result = qword_100144BB8;
  if (!qword_100144BB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000D3B10()
{
  sub_1000D3BB0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000D3BB0()
{
  if (!qword_100144BC8)
  {
    type metadata accessor for MediaArtwork();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100144BC8);
    }
  }
}

uint64_t sub_1000D3C08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000D3C24@<X0>(void (*a1)(char *, uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100005B18(&qword_100144C00);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000D3D3C(a1, (uint64_t)v8);
  uint64_t v9 = static Alignment.bottomTrailing.getter();
  uint64_t v11 = v10;
  sub_1000D44A0(a2, v19);
  sub_1000170C8((uint64_t)v8, a3, &qword_100144C00);
  uint64_t v12 = a3 + *(int *)(sub_100005B18(&qword_100144C08) + 36);
  long long v13 = v19[7];
  *(_OWORD *)(v12 + 96) = v19[6];
  *(_OWORD *)(v12 + 112) = v13;
  long long v14 = v19[9];
  *(_OWORD *)(v12 + 128) = v19[8];
  *(_OWORD *)(v12 + 144) = v14;
  long long v15 = v19[3];
  *(_OWORD *)(v12 + 32) = v19[2];
  *(_OWORD *)(v12 + 48) = v15;
  long long v16 = v19[5];
  *(_OWORD *)(v12 + 64) = v19[4];
  *(_OWORD *)(v12 + 80) = v16;
  long long v17 = v19[1];
  *(_OWORD *)uint64_t v12 = v19[0];
  *(_OWORD *)(v12 + 16) = v17;
  *(void *)(v12 + 160) = v9;
  *(void *)(v12 + 168) = v11;
  return sub_100017388((uint64_t)v8, &qword_100144C00);
}

uint64_t sub_1000D3D3C@<X0>(void (*a1)(char *, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  char v43 = a1;
  uint64_t v51 = a2;
  uint64_t v3 = type metadata accessor for Image.ResizingMode();
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100005B18(&qword_100144C90);
  __chkstk_darwin(v50);
  uint64_t v49 = (uint64_t)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_100005B18(&qword_100144C98);
  __chkstk_darwin(v47);
  char v48 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100005B18(&qword_100144CA0);
  __chkstk_darwin(v52);
  uint64_t v46 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005B18(&qword_100144CA8);
  uint64_t v45 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v44 = (char *)&v41 - v13;
  uint64_t v14 = sub_100005B18(&qword_100142B48);
  __chkstk_darwin(v14 - 8);
  long long v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for MediaArtwork();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  unint64_t v21 = (char *)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  unint64_t v23 = (char *)&v41 - v22;
  sub_1000170C8(v2, (uint64_t)v16, &qword_100142B48);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    int64_t v24 = v48;
    uint64_t v45 = v9;
    uint64_t v25 = v49;
    sub_100017388((uint64_t)v16, &qword_100142B48);
    uint64_t v26 = *(void **)(v2 + *(int *)(type metadata accessor for PlayerAvatarView() + 20));
    if (v26)
    {
      id v27 = v26;
      Image.init(uiImage:)();
      uint64_t v28 = v41;
      uint64_t v29 = v42;
      (*(void (**)(char *, void, uint64_t))(v41 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v42);
      uint64_t v30 = Image.resizable(capInsets:resizingMode:)();
      swift_release();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v29);
      *(void *)int64_t v24 = v30;
      *((void *)v24 + 1) = 0;
      *((_WORD *)v24 + 8) = 1;
      swift_storeEnumTagMultiPayload();
      swift_retain();
      sub_100005B18(&qword_100144CC8);
      unint64_t v31 = sub_1000D5C1C();
      unint64_t v32 = sub_1000D5C74();
      uint64_t v53 = v17;
      long long v54 = &type metadata for PlayerAvatarMediaArtworkStyle;
      unint64_t v55 = v31;
      unint64_t v56 = v32;
      swift_getOpaqueTypeConformance2();
      sub_1000D5CC8();
      uint64_t v33 = (uint64_t)v46;
      _ConditionalContent<>.init(storage:)();
      sub_1000170C8(v33, v25, &qword_100144CA0);
      swift_storeEnumTagMultiPayload();
      sub_1000D5B54();
      _ConditionalContent<>.init(storage:)();

      sub_100017388(v33, &qword_100144CA0);
      return swift_release();
    }
    else
    {
      swift_storeEnumTagMultiPayload();
      sub_1000D5B54();
      return _ConditionalContent<>.init(storage:)();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v23, v16, v17);
    GeometryProxy.size.getter();
    GeometryProxy.size.getter();
    id v35 = AMSMediaArtworkCropStyleBoundedBox;
    MediaArtwork.resize(_:croppedTo:)();

    unint64_t v36 = sub_1000D5C1C();
    unint64_t v37 = sub_1000D5C74();
    View.mediaArtworkStyle<A>(_:)();
    char v43 = *(void (**)(char *, uint64_t))(v18 + 8);
    v43(v21, v17);
    uint64_t v39 = v44;
    uint64_t v38 = v45;
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v44, v12, v9);
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v48, v39, v9);
    swift_storeEnumTagMultiPayload();
    sub_100005B18(&qword_100144CC8);
    uint64_t v53 = v17;
    long long v54 = &type metadata for PlayerAvatarMediaArtworkStyle;
    unint64_t v55 = v36;
    unint64_t v56 = v37;
    swift_getOpaqueTypeConformance2();
    sub_1000D5CC8();
    uint64_t v40 = (uint64_t)v46;
    _ConditionalContent<>.init(storage:)();
    sub_1000170C8(v40, v49, &qword_100144CA0);
    swift_storeEnumTagMultiPayload();
    sub_1000D5B54();
    _ConditionalContent<>.init(storage:)();
    sub_100017388(v40, &qword_100144CA0);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v9);
    return ((uint64_t (*)(char *, uint64_t))v43)(v23, v17);
  }
}

double sub_1000D44A0@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  int v3 = *(unsigned __int8 *)(a1 + *(int *)(type metadata accessor for PlayerAvatarView() + 24));
  if (v3 == 2)
  {
    sub_1000D4E4C((uint64_t)&v55);
    sub_100024A74((uint64_t)&v55, (uint64_t)v53, &qword_100144C10);
    sub_100005B18(&qword_100144C18);
    sub_1000D4E58();
    _ConditionalContent<>.init(storage:)();
  }
  else
  {
    if (v3)
    {
      GeometryProxy.size.getter();
      uint64_t v5 = Image.init(systemName:)();
      uint64_t v25 = static Font.title.getter();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v7 = static Color.red.getter();
      uint64_t v8 = swift_getKeyPath();
      char v24 = static Edge.Set.all.getter();
      EdgeInsets.init(_all:)();
      uint64_t v10 = v9;
      uint64_t v12 = v11;
      uint64_t v14 = v13;
      uint64_t v16 = v15;
      uint64_t v17 = static Color.white.getter();
      char v18 = static Edge.Set.all.getter();
      static Alignment.center.getter();
      _FrameLayout.init(width:height:alignment:)();
      uint64_t v35 = v5;
      uint64_t v36 = KeyPath;
      uint64_t v37 = v25;
      uint64_t v38 = v8;
      uint64_t v39 = v7;
      LOBYTE(v40) = v24;
      *((void *)&v40 + 1) = v10;
      uint64_t v41 = v12;
      uint64_t v42 = v14;
      uint64_t v43 = v16;
      char v44 = 0;
      uint64_t v45 = v17;
      char v46 = v18;
      __int16 v47 = 256;
      uint64_t v48 = v64;
      char v49 = v65;
      uint64_t v50 = v66;
      char v51 = v67;
      long long v52 = v68;
      sub_1000D5B38((uint64_t)&v35);
      sub_100024A74((uint64_t)&v35, (uint64_t)&v69, &qword_100144C88);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_100005B18(&qword_100141370);
      sub_100005B18(&qword_100144C30);
      sub_1000D5D80((unint64_t *)&qword_100141368, &qword_100141370);
      sub_1000D508C(&qword_100144C28, &qword_100144C30, (void (*)(void))sub_1000D4F20);
      _ConditionalContent<>.init(storage:)();
      long long v61 = v32;
      long long v62 = v33;
      v63[0] = *(_OWORD *)v34;
      *(_OWORD *)((char *)v63 + 9) = *(_OWORD *)&v34[9];
      long long v57 = v28;
      long long v58 = v29;
      long long v59 = v30;
      long long v60 = v31;
      long long v55 = v26;
      long long v56 = v27;
      sub_1000D5B44((uint64_t)&v55);
      sub_100024A74((uint64_t)&v55, (uint64_t)&v69, &qword_100144C10);
      sub_100005B18(&qword_100144C18);
      sub_1000D4E58();
      _ConditionalContent<>.init(storage:)();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      GeometryProxy.size.getter();
      uint64_t v4 = Image.init(_:bundle:)();
      static Alignment.center.getter();
      _FrameLayout.init(width:height:alignment:)();
      uint64_t v35 = v4;
      uint64_t v36 = v64;
      LOBYTE(v37) = v65;
      uint64_t v38 = v66;
      LOBYTE(v39) = v67;
      long long v40 = v68;
      sub_1000D5B4C((uint64_t)&v35);
      sub_100024A74((uint64_t)&v35, (uint64_t)&v69, &qword_100144C88);
      swift_retain();
      sub_100005B18(&qword_100141370);
      sub_100005B18(&qword_100144C30);
      sub_1000D5D80((unint64_t *)&qword_100141368, &qword_100141370);
      sub_1000D508C(&qword_100144C28, &qword_100144C30, (void (*)(void))sub_1000D4F20);
      _ConditionalContent<>.init(storage:)();
      long long v61 = v32;
      long long v62 = v33;
      v63[0] = *(_OWORD *)v34;
      *(_OWORD *)((char *)v63 + 9) = *(_OWORD *)&v34[9];
      long long v57 = v28;
      long long v58 = v29;
      long long v59 = v30;
      long long v60 = v31;
      long long v55 = v26;
      long long v56 = v27;
      sub_1000D5B44((uint64_t)&v55);
      sub_100024A74((uint64_t)&v55, (uint64_t)&v69, &qword_100144C10);
      sub_100005B18(&qword_100144C18);
      sub_1000D4E58();
      _ConditionalContent<>.init(storage:)();
    }
    swift_release();
    long long v75 = v53[6];
    long long v76 = v53[7];
    v77[0] = v54[0];
    *(_OWORD *)((char *)v77 + 10) = *(_OWORD *)((char *)v54 + 10);
    long long v71 = v53[2];
    long long v72 = v53[3];
    long long v73 = v53[4];
    long long v74 = v53[5];
    long long v69 = v53[0];
    long long v70 = v53[1];
  }
  long long v19 = v76;
  a2[6] = v75;
  a2[7] = v19;
  a2[8] = v77[0];
  *(_OWORD *)((char *)a2 + 138) = *(_OWORD *)((char *)v77 + 10);
  long long v20 = v72;
  a2[2] = v71;
  a2[3] = v20;
  long long v21 = v74;
  a2[4] = v73;
  a2[5] = v21;
  double result = *(double *)&v69;
  long long v23 = v70;
  *a2 = v69;
  a2[1] = v23;
  return result;
}

uint64_t sub_1000D4AD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_1000D4BCC(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_1000D4D68((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *(void *)a2 = sub_1000D4DCC;
  *(void *)(a2 + 8) = v7;
  *(void *)(a2 + 16) = 0x3FF0000000000000;
  *(_WORD *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_1000D4BCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PlayerAvatarView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000D4C30()
{
  uint64_t v1 = type metadata accessor for PlayerAvatarView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = type metadata accessor for MediaArtwork();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000D4D68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PlayerAvatarView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000D4DCC@<X0>(void (*a1)(char *, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for PlayerAvatarView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000D3C24(a1, v6, a2);
}

uint64_t sub_1000D4E4C(uint64_t result)
{
  *(unsigned char *)(result + 153) = 1;
  return result;
}

unint64_t sub_1000D4E58()
{
  unint64_t result = qword_100144C20;
  if (!qword_100144C20)
  {
    sub_10000B448(&qword_100144C18);
    sub_1000D5D80((unint64_t *)&qword_100141368, &qword_100141370);
    sub_1000D508C(&qword_100144C28, &qword_100144C30, (void (*)(void))sub_1000D4F20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144C20);
  }
  return result;
}

unint64_t sub_1000D4F20()
{
  unint64_t result = qword_100144C38;
  if (!qword_100144C38)
  {
    sub_10000B448(&qword_100144C40);
    sub_1000D4FC0();
    sub_10001758C(&qword_1001438B8, &qword_1001438C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144C38);
  }
  return result;
}

unint64_t sub_1000D4FC0()
{
  unint64_t result = qword_100144C48;
  if (!qword_100144C48)
  {
    sub_10000B448(&qword_100144C50);
    sub_1000D508C(&qword_100144C58, &qword_100144C60, (void (*)(void))sub_1000D5108);
    sub_10001758C(&qword_100143B90, &qword_100143B98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144C48);
  }
  return result;
}

uint64_t sub_1000D508C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B448(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000D5108()
{
  unint64_t result = qword_100144C68;
  if (!qword_100144C68)
  {
    sub_10000B448(&qword_100144C70);
    sub_100026028();
    sub_10001758C(&qword_100144C78, &qword_100144C80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144C68);
  }
  return result;
}

uint64_t sub_1000D51A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Image.ResizingMode();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MediaArtworkStyleConfiguration.image.getter())
  {
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v2);
    uint64_t v6 = Image.resizable(capInsets:resizingMode:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    long long v16 = (unint64_t)v6;
    LOWORD(v17) = 1;
    BYTE2(v17) = 0;
    swift_retain();
    sub_100005B18(&qword_100144CC8);
    sub_100005B18(&qword_100144D28);
    sub_1000D5CC8();
    sub_1000D6158();
    _ConditionalContent<>.init(storage:)();
    long long v7 = v18;
    char v8 = v20;
    uint64_t v9 = v19;
    long long v16 = v18;
    HIWORD(v17) = v20 != 0;
    LOWORD(v17) = v19;
    sub_1000D62EC(v18, *((uint64_t *)&v18 + 1), v19, v20);
    sub_100005B18(&qword_100144D08);
    sub_100005B18(&qword_100144D10);
    sub_1000D6094();
    sub_1000D624C();
    _ConditionalContent<>.init(storage:)();
    swift_release();
    sub_1000D632C(v7, *((uint64_t *)&v7 + 1), v9, v8);
  }
  else
  {
    uint64_t v10 = MediaArtworkStyleConfiguration.subscript.getter();
    if (!v10)
    {
      long long v16 = static HierarchicalShapeStyle.quaternary.getter();
      int v17 = 0x1000000;
      sub_100005B18(&qword_100144D08);
      sub_100005B18(&qword_100144D10);
      sub_1000D6094();
      sub_1000D624C();
      uint64_t result = _ConditionalContent<>.init(storage:)();
      goto LABEL_6;
    }
    uint64_t v11 = v10;
    *(void *)&long long v16 = swift_getKeyPath();
    *((void *)&v16 + 1) = v11;
    LOWORD(v17) = 0;
    BYTE2(v17) = 1;
    swift_retain();
    swift_retain();
    sub_100005B18(&qword_100144CC8);
    sub_100005B18(&qword_100144D28);
    sub_1000D5CC8();
    sub_1000D6158();
    _ConditionalContent<>.init(storage:)();
    long long v16 = v18;
    HIWORD(v17) = v20 != 0;
    LOWORD(v17) = v19;
    sub_100005B18(&qword_100144D08);
    sub_100005B18(&qword_100144D10);
    sub_1000D6094();
    sub_1000D624C();
    _ConditionalContent<>.init(storage:)();
    swift_release();
  }
  uint64_t result = swift_release();
LABEL_6:
  uint64_t v13 = *((void *)&v18 + 1);
  int v14 = v19 | (v20 << 16);
  char v15 = v21;
  *(void *)a1 = v18;
  *(void *)(a1 + 8) = v13;
  *(_WORD *)(a1 + 16) = v14;
  *(unsigned char *)(a1 + 18) = BYTE2(v14);
  *(unsigned char *)(a1 + 19) = v15;
  return result;
}

uint64_t sub_1000D5584(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v12 = a4;
  uint64_t v6 = sub_100005B18(&qword_100144D68);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006650(a1, a1[3]);
  sub_1000D6580();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v15 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v4)
  {
    char v14 = v12;
    char v13 = 1;
    sub_1000D6628();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1000D570C(char *a1, char *a2)
{
  return sub_100009108(*a1, *a2);
}

Swift::Int sub_1000D5718()
{
  return Hasher._finalize()();
}

uint64_t sub_1000D5790()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000D57F4()
{
  return Hasher._finalize()();
}

uint64_t sub_1000D5868@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10012FE18, *a1);
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

void sub_1000D58C8(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1953064037;
  if (!*v1) {
    uint64_t v2 = 0x656461637261;
  }
  unint64_t v3 = 0xE600000000000000;
  if (*v1) {
    unint64_t v3 = 0xE400000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1000D58FC()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_1000D595C()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_1000D59AC()
{
  if (*v0) {
    return 0x79616C7265766FLL;
  }
  else {
    return 0x6574616C706D6574;
  }
}

uint64_t sub_1000D59E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000D692C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000D5A10(uint64_t a1)
{
  unint64_t v2 = sub_1000D6580();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000D5A4C(uint64_t a1)
{
  unint64_t v2 = sub_1000D6580();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000D5A88@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1000D6378(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_1000D5AB8(void *a1)
{
  return sub_1000D5584(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_1000D5AE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000D5B0C()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000D5B38(uint64_t result)
{
  *(unsigned char *)(result + 152) = 1;
  return result;
}

uint64_t sub_1000D5B44(uint64_t result)
{
  *(unsigned char *)(result + 153) = 0;
  return result;
}

uint64_t sub_1000D5B4C(uint64_t result)
{
  *(unsigned char *)(result + 152) = 0;
  return result;
}

unint64_t sub_1000D5B54()
{
  unint64_t result = qword_100144CB0;
  if (!qword_100144CB0)
  {
    sub_10000B448(&qword_100144CA0);
    type metadata accessor for MediaArtwork();
    sub_1000D5C1C();
    sub_1000D5C74();
    swift_getOpaqueTypeConformance2();
    sub_1000D5CC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144CB0);
  }
  return result;
}

unint64_t sub_1000D5C1C()
{
  unint64_t result = qword_100143BC0;
  if (!qword_100143BC0)
  {
    type metadata accessor for MediaArtwork();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100143BC0);
  }
  return result;
}

unint64_t sub_1000D5C74()
{
  unint64_t result = qword_100144CB8;
  if (!qword_100144CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144CB8);
  }
  return result;
}

unint64_t sub_1000D5CC8()
{
  unint64_t result = qword_100144CC0;
  if (!qword_100144CC0)
  {
    sub_10000B448(&qword_100144CC8);
    sub_1000D5D80(&qword_100143B80, &qword_100143B88);
    sub_10001758C(&qword_100144CD0, &qword_100144CD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144CC0);
  }
  return result;
}

uint64_t sub_1000D5D80(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B448(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for PlayerAvatarMediaArtworkStyle()
{
  return &type metadata for PlayerAvatarMediaArtworkStyle;
}

uint64_t sub_1000D5E00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PlayerAvatar(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for PlayerAvatar(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for PlayerAvatar(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PlayerAvatar(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for PlayerAvatar()
{
  return &type metadata for PlayerAvatar;
}

ValueMetadata *type metadata accessor for PlayerAvatar.Overlay()
{
  return &type metadata for PlayerAvatar.Overlay;
}

unint64_t sub_1000D5F80()
{
  unint64_t result = qword_100144CE0;
  if (!qword_100144CE0)
  {
    sub_10000B448(&qword_100144CE8);
    sub_10001758C(&qword_100144CF0, &qword_100144CF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144CE0);
  }
  return result;
}

unint64_t sub_1000D6024()
{
  unint64_t result = qword_100144D00;
  if (!qword_100144D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144D00);
  }
  return result;
}

uint64_t sub_1000D6078()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000D6094()
{
  return sub_1000D60D0(&qword_100144D18, &qword_100144D08, (void (*)(void))sub_1000D5CC8, (void (*)(void))sub_1000D6158);
}

uint64_t sub_1000D60D0(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B448(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000D6158()
{
  unint64_t result = qword_100144D20;
  if (!qword_100144D20)
  {
    sub_10000B448(&qword_100144D28);
    sub_1000D61F8();
    sub_10001758C(&qword_100144C78, &qword_100144C80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144D20);
  }
  return result;
}

unint64_t sub_1000D61F8()
{
  unint64_t result = qword_100144D30;
  if (!qword_100144D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144D30);
  }
  return result;
}

unint64_t sub_1000D624C()
{
  unint64_t result = qword_100144D38;
  if (!qword_100144D38)
  {
    sub_10000B448(&qword_100144D10);
    sub_1000D61F8();
    sub_10001758C(&qword_100144D40, &qword_100144D48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144D38);
  }
  return result;
}

uint64_t sub_1000D62EC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_1000D632C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result = swift_release();
  if (a4)
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000D6378(void *a1)
{
  uint64_t v3 = sub_100005B18(&qword_100144D50);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  sub_100006650(a1, a1[3]);
  sub_1000D6580();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    sub_100007188((uint64_t)a1);
  }
  else
  {
    v9[15] = 0;
    uint64_t v7 = KeyedDecodingContainer.decode(_:forKey:)();
    v9[13] = 1;
    sub_1000D65D4();
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    sub_100007188((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_1000D6580()
{
  unint64_t result = qword_100144D58;
  if (!qword_100144D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144D58);
  }
  return result;
}

unint64_t sub_1000D65D4()
{
  unint64_t result = qword_100144D60;
  if (!qword_100144D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144D60);
  }
  return result;
}

unint64_t sub_1000D6628()
{
  unint64_t result = qword_100144D70;
  if (!qword_100144D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144D70);
  }
  return result;
}

unint64_t sub_1000D667C()
{
  unint64_t result = qword_100144D78;
  if (!qword_100144D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144D78);
  }
  return result;
}

unsigned char *_s13GameOverlayUI12PlayerAvatarV7OverlayOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000D679CLL);
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

ValueMetadata *type metadata accessor for PlayerAvatar.CodingKeys()
{
  return &type metadata for PlayerAvatar.CodingKeys;
}

uint64_t sub_1000D67D4()
{
  return sub_1000D60D0(&qword_100144D80, &qword_100144D88, (void (*)(void))sub_1000D6094, (void (*)(void))sub_1000D624C);
}

unint64_t sub_1000D6828()
{
  unint64_t result = qword_100144D90;
  if (!qword_100144D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144D90);
  }
  return result;
}

unint64_t sub_1000D6880()
{
  unint64_t result = qword_100144D98;
  if (!qword_100144D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144D98);
  }
  return result;
}

unint64_t sub_1000D68D8()
{
  unint64_t result = qword_100144DA0;
  if (!qword_100144DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100144DA0);
  }
  return result;
}

uint64_t sub_1000D692C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6574616C706D6574 && a2 == 0xE800000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79616C7265766FLL && a2 == 0xE700000000000000)
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

void sub_1000D6A20()
{
  id v0 = [self defaultSettings];
  id v1 = [objc_allocWithZone((Class)CNAvatarImageRenderer) initWithSettings:v0];

  qword_100144DA8 = (uint64_t)v1;
}

uint64_t sub_1000D6A8C()
{
  uint64_t v0 = type metadata accessor for URLExpression();
  sub_100007CE8(v0, qword_100144DB0);
  sub_100007D4C(v0, (uint64_t)qword_100144DB0);
  return URLExpression.init(schemePattern:hostPattern:pathPattern:queryPattern:)();
}

uint64_t PlayerMonogramProtocol.fetch(contentsOf:)(uint64_t a1)
{
  uint64_t v2 = sub_100005B18(&qword_1001448A0);
  __chkstk_darwin(v2);
  uint64_t v7 = a1;
  (*(void (**)(unsigned char *, void))(v4 + 104))(&v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], enum case for AsyncStream.Continuation.BufferingPolicy.unbounded<A>(_:));
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

void sub_1000D6C4C(uint64_t a1)
{
  uint64_t v2 = sub_100005B18((uint64_t *)&unk_1001448C8);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  sub_100005B18(&qword_100144DC8);
  MediaArtwork.ProtocolRequest.size.getter();
  double v6 = v5;
  double v8 = v7;
  MediaArtwork.ProtocolRequest.scale.getter();
  double v10 = v9;
  id v11 = [self availableColors];
  sub_1000D821C();
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  MediaArtwork.ProtocolRequest.matchResult.getter();
  swift_bridgeObjectRelease();
  if ((v12 & 0xC000000000000001) == 0)
  {
    if (((unint64_t)v22 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v22 < *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v13 = *(id *)(v12 + 8 * (void)v22 + 32);
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_10;
  }
  id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_5:
  char v14 = v13;
  swift_bridgeObjectRelease();
  uint64_t v12 = [self scopeWithPointSize:0 scale:0 strokeWidth:0 strokeColor:v14 rightToLeft:v6 style:v8 color:v10];

  if (qword_10013FCD8 != -1) {
LABEL_10:
  }
    swift_once();
  char v15 = (void *)qword_100144DA8;
  MediaArtwork.ProtocolRequest.matchResult.getter();
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v17 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v18 + v17, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  char v24 = sub_1000D82F0;
  uint64_t v25 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  uint64_t v22 = sub_10007BDE0;
  long long v23 = &unk_100134C58;
  unsigned __int16 v19 = _Block_copy(aBlock);
  swift_release();
  id v20 = [v15 renderMonogramForString:v16 scope:v12 imageHandler:v19];
  _Block_release(v19);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

void sub_1000D6FA0(void *a1)
{
  uint64_t v2 = sub_100005B18(&qword_1001448B8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  double v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = a1;
  v7[1] = Image.init(uiImage:)();
  sub_100005B18((uint64_t *)&unk_1001448C8);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  AsyncStream.Continuation.finish()();
}

uint64_t sub_1000D70A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s13GameOverlayUI22PlayerMonogramProtocolV5matchyAC15MatchedResourceVSg10Foundation3URLVF_0();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_1000D70D0(uint64_t a1)
{
  uint64_t v2 = sub_100005B18(&qword_1001448A0);
  __chkstk_darwin(v2);
  uint64_t v7 = a1;
  (*(void (**)(unsigned char *, void))(v4 + 104))(&v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], enum case for AsyncStream.Continuation.BufferingPolicy.unbounded<A>(_:));
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

unsigned __int8 *sub_1000D71D4(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000D72D4(a1, a2, a3);
}

unsigned __int8 *sub_1000D71EC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v5 = sub_1000D7550();
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
  id v11 = sub_1000D72D4(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_1000D72D4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            for (int64_t i = result + 1; ; ++i)
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

uint64_t sub_1000D7550()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = sub_1000D75D0(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1000D75D0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_1000D7728(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_1000370F4(v9, 0),
          unint64_t v12 = sub_1000D7828((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
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

uint64_t sub_1000D7728(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_10003715C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_10003715C(v6, v5, v4);
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

unint64_t sub_1000D7828(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    *uint64_t v9 = a4;
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
      uint64_t result = sub_10003715C(v12, a6, a7);
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
    uint64_t result = sub_10003715C(v12, a6, a7);
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

uint64_t sub_1000D7A3C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QueryExpression.MatchResult();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v37[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t matched = URLExpression.MatchResult.host.getter();
  unint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = matched & 0xFFFFFFFFFFFFLL;
  }
  if (!v9)
  {
    uint64_t v10 = 0;
LABEL_54:
    uint64_t v32 = type metadata accessor for URLExpression.MatchResult();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v32 - 8) + 8))(a1, v32);
    return v10;
  }
  uint64_t v10 = URLExpression.MatchResult.host.getter();
  URLExpression.MatchResult.query.getter();
  uint64_t v11 = QueryExpression.MatchResult.subscript.getter();
  unint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v13) {
    uint64_t result = v11;
  }
  else {
    uint64_t result = 48;
  }
  if (v13) {
    unint64_t v15 = v13;
  }
  else {
    unint64_t v15 = 0xE100000000000000;
  }
  uint64_t v16 = HIBYTE(v15) & 0xF;
  uint64_t v17 = result & 0xFFFFFFFFFFFFLL;
  if ((v15 & 0x2000000000000000) != 0) {
    uint64_t v18 = HIBYTE(v15) & 0xF;
  }
  else {
    uint64_t v18 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v18)
  {
LABEL_53:
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
  if ((v15 & 0x1000000000000000) != 0)
  {
    sub_1000D71EC(result, v15, 10);
    goto LABEL_53;
  }
  if ((v15 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      char v19 = (unsigned __int8 *)((v15 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      char v19 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    }
    sub_1000D72D4(v19, v17, 10);
    goto LABEL_53;
  }
  v37[0] = result;
  v37[1] = v15 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (v16)
    {
      if (v16 != 1
        && (BYTE1(result) - 48) <= 9u
        && v16 != 2
        && (BYTE2(result) - 48) <= 9u)
      {
        uint64_t v20 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
        uint64_t v21 = v16 - 3;
        if (v21)
        {
          uint64_t v22 = (unsigned __int8 *)v37 + 3;
          do
          {
            unsigned int v23 = *v22 - 48;
            if (v23 > 9) {
              break;
            }
            uint64_t v24 = 10 * v20;
            if ((unsigned __int128)(v20 * (__int128)10) >> 64 != (10 * v20) >> 63) {
              break;
            }
            uint64_t v20 = v24 + v23;
            if (__OFADD__(v24, v23)) {
              break;
            }
            ++v22;
            --v21;
          }
          while (v21);
        }
      }
      goto LABEL_53;
    }
  }
  else
  {
    if (result != 45)
    {
      if (v16)
      {
        if ((result - 48) <= 9u && v16 != 1 && (BYTE1(result) - 48) <= 9u)
        {
          uint64_t v25 = 10 * (result - 48) + (BYTE1(result) - 48);
          uint64_t v26 = v16 - 2;
          if (v26)
          {
            unint64_t v27 = (unsigned __int8 *)v37 + 2;
            do
            {
              unsigned int v28 = *v27 - 48;
              if (v28 > 9) {
                break;
              }
              uint64_t v29 = 10 * v25;
              if ((unsigned __int128)(v25 * (__int128)10) >> 64 != (10 * v25) >> 63) {
                break;
              }
              uint64_t v25 = v29 + v28;
              if (__OFADD__(v29, v28)) {
                break;
              }
              ++v27;
              --v26;
            }
            while (v26);
          }
        }
      }
      goto LABEL_53;
    }
    if (v16)
    {
      if (v16 != 1
        && (BYTE1(result) - 48) <= 9u
        && v16 != 2
        && (BYTE2(result) - 48) <= 9u)
      {
        uint64_t v30 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
        uint64_t v31 = v16 - 3;
        if (v31)
        {
          long long v33 = (unsigned __int8 *)v37 + 3;
          do
          {
            unsigned int v34 = *v33 - 48;
            if (v34 > 9) {
              break;
            }
            uint64_t v35 = 10 * v30;
            if ((unsigned __int128)(v30 * (__int128)10) >> 64 != (10 * v30) >> 63) {
              break;
            }
            uint64_t v30 = v35 - v34;
            if (__OFSUB__(v35, v34)) {
              break;
            }
            ++v33;
            --v31;
          }
          while (v31);
        }
      }
      goto LABEL_53;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t _s13GameOverlayUI22PlayerMonogramProtocolV5matchyAC15MatchedResourceVSg10Foundation3URLVF_0()
{
  uint64_t v0 = sub_100005B18(&qword_100144948);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t matched = type metadata accessor for URLExpression.MatchResult();
  uint64_t v4 = *(void *)(matched - 8);
  uint64_t v5 = __chkstk_darwin(matched);
  unint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v13 - v8;
  if (qword_10013FCE0 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for URLExpression();
  sub_100007D4C(v10, (uint64_t)qword_100144DB0);
  URLExpression.match(_:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, matched) == 1)
  {
    sub_1000CDDD8((uint64_t)v2);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, matched);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, matched);
    uint64_t v11 = sub_1000D7A3C((uint64_t)v7);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, matched);
  }
  return v11;
}

void sub_1000D8098(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for PlayerMonogramProtocol()
{
  return &type metadata for PlayerMonogramProtocol;
}

void *sub_1000D80B4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PlayerMonogramProtocol.MatchedResource(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for PlayerMonogramProtocol.MatchedResource(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for PlayerMonogramProtocol.MatchedResource(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PlayerMonogramProtocol.MatchedResource(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for PlayerMonogramProtocol.MatchedResource()
{
  return &type metadata for PlayerMonogramProtocol.MatchedResource;
}

unint64_t sub_1000D821C()
{
  unint64_t result = qword_100142C20;
  if (!qword_100142C20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100142C20);
  }
  return result;
}

uint64_t sub_1000D825C()
{
  uint64_t v1 = sub_100005B18((uint64_t *)&unk_1001448C8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_1000D82F0(void *a1)
{
  sub_100005B18((uint64_t *)&unk_1001448C8);

  sub_1000D6FA0(a1);
}

uint64_t sub_1000D8364(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000D8374()
{
  return swift_release();
}

void sub_1000D8390(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = type metadata accessor for GameOverlayUIConfig.ServiceKind();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = self;
  id v10 = a1;
  uint64_t v11 = sub_1000E6E58([v9 currentContext]);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for GameOverlayUIConfig.ServiceKind.multiplayer(_:), v5);
  sub_100072354((uint64_t)v8, a3, v11);
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000D84D4@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__anchoring;
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for AccessPointAnchoring();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1000D85D0()
{
  return sub_1000D86D0();
}

uint64_t sub_1000D85E4()
{
  swift_getKeyPath();
  sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000D8694()
{
  return sub_1000D8B14((uint64_t)&unk_100112FC8, &OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__active);
}

uint64_t sub_1000D86A8()
{
  return sub_1000D8B14((uint64_t)&unk_1001130B8, &OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__isShowingDashboard);
}

uint64_t sub_1000D86BC()
{
  return sub_1000D86D0();
}

uint64_t sub_1000D86D0()
{
  return swift_unknownObjectWeakLoadStrong();
}

void *sub_1000D8774()
{
  swift_getKeyPath();
  sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__gkGame);
  id v2 = v1;
  return v1;
}

uint64_t sub_1000D8824()
{
  swift_getKeyPath();
  sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(void *)(v0 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__hideCount);
}

uint64_t sub_1000D88CC()
{
  return sub_1000D8B14((uint64_t)&unk_1001131A8, &OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__didReturnToForeground);
}

uint64_t sub_1000D88E0()
{
  swift_getKeyPath();
  sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__useCase);
}

uint64_t sub_1000D8988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000D89C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__anchoring;
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(v3, a2, v4);
  return swift_endAccess();
}

uint64_t sub_1000D8A60(uint64_t result, char a2)
{
  *(unsigned char *)(result + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__useCase) = a2;
  return result;
}

uint64_t sub_1000D8A70(uint64_t result, char a2)
{
  *(unsigned char *)(result + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__active) = a2;
  return result;
}

uint64_t sub_1000D8A80(uint64_t result, uint64_t a2)
{
  *(void *)(result + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__hideCount) = a2;
  return result;
}

void sub_1000D8A90(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__gkGame);
  *(void *)(a1 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__gkGame) = a2;
  id v3 = a2;
}

uint64_t sub_1000D8ACC(uint64_t result, char a2)
{
  *(unsigned char *)(result + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__didReturnToForeground) = a2;
  return result;
}

uint64_t sub_1000D8ADC()
{
  return sub_1000D8B14((uint64_t)&unk_100113180, &OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__newToGameCenter);
}

uint64_t sub_1000D8AF0(uint64_t result, char a2)
{
  *(unsigned char *)(result + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__newToGameCenter) = a2;
  return result;
}

uint64_t sub_1000D8B00()
{
  return sub_1000D8B14((uint64_t)&unk_1001130E0, &OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__dismissDashboardRequested);
}

uint64_t sub_1000D8B14(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v2 + *a2);
}

uint64_t sub_1000D8BB4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__dismissDashboardRequested);
  return result;
}

uint64_t sub_1000D8C64()
{
  return swift_release();
}

void sub_1000D8D34()
{
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007D4C(v1, (uint64_t)qword_100156CF8);
  swift_retain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    swift_getKeyPath();
    sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_release();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "RemoteAlertAccessPointContext: isShowingDashboard is %{BOOL}d", v4, 8u);
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  swift_getKeyPath();
  sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__isShowingDashboard) & 1) == 0)
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    swift_retain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 67109120;
      swift_getKeyPath();
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      swift_release();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "RemoteAlertAccessPointContext: dismissDashboardRequested is set to %{BOOL}d.", v8, 8u);
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
  }
}

void sub_1000D9114(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__isShowingDashboard) = a2;
  sub_1000D8D34();
}

uint64_t sub_1000D914C()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1000D9170()
{
  return swift_unknownObjectWeakAssign();
}

void *sub_1000D9194(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, int a6, int a7)
{
  uint64_t v8 = v7;
  int v24 = a6;
  int v25 = a7;
  uint64_t v23 = a5;
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[2] = 0;
  v8[3] = 0;
  UUID.init()();
  uint64_t v17 = UUID.uuidString.getter();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v8[4] = v17;
  v8[5] = v19;
  *((unsigned char *)v8 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__active) = 1;
  *(void *)((char *)v8 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__gkGame) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  ObservationRegistrar.init()();
  swift_bridgeObjectRelease();
  v8[2] = a1;
  v8[3] = a2;
  uint64_t v20 = (char *)v8 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__anchoring;
  uint64_t v21 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(v20, a3, v21);
  *((unsigned char *)v8 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__useCase) = a4;
  *(void *)((char *)v8 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__hideCount) = v23;
  *((unsigned char *)v8 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__didReturnToForeground) = v24;
  *((unsigned char *)v8 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__newToGameCenter) = v25;
  *((unsigned char *)v8 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__isShowingDashboard) = 0;
  *((unsigned char *)v8 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__dismissDashboardRequested) = 0;
  return v8;
}

uint64_t sub_1000D93A0()
{
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007D4C(v1, (uint64_t)qword_100156CF8);
  swift_retain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    swift_getKeyPath();
    sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_release();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "RemoteAlertAccessPointContext: requestDismissDashboard called. Is the Access Point expanded to show the dashboard? %{BOOL}d", v4, 8u);
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  swift_getKeyPath();
  sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v5 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__isShowingDashboard);
  if (v5 == 1)
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    swift_retain_n();
    os_log_type_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 67109120;
      swift_getKeyPath();
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      swift_release();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "RemoteAlertAccessPointContext: dismissDashboardRequested is set to %{BOOL}d.", v9, 8u);
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
  }
  return v5;
}

uint64_t sub_1000D978C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__anchoring;
  uint64_t v2 = type metadata accessor for AccessPointAnchoring();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_unknownObjectWeakDestroy();
  sub_1000C0130(v0 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__remoteTarget);
  uint64_t v3 = v0 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_1000D98B0()
{
  return type metadata accessor for RemoteAlertAccessPointContext(0);
}

uint64_t type metadata accessor for RemoteAlertAccessPointContext(uint64_t a1)
{
  return sub_100017090(a1, qword_100144E58);
}

uint64_t sub_1000D98D8()
{
  uint64_t result = type metadata accessor for AccessPointAnchoring();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ObservationRegistrar();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_1000D99F4()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1000D9AA4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000D9AD8()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_1000DA7D4((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v1
                            + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__dismissDashboardRequested);
}

uint64_t sub_1000D9B80()
{
  return sub_1000D93A0() & 1;
}

uint64_t sub_1000D9BA8()
{
  swift_getKeyPath();
  sub_1000DA7D4(&qword_1001454E0, (void (*)(uint64_t))type metadata accessor for RemoteAlertDashboardContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000D9C58@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000DA7D4(&qword_1001454E0, (void (*)(uint64_t))type metadata accessor for RemoteAlertDashboardContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000D9D04()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000D9DE8()
{
  swift_getKeyPath();
  sub_1000DA7D4(&qword_1001454E0, (void (*)(uint64_t))type metadata accessor for RemoteAlertDashboardContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t sub_1000D9E88@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000DA7D4(&qword_1001454E0, (void (*)(uint64_t))type metadata accessor for RemoteAlertDashboardContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 32);
  return result;
}

uint64_t sub_1000D9F30()
{
  return swift_release();
}

uint64_t sub_1000DA000()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t sub_1000DA0A4()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1000DA0C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  UUID.init()();
  uint64_t v10 = UUID.uuidString.getter();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *(void *)(v3 + 40) = v10;
  *(void *)(v3 + 48) = v12;
  swift_unknownObjectWeakInit();
  ObservationRegistrar.init()();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  *(unsigned char *)(v3 + 32) = 0;
  return v3;
}

uint64_t sub_1000DA1E0()
{
  swift_getKeyPath();
  sub_1000DA7D4(&qword_1001454E0, (void (*)(uint64_t))type metadata accessor for RemoteAlertDashboardContext);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100007D4C(v0, (uint64_t)qword_100156CF8);
  swift_retain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 67109120;
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_release();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "RemoteAlertDashboardContext: requestDismissDashboard called. dismissDashboardRequested is set to %{BOOL}d.", v3, 8u);
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  return 1;
}

uint64_t sub_1000DA418()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000C0130(v0 + 56);
  uint64_t v1 = v0 + OBJC_IVAR____TtC13GameOverlayUI27RemoteAlertDashboardContext___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_1000DA4D0()
{
  return type metadata accessor for RemoteAlertDashboardContext(0);
}

uint64_t type metadata accessor for RemoteAlertDashboardContext(uint64_t a1)
{
  return sub_100017090(a1, qword_100144F78);
}

uint64_t sub_1000DA4F8()
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

uint64_t sub_1000DA5B0()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_1000DA7D4(&qword_1001454E0, (void (*)(uint64_t))type metadata accessor for RemoteAlertDashboardContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1000DA660()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000DA694()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_1000DA7D4(&qword_1001454E0, (void (*)(uint64_t))type metadata accessor for RemoteAlertDashboardContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v1 + 32);
}

uint64_t sub_1000DA734()
{
  return 1;
}

void sub_1000DA79C()
{
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__dismissDashboardRequested) = *(unsigned char *)(v0 + 24);
}

void sub_1000DA7C4()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 32) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_1000DA7D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000DA824()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 16) = v0[3];
  *(void *)(v1 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_1000DA884()
{
}

void sub_1000DA89C()
{
}

char *DashboardRequest.__allocating_init(initialState:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return DashboardRequest.init(initialState:)(a1);
}

uint64_t sub_1000DA8E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_1000DC324(a1, a2), (v3 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

char *DashboardRequest.init(initialState:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_statusBarHeight] = 0;
  *(_DWORD *)&v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_hostPID] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_currentGame] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_localPlayer] = 0;
  v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_shouldLayoutRTL] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_preferredLocalizations] = &_swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_viewState] = -1;
  *(void *)&v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardTimeScope] = 2;
  *(void *)&v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardPlayerScope] = 1;
  v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_shouldShowPlayForChallenge] = 0;
  v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_shouldShowPlayForTurnBasedMatch] = 0;
  v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_shouldShowQuitForTurnBasedMatch] = 0;
  v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_isArcade] = 0;
  char v3 = &v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_launchContext];
  *char v3 = 0;
  v3[1] = 0;
  uint64_t v4 = &v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardIdentifier];
  *uint64_t v4 = 0;
  v4[1] = 0;
  uint64_t v5 = &v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_gameBundleID];
  *uint64_t v5 = 0;
  v5[1] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardInternal] = 0;
  uint64_t v6 = &v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardTitle];
  *uint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = &v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_achievementIdentifier];
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = &v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_activityIdentifier];
  *uint64_t v8 = 0;
  v8[1] = 0;
  uint64_t v9 = &v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_playerIdentifier];
  *uint64_t v9 = 0;
  v9[1] = 0;
  uint64_t v10 = &v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_playerAlias];
  *uint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = &v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardSetID];
  *uint64_t v11 = 0;
  v11[1] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_deepLinkDestination] = 0;
  v270.receiver = v1;
  v270.super_class = (Class)type metadata accessor for DashboardRequest();
  uint64_t v12 = (char *)objc_msgSendSuper2(&v270, "init");
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v22 = v12;
    goto LABEL_6;
  }
  uint64_t v16 = v13;
  uint64_t v17 = v12;
  unint64_t v18 = sub_1000DC324(v16, v15);
  if ((v19 & 1) == 0)
  {
LABEL_6:
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8 * v18);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v266 = v20;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_7:
    uint64_t v21 = 0;
    goto LABEL_8;
  }
  uint64_t v21 = v269;
LABEL_8:
  *(void *)&v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_statusBarHeight] = v21;
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(a1 + 16) || (unint64_t v25 = sub_1000DC324(v23, v24), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8 * v25);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v266 = v27;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    int v28 = 0;
    goto LABEL_14;
  }
  int v28 = v269;
LABEL_14:
  *(_DWORD *)&v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_hostPID] = v28;
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(a1 + 16) || (sub_1000DC324(v29, v30), (v31 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  self;
  uint64_t v32 = swift_dynamicCastObjCClass();
  if (!v32)
  {
    swift_unknownObjectRelease();
LABEL_19:
    uint64_t v32 = 0;
  }
  uint64_t v33 = OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_currentGame;
  unsigned int v34 = *(void **)&v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_currentGame];
  *(void *)&v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_currentGame] = v32;

  uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(a1 + 16) || (sub_1000DC324(v35, v36), (v37 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  self;
  uint64_t v38 = swift_dynamicCastObjCClass();
  if (!v38)
  {
    swift_unknownObjectRelease();
LABEL_25:
    uint64_t v38 = 0;
  }
  uint64_t v39 = *(void **)&v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_localPlayer];
  *(void *)&v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_localPlayer] = v38;

  uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(a1 + 16) || (unint64_t v42 = sub_1000DC324(v40, v41), (v43 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  uint64_t v44 = *(void *)(*(void *)(a1 + 56) + 8 * v42);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v266 = v44;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_31:
    char v45 = 0;
    goto LABEL_32;
  }
  char v45 = v269;
LABEL_32:
  v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_shouldLayoutRTL] = v45;
  uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(a1 + 16) || (unint64_t v48 = sub_1000DC324(v46, v47), (v49 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  uint64_t v50 = *(void *)(*(void *)(a1 + 56) + 8 * v48);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v266 = v50;
  sub_100005B18(&qword_100143D38);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_37:
    char v51 = &_swiftEmptyArrayStorage;
    goto LABEL_38;
  }
  char v51 = (void *)v269;
LABEL_38:
  *(void *)&v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_preferredLocalizations] = v51;
  swift_bridgeObjectRelease();
  uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(a1 + 16) || (unint64_t v54 = sub_1000DC324(v52, v53), (v55 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_43;
  }
  uint64_t v56 = *(void *)(*(void *)(a1 + 56) + 8 * v54);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v266 = v56;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_43:
    uint64_t v57 = -1;
    goto LABEL_44;
  }
  uint64_t v57 = v269;
LABEL_44:
  uint64_t v58 = OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_viewState;
  *(void *)&v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_viewState] = v57;
  uint64_t v59 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v265 = v58;
  if (!*(void *)(a1 + 16) || (unint64_t v61 = sub_1000DC324(v59, v60), (v62 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_49;
  }
  uint64_t v63 = *(void *)(*(void *)(a1 + 56) + 8 * v61);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v266 = v63;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_49:
    uint64_t v64 = -1;
    goto LABEL_50;
  }
  uint64_t v64 = v269;
LABEL_50:
  uint64_t v65 = OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardTimeScope;
  *(void *)&v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardTimeScope] = v64;
  uint64_t v66 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(a1 + 16) || (unint64_t v68 = sub_1000DC324(v66, v67), (v69 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_55;
  }
  uint64_t v70 = *(void *)(*(void *)(a1 + 56) + 8 * v68);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v266 = v70;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_55:
    uint64_t v71 = -1;
    goto LABEL_56;
  }
  uint64_t v71 = v269;
LABEL_56:
  uint64_t v72 = OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardPlayerScope;
  *(void *)&v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardPlayerScope] = v71;
  uint64_t v73 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v75 = sub_1000DC324(v73, v74), (v76 & 1) != 0))
  {
    uint64_t v77 = *(void *)(*(void *)(a1 + 56) + 8 * v75);
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v269 = v77;
    int v78 = swift_dynamicCast();
    uint64_t v79 = v266;
    unint64_t v80 = v268;
    if (!v78)
    {
      uint64_t v79 = 0;
      unint64_t v80 = 0;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v79 = 0;
    unint64_t v80 = 0;
  }
  uint64_t v81 = &v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardSetID];
  *(void *)uint64_t v81 = v79;
  *((void *)v81 + 1) = v80;
  v260 = v81;
  swift_bridgeObjectRelease();
  uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(a1 + 16) || (unint64_t v84 = sub_1000DC324(v82, v83), (v85 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_66;
  }
  uint64_t v86 = *(void *)(*(void *)(a1 + 56) + 8 * v84);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v266 = v86;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_66:
    char v87 = 0;
    goto LABEL_67;
  }
  char v87 = v269;
LABEL_67:
  v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_shouldShowPlayForChallenge] = v87;
  uint64_t v88 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(a1 + 16) || (unint64_t v90 = sub_1000DC324(v88, v89), (v91 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_72;
  }
  uint64_t v92 = *(void *)(*(void *)(a1 + 56) + 8 * v90);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v266 = v92;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_72:
    char v93 = 0;
    goto LABEL_73;
  }
  char v93 = v269;
LABEL_73:
  v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_shouldShowPlayForTurnBasedMatch] = v93;
  uint64_t v94 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v96 = sub_1000DA8E8(v94, v95, a1);
  swift_bridgeObjectRelease();
  if (v96 && (uint64_t v266 = v96, swift_dynamicCast())) {
    char v97 = v269;
  }
  else {
    char v97 = 0;
  }
  v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_shouldShowQuitForTurnBasedMatch] = v97;
  uint64_t v98 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v100 = sub_1000DA8E8(v98, v99, a1);
  swift_bridgeObjectRelease();
  if (v100 && (uint64_t v266 = v100, swift_dynamicCast())) {
    char v101 = v269;
  }
  else {
    char v101 = 0;
  }
  v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_isArcade] = v101;
  uint64_t v102 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v104 = sub_1000DA8E8(v102, v103, a1);
  swift_bridgeObjectRelease();
  if (v104)
  {
    uint64_t v269 = v104;
    int v105 = swift_dynamicCast();
    uint64_t v106 = v266;
    unint64_t v107 = v268;
    if (!v105)
    {
      uint64_t v106 = 0;
      unint64_t v107 = 0;
    }
  }
  else
  {
    uint64_t v106 = 0;
    unint64_t v107 = 0;
  }
  uint64_t v108 = &v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_launchContext];
  *(void *)uint64_t v108 = v106;
  *((void *)v108 + 1) = v107;
  swift_bridgeObjectRelease();
  uint64_t v109 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v111 = sub_1000DA8E8(v109, v110, a1);
  swift_bridgeObjectRelease();
  if (v111)
  {
    uint64_t v269 = v111;
    int v112 = swift_dynamicCast();
    uint64_t v113 = v266;
    unint64_t v114 = v268;
    if (!v112)
    {
      uint64_t v113 = 0;
      unint64_t v114 = 0;
    }
  }
  else
  {
    uint64_t v113 = 0;
    unint64_t v114 = 0;
  }
  v115 = &v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardIdentifier];
  *(void *)v115 = v113;
  *((void *)v115 + 1) = v114;
  v259 = v115;
  swift_bridgeObjectRelease();
  uint64_t v116 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v118 = sub_1000DA8E8(v116, v117, a1);
  swift_bridgeObjectRelease();
  if (v118)
  {
    uint64_t v269 = v118;
    int v119 = swift_dynamicCast();
    uint64_t v120 = v266;
    unint64_t v121 = v268;
    if (!v119)
    {
      uint64_t v120 = 0;
      unint64_t v121 = 0;
    }
  }
  else
  {
    uint64_t v120 = 0;
    unint64_t v121 = 0;
  }
  long long v122 = &v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_gameBundleID];
  *(void *)long long v122 = v120;
  *((void *)v122 + 1) = v121;
  v261 = v122;
  swift_bridgeObjectRelease();
  uint64_t v123 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v125 = sub_1000DA8E8(v123, v124, a1);
  swift_bridgeObjectRelease();
  if (v125)
  {
    self;
    uint64_t v126 = swift_dynamicCastObjCClass();
    if (v126) {
      goto LABEL_97;
    }
    swift_unknownObjectRelease();
  }
  uint64_t v126 = 0;
LABEL_97:
  uint64_t v127 = *(void **)&v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardInternal];
  *(void *)&v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardInternal] = v126;

  uint64_t v128 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v130 = sub_1000DA8E8(v128, v129, a1);
  swift_bridgeObjectRelease();
  uint64_t v264 = v72;
  if (v130)
  {
    uint64_t v269 = v130;
    int v131 = swift_dynamicCast();
    uint64_t v132 = v266;
    unint64_t v133 = v268;
    if (!v131)
    {
      uint64_t v132 = 0;
      unint64_t v133 = 0;
    }
  }
  else
  {
    uint64_t v132 = 0;
    unint64_t v133 = 0;
  }
  uint64_t v134 = &v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardTitle];
  *(void *)uint64_t v134 = v132;
  *((void *)v134 + 1) = v133;
  swift_bridgeObjectRelease();
  uint64_t v135 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v137 = sub_1000DA8E8(v135, v136, a1);
  swift_bridgeObjectRelease();
  v263 = v108;
  if (v137)
  {
    uint64_t v269 = v137;
    int v138 = swift_dynamicCast();
    uint64_t v139 = v266;
    unint64_t v140 = v268;
    if (!v138)
    {
      uint64_t v139 = 0;
      unint64_t v140 = 0;
    }
  }
  else
  {
    uint64_t v139 = 0;
    unint64_t v140 = 0;
  }
  v141 = &v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_achievementIdentifier];
  *(void *)v141 = v139;
  *((void *)v141 + 1) = v140;
  swift_bridgeObjectRelease();
  uint64_t v142 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v144 = sub_1000DA8E8(v142, v143, a1);
  swift_bridgeObjectRelease();
  if (v144)
  {
    uint64_t v269 = v144;
    int v145 = swift_dynamicCast();
    uint64_t v146 = v266;
    unint64_t v147 = v268;
    if (!v145)
    {
      uint64_t v146 = 0;
      unint64_t v147 = 0;
    }
  }
  else
  {
    uint64_t v146 = 0;
    unint64_t v147 = 0;
  }
  id v148 = &v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_activityIdentifier];
  *(void *)id v148 = v146;
  *((void *)v148 + 1) = v147;
  swift_bridgeObjectRelease();
  uint64_t v149 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v151 = sub_1000DA8E8(v149, v150, a1);
  swift_bridgeObjectRelease();
  if (v151)
  {
    uint64_t v269 = v151;
    int v152 = swift_dynamicCast();
    uint64_t v153 = v266;
    unint64_t v154 = v268;
    if (!v152)
    {
      uint64_t v153 = 0;
      unint64_t v154 = 0;
    }
  }
  else
  {
    uint64_t v153 = 0;
    unint64_t v154 = 0;
  }
  v155 = &v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_playerIdentifier];
  *(void *)v155 = v153;
  *((void *)v155 + 1) = v154;
  v262 = (uint64_t *)v155;
  swift_bridgeObjectRelease();
  uint64_t v156 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v158 = sub_1000DA8E8(v156, v157, a1);
  swift_bridgeObjectRelease();
  if (v158)
  {
    uint64_t v269 = v158;
    int v159 = swift_dynamicCast();
    uint64_t v160 = v266;
    unint64_t v161 = v268;
    if (!v159)
    {
      uint64_t v160 = 0;
      unint64_t v161 = 0;
    }
  }
  else
  {
    uint64_t v160 = 0;
    unint64_t v161 = 0;
  }
  uint64_t v162 = &v12[OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_playerAlias];
  *(void *)uint64_t v162 = v160;
  *((void *)v162 + 1) = v161;
  swift_bridgeObjectRelease();
  if (!*(void *)&v12[v33] && sub_1000DA8E8(0x65746E49656D6167, 0xEC0000006C616E72, a1))
  {
    self;
    uint64_t v171 = swift_dynamicCastObjCClass();
    if (v171)
    {
      id v172 = [objc_allocWithZone((Class)GKGame) initWithInternalRepresentation:v171];
      swift_unknownObjectRelease();
      uint64_t v173 = *(void **)&v12[v33];
      *(void *)&v12[v33] = v172;
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  uint64_t v163 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v165 = sub_1000DA8E8(v163, v164, a1);
  swift_bridgeObjectRelease();
  if (!v165) {
    goto LABEL_157;
  }
  uint64_t v267 = v165;
  sub_100005B18(&qword_100142280);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_157;
  }
  uint64_t v166 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v168 = sub_1000DA8E8(v166, v167, v269);
  swift_bridgeObjectRelease();
  if (v168 && swift_dynamicCast())
  {
    uint64_t v169 = v267;
    unint64_t v170 = v268;
  }
  else
  {
    uint64_t v169 = 0;
    unint64_t v170 = 0xE000000000000000;
  }
  uint64_t v258 = v65;
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v169 && v174 == v170)
  {
    swift_bridgeObjectRelease();
LABEL_131:
    swift_bridgeObjectRelease();
    *(void *)&v12[v265] = 0;
    uint64_t v176 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v178 = sub_1000DA8E8(v176, v177, v269);
    swift_bridgeObjectRelease();
    if (v178)
    {
      int v179 = swift_dynamicCast();
      uint64_t v180 = v267;
      unint64_t v181 = v268;
      if (!v179)
      {
        uint64_t v180 = 0;
        unint64_t v181 = 0;
      }
      uint64_t v182 = v258;
      uint64_t v183 = (uint64_t *)v263;
    }
    else
    {
      uint64_t v180 = 0;
      unint64_t v181 = 0;
      uint64_t v182 = v258;
      uint64_t v183 = (uint64_t *)v263;
    }
    void *v259 = v180;
    v259[1] = v181;
    swift_bridgeObjectRelease();
    uint64_t v184 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v186 = sub_1000DA8E8(v184, v185, v269);
    swift_bridgeObjectRelease();
    if (v186)
    {
      int v187 = swift_dynamicCast();
      uint64_t v188 = v267;
      unint64_t v189 = v268;
      if (!v187)
      {
        uint64_t v188 = 0;
        unint64_t v189 = 0;
      }
    }
    else
    {
      uint64_t v188 = 0;
      unint64_t v189 = 0;
    }
    *(void *)uint64_t v134 = v188;
    *((void *)v134 + 1) = v189;
    swift_bridgeObjectRelease();
    uint64_t v190 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v192 = sub_1000DA8E8(v190, v191, v269);
    swift_bridgeObjectRelease();
    if (v192)
    {
      int v193 = swift_dynamicCast();
      uint64_t v194 = v267;
      unint64_t v195 = v268;
      if (!v193)
      {
        uint64_t v194 = 0;
        unint64_t v195 = 0;
      }
    }
    else
    {
      uint64_t v194 = 0;
      unint64_t v195 = 0;
    }
    uint64_t *v262 = v194;
    v262[1] = v195;
    swift_bridgeObjectRelease();
    uint64_t v196 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v198 = sub_1000DA8E8(v196, v197, v269);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v198)
    {
      int v199 = swift_dynamicCast();
      uint64_t v200 = v267;
      unint64_t v201 = v268;
      if (!v199)
      {
        uint64_t v200 = 0;
        unint64_t v201 = 0;
      }
    }
    else
    {
      uint64_t v200 = 0;
      unint64_t v201 = 0;
    }
    void *v261 = v200;
    v261[1] = v201;
    swift_bridgeObjectRelease();
    uint64_t v202 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v204 = sub_1000DA8E8(v202, v203, a1);
    swift_bridgeObjectRelease();
    if (v204)
    {
      int v205 = swift_dynamicCast();
      uint64_t v206 = v267;
      unint64_t v207 = v268;
      if (!v205)
      {
        uint64_t v206 = 0;
        unint64_t v207 = 0;
      }
    }
    else
    {
      uint64_t v206 = 0;
      unint64_t v207 = 0;
    }
    uint64_t v208 = v264;
    long long v209 = (uint64_t *)v260;
LABEL_154:
    *long long v209 = v206;
    v209[1] = v207;
LABEL_155:
    swift_bridgeObjectRelease();
    goto LABEL_156;
  }
  char v175 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v175) {
    goto LABEL_131;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v169 && v217 == v170)
  {
    swift_bridgeObjectRelease();
    goto LABEL_168;
  }
  char v218 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v218)
  {
LABEL_168:
    swift_bridgeObjectRelease();
    *(void *)&v12[v265] = 3;
    uint64_t v219 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v221 = sub_1000DA8E8(v219, v220, v269);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v221)
    {
      int v222 = swift_dynamicCast();
      uint64_t v206 = v267;
      unint64_t v207 = v268;
      if (!v222)
      {
        uint64_t v206 = 0;
        unint64_t v207 = 0;
      }
      uint64_t v182 = v258;
      uint64_t v183 = (uint64_t *)v263;
      uint64_t v208 = v264;
      long long v209 = v262;
    }
    else
    {
      uint64_t v206 = 0;
      unint64_t v207 = 0;
      uint64_t v182 = v258;
      uint64_t v183 = (uint64_t *)v263;
      uint64_t v208 = v264;
      long long v209 = v262;
    }
    goto LABEL_154;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v169 && v223 == v170)
  {
    swift_bridgeObjectRelease();
LABEL_177:
    swift_bridgeObjectRelease();
    *(void *)&v12[v265] = 1;
    uint64_t v225 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v227 = sub_1000DA8E8(v225, v226, v269);
    swift_bridgeObjectRelease();
    if (v227)
    {
      int v228 = swift_dynamicCast();
      uint64_t v229 = v267;
      unint64_t v230 = v268;
      if (!v228)
      {
        uint64_t v229 = 0;
        unint64_t v230 = 0;
      }
    }
    else
    {
      uint64_t v229 = 0;
      unint64_t v230 = 0;
    }
    *(void *)v141 = v229;
    *((void *)v141 + 1) = v230;
    swift_bridgeObjectRelease();
    uint64_t v231 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v233 = sub_1000DA8E8(v231, v232, v269);
    swift_bridgeObjectRelease();
    if (v233)
    {
      int v234 = swift_dynamicCast();
      uint64_t v235 = v267;
      unint64_t v236 = v268;
      if (!v234)
      {
        uint64_t v235 = 0;
        unint64_t v236 = 0;
      }
    }
    else
    {
      uint64_t v235 = 0;
      unint64_t v236 = 0;
    }
    uint64_t v182 = v258;
    uint64_t v183 = (uint64_t *)v263;
    void *v261 = v235;
    v261[1] = v236;
    swift_bridgeObjectRelease();
    uint64_t v237 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v239 = sub_1000DA8E8(v237, v238, v269);
    swift_bridgeObjectRelease();
    if (v239)
    {
      int v240 = swift_dynamicCast();
      uint64_t v241 = v267;
      unint64_t v242 = v268;
      if (!v240)
      {
        uint64_t v241 = 0;
        unint64_t v242 = 0;
      }
    }
    else
    {
      uint64_t v241 = 0;
      unint64_t v242 = 0;
    }
    uint64_t *v262 = v241;
    v262[1] = v242;
    swift_bridgeObjectRelease();
    uint64_t v243 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v245 = sub_1000DA8E8(v243, v244, v269);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v245)
    {
      int v246 = swift_dynamicCast();
      uint64_t v247 = v267;
      unint64_t v248 = v268;
      if (!v246)
      {
        uint64_t v247 = 0;
        unint64_t v248 = 0;
      }
    }
    else
    {
      uint64_t v247 = 0;
      unint64_t v248 = 0;
    }
    uint64_t v208 = v264;
    *(void *)uint64_t v162 = v247;
    *((void *)v162 + 1) = v248;
    goto LABEL_155;
  }
  char v224 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v224) {
    goto LABEL_177;
  }
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v169 && v249 == v170)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v182 = v258;
    uint64_t v183 = (uint64_t *)v263;
    uint64_t v250 = v265;
LABEL_198:
    *(void *)&v12[v250] = 4;
    uint64_t v252 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v254 = sub_1000DA8E8(v252, v253, v269);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v254)
    {
      int v255 = swift_dynamicCast();
      uint64_t v256 = v267;
      unint64_t v257 = v268;
      if (!v255)
      {
        uint64_t v256 = 0;
        unint64_t v257 = 0;
      }
    }
    else
    {
      uint64_t v256 = 0;
      unint64_t v257 = 0;
    }
    uint64_t v208 = v264;
    *(void *)id v148 = v256;
    *((void *)v148 + 1) = v257;
    goto LABEL_155;
  }
  char v251 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v182 = v258;
  uint64_t v183 = (uint64_t *)v263;
  uint64_t v250 = v265;
  if (v251) {
    goto LABEL_198;
  }
  swift_bridgeObjectRelease();
  *(void *)&v12[v265] = -1;
  uint64_t v208 = v264;
LABEL_156:
  *(void *)&v12[v182] = 2;
  *(void *)&v12[v208] = 1;
  if (v183[1])
  {
LABEL_157:
    swift_bridgeObjectRelease();

    return v12;
  }
  uint64_t v211 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v213 = sub_1000DA8E8(v211, v212, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v213)
  {
    int v214 = swift_dynamicCast();
    uint64_t v215 = v267;
    unint64_t v216 = v268;
    if (!v214)
    {
      uint64_t v215 = 0;
      unint64_t v216 = 0;
    }
  }
  else
  {
    uint64_t v215 = 0;
    unint64_t v216 = 0;
  }
  *uint64_t v183 = v215;
  v183[1] = v216;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t type metadata accessor for DashboardRequest()
{
  return self;
}

id DashboardRequest.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void DashboardRequest.init()()
{
}

id DashboardRequest.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DashboardRequest();
  return [super dealloc];
}

unint64_t sub_1000DC324(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000DC538(a1, a2, v4);
}

unint64_t sub_1000DC39C(uint64_t a1)
{
  type metadata accessor for MetricsEventType();
  sub_1000DCB14(&qword_100145108);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_1000DC61C(a1, v2);
}

unint64_t sub_1000DC420(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000DC7C8(a1, v4);
}

unint64_t sub_1000DC464(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000DC890(a1, v4);
}

unint64_t sub_1000DC4A8(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return sub_1000DC99C(a1, v2);
}

unint64_t sub_1000DC538(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_1000DC61C(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for MetricsEventType();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1000DCB14((unint64_t *)&unk_100145110);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_1000DC7C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000AEAD4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100086324((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1000DC890(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_100072E14();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = static NSObject.== infix(_:_:)();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_1000DC99C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_1000DCB14(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MetricsEventType();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000DCB58(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2) {
    return String.subscript.getter();
  }
  else {
    return 0;
  }
}

uint64_t sub_1000DCBA0(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = __CocoaSet.startIndex.getter();
    uint64_t v5 = v4;
    __CocoaSet.endIndex.getter();
    char v6 = static __CocoaSet.Index.== infix(_:_:)();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_1000E584C(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_1000E14EC(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_1000E584C(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_1000E1764(a1);
  if ((v10 & 1) == 0)
  {
    uint64_t v5 = v9;
    if (*(_DWORD *)(a1 + 36) == v9)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000DCCB0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000DCCF4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000E5994((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__useCase);
  return result;
}

uint64_t sub_1000DCDA4()
{
  return swift_release();
}

uint64_t sub_1000DCE74@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1000DCF6C(a1, &OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__didReturnToForeground, a2);
}

uint64_t sub_1000DCE88()
{
  return swift_release();
}

uint64_t sub_1000DCF58@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1000DCF6C(a1, &OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__newToGameCenter, a2);
}

uint64_t sub_1000DCF6C@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, unsigned char *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_1000E5994((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a3 = *(unsigned char *)(v5 + *a2);
  return result;
}

uint64_t sub_1000DD020()
{
  return swift_release();
}

uint64_t sub_1000DD0F0@<X0>(uint64_t *a1@<X8>)
{
  swift_getKeyPath();
  sub_1000E5994(&qword_1001454E0, (void (*)(uint64_t))type metadata accessor for RemoteAlertDashboardContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  *a1 = result;
  return result;
}

uint64_t sub_1000DD19C()
{
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for GameOverlayUISceneDelegate()
{
  return self;
}

uint64_t sub_1000DD39C()
{
  return swift_initClassMetadata2();
}

void sub_1000DD3EC()
{
  v6.receiver = v0;
  v6.super_class = (Class)swift_getObjectType();
  [super viewDidLoad];
  id v1 = [self currentDevice];
  id v2 = [v1 userInterfaceIdiom];

  if (!v2)
  {
    uint64_t v3 = self;
    id v4 = [v3 defaultCenter];
    [v4 addObserver:v0 selector:"controllerDidConnectOrDisconnect:" name:GCControllerDidConnectNotification object:0];

    id v5 = [v3 defaultCenter];
    [v5 addObserver:v0 selector:"controllerDidConnectOrDisconnect:" name:GCControllerDidDisconnectNotification object:0];
  }
}

void sub_1000DD50C(void *a1)
{
  id v1 = a1;
  sub_1000DD3EC();
}

void sub_1000DD554(char a1)
{
  v8.receiver = v1;
  v8.super_class = (Class)swift_getObjectType();
  [super viewWillDisappear:a1 & 1];
  id v3 = [self currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (!v4)
  {
    id v5 = self;
    id v6 = [v5 defaultCenter];
    [v6 removeObserver:v1 name:GCControllerDidConnectNotification object:0];

    id v7 = [v5 defaultCenter];
    [v7 removeObserver:v1 name:GCControllerDidDisconnectNotification object:0];
  }
}

void sub_1000DD66C(void *a1, uint64_t a2, char a3)
{
  id v4 = a1;
  sub_1000DD554(a3);
}

void sub_1000DD6C0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_1000E1F48();
}

uint64_t sub_1000DD720(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_1000DD754();

  return v2;
}

uint64_t sub_1000DD754()
{
  if (*((unsigned char *)v0 + *(void *)(qword_100156E10 + (swift_isaMask & *v0) + 16))) {
    return 30;
  }
  id v1 = [self currentDevice];
  id v2 = [v1 userInterfaceIdiom];

  if (v2) {
    return 30;
  }
  id v4 = [self current];
  if (!v4) {
    return 30;
  }
  id v5 = v4;
  unsigned __int8 v6 = [v4 isAttachedToDevice];

  if ((v6 & 1) == 0) {
    return 30;
  }
  else {
    return 24;
  }
}

uint64_t sub_1000DD844()
{
  return 1;
}

uint64_t sub_1000DD84C(uint64_t a1)
{
  id v2 = v1;
  id v4 = objc_allocWithZone(v1);
  uint64_t v5 = sub_1000E1F58(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)((char *)v2 + qword_100156E10) - 8) + 8))(a1);
  return v5;
}

void *sub_1000DD8CC(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_1000DD910(a1, a2);
}

void *sub_1000DD910(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)((swift_isaMask & *v2) + qword_100156E10);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(a1);
  *((unsigned char *)v2 + *(void *)(v6 + 16)) = 1;
  (*(void (**)(char *))(v5 + 16))((char *)&v12 - v7);
  objc_super v8 = (void *)UIHostingController.init(coder:rootView:)();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  id v10 = v8;
  v9(a2, v4);
  if (v8) {

  }
  return v8;
}

id sub_1000DDA58(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)v1 + *(void *)(qword_100156E10 + (swift_isaMask & *v1) + 16)) = 1;
  v6.receiver = v1;
  v6.super_class = ObjectType;
  id v4 = [super initWithCoder:a1];

  return v4;
}

id sub_1000DDAF8(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1000DDA58(a3);
}

uint64_t type metadata accessor for GameOverlayHostingController()
{
  return sub_100097F94();
}

uint64_t type metadata accessor for GameOverlayWindow()
{
  return self;
}

void *sub_1000DDD2C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v43 = a5;
  uint64_t v39 = a2;
  uint64_t v10 = sub_100005B18(&qword_100145528);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (void *)((char *)v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v40 = type metadata accessor for ColorScheme();
  uint64_t v14 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v16 = (char *)v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005B18(&qword_100145558);
  uint64_t v18 = v17 - 8;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v42 = (uint64_t)v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v41 = (uint64_t)v38 - v22;
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)v38 - v23;
  sub_1000170C8(a6, (uint64_t)v44, &qword_1001444D0);
  uint64_t v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  char v26 = (void *)swift_allocObject();
  void v26[2] = v7;
  v26[3] = v25;
  v38[1] = a3;
  v26[4] = a3;
  uint64_t v27 = v39;
  v45[0] = v39;
  swift_unknownObjectWeakInit();
  sub_10006919C((uint64_t)v44, (uint64_t)v46);
  v46[5] = sub_1000E5DA8;
  v46[6] = v26;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v29 = v40;
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, enum case for ColorScheme.dark(_:), v40);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))((char *)v13 + *(int *)(v11 + 36), v16, v29);
  *uint64_t v13 = KeyPath;
  sub_10005FC94((uint64_t)v45, (uint64_t)v24);
  sub_1000170C8((uint64_t)v13, (uint64_t)&v24[*(int *)(v18 + 44)], &qword_100145528);
  id v30 = v27;
  swift_unknownObjectRetain();
  id v31 = v7;
  sub_100017388((uint64_t)v13, &qword_100145528);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v29);
  sub_10005FCF0((uint64_t)v45);
  uint64_t v32 = v41;
  sub_1000170C8((uint64_t)v24, v41, &qword_100145558);
  uint64_t v33 = objc_allocWithZone((Class)sub_100005B18(&qword_100145560));
  v33[*(void *)(qword_100156E10 + (swift_isaMask & *(void *)v33) + 16)] = 1;
  sub_1000170C8(v32, v42, &qword_100145558);
  unsigned int v34 = (void *)UIHostingController.init(rootView:)();
  sub_100017388(v32, &qword_100145558);
  *((unsigned char *)v34 + *(void *)(qword_100156E10 + (swift_isaMask & *v34) + 16)) = v43 != 0;
  uint64_t result = [v34 view];
  if (result)
  {
    uint64_t v36 = result;
    id v37 = [self clearColor];
    [v36 setBackgroundColor:v37];

    sub_100017388((uint64_t)v24, &qword_100145558);
    return v34;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000DE1A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v29[1] = a4;
  v29[2] = a3;
  uint64_t v6 = type metadata accessor for OnboardingOverlayView();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005B18(&qword_1001454E8);
  uint64_t v11 = v10 - 8;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v30 = (uint64_t)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)v29 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)v29 - v17;
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = v4;
  v20[3] = v19;
  v20[4] = a2;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  id v21 = v4;
  OnboardingOverlayView.init(gameBundleID:dismissAction:)();
  uint64_t v22 = static SafeAreaRegions.all.getter();
  LOBYTE(a2) = static Edge.Set.all.getter();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v18, v9, v6);
  uint64_t v23 = &v18[*(int *)(v11 + 44)];
  *(void *)uint64_t v23 = v22;
  v23[8] = a2;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1000170C8((uint64_t)v18, (uint64_t)v16, &qword_1001454E8);
  uint64_t v24 = objc_allocWithZone((Class)sub_100005B18(&qword_1001454F0));
  v24[*(void *)(qword_100156E10 + (swift_isaMask & *(void *)v24) + 16)] = 1;
  sub_1000170C8((uint64_t)v16, v30, &qword_1001454E8);
  uint64_t v25 = (void *)UIHostingController.init(rootView:)();
  sub_100017388((uint64_t)v16, &qword_1001454E8);
  id result = [v25 view];
  if (result)
  {
    uint64_t v27 = result;
    id v28 = [self clearColor];
    [v27 setBackgroundColor:v28];

    sub_100017388((uint64_t)v18, &qword_1001454E8);
    return v25;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000DE4F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[17] = a7;
  v8[18] = a8;
  v8[15] = a5;
  v8[16] = a6;
  v8[14] = a4;
  type metadata accessor for MainActor();
  v8[19] = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  v8[20] = v10;
  v8[21] = v9;
  return _swift_task_switch(sub_1000DE598, v10, v9);
}

uint64_t sub_1000DE598()
{
  id v1 = (void *)v0[15];
  if (v1)
  {
    uint64_t v2 = v0[14];
    swift_bridgeObjectRetain();
    v8._countAndFlagsBits = v2;
    v8._object = v1;
    switch(sub_10008EB8C(v8))
    {
      case 2u:
        swift_bridgeObjectRelease();
        break;
      case 8u:
        goto LABEL_8;
      default:
        char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v3 & 1) == 0) {
          goto LABEL_8;
        }
        break;
    }
    if (qword_10013FCE8 != -1) {
      swift_once();
    }
    uint64_t v4 = qword_100156E08;
    v0[22] = qword_100156E08;
    uint64_t v5 = sub_1000DE7C0;
  }
  else
  {
LABEL_8:
    if (qword_10013FCE8 != -1) {
      swift_once();
    }
    uint64_t v4 = qword_100156E08;
    v0[25] = qword_100156E08;
    uint64_t v5 = sub_1000DEC10;
  }
  return _swift_task_switch(v5, v4, 0);
}

uint64_t sub_1000DE7C0()
{
  uint64_t v1 = *(void *)(v0 + 176);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  if (*(void *)(v2 + 16))
  {
    uint64_t v4 = *(void *)(v0 + 128);
    uint64_t v3 = *(void *)(v0 + 136);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_1000DC324(v4, v3);
    if (v6)
    {
      uint64_t v7 = *(void *)(*(void *)(v2 + 56) + 8 * v5);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_1000170C8(v7 + 32, v0 + 16, &qword_1001444D0);
      swift_release();
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
LABEL_6:
  uint64_t v8 = *(void *)(v0 + 160);
  uint64_t v9 = *(void *)(v0 + 168);
  return _swift_task_switch(sub_1000DE8F4, v8, v9);
}

uint64_t sub_1000DE8F4()
{
  if (v0[5])
  {
    sub_100005B18((uint64_t *)&unk_1001454D0);
    type metadata accessor for RemoteAlertDashboardContext(0);
    if (swift_dynamicCast())
    {
      uint64_t v1 = v0[13];
      v0[23] = v1;
      swift_getKeyPath();
      v0[2] = v1;
      sub_1000E5994(&qword_1001454E0, (void (*)(uint64_t))type metadata accessor for RemoteAlertDashboardContext);
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        [Strong didDismissDashboard];
        swift_unknownObjectRelease();
      }
      uint64_t v3 = qword_100156E08;
      v0[24] = qword_100156E08;
      uint64_t v4 = sub_1000DEA9C;
      goto LABEL_10;
    }
  }
  else
  {
    sub_100017388((uint64_t)(v0 + 2), &qword_1001444D0);
  }
  if (qword_10013FCE8 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_100156E08;
  v0[25] = qword_100156E08;
  uint64_t v4 = sub_1000DEC10;
LABEL_10:
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_1000DEA9C()
{
  uint64_t v1 = v0[24];
  uint64_t v3 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[16];
  sub_1000E0860(v4, v3, 0);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *(void *)(v1 + 112);
  *(void *)(v1 + 112) = 0x8000000000000000;
  sub_10006F5E0(v2, v4, v3, isUniquelyReferenced_nonNull_native);
  *(void *)(v1 + 112) = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v6 = v0[20];
  uint64_t v7 = v0[21];
  return _swift_task_switch(sub_1000DEBA8, v6, v7);
}

uint64_t sub_1000DEBA8()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000DEC10()
{
  uint64_t v1 = v0[25];
  uint64_t v3 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[16];
  sub_1000E0860(v4, v3, 0);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *(void *)(v1 + 112);
  *(void *)(v1 + 112) = 0x8000000000000000;
  sub_10006F5E0(v2, v4, v3, isUniquelyReferenced_nonNull_native);
  *(void *)(v1 + 112) = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v6 = v0[20];
  uint64_t v7 = v0[21];
  return _swift_task_switch(sub_1000DED1C, v6, v7);
}

uint64_t sub_1000DED1C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_1000DEE0C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = self;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  uint64_t v16 = sub_1000E5A60;
  uint64_t v17 = v7;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_1000DCCB0;
  uint64_t v15 = &unk_100134F40;
  uint64_t v8 = _Block_copy(&v12);
  id v9 = a1;
  swift_release();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  uint64_t v16 = sub_1000E5A6C;
  uint64_t v17 = v10;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_1000DF0C0;
  uint64_t v15 = &unk_100134F90;
  uint64_t v11 = _Block_copy(&v12);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  [v6 animateWithDuration:v8 animations:v11 completion:0.3];
  _Block_release(v11);
  _Block_release(v8);
}

uint64_t sub_1000DEFB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 24) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000DF04C, v6, v5);
}

uint64_t sub_1000DF04C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  [v1 didFinishOnboardingWithError:0];
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000DF0C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_1000DF114()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    [Strong invalidate];
  }
}

uint64_t sub_1000DF170(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorScheme();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.colorScheme.setter();
}

void sub_1000DF238(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100007D4C(v6, (uint64_t)qword_100156CF8);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "gameCenterDashboardViewController.dismissHandler called", v9, 2u);
    swift_slowDealloc();
  }

  uint64_t v10 = self;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  uint64_t v20 = sub_1000E5A60;
  uint64_t v21 = v11;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_1000DCCB0;
  uint64_t v19 = &unk_100135030;
  uint64_t v12 = _Block_copy(&v16);
  id v13 = a1;
  swift_release();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  uint64_t v20 = sub_1000E5E30;
  uint64_t v21 = v14;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_1000DF0C0;
  uint64_t v19 = &unk_100135080;
  uint64_t v15 = _Block_copy(&v16);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  [v10 animateWithDuration:v12 animations:v15 completion:0.3];
  _Block_release(v15);
  _Block_release(v12);
}

void sub_1000DF494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const char *a6)
{
  uint64_t v9 = sub_100005B18(&qword_100142A60);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v13 = Strong;
    [Strong invalidate];
  }
  if (a3)
  {
    uint64_t v14 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
    type metadata accessor for MainActor();
    swift_unknownObjectRetain();
    uint64_t v15 = static MainActor.shared.getter();
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = v15;
    v16[3] = &protocol witness table for MainActor;
    v16[4] = a3;
    sub_10002C340((uint64_t)v11, a5, (uint64_t)v16);
    swift_release();
  }
  else
  {
    if (qword_10013FBB0 != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    sub_100007D4C(v17, (uint64_t)qword_100156CF8);
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, a6, v20, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_1000DF6A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 24) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000DF73C, v6, v5);
}

uint64_t sub_1000DF73C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  [v1 didDismissDashboard];
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_1000DF7AC(void *a1, uint64_t a2)
{
  uint64_t v4 = self;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  id v13 = sub_1000E5A60;
  uint64_t v14 = v5;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 1107296256;
  uint64_t v11 = sub_1000DCCB0;
  uint64_t v12 = &unk_100135120;
  uint64_t v6 = _Block_copy(&v9);
  id v7 = a1;
  swift_release();
  id v13 = sub_1000E6148;
  uint64_t v14 = a2;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 1107296256;
  uint64_t v11 = sub_1000DF0C0;
  uint64_t v12 = &unk_100135148;
  uint64_t v8 = _Block_copy(&v9);
  swift_retain();
  swift_release();
  [v4 animateWithDuration:v6 animations:v8 completion:0.3];
  _Block_release(v8);
  _Block_release(v6);
}

void sub_1000DF930()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    [Strong invalidate];
  }
}

void sub_1000DFA7C(void *a1, uint64_t a2, void *a3, const char *a4)
{
  uint64_t v6 = qword_10013FBB0;
  id v12 = a3;
  id v7 = a1;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100007D4C(v8, (uint64_t)qword_100156CF8);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, a4, v11, 2u);
    swift_slowDealloc();
  }
}

id sub_1000DFC34(char *a1, uint64_t a2, void *a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&a1[*a3] = 0;
  v7.receiver = a1;
  v7.super_class = ObjectType;
  return [super init];
}

id sub_1000DFC80()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for GameOverlayUIRemoteAlertSceneDelegate()
{
  return self;
}

uint64_t sub_1000DFCEC()
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_100017388(v0 + 32, &qword_1001444D0);

  return swift_deallocClassInstance();
}

uint64_t sub_1000DFD3C()
{
  type metadata accessor for RemoteSceneManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  *(void *)(v0 + 112) = &_swiftEmptyDictionarySingleton;
  qword_100156E08 = v0;
  return result;
}

uint64_t sub_1000DFD84()
{
  uint64_t v1 = v0 + 112;
  swift_beginAccess();
  swift_retain();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_1000E1B08(v2, v0);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  swift_release();
  if (!v5) {
    goto LABEL_11;
  }
  uint64_t v6 = *(void *)v1;
  if (*(void *)(*(void *)v1 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1000DC324(v3, v5);
    if (v8)
    {
      uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_1000170C8(v9 + 32, (uint64_t)&v36, &qword_1001444D0);
      swift_release();
      if (*((void *)&v37 + 1))
      {
        sub_100069BBC(&v36, (uint64_t)v39);
        if (qword_10013FBB0 != -1) {
          goto LABEL_53;
        }
        goto LABEL_6;
      }
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v38 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
LABEL_10:
  swift_bridgeObjectRelease();
  sub_100017388((uint64_t)&v36, &qword_1001444D0);
LABEL_11:
  uint64_t v13 = *(void *)v1;
  uint64_t v14 = *(void *)v1 + 64;
  uint64_t v15 = 1 << *(unsigned char *)(*(void *)v1 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(*(void *)v1 + 64);
  int64_t v18 = (unint64_t)(v15 + 63) >> 6;
  swift_bridgeObjectRetain_n();
  int64_t v19 = 0;
  if (!v17) {
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v20 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (unint64_t i = v20 | (v19 << 6); ; unint64_t i = __clz(__rbit64(v23)) + (v19 << 6))
  {
    uint64_t v25 = (uint64_t *)(*(void *)(v13 + 48) + 16 * i);
    uint64_t v3 = *v25;
    uint64_t v5 = v25[1];
    v39[0] = *v25;
    v39[1] = v5;
    swift_bridgeObjectRetain();
    if (sub_1000E0664(v39))
    {
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v26 = *(void *)v1;
      if (*(void *)(*(void *)v1 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v27 = sub_1000DC324(v3, v5);
        if (v28)
        {
          uint64_t v29 = *(void *)(*(void *)(v26 + 56) + 8 * v27);
          swift_retain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_beginAccess();
          sub_1000170C8(v29 + 32, (uint64_t)&v36, &qword_1001444D0);
          swift_release();
          if (*((void *)&v37 + 1))
          {
            sub_100069BBC(&v36, (uint64_t)v39);
            if (qword_10013FBB0 != -1) {
              swift_once();
            }
            uint64_t v30 = type metadata accessor for Logger();
            sub_100007D4C(v30, (uint64_t)qword_100156CF8);
            swift_bridgeObjectRetain();
            uint64_t v11 = Logger.logObject.getter();
            os_log_type_t v12 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v11, v12)) {
              goto LABEL_43;
            }
            goto LABEL_48;
          }
LABEL_47:
          swift_bridgeObjectRelease();
          sub_100017388((uint64_t)&v36, &qword_1001444D0);
          char v32 = 0;
          return v32 & 1;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      uint64_t v38 = 0;
      long long v36 = 0u;
      long long v37 = 0u;
      goto LABEL_47;
    }
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_14;
    }
LABEL_15:
    if (__OFADD__(v19++, 1))
    {
      __break(1u);
      goto LABEL_52;
    }
    if (v19 >= v18) {
      goto LABEL_44;
    }
    unint64_t v23 = *(void *)(v14 + 8 * v19);
    if (!v23) {
      break;
    }
LABEL_29:
    unint64_t v17 = (v23 - 1) & v23;
  }
  int64_t v24 = v19 + 1;
  if (v19 + 1 >= v18) {
    goto LABEL_44;
  }
  unint64_t v23 = *(void *)(v14 + 8 * v24);
  if (v23) {
    goto LABEL_28;
  }
  int64_t v24 = v19 + 2;
  if (v19 + 2 >= v18) {
    goto LABEL_44;
  }
  unint64_t v23 = *(void *)(v14 + 8 * v24);
  if (v23) {
    goto LABEL_28;
  }
  int64_t v24 = v19 + 3;
  if (v19 + 3 >= v18) {
    goto LABEL_44;
  }
  unint64_t v23 = *(void *)(v14 + 8 * v24);
  if (v23) {
    goto LABEL_28;
  }
  int64_t v24 = v19 + 4;
  if (v19 + 4 >= v18) {
    goto LABEL_44;
  }
  unint64_t v23 = *(void *)(v14 + 8 * v24);
  if (v23) {
    goto LABEL_28;
  }
  int64_t v24 = v19 + 5;
  if (v19 + 5 >= v18)
  {
LABEL_44:
    swift_release();
    swift_bridgeObjectRelease();
    char v32 = 0;
    return v32 & 1;
  }
  unint64_t v23 = *(void *)(v14 + 8 * v24);
  if (v23)
  {
LABEL_28:
    int64_t v19 = v24;
    goto LABEL_29;
  }
  while (1)
  {
    int64_t v19 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v19 >= v18) {
      goto LABEL_44;
    }
    unint64_t v23 = *(void *)(v14 + 8 * v19);
    ++v24;
    if (v23) {
      goto LABEL_29;
    }
  }
LABEL_52:
  __break(1u);
LABEL_53:
  swift_once();
LABEL_6:
  uint64_t v10 = type metadata accessor for Logger();
  sub_100007D4C(v10, (uint64_t)qword_100156CF8);
  swift_bridgeObjectRetain();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (!os_log_type_enabled(v11, v12))
  {
LABEL_48:

    swift_bridgeObjectRelease_n();
    goto LABEL_49;
  }
LABEL_43:
  id v31 = (uint8_t *)swift_slowAlloc();
  *(void *)&long long v36 = swift_slowAlloc();
  *(_DWORD *)id v31 = 136315138;
  swift_bridgeObjectRetain();
  sub_100036BF8(v3, v5, (uint64_t *)&v36);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  _os_log_impl((void *)&_mh_execute_header, v11, v12, "dashboardDidDismiss: Requesting the dashboard [%s] to be dismissed..", v31, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

LABEL_49:
  uint64_t v33 = v40;
  uint64_t v34 = v41;
  sub_100006650(v39, v40);
  char v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 32))(v33, v34);
  sub_100007188((uint64_t)v39);
  return v32 & 1;
}

uint64_t sub_1000E03A4(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v3 = a1[1];
  v5._object = (void *)0x80000001000FC1C0;
  v5._countAndFlagsBits = 0xD000000000000018;
  BOOL v6 = String.hasPrefix(_:)(v5);
  swift_beginAccess();
  if (*(void *)(*(void *)(a2 + 112) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000DC324(v4, v3);
    if (v7)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
      swift_release();
      if (Strong)
      {

        int v9 = 1;
        goto LABEL_7;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  int v9 = 0;
LABEL_7:
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_100007D4C(v10, (uint64_t)qword_100156CF8);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315650;
    swift_bridgeObjectRetain();
    sub_100036BF8(v4, v3, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v13 + 18) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "dashboardDidDismiss: [%s] Is this a dashboard token? %{BOOL}d, is the scene valid? %{BOOL}d", (uint8_t *)v13, 0x18u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v6 & v9;
}

BOOL sub_1000E0664(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v1 = a1[1];
  v3._object = (void *)0x80000001000FC180;
  v3._countAndFlagsBits = 0xD00000000000001BLL;
  Swift::Bool v4 = String.hasPrefix(_:)(v3);
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100007D4C(v5, (uint64_t)qword_100156CF8);
  swift_bridgeObjectRetain_n();
  BOOL v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    swift_bridgeObjectRetain();
    sub_100036BF8(v2, v1, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "dashboardDidDismiss: [%s] Is this an accessPoint token? %{BOOL}d", (uint8_t *)v8, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v4;
}

void sub_1000E0860(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = sub_100005B18(&qword_100142A60);
  __chkstk_darwin(v7 - 8);
  int v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  if (*(void *)(*(void *)(v3 + 112) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000DC324(a1, a2);
    if ((v10 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    swift_retain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    swift_release();
    if (!Strong) {
      return;
    }
    if (*(void *)(*(void *)(v3 + 112) + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1000DC324(a1, a2);
      if (v12)
      {
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v13 = (void *)swift_unknownObjectWeakLoadStrong();
        swift_release();
LABEL_10:
        swift_beginAccess();
        swift_bridgeObjectRetain();
        sub_1000E12B4(a1, a2, (void (*)(unint64_t, uint64_t))sub_100037634, (void (*)(void))sub_1000700B4);
        swift_endAccess();
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v14 = type metadata accessor for TaskPriority();
        (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
        type metadata accessor for MainActor();
        id v15 = v13;
        id v16 = Strong;
        swift_bridgeObjectRetain();
        uint64_t v17 = static MainActor.shared.getter();
        uint64_t v18 = swift_allocObject();
        *(void *)(v18 + 16) = v17;
        *(void *)(v18 + 24) = &protocol witness table for MainActor;
        *(void *)(v18 + 32) = v13;
        *(void *)(v18 + 40) = v16;
        *(void *)(v18 + 48) = a1;
        *(void *)(v18 + 56) = a2;
        *(unsigned char *)(v18 + 64) = a3 & 1;
        sub_10002C340((uint64_t)v9, (uint64_t)&unk_100145498, v18);
        swift_release();

        return;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v13 = 0;
    goto LABEL_10;
  }
}

uint64_t sub_1000E0B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(unsigned char *)(v8 + 104) = a8;
  *(void *)(v8 + 80) = a6;
  *(void *)(v8 + 88) = a7;
  *(void *)(v8 + 64) = a4;
  *(void *)(v8 + 72) = a5;
  type metadata accessor for MainActor();
  *(void *)(v8 + 96) = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000E0BD8, v10, v9);
}

void sub_1000E0BD8()
{
  uint64_t v25 = v0;
  uint64_t v1 = *(void *)(v0 + 64);
  swift_release();
  if (!v1)
  {
    id v3 = [*(id *)(v0 + 72) windows];
    sub_100069708(0, &qword_1001454A0);
    unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v2 = (void *)_CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v2) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v2 = *(void **)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v2)
      {
LABEL_5:
        if ((v4 & 0xC000000000000001) != 0)
        {
          id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v5 = *(id *)(v4 + 32);
        }
        uint64_t v2 = v5;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v2 = *(void **)(v0 + 64);
LABEL_10:
  uint64_t v6 = qword_10013FBB0;
  id v7 = *(id *)(v0 + 64);
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100007D4C(v8, (uint64_t)qword_100156CF8);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  BOOL v11 = os_log_type_enabled(v9, v10);
  unint64_t v12 = *(void *)(v0 + 88);
  if (v11)
  {
    uint64_t v13 = *(void *)(v0 + 80);
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16) = sub_100036BF8(v13, v12, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Attempting to dismiss remote alert for token: %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  id v15 = *(void **)(v0 + 72);
  if (*(unsigned char *)(v0 + 104) == 1)
  {
    id v16 = self;
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v2;
    *(void *)(v0 + 48) = sub_1000E1AC4;
    *(void *)(v0 + 56) = v17;
    *(void *)(v0 + 16) = _NSConcreteStackBlock;
    *(void *)(v0 + 24) = 1107296256;
    *(void *)(v0 + 32) = sub_1000DCCB0;
    *(void *)(v0 + 40) = &unk_100134DD8;
    uint64_t v18 = _Block_copy((const void *)(v0 + 16));
    id v19 = v2;
    swift_release();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v15;
    *(void *)(v0 + 48) = sub_1000E1AF8;
    *(void *)(v0 + 56) = v20;
    *(void *)(v0 + 16) = _NSConcreteStackBlock;
    *(void *)(v0 + 24) = 1107296256;
    *(void *)(v0 + 32) = sub_1000DF0C0;
    *(void *)(v0 + 40) = &unk_100134E28;
    uint64_t v21 = _Block_copy((const void *)(v0 + 16));
    id v22 = v15;
    swift_release();
    [v16 animateWithDuration:v18 animations:v21 completion:0.3];

    _Block_release(v21);
    _Block_release(v18);
  }
  else
  {
    [*(id *)(v0 + 72) invalidate];
  }
  unint64_t v23 = *(void (**)(void))(v0 + 8);
  v23();
}

uint64_t sub_1000E1020@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v7 = (uint64_t *)(v3 + 112);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v9 = sub_1000E17EC(v8, a1, a2);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v11)
  {
    *(void *)(a3 + 48) = 0;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
    return result;
  }
  uint64_t v13 = *v7;
  if (!*(void *)(v13 + 16)) {
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_1000DC324(v9, v11);
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_7:
    uint64_t v18 = 0;
    memset(v17, 0, sizeof(v17));
    goto LABEL_8;
  }
  uint64_t v16 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_1000170C8(v16 + 32, (uint64_t)v17, &qword_1001444D0);
  swift_release();
LABEL_8:
  sub_1000E0860(v9, v11, 0);
  *(void *)a3 = v9;
  *(void *)(a3 + 8) = v11;
  return sub_10006919C((uint64_t)v17, a3 + 16);
}

uint64_t type metadata accessor for RemoteSceneManager()
{
  return self;
}

uint64_t type metadata accessor for RemoteSceneManager.WeakScene()
{
  return self;
}

uint64_t sub_1000E11E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1000DC324(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10006FEFC();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_10003745C(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1000E12B4(uint64_t a1, uint64_t a2, void (*a3)(unint64_t, uint64_t), void (*a4)(void))
{
  char v7 = v4;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_1000DC324(a1, a2);
  LOBYTE(a2) = v11;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v7;
  uint64_t v16 = *v7;
  *char v7 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a4();
    uint64_t v13 = v16;
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(*(void *)(v13 + 56) + 8 * v10);
  a3(v10, v13);
  *char v7 = v13;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1000E139C(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_1000DC464(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      Swift::Int v9 = *v2;
      Swift::Int v17 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_10007027C();
        Swift::Int v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = __CocoaDictionary.lookup(_:)();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = __CocoaDictionary.count.getter();
  Swift::Int v9 = sub_10006DB6C(v5, v8);
  swift_retain();
  a1 = sub_1000DC464((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  sub_100037638(a1, v9);
  *uint64_t v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

void sub_1000E14EC(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_100069708(0, &qword_1001454A8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  __CocoaSet.Index.element.getter();
  sub_100069708(0, &qword_1001454A8);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = static NSObject.== infix(_:_:)();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = static NSObject.== infix(_:_:)();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  uint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_1000E1764(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1000E17EC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = a1 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t j = 0;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v13 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v13 | (j << 6); ; unint64_t i = __clz(__rbit64(v16)) + (j << 6))
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 16 * i);
    swift_bridgeObjectRetain();
    v19._countAndFlagsBits = a2;
    v19._object = a3;
    if (String.hasPrefix(_:)(v19))
    {
      swift_release();
      return v18;
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v15 = j + 1;
    if (__OFADD__(j, 1)) {
      break;
    }
    if (v15 >= v10) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++j;
    if (v16) {
      goto LABEL_19;
    }
    int64_t j = v15 + 1;
    if (v15 + 1 >= v10) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v6 + 8 * j);
    if (v16) {
      goto LABEL_19;
    }
    int64_t j = v15 + 2;
    if (v15 + 2 >= v10) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v6 + 8 * j);
    if (v16) {
      goto LABEL_19;
    }
    int64_t j = v15 + 3;
    if (v15 + 3 >= v10) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v6 + 8 * j);
    if (v16) {
      goto LABEL_19;
    }
    int64_t v17 = v15 + 4;
    if (v17 >= v10)
    {
LABEL_24:
      swift_release();
      return 0;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v17);
    for (int64_t j = v17; !v16; ++v17)
    {
      int64_t j = v17 + 1;
      if (__OFADD__(v17, 1)) {
        goto LABEL_27;
      }
      if (j >= v10) {
        goto LABEL_24;
      }
      unint64_t v16 = *(void *)(v6 + 8 * j);
    }
LABEL_19:
    unint64_t v9 = (v16 - 1) & v16;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1000E1998()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 65, 7);
}

uint64_t sub_1000E19E8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_10003E30C;
  return sub_1000E0B38(a1, v4, v5, v6, v7, v8, v9, v10);
}

id sub_1000E1AC4()
{
  id result = *(id *)(v0 + 16);
  if (result) {
    return [result setAlpha:0.0];
  }
  return result;
}

uint64_t sub_1000E1AE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000E1AF0()
{
  return swift_release();
}

id sub_1000E1AF8()
{
  return [*(id *)(v0 + 16) invalidate];
}

uint64_t sub_1000E1B08(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    v22[0] = *v17;
    v22[1] = v18;
    swift_bridgeObjectRetain();
    char v20 = sub_1000E03A4(v22, a2);
    if (v2)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return v19;
    }
    if (v20)
    {
      swift_release();
      return v19;
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v11++, 1)) {
      break;
    }
    if (v11 >= v9) {
      goto LABEL_28;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v11);
    if (!v15)
    {
      int64_t v16 = v11 + 1;
      if (v11 + 1 >= v9) {
        goto LABEL_28;
      }
      unint64_t v15 = *(void *)(v5 + 8 * v16);
      if (v15) {
        goto LABEL_14;
      }
      int64_t v16 = v11 + 2;
      if (v11 + 2 >= v9) {
        goto LABEL_28;
      }
      unint64_t v15 = *(void *)(v5 + 8 * v16);
      if (v15) {
        goto LABEL_14;
      }
      int64_t v16 = v11 + 3;
      if (v11 + 3 >= v9) {
        goto LABEL_28;
      }
      unint64_t v15 = *(void *)(v5 + 8 * v16);
      if (v15)
      {
LABEL_14:
        int64_t v11 = v16;
        goto LABEL_15;
      }
      int64_t v21 = v11 + 4;
      if (v11 + 4 >= v9)
      {
LABEL_28:
        swift_release();
        return 0;
      }
      unint64_t v15 = *(void *)(v5 + 8 * v21);
      for (v11 += 4; !v15; ++v21)
      {
        int64_t v11 = v21 + 1;
        if (__OFADD__(v21, 1)) {
          goto LABEL_31;
        }
        if (v11 >= v9) {
          goto LABEL_28;
        }
        unint64_t v15 = *(void *)(v5 + 8 * v11);
      }
    }
LABEL_15:
    unint64_t v8 = (v15 - 1) & v15;
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

unint64_t sub_1000E1CD8()
{
  unint64_t result = qword_1001454B0;
  if (!qword_1001454B0)
  {
    sub_100069708(255, &qword_1001454A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1001454B0);
  }
  return result;
}

void sub_1000E1D40(void *a1)
{
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007D4C(v2, (uint64_t)qword_100156CF8);
  id v10 = a1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    id v6 = [v10 role];
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v9 = v8;

    sub_100036BF8(v7, v9, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Scene willConnectTo session: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

id sub_1000E1F48()
{
  return [v0 setNeedsUpdateOfSupportedInterfaceOrientations];
}

uint64_t sub_1000E1F58(uint64_t a1)
{
  __chkstk_darwin(a1);
  *(unsigned char *)(v1 + *(void *)(v3 + 16)) = 1;
  (*(void (**)(char *))(v4 + 16))((char *)&v6 - v2);
  return UIHostingController.init(rootView:)();
}

id sub_1000E2050()
{
  static HorizontalAlignment.center.getter();
  sub_100025F34();
  swift_bridgeObjectRetain();
  uint64_t v0 = Text.init<A>(_:)();
  uint64_t v2 = v1;
  char v4 = v3 & 1;
  uint64_t v5 = objc_allocWithZone((Class)sub_100005B18(&qword_1001455B8));
  v5[*(void *)(qword_100156E10 + (swift_isaMask & *(void *)v5) + 16)] = 1;
  swift_bridgeObjectRetain();
  sub_100025F98(v0, v2, v4);
  uint64_t v6 = (void *)UIHostingController.init(rootView:)();
  id result = [v6 view];
  if (result)
  {
    unint64_t v8 = result;
    id v9 = [self clearColor];
    [v8 setBackgroundColor:v9];
    sub_100025F88(v0, v2, v4);

    swift_bridgeObjectRelease();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000E21E8()
{
  uint64_t v0 = type metadata accessor for ActivitySharingRepromptOverlayView();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  char v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)&v17 - v6;
  __chkstk_darwin(v5);
  id v9 = (char *)&v17 - v8;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  ActivitySharingRepromptOverlayView.init(recipientName:dismissAction:)();
  id v10 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
  v10(v7, v9, v0);
  uint64_t v11 = objc_allocWithZone((Class)sub_100005B18(&qword_100145508));
  *((unsigned char *)v11 + *(void *)(qword_100156E10 + (swift_isaMask & *v11) + 16)) = 1;
  v10(v4, v7, v0);
  unint64_t v12 = (void *)UIHostingController.init(rootView:)();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13(v7, v0);
  id result = [v12 view];
  if (result)
  {
    unint64_t v15 = result;
    id v16 = [self clearColor];
    [v15 setBackgroundColor:v16];

    v13(v9, v0);
    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000E247C(unsigned char *a1, int a2, void *a3)
{
  id v53 = a3;
  int v54 = a2;
  uint64_t v4 = type metadata accessor for ColorScheme();
  uint64_t v59 = *(void *)(v4 - 8);
  uint64_t v60 = v4;
  __chkstk_darwin(v4);
  uint64_t v58 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005B18(&qword_100145510);
  __chkstk_darwin(v6 - 8);
  char v49 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AccessPointView();
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_100005B18(&qword_100145518);
  __chkstk_darwin(v55);
  unint64_t v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005B18(&qword_100145520);
  uint64_t v62 = *(void *)(v13 - 8);
  uint64_t v63 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v56 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v57 = (char *)&v49 - v17;
  __chkstk_darwin(v16);
  unint64_t v61 = (char *)&v49 - v18;
  swift_getKeyPath();
  *(void *)&long long v65 = a1;
  uint64_t v51 = sub_1000E5994((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  unsigned __int8 v19 = a1[OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__didReturnToForeground];
  char v20 = self;
  id v21 = [v20 authenticatedLocalPlayers];
  uint64_t v22 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(void *)(v22 + 16))
  {
    sub_100036E88(v22 + 32, (uint64_t)&v65);
  }
  else
  {
    long long v65 = 0u;
    long long v66 = 0u;
  }
  swift_bridgeObjectRelease();
  uint64_t v52 = v12;
  uint64_t v50 = v10;
  if (*((void *)&v66 + 1))
  {
    sub_100069708(0, &qword_100145550);
    if (swift_dynamicCast())
    {
      uint64_t v23 = (uint64_t)v49;
      id v24 = v64;
      goto LABEL_9;
    }
  }
  else
  {
    sub_100017388((uint64_t)&v65, &qword_100142A70);
  }
  uint64_t v23 = (uint64_t)v49;
  id v24 = [v20 currentLocalPlayer];
LABEL_9:
  swift_getKeyPath();
  *(void *)&long long v65 = a1;
  id v25 = v53;
  id v26 = v53;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  unint64_t v27 = &a1[OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__anchoring];
  swift_beginAccess();
  uint64_t v28 = type metadata accessor for AccessPointAnchoring();
  uint64_t v29 = *(void *)(v28 - 8);
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v29 + 16))(v23, v27, v28);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v29 + 56))(v23, 0, 1, v28);
  swift_getKeyPath();
  uint64_t v64 = a1;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v30 = (uint64_t)v50;
  sub_1000C0D60(v24, v25, v23, v54, (v19 ^ 1) & 1, a1[OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__newToGameCenter], (uint64_t)v50);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = v58;
  uint64_t v32 = v59;
  uint64_t v34 = v60;
  (*(void (**)(char *, void, uint64_t))(v59 + 104))(v58, enum case for ColorScheme.dark(_:), v60);
  uint64_t v35 = (uint64_t)v52;
  long long v36 = (uint64_t *)&v52[*(int *)(v55 + 36)];
  uint64_t v37 = sub_100005B18(&qword_100145528);
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))((char *)v36 + *(int *)(v37 + 28), v33, v34);
  *long long v36 = KeyPath;
  sub_1000E5F68(v30, v35, (uint64_t (*)(void))type metadata accessor for AccessPointView);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  sub_1000E5FD0(v30, (uint64_t (*)(void))type metadata accessor for AccessPointView);
  type metadata accessor for RemoteAlertAccessPointContext(0);
  sub_1000E5BF4();
  uint64_t v38 = v61;
  View.environment<A>(_:)();
  sub_100017388(v35, &qword_100145518);
  uint64_t v39 = v62;
  uint64_t v40 = v63;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
  uint64_t v42 = v57;
  v41(v57, v38, v63);
  uint64_t v43 = objc_allocWithZone((Class)sub_100005B18(&qword_100145548));
  v43[*(void *)(qword_100156E10 + (swift_isaMask & *(void *)v43) + 16)] = 1;
  v41(v56, v42, v40);
  uint64_t v44 = (void *)UIHostingController.init(rootView:)();
  char v45 = *(void (**)(char *, uint64_t))(v39 + 8);
  v45(v42, v40);
  id result = [v44 view];
  if (result)
  {
    uint64_t v47 = result;
    id v48 = [self clearColor];
    [v47 setBackgroundColor:v48];

    v45(v38, v40);
    return v44;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000E2BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11)
{
  uint64_t v58 = a4;
  uint64_t v59 = a8;
  uint64_t v51 = a6;
  unint64_t v52 = a7;
  uint64_t v56 = a2;
  uint64_t v57 = type metadata accessor for ColorScheme();
  uint64_t v14 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  int v54 = (char *)v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for InGameBannerView();
  __chkstk_darwin(v16 - 8);
  uint64_t v48 = (uint64_t)v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100005B18(&qword_100145578);
  __chkstk_darwin(v50);
  unsigned __int8 v19 = (char *)v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_100005B18(&qword_100145580);
  uint64_t v60 = *(void *)(v53 - 8);
  uint64_t v20 = __chkstk_darwin(v53);
  unint64_t v61 = (char *)v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v55 = (char *)v47 - v23;
  __chkstk_darwin(v22);
  char v49 = (char *)v47 - v24;
  swift_getKeyPath();
  uint64_t v62 = a1;
  v47[0] = a1;
  v47[1] = sub_1000E5994((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  LODWORD(a1) = *(unsigned __int8 *)(a1 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__useCase);
  uint64_t v25 = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v27 = v51;
  uint64_t v26 = v52;
  sub_1000244B8(v51, v52);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v28 = a10;
  uint64_t v29 = v48;
  sub_100074BC4(a1, v56, a3, v58, v25, v27, v26, v59, v48, a9, a10, a11);
  uint64_t KeyPath = swift_getKeyPath();
  id v31 = v54;
  uint64_t v32 = v57;
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v54, enum case for ColorScheme.dark(_:), v57);
  uint64_t v33 = (uint64_t *)&v19[*(int *)(v50 + 36)];
  uint64_t v34 = sub_100005B18(&qword_100145528);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))((char *)v33 + *(int *)(v34 + 28), v31, v32);
  *uint64_t v33 = KeyPath;
  sub_1000E5F68(v29, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for InGameBannerView);
  uint64_t v35 = v31;
  uint64_t v36 = v53;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v35, v32);
  uint64_t v37 = v49;
  sub_1000E5FD0(v29, (uint64_t (*)(void))type metadata accessor for InGameBannerView);
  type metadata accessor for RemoteAlertAccessPointContext(0);
  sub_1000E6030();
  View.environment<A>(_:)();
  sub_100017388((uint64_t)v19, &qword_100145578);
  uint64_t v38 = v60;
  uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
  uint64_t v40 = v55;
  v39(v55, v37, v36);
  uint64_t v41 = objc_allocWithZone((Class)sub_100005B18(&qword_100145598));
  v41[*(void *)(qword_100156E10 + (swift_isaMask & *(void *)v41) + 16)] = 1;
  v39(v61, v40, v36);
  uint64_t v42 = (void *)UIHostingController.init(rootView:)();
  uint64_t v43 = *(void (**)(char *, uint64_t))(v38 + 8);
  v43(v40, v36);
  id result = [v42 view];
  if (result)
  {
    char v45 = result;
    id v46 = [self clearColor];
    [v45 setBackgroundColor:v46];

    v43(v37, v36);
    return v42;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000E3160()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005B18(&qword_100145528);
  uint64_t v3 = v2 - 8;
  __chkstk_darwin(v2);
  uint64_t v5 = (uint64_t *)((char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for ColorScheme();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005B18(&qword_1001455A0);
  uint64_t v11 = v10 - 8;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v29 = (uint64_t)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v28 = (uint64_t)&v28 - v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (void (**)())((char *)&v28 - v16);
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v1;
  *(void *)(v19 + 24) = v18;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for ColorScheme.dark(_:), v6);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 36), v9, v6);
  *uint64_t v5 = KeyPath;
  sub_1000170C8((uint64_t)v5, (uint64_t)v17 + *(int *)(v11 + 44), &qword_100145528);
  uint64_t *v17 = sub_1000E611C;
  v17[1] = (void (*)())v19;
  id v21 = v1;
  swift_retain();
  sub_100017388((uint64_t)v5, &qword_100145528);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  uint64_t v22 = v28;
  sub_1000170C8((uint64_t)v17, v28, &qword_1001455A0);
  uint64_t v23 = objc_allocWithZone((Class)sub_100005B18(&qword_1001455A8));
  *((unsigned char *)v23 + *(void *)(qword_100156E10 + (swift_isaMask & *v23) + 16)) = 1;
  sub_1000170C8(v22, v29, &qword_1001455A0);
  uint64_t v24 = (void *)UIHostingController.init(rootView:)();
  sub_100017388(v22, &qword_1001455A0);
  id result = [v24 view];
  if (result)
  {
    uint64_t v26 = result;
    id v27 = [self clearColor];
    [v26 setBackgroundColor:v27];

    sub_100017388((uint64_t)v17, &qword_1001455A0);
    return v24;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1000E3534(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005B18(&qword_100142A60);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v153 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  self;
  uint64_t v7 = swift_dynamicCastObjCClass();
  uint64_t v8 = qword_10013FBB0;
  if (!v7)
  {
    if (qword_10013FBB0 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_100007D4C(v22, (uint64_t)qword_100156CF8);
    uint64_t v173 = a1;
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 138412290;
      *(void *)&long long v181 = v173;
      id v27 = v173;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v26 = v173;

      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Expected scene to be SBSUIRemoteAlertScene but got %@", v25, 0xCu);
      sub_100005B18(&qword_100142A40);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      int v54 = v173;
    }
    return;
  }
  uint64_t v9 = (void *)v7;
  unint64_t v170 = v6;
  id v10 = a1;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100007D4C(v11, (uint64_t)qword_100156CF8);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Remote Alert scene will connect", v14, 2u);
    swift_slowDealloc();
  }

  id v15 = [objc_allocWithZone((Class)type metadata accessor for GameOverlayWindow()) initWithWindowScene:v9];
  uint64_t v16 = OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window;
  uint64_t v17 = *(void **)(v2 + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window);
  *(void *)(v2 + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window) = v15;

  id v18 = [v9 configurationIdentifier];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v171 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v21 = v20;
  }
  else
  {
    uint64_t v171 = 0;
    id v21 = 0;
  }
  uint64_t v173 = v16;
  id v28 = [v9 activationContext];
  if (!v28
    || (uint64_t v29 = v28, v30 = [v28 userInfo], v29, !v30))
  {
    uint64_t v183 = 0;
    long long v32 = 0uLL;
    long long v181 = 0u;
    long long v182 = 0u;
    goto LABEL_20;
  }
  uint64_t v31 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v183 = 0;
  long long v32 = 0uLL;
  long long v181 = 0u;
  long long v182 = 0u;
  if (!v31)
  {
LABEL_20:
    long long v179 = v32;
    long long v180 = v32;
LABEL_21:
    sub_100017388((uint64_t)&v179, &qword_100142A70);
    goto LABEL_22;
  }
  unint64_t v174 = 0xD000000000000011;
  unint64_t v175 = 0x80000001000FCF40;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v31 + 16) && (unint64_t v33 = sub_1000DC420((uint64_t)v176), (v34 & 1) != 0))
  {
    sub_100036E88(*(void *)(v31 + 56) + 32 * v33, (uint64_t)&v179);
  }
  else
  {
    long long v179 = 0u;
    long long v180 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100086324((uint64_t)v176);
  if (!*((void *)&v180 + 1)) {
    goto LABEL_21;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v56 = v176[0];
  uint64_t v57 = v176[1];
  if (qword_10013FCF0 != -1) {
    swift_once();
  }
  uint64_t v58 = qword_100156E20;
  swift_beginAccess();
  uint64_t v59 = *(void *)(v58 + 16);
  if (!*(void *)(v59 + 16))
  {
LABEL_96:
    swift_endAccess();
    swift_bridgeObjectRelease();
LABEL_22:
    uint64_t v35 = 0;
    uint64_t v36 = v173;
    if (!v21)
    {
LABEL_24:
      uint64_t v38 = 0;
      uint64_t v169 = 0;
      id v172 = 0;
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  swift_bridgeObjectRetain();
  unint64_t v60 = sub_1000DC324(v56, v57);
  if ((v61 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_96;
  }
  uint64_t v62 = *(__objc2_class ***)(*(void *)(v59 + 56) + 8 * v60);
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_1000E12B4(v56, v57, (void (*)(unint64_t, uint64_t))sub_100037634, (void (*)(void))sub_1000700C0);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v35 = v62;
  uint64_t v36 = v173;
  if (!v21) {
    goto LABEL_24;
  }
LABEL_23:
  swift_bridgeObjectRetain();
  v186._countAndFlagsBits = v171;
  v186._object = v21;
  char v37 = sub_10008EB8C(v186);
  if (v37 == 8) {
    goto LABEL_24;
  }
  char v43 = v37;
  if (v35 && (uint64_t v44 = v35[2]) != 0)
  {
    id v172 = v9;
    char v45 = v35;
    id v46 = v10;
    uint64_t v48 = (uint64_t)v45[13];
    uint64_t v47 = v45[14];
    swift_bridgeObjectRetain();
    char v49 = v44;
    uint64_t v50 = v48;
    id v10 = v46;
    uint64_t v35 = v45;
    uint64_t v9 = v172;
    uint64_t v169 = sub_1000E61EC(v43, v50, v47);
    unint64_t v52 = v51;

    uint64_t v36 = v173;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v53 = &v184;
    uint64_t v169 = 0;
    unint64_t v52 = 0;
  }
  id v172 = v52;
  switch((int)v53)
  {
    case 1:
      if (v35 && *v35 == _TtC13GameOverlayUI29InGameBannerConnectionContext)
      {
        swift_beginAccess();
        sub_1000170C8((uint64_t)(v35 + 8), (uint64_t)v176, &qword_1001444D0);
        if (v177)
        {
          swift_retain();
          sub_100005B18((uint64_t *)&unk_1001454D0);
          uint64_t v102 = (__objc2_class **)type metadata accessor for RemoteAlertAccessPointContext(0);
          if (swift_dynamicCast())
          {
            p_Class isa = v102;
            id v167 = v10;
            uint64_t v103 = v179;
            uint64_t v166 = (__objc2_class **)v179;
            uint64_t v104 = v35[23];
            uint64_t KeyPath = (__objc2_class *)swift_getKeyPath();
            uint64_t v162 = (id *)&v153;
            __chkstk_darwin(KeyPath);
            uint64_t v105 = v103 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext___observationRegistrar;
            v176[0] = v103;
            uint64_t v106 = (void *)sub_1000E5994((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
            uint64_t v160 = v104;
            uint64_t v163 = (id *)((char *)&type metadata for () + 8);
            id v164 = v106;
            uint64_t v165 = (id *)v105;
            ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
            swift_release();

            unint64_t v107 = *(Class *)((char *)&v173->isa + v2);
            if (v107)
            {
              int v159 = v35[15];
              uint64_t v162 = (id *)v35[16];
              uint64_t v108 = (uint64_t)v35[18];
              uint64_t v158 = v35[17];
              uint64_t v156 = v108;
              unint64_t v110 = (unint64_t)v35[20];
              unint64_t v154 = v35[19];
              uint64_t v109 = (uint64_t)v154;
              uint64_t v111 = (uint64_t)v35[22];
              uint64_t v157 = v35[21];
              v155 = v35[23];
              uint64_t KeyPath = 0;
              uint64_t v112 = (uint64_t)v35[24];
              swift_bridgeObjectRetain();
              uint64_t v160 = v107;
              uint64_t v113 = v162;
              swift_bridgeObjectRetain();
              sub_1000244B8(v109, v110);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              unint64_t v114 = v155;
              uint64_t v153 = v155;
              uint64_t v115 = (uint64_t)v113;
              uint64_t v116 = (uint64_t)v154;
              int v159 = (__objc2_class *)sub_1000E2BD0((uint64_t)v166, (uint64_t)v159, v115, (uint64_t)v158, v156, (uint64_t)v154, v110, (uint64_t)v157, v111, v114, v112);
              swift_bridgeObjectRelease();

              swift_bridgeObjectRelease();
              sub_1000247B8(v116, v110);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v117 = v160;
              uint64_t v118 = v159;
              [(__objc2_class *)v160 setRootViewController:v159];
            }
            uint64_t v177 = p_isa;
            uint64_t v178 = &off_100134CA8;
            uint64_t v119 = (uint64_t)v166;
            v176[0] = v166;
            swift_retain();
            sub_100017388((uint64_t)&v181, &qword_1001444D0);
            sub_10006919C((uint64_t)v176, (uint64_t)&v181);
            uint64_t v120 = swift_getKeyPath();
            uint64_t v162 = (id *)&v153;
            __chkstk_darwin(v120);
            v176[0] = v119;
            p_Class isa = v35;
            id v121 = v167;
            id v122 = v167;
            ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
            swift_release();

            id v10 = v121;
            uint64_t v35 = p_isa;
            goto LABEL_150;
          }
          swift_release();
        }
        else
        {
          sub_100017388((uint64_t)v176, &qword_1001444D0);
        }
      }
      uint64_t v55 = *(Class *)((char *)&v36->isa + v2);
      if (!v55) {
        goto LABEL_75;
      }
      goto LABEL_74;
    case 2:
      id v167 = v10;
      if (!v35 || *v35 != _TtC13GameOverlayUI26DashboardConnectionContext) {
        goto LABEL_60;
      }
      swift_beginAccess();
      sub_1000170C8((uint64_t)(v35 + 8), (uint64_t)v176, &qword_1001444D0);
      if (v177)
      {
        swift_retain();
        sub_100005B18((uint64_t *)&unk_1001454D0);
        uint64_t v123 = type metadata accessor for RemoteAlertDashboardContext(0);
        if (swift_dynamicCast())
        {
          uint64_t v124 = v179;
          p_Class isa = v35 + 3;
          sub_1000170C8((uint64_t)(v35 + 3), (uint64_t)v176, &qword_100142A70);
          uint64_t v166 = (__objc2_class **)v123;
          if (v177)
          {
            sub_100005B18((uint64_t *)&unk_100144A90);
            swift_dynamicCast();
          }
          else
          {
            sub_100017388((uint64_t)v176, &qword_100142A70);
          }
          uint64_t v150 = swift_getKeyPath();
          uint64_t v165 = (id *)&v153;
          __chkstk_darwin(v150);
          v176[0] = v124;
          sub_1000E5994(&qword_1001454E0, (void (*)(uint64_t))type metadata accessor for RemoteAlertDashboardContext);
          ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
          swift_release();
          swift_unknownObjectRelease();
          uint64_t v177 = v166;
          uint64_t v178 = &off_100134C80;
          v176[0] = v124;
          sub_100017388((uint64_t)&v181, &qword_1001444D0);
          sub_10006919C((uint64_t)v176, (uint64_t)&v181);
          uint64_t v98 = v35[15];
          uint64_t v38 = *((unsigned __int8 *)v35 + 128);
          sub_1000170C8((uint64_t)p_isa, (uint64_t)v176, &qword_100142A70);
          uint64_t v151 = v98;
          swift_release();
          if (v177)
          {
            sub_100005B18((uint64_t *)&unk_100144A90);
            if (swift_dynamicCast()) {
              int v152 = (void *)v179;
            }
            else {
              int v152 = 0;
            }
          }
          else
          {
            sub_100017388((uint64_t)v176, &qword_100142A70);
            int v152 = 0;
          }
          uint64_t v36 = v173;
          long long v66 = *(Class *)((char *)&v173->isa + v2);
          if (v66)
          {
            id v164 = v152;
            p_Class isa = &v98->isa;
            goto LABEL_65;
          }
LABEL_103:
          swift_unknownObjectRelease();

          goto LABEL_129;
        }
        swift_release();
      }
      else
      {
        sub_100017388((uint64_t)v176, &qword_1001444D0);
      }
LABEL_60:
      uint64_t v63 = Logger.logObject.getter();
      os_log_type_t v64 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v63, v64))
      {
        long long v65 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)long long v65 = 0;
        _os_log_impl((void *)&_mh_execute_header, v63, v64, "A valid RemoteAlertDashboardContext could not be found for the dashboard request.", v65, 2u);
        uint64_t v36 = v173;
        swift_slowDealloc();
      }

      long long v66 = *(Class *)((char *)&v36->isa + v2);
      if (!v66)
      {
        uint64_t v98 = 0;
        uint64_t v38 = 0;
        goto LABEL_103;
      }
      uint64_t v38 = 0;
      if (v35)
      {
        id v164 = 0;
        p_Class isa = 0;
LABEL_65:
        uint64_t v67 = (uint64_t)v35[14];
        uint64_t v165 = (id *)v35[13];
        uint64_t v166 = (__objc2_class **)v67;
        swift_bridgeObjectRetain();
        unint64_t v68 = p_isa;
        uint64_t v69 = (uint64_t)v164;
        goto LABEL_128;
      }
      uint64_t v69 = 0;
      unint64_t v68 = 0;
      uint64_t v165 = 0;
      uint64_t v166 = 0;
LABEL_128:
      id v164 = v66;
      p_Class isa = v68;
      uint64_t v128 = sub_1000DDD2C((uint64_t)v9, v68, v69, (uint64_t)v165, (uint64_t)v166, (uint64_t)&v181);
      swift_bridgeObjectRelease();
      id v129 = v164;
      [v164 setRootViewController:v128];

      swift_unknownObjectRelease();
LABEL_129:
      id v10 = v167;
LABEL_25:
      uint64_t v39 = *(Class *)((char *)&v36->isa + v2);
      if (v39
        && ([v39 makeKeyAndVisible], (uint64_t v40 = *(Class *)((char *)&v36->isa + v2)) != 0)
        && (uint64_t v41 = [v40 _rootSheetPresentationController]) != 0)
      {
        uint64_t v42 = v41;
        [v41 _setShouldScaleDownBehindDescendantSheets:0];
      }
      else
      {
LABEL_76:
        uint64_t v42 = Logger.logObject.getter();
        os_log_type_t v72 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v42, v72))
        {
          uint64_t v73 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v73 = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, v72, "_rootSheetPresentationController was unexpectedly nil.", v73, 2u);
          swift_slowDealloc();
        }
      }

      NSString v74 = String._bridgeToObjectiveC()();
      [v9 setIdleTimerDisabled:1 forReason:v74];

      [v9 setContentOpaque:0];
      [v9 setAllowsAlertStacking:v38 ^ 1];
      [v9 setSwipeDismissalStyle:v38];
      [v9 setAllowsMenuButtonDismissal:v38];
      [v9 setSceneDeactivationReason:0];
      if (!v35) {
        goto LABEL_84;
      }
      unint64_t v75 = v35[2];
      if (!v75) {
        goto LABEL_84;
      }
      char v76 = v75;
      if ((sub_1000E63BC() & 1) == 0)
      {

LABEL_84:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v84 = Logger.logObject.getter();
        os_log_type_t v85 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v84, v85))
        {
          uint64_t v86 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v86 = 0;
          _os_log_impl((void *)&_mh_execute_header, v84, v85, "Invalidating remote alert scene because the client is no longer valid.", v86, 2u);
          swift_slowDealloc();
        }

        [v9 invalidate];
        sub_100017388((uint64_t)&v181, &qword_1001444D0);
        goto LABEL_87;
      }
      if (v172)
      {
        sub_1000170C8((uint64_t)&v181, (uint64_t)v176, &qword_1001444D0);
        type metadata accessor for RemoteSceneManager.WeakScene();
        uint64_t v77 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v173 = v21;
        swift_unknownObjectWeakInit();
        *(void *)(v77 + 64) = 0;
        *(_OWORD *)(v77 + 48) = 0u;
        *(_OWORD *)(v77 + 32) = 0u;
        swift_unknownObjectWeakAssign();
        swift_unknownObjectWeakAssign();
        swift_beginAccess();
        sub_100069204((uint64_t)v176, v77 + 32);
        swift_endAccess();
        uint64_t v78 = type metadata accessor for TaskPriority();
        uint64_t v79 = (uint64_t)v170;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v78 - 8) + 56))(v170, 1, 1, v78);
        type metadata accessor for MainActor();
        swift_retain();
        uint64_t v80 = static MainActor.shared.getter();
        uint64_t v81 = (void *)swift_allocObject();
        v81[2] = v80;
        _DWORD v81[3] = &protocol witness table for MainActor;
        uint64_t v82 = v173;
        v81[4] = v171;
        v81[5] = v82;
        uint64_t v83 = v172;
        v81[6] = v169;
        v81[7] = v83;
        v81[8] = v77;
        sub_10002C340(v79, (uint64_t)&unk_1001454C0, (uint64_t)v81);
        swift_release();
        swift_release();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      id v87 = [v9 configurationContext];
      if (v87)
      {
        id v88 = v87;
        p_Class isa = v35;
        id v89 = v87;
        unint64_t v90 = Logger.logObject.getter();
        os_log_type_t v91 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v90, v91))
        {
          uint64_t v173 = v90;
          uint64_t v92 = (uint8_t *)swift_slowAlloc();
          id v172 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v92 = 138412290;
          v176[0] = v89;
          id v93 = v89;
          uint64_t v94 = v10;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *id v172 = v88;

          unint64_t v90 = v173;
          _os_log_impl((void *)&_mh_execute_header, v173, v91, "Remote alert scene got configuration context %@", v92, 0xCu);
          sub_100005B18(&qword_100142A40);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          uint64_t v94 = v89;
        }

        sub_100017388((uint64_t)&v181, &qword_1001444D0);
LABEL_87:
        swift_release();
        return;
      }
      sub_100017388((uint64_t)&v181, &qword_1001444D0);
      swift_release();

      return;
    case 3:
      if (v35)
      {
        sub_1000170C8((uint64_t)(v35 + 3), (uint64_t)v176, &qword_100142A70);
        if (v177)
        {
          sub_100005B18(&qword_1001454C8);
          swift_dynamicCast();
        }
        else
        {
          sub_100017388((uint64_t)v176, &qword_100142A70);
        }
      }
      uint64_t v125 = *(Class *)((char *)&v36->isa + v2);
      if (v125)
      {
        id v126 = v125;
        id v127 = sub_1000E3160();
        [v126 setRootViewController:v127];

        uint64_t v36 = v173;
      }
      swift_unknownObjectRelease();
      goto LABEL_123;
    case 4:
      uint64_t v55 = *(Class *)((char *)&v36->isa + v2);
      if (v55) {
        goto LABEL_74;
      }
      goto LABEL_75;
    case 5:
    case 6:
      if (v35)
      {
        if (*v35 == _TtC13GameOverlayUI31AuthenticationConnectionContext)
        {
          uint64_t v95 = (uint64_t)v35[16];
          if (v95)
          {
            uint64_t v96 = (uint64_t)v35[15];
            sub_1000170C8((uint64_t)(v35 + 3), (uint64_t)v176, &qword_100142A70);
            id v167 = v10;
            if (v177)
            {
              swift_retain();
              swift_bridgeObjectRetain();
              sub_100005B18((uint64_t *)&unk_100144A80);
              if (swift_dynamicCast()) {
                uint64_t v97 = v179;
              }
              else {
                uint64_t v97 = 0;
              }
            }
            else
            {
              swift_retain();
              swift_bridgeObjectRetain();
              sub_100017388((uint64_t)v176, &qword_100142A70);
              uint64_t v97 = 0;
            }
            uint64_t v130 = *(Class *)((char *)&v173->isa + v2);
            if (v130)
            {
              swift_unknownObjectRetain();
              id v131 = v130;
              id v132 = sub_1000DE1A8((uint64_t)v9, v97, v96, v95);
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              [v131 setRootViewController:v132];
              swift_release();
            }
            else
            {
              swift_release();
              swift_bridgeObjectRelease();
            }
            swift_unknownObjectRelease();
            uint64_t v38 = 0;
            id v10 = v167;
            uint64_t v36 = v173;
            goto LABEL_25;
          }
        }
      }
      uint64_t v36 = v173;
      uint64_t v55 = *(Class *)((char *)&v173->isa + v2);
      if (!v55) {
        goto LABEL_75;
      }
      goto LABEL_74;
    case 7:
      if (v35 && *v35 == _TtC13GameOverlayUI31AuthenticationConnectionContext && v35[18])
      {
        sub_1000170C8((uint64_t)(v35 + 3), (uint64_t)v176, &qword_100142A70);
        if (v177)
        {
          swift_retain();
          swift_bridgeObjectRetain();
          sub_100005B18((uint64_t *)&unk_100144A80);
          swift_dynamicCast();
        }
        else
        {
          swift_retain();
          swift_bridgeObjectRetain();
          sub_100017388((uint64_t)v176, &qword_100142A70);
        }
        unint64_t v133 = *(Class *)((char *)&v173->isa + v2);
        if (v133)
        {
          swift_unknownObjectRetain();
          id v134 = v133;
          id v135 = sub_1000E21E8();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          [v134 setRootViewController:v135];
          swift_release();
        }
        else
        {
          swift_release();
          swift_bridgeObjectRelease();
        }
        swift_unknownObjectRelease();
        goto LABEL_151;
      }
      uint64_t v55 = *(Class *)((char *)&v36->isa + v2);
      if (!v55) {
        goto LABEL_75;
      }
      goto LABEL_74;
    default:
      if (!v35 || *v35 != _TtC13GameOverlayUI28AccessPointConnectionContext) {
        goto LABEL_52;
      }
      swift_beginAccess();
      sub_1000170C8((uint64_t)(v35 + 8), (uint64_t)v176, &qword_1001444D0);
      if (v177)
      {
        swift_retain();
        sub_100005B18((uint64_t *)&unk_1001454D0);
        uint64_t v99 = (__objc2_class **)type metadata accessor for RemoteAlertAccessPointContext(0);
        if (swift_dynamicCast())
        {
          uint64_t v100 = v179;
          sub_1000170C8((uint64_t)(v35 + 3), (uint64_t)v176, &qword_100142A70);
          id v167 = v10;
          p_Class isa = v99;
          if (v177)
          {
            sub_100005B18((uint64_t *)&unk_100144A90);
            if (swift_dynamicCast()) {
              char v101 = (id *)v179;
            }
            else {
              char v101 = 0;
            }
          }
          else
          {
            sub_100017388((uint64_t)v176, &qword_100142A70);
            char v101 = 0;
          }
          uint64_t v162 = v101;
          uint64_t v136 = swift_getKeyPath();
          uint64_t v163 = (id *)&v153;
          __chkstk_darwin(v136);
          uint64_t v165 = (id *)(v100 + OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext___observationRegistrar);
          v176[0] = v100;
          uint64_t v137 = (void *)sub_1000E5994((unint64_t *)&qword_100140DB8, (void (*)(uint64_t))type metadata accessor for RemoteAlertAccessPointContext);
          uint64_t v166 = (__objc2_class **)v100;
          id v164 = v137;
          ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
          swift_release();
          swift_unknownObjectRelease();
          int v138 = v35[15];
          uint64_t v139 = swift_getKeyPath();
          uint64_t v162 = (id *)&v153;
          __chkstk_darwin(v139);
          v176[0] = v166;
          uint64_t KeyPath = v138;
          uint64_t v163 = (id *)((char *)&type metadata for () + 8);
          uint64_t v140 = (uint64_t)v166;
          ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
          v141 = (unsigned char *)v140;
          swift_release();

          uint64_t v142 = *(Class *)((char *)&v173->isa + v2);
          if (v142)
          {
            swift_getKeyPath();
            v176[0] = v140;
            uint64_t v162 = v142;
            ObservationRegistrar.access<A, B>(_:keyPath:)();
            swift_release();
            uint64_t v143 = v35[15];
            int v144 = v141[OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__useCase];
            int v145 = v143;
            id v146 = sub_1000E247C(v141, v144, v143);

            unint64_t v147 = v162;
            [v162 setRootViewController:v146];
          }
          uint64_t v177 = p_isa;
          uint64_t v178 = &off_100134CA8;
          v176[0] = v141;
          swift_retain();
          sub_100017388((uint64_t)&v181, &qword_1001444D0);
          sub_10006919C((uint64_t)v176, (uint64_t)&v181);
          uint64_t v148 = swift_getKeyPath();
          __chkstk_darwin(v148);
          v176[0] = v141;
          p_Class isa = v35;
          id v149 = v167;
          uint64_t v162 = (id *)v167;
          ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
          swift_release();

          id v10 = v149;
          uint64_t v35 = p_isa;
LABEL_150:
          [v9 setInputHardwareEventsDisabled:1];
          swift_release();
          swift_release();
LABEL_151:
          uint64_t v38 = 0;
          uint64_t v36 = v173;
          goto LABEL_25;
        }
        swift_release();
      }
      else
      {
        sub_100017388((uint64_t)v176, &qword_1001444D0);
      }
LABEL_52:
      uint64_t v55 = *(Class *)((char *)&v36->isa + v2);
      if (!v55)
      {
LABEL_75:
        uint64_t v38 = 0;
        goto LABEL_76;
      }
LABEL_74:
      id v70 = v55;
      id v71 = sub_1000E2050();
      [v70 setRootViewController:v71];

LABEL_123:
      uint64_t v38 = 0;
      goto LABEL_25;
  }
}

void sub_1000E5450()
{
  uint64_t v1 = v0;
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007D4C(v2, (uint64_t)qword_100156CF8);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Remote alert scene sceneDidBecomeActive", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window];
  if (v6) {
    [v6 setAlpha:0.0];
  }
  uint64_t v7 = self;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v1;
  v11[4] = sub_1000E5858;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1000DCCB0;
  v11[3] = &unk_100134E78;
  uint64_t v9 = _Block_copy(v11);
  id v10 = v1;
  swift_release();
  [v7 animateWithDuration:v9 animations:0.3];
  _Block_release(v9);
}

void sub_1000E5618()
{
  uint64_t v1 = v0;
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007D4C(v2, (uint64_t)qword_100156CF8);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Remote alert scene sceneDidDisconnect", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window);
  *(void *)(v1 + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window) = 0;
}

void sub_1000E5714()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  id v5 = (id)sub_1000DCBA0(v0);
  swift_bridgeObjectRelease();
  if (v5)
  {
    if (([v5 events] & 2) != 0)
    {
      if (qword_10013FBB0 != -1) {
        swift_once();
      }
      uint64_t v1 = type metadata accessor for Logger();
      sub_100007D4C(v1, (uint64_t)qword_100156CF8);
      uint64_t v2 = Logger.logObject.getter();
      os_log_type_t v3 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v2, v3))
      {
        os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, v3, "Remote alert scene got volume up press", v4, 2u);
        swift_slowDealloc();
      }
    }
  }
}

uint64_t sub_1000E584C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_1000E5858()
{
  return sub_1000E6124();
}

uint64_t sub_1000E5860()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1000E58B0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_10003E30C;
  return sub_1000DE4F8(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1000E5994(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000E59EC()
{
  return sub_1000DA0A4();
}

uint64_t sub_1000E5A18()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000E5A54()
{
  sub_1000DEE0C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

id sub_1000E5A60()
{
  return sub_1000E6124();
}

void sub_1000E5A6C(uint64_t a1)
{
  sub_1000DF494(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_100134FC8, (uint64_t)&unk_100145500, "Client does not appear to adopt the client side authentication protocol");
}

uint64_t sub_1000E5AB0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000243C4;
  return sub_1000DEFB4(a1, v4, v5, v6);
}

void sub_1000E5B64()
{
}

uint64_t sub_1000E5B6C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1000DCF6C(a1, &OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__didReturnToForeground, a2);
}

uint64_t sub_1000E5BA0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1000DCF6C(a1, &OBJC_IVAR____TtC13GameOverlayUI29RemoteAlertAccessPointContext__newToGameCenter, a2);
}

uint64_t sub_1000E5BCC()
{
  return EnvironmentValues.colorScheme.getter();
}

unint64_t sub_1000E5BF4()
{
  unint64_t result = qword_100145530;
  if (!qword_100145530)
  {
    sub_10000B448(&qword_100145518);
    sub_1000E5994(&qword_100145538, (void (*)(uint64_t))type metadata accessor for AccessPointView);
    sub_1000E5CA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145530);
  }
  return result;
}

unint64_t sub_1000E5CA0()
{
  unint64_t result = qword_100145540;
  if (!qword_100145540)
  {
    sub_10000B448(&qword_100145528);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145540);
  }
  return result;
}

uint64_t sub_1000E5CFC()
{
  return sub_1000D8AF0(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_1000E5D1C()
{
  return sub_1000D8ACC(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_1000E5D3C()
{
  return sub_1000D8A60(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_1000E5D60()
{
  swift_release();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_1000E5DA8()
{
  sub_1000DF238(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1000E5DB4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000E5DF0()
{
  swift_release();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000E5E30(uint64_t a1)
{
  sub_1000DF494(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_1001350B8, (uint64_t)&unk_100145570, "Client does not appear to adopt the client side dashboard protocol");
}

uint64_t sub_1000E5E74()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000E5EB4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10003E30C;
  return sub_1000DF6A4(a1, v4, v5, v6);
}

uint64_t sub_1000E5F68(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000E5FD0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000E6030()
{
  unint64_t result = qword_100145588;
  if (!qword_100145588)
  {
    sub_10000B448(&qword_100145578);
    sub_1000E5994(&qword_100145590, (void (*)(uint64_t))type metadata accessor for InGameBannerView);
    sub_1000E5CA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145588);
  }
  return result;
}

uint64_t sub_1000E60DC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000E611C()
{
  sub_1000DF7AC(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

id sub_1000E6124()
{
  id result = *(id *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window);
  if (result) {
    return [result setAlpha:];
  }
  return result;
}

void sub_1000E6148()
{
}

void sub_1000E61A4()
{
}

uint64_t sub_1000E61BC()
{
  return sub_10005EE58();
}

uint64_t sub_1000E61D4()
{
  return sub_1000E59EC();
}

uint64_t sub_1000E61EC(char a1, uint64_t a2, void *a3)
{
  unint64_t v5 = 0xD00000000000001BLL;
  unint64_t v6 = 0x80000001000FC180;
  switch(a1)
  {
    case 1:
      uint64_t v9 = "action:in-game-banner-overlay";
      goto LABEL_7;
    case 2:
      unint64_t v5 = 0xD000000000000018;
      uint64_t v10 = "action:dashboard-overlay";
      goto LABEL_10;
    case 3:
      unint64_t v5 = 0xD00000000000001ALL;
      uint64_t v10 = "action:multiplayer-overlay";
      goto LABEL_10;
    case 4:
      unint64_t v5 = 0xD000000000000025;
      uint64_t v10 = "action:turn-based-multiplayer-overlay";
      goto LABEL_10;
    case 5:
      uint64_t v9 = "action:authentication-overlay";
LABEL_7:
      unint64_t v6 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      unint64_t v5 = 0xD00000000000001DLL;
      break;
    case 6:
      unint64_t v5 = 0xD000000000000019;
      uint64_t v10 = "action:onboarding-overlay";
      goto LABEL_10;
    case 7:
      unint64_t v5 = 0xD000000000000028;
      uint64_t v10 = "action:activity-sharing-reprompt-overlay";
LABEL_10:
      unint64_t v6 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v11 = v6;
  String.append(_:)(*(Swift::String *)&v5);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 58;
  v12._object = (void *)0xE100000000000000;
  String.append(_:)(v12);
  [v3 pid];
  v13._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 58;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  if (a3)
  {
    id v15 = a3;
  }
  else
  {
    a2 = 0;
    id v15 = (void *)0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = a2;
  v16._object = v15;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1000E63BC()
{
  id v1 = [self processHandleForAuditToken:v0];
  uint64_t v2 = self;
  id v12 = 0;
  id v3 = v1;
  id v4 = [v2 handleForLegacyHandle:v3 error:&v12];
  if (v4)
  {
    unint64_t v5 = v4;
    id v6 = v12;

    id v7 = [v5 currentState];
    if (v7)
    {
      uint64_t v8 = v7;
      unsigned __int8 v9 = [v7 isRunning];

      if (v9) {
        return 1;
      }
    }
    else
    {
    }
  }
  else
  {
    id v11 = v12;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
  }
  return 0;
}

uint64_t sub_1000E6514(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()();
  uint64_t v8 = UUID.uuidString.getter();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *(void *)(v2 + 16);
  *(void *)(v2 + 16) = 0x8000000000000000;
  sub_10006F5EC(a1, v8, v10, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + 16) = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  return v8;
}

uint64_t sub_1000E667C(char a1)
{
  unint64_t v3 = 0xD00000000000001BLL;
  unint64_t v4 = 0x80000001000FC180;
  switch(a1)
  {
    case 1:
      uint64_t v5 = "action:in-game-banner-overlay";
      goto LABEL_7;
    case 2:
      unint64_t v3 = 0xD000000000000018;
      uint64_t v6 = "action:dashboard-overlay";
      goto LABEL_10;
    case 3:
      unint64_t v3 = 0xD00000000000001ALL;
      uint64_t v6 = "action:multiplayer-overlay";
      goto LABEL_10;
    case 4:
      unint64_t v3 = 0xD000000000000025;
      uint64_t v6 = "action:turn-based-multiplayer-overlay";
      goto LABEL_10;
    case 5:
      uint64_t v5 = "action:authentication-overlay";
LABEL_7:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD00000000000001DLL;
      break;
    case 6:
      unint64_t v3 = 0xD000000000000019;
      uint64_t v6 = "action:onboarding-overlay";
      goto LABEL_10;
    case 7:
      unint64_t v3 = 0xD000000000000028;
      uint64_t v6 = "action:activity-sharing-reprompt-overlay";
LABEL_10:
      unint64_t v4 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = v4;
  String.append(_:)(*(Swift::String *)&v3);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 58;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  [v1 pid];
  v9._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1000E67FC(void *a1)
{
  *(void *)(v1 + 56) = &_swiftEmptyDictionarySingleton;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(void *)(v1 + 112) = 0;
  if (a1)
  {
    *(void *)(v1 + 16) = [a1 remoteToken];
    if ([a1 remoteTarget])
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {

      memset(v4, 0, sizeof(v4));
    }
    sub_10007EB70((uint64_t)v4, (uint64_t)v5);
  }
  else
  {
    *(void *)(v1 + 16) = 0;
    memset(v5, 0, sizeof(v5));
  }
  sub_10007EB70((uint64_t)v5, v1 + 24);
  return v1;
}

uint64_t sub_1000E68D0()
{
  sub_100017388(v0 + 24, &qword_100142A70);
  swift_bridgeObjectRelease();
  sub_100017388(v0 + 64, &qword_1001444D0);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ConnectionContext()
{
  return self;
}

uint64_t sub_1000E695C()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000E698C()
{
  sub_100017388(v0 + 24, &qword_100142A70);
  swift_bridgeObjectRelease();
  sub_100017388(v0 + 64, &qword_1001444D0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AuthenticationConnectionContext()
{
  return self;
}

uint64_t sub_1000E6A28()
{
  return sub_1000E6B8C();
}

uint64_t type metadata accessor for AccessPointConnectionContext()
{
  return self;
}

uint64_t sub_1000E6A54()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000247B8(*(void *)(v0 + 152), *(void *)(v0 + 160));
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000E6AA4()
{
  sub_100017388(v0 + 24, &qword_100142A70);
  swift_bridgeObjectRelease();
  sub_100017388(v0 + 64, &qword_1001444D0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000247B8(*(void *)(v0 + 152), *(void *)(v0 + 160));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000E6B24()
{
  sub_1000E6AA4();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for InGameBannerConnectionContext()
{
  return self;
}

void sub_1000E6B7C()
{
}

uint64_t sub_1000E6B84()
{
  return sub_1000E6B8C();
}

uint64_t sub_1000E6B8C()
{
  sub_100017388(v0 + 24, &qword_100142A70);
  swift_bridgeObjectRelease();
  sub_100017388(v0 + 64, &qword_1001444D0);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DashboardConnectionContext()
{
  return self;
}

uint64_t sub_1000E6C2C()
{
  type metadata accessor for ConnectionContextManager();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = &_swiftEmptyDictionarySingleton;
  uint64_t v1 = v0 + OBJC_IVAR____TtC13GameOverlayUI24ConnectionContextManager_overlayBootstrap;
  sub_10000735C();
  uint64_t result = sub_100005B18(&qword_10013FF50);
  *(void *)(v1 + *(int *)(result + 28)) = 0;
  qword_100156E20 = v0;
  return result;
}

uint64_t sub_1000E6C9C()
{
  swift_bridgeObjectRelease();
  sub_1000E6DFC(v0 + OBJC_IVAR____TtC13GameOverlayUI24ConnectionContextManager_overlayBootstrap);

  return swift_deallocClassInstance();
}

uint64_t sub_1000E6D08()
{
  return type metadata accessor for ConnectionContextManager();
}

uint64_t type metadata accessor for ConnectionContextManager()
{
  uint64_t result = qword_100145B60;
  if (!qword_100145B60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000E6D5C()
{
  sub_100007A2C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1000E6DFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for OverlayBootstrap();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000E6E58(void *a1)
{
  type metadata accessor for ConnectionContext();
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2;
  *(void *)(v2 + 56) = &_swiftEmptyDictionarySingleton;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(void *)(v2 + 112) = 0;
  if (a1)
  {
    *(void *)(v2 + 16) = [a1 remoteToken];
    if ([a1 remoteTarget])
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {

      memset(v5, 0, sizeof(v5));
    }
    sub_10007EB70((uint64_t)v5, (uint64_t)v6);
  }
  else
  {
    *(void *)(v2 + 16) = 0;
    memset(v6, 0, sizeof(v6));
  }
  sub_10007EB70((uint64_t)v6, v3 + 24);
  return v3;
}

_WORD *sub_1000E6F48(_WORD *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)unint64_t v4 = *a2;
    unint64_t v4 = (_WORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_WORD *)a2;
    uint64_t v7 = a2[2];
    *((void *)v4 + 1) = a2[1];
    *((void *)v4 + 2) = v7;
    uint64_t v8 = a2[4];
    *((void *)v4 + 3) = a2[3];
    *((void *)v4 + 4) = v8;
    uint64_t v9 = a2[6];
    *((void *)v4 + 5) = a2[5];
    *((void *)v4 + 6) = v9;
    uint64_t v10 = a2[8];
    *((void *)v4 + 7) = a2[7];
    *((void *)v4 + 8) = v10;
    uint64_t v11 = a2[10];
    *((void *)v4 + 9) = a2[9];
    *((void *)v4 + 10) = v11;
    *((unsigned char *)v4 + 88) = *((unsigned char *)a2 + 88);
    uint64_t v12 = a2[13];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12)
    {
      *((void *)v4 + 12) = a2[12];
      *((void *)v4 + 13) = v12;
      uint64_t v13 = a2[15];
      *((void *)v4 + 14) = a2[14];
      *((void *)v4 + 15) = v13;
      uint64_t v14 = a2[17];
      *((void *)v4 + 16) = a2[16];
      *((void *)v4 + 17) = v14;
      uint64_t v15 = a2[19];
      *((void *)v4 + 18) = a2[18];
      *((void *)v4 + 19) = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v17 = *((_OWORD *)a2 + 7);
      *((_OWORD *)v4 + 6) = *((_OWORD *)a2 + 6);
      *((_OWORD *)v4 + 7) = v17;
      long long v18 = *((_OWORD *)a2 + 9);
      *((_OWORD *)v4 + 8) = *((_OWORD *)a2 + 8);
      *((_OWORD *)v4 + 9) = v18;
    }
    uint64_t v19 = *(int *)(a3 + 28);
    uint64_t v20 = (void *)((char *)v4 + v19);
    uint64_t v21 = (uint64_t)a2 + v19;
    uint64_t v22 = *(uint64_t *)((char *)a2 + v19 + 8);
    *uint64_t v20 = *(uint64_t *)((char *)a2 + v19);
    v20[1] = v22;
    uint64_t v23 = *(uint64_t *)((char *)a2 + v19 + 24);
    v20[2] = *(uint64_t *)((char *)a2 + v19 + 16);
    v20[3] = v23;
    uint64_t v24 = *(uint64_t *)((char *)a2 + v19 + 40);
    v20[4] = *(uint64_t *)((char *)a2 + v19 + 32);
    v20[5] = v24;
    uint64_t v25 = (int *)type metadata accessor for Game();
    uint64_t v26 = v25[7];
    __dst = (char *)v20 + v26;
    uint64_t v35 = (const void *)(v21 + v26);
    uint64_t v27 = type metadata accessor for Date();
    uint64_t v28 = *(void *)(v27 - 8);
    uint64_t v36 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v28 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v36(v35, 1, v27))
    {
      uint64_t v29 = sub_100005B18(&qword_100140C48);
      memcpy(__dst, v35, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v28 + 16))(__dst, v35, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(__dst, 0, 1, v27);
    }
    *(void *)((char *)v20 + v25[8]) = *(void *)(v21 + v25[8]);
    *((unsigned char *)v20 + v25[9]) = *(unsigned char *)(v21 + v25[9]);
    *((unsigned char *)v20 + v25[10]) = *(unsigned char *)(v21 + v25[10]);
    *((unsigned char *)v20 + v25[11]) = *(unsigned char *)(v21 + v25[11]);
    *((unsigned char *)v20 + v25[12]) = *(unsigned char *)(v21 + v25[12]);
    *((unsigned char *)v20 + v25[13]) = *(unsigned char *)(v21 + v25[13]);
    *((unsigned char *)v20 + v25[14]) = *(unsigned char *)(v21 + v25[14]);
    uint64_t v30 = v25[15];
    uint64_t v31 = (void *)((char *)v20 + v30);
    long long v32 = (void *)(v21 + v30);
    uint64_t v33 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v33;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1000E7250(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 104))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v4 + *(int *)(type metadata accessor for Game() + 28);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000E7394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  uint64_t v10 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v10;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v11 = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11)
  {
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = v11;
    uint64_t v12 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = v12;
    uint64_t v13 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = v13;
    uint64_t v14 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v15 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v15;
    long long v16 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v16;
  }
  uint64_t v17 = *(int *)(a3 + 28);
  long long v18 = (void *)(a1 + v17);
  uint64_t v19 = a2 + v17;
  uint64_t v20 = *(void *)(a2 + v17 + 8);
  *long long v18 = *(void *)(a2 + v17);
  v18[1] = v20;
  uint64_t v21 = *(void *)(a2 + v17 + 24);
  uint64_t v18[2] = *(void *)(a2 + v17 + 16);
  v18[3] = v21;
  uint64_t v22 = *(void *)(a2 + v17 + 40);
  v18[4] = *(void *)(a2 + v17 + 32);
  v18[5] = v22;
  uint64_t v23 = (int *)type metadata accessor for Game();
  uint64_t v24 = v23[7];
  __dst = (char *)v18 + v24;
  uint64_t v33 = (const void *)(v19 + v24);
  uint64_t v25 = type metadata accessor for Date();
  uint64_t v26 = *(void *)(v25 - 8);
  char v34 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v26 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v34(v33, 1, v25))
  {
    uint64_t v27 = sub_100005B18(&qword_100140C48);
    memcpy(__dst, v33, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v26 + 16))(__dst, v33, v25);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(__dst, 0, 1, v25);
  }
  *(void *)((char *)v18 + v23[8]) = *(void *)(v19 + v23[8]);
  *((unsigned char *)v18 + v23[9]) = *(unsigned char *)(v19 + v23[9]);
  *((unsigned char *)v18 + v23[10]) = *(unsigned char *)(v19 + v23[10]);
  *((unsigned char *)v18 + v23[11]) = *(unsigned char *)(v19 + v23[11]);
  *((unsigned char *)v18 + v23[12]) = *(unsigned char *)(v19 + v23[12]);
  *((unsigned char *)v18 + v23[13]) = *(unsigned char *)(v19 + v23[13]);
  *((unsigned char *)v18 + v23[14]) = *(unsigned char *)(v19 + v23[14]);
  uint64_t v28 = v23[15];
  uint64_t v29 = (void *)((char *)v18 + v28);
  uint64_t v30 = (void *)(v19 + v28);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000E764C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v6 = (_OWORD *)(a1 + 96);
  uint64_t v7 = (long long *)(a2 + 96);
  uint64_t v8 = *(void *)(a2 + 104);
  if (*(void *)(a1 + 104))
  {
    if (v8)
    {
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = *(void *)(a2 + 152);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_100006D1C(a1 + 96);
      long long v9 = *(_OWORD *)(a2 + 144);
      long long v11 = *v7;
      long long v10 = *(_OWORD *)(a2 + 112);
      *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
      *(_OWORD *)(a1 + 144) = v9;
      *uint64_t v6 = v11;
      *(_OWORD *)(a1 + 112) = v10;
    }
  }
  else if (v8)
  {
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v12 = *v7;
    long long v13 = *(_OWORD *)(a2 + 112);
    long long v14 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v14;
    *uint64_t v6 = v12;
    *(_OWORD *)(a1 + 112) = v13;
  }
  uint64_t v15 = *(int *)(a3 + 28);
  long long v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *long long v16 = *(void *)(a2 + v15);
  v16[1] = *(void *)(a2 + v15 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16[2] = v17[2];
  v16[3] = v17[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16[4] = v17[4];
  v16[5] = v17[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v18 = (int *)type metadata accessor for Game();
  uint64_t v19 = v18[7];
  uint64_t v20 = (char *)v16 + v19;
  uint64_t v21 = (char *)v17 + v19;
  uint64_t v22 = type metadata accessor for Date();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  long long v32 = v20;
  LODWORD(v20) = v24(v20, 1, v22);
  int v25 = v24(v21, 1, v22);
  if (v20)
  {
    if (!v25)
    {
      (*(void (**)(void *, char *, uint64_t))(v23 + 16))(v32, v21, v22);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v32, 0, 1, v22);
      goto LABEL_16;
    }
    size_t v26 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
    uint64_t v27 = v32;
  }
  else
  {
    if (!v25)
    {
      (*(void (**)(void *, char *, uint64_t))(v23 + 24))(v32, v21, v22);
      goto LABEL_16;
    }
    (*(void (**)(void *, uint64_t))(v23 + 8))(v32, v22);
    size_t v26 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
    uint64_t v27 = v32;
  }
  memcpy(v27, v21, v26);
LABEL_16:
  *(void *)((char *)v16 + v18[8]) = *(void *)((char *)v17 + v18[8]);
  *((unsigned char *)v16 + v18[9]) = *((unsigned char *)v17 + v18[9]);
  *((unsigned char *)v16 + v18[10]) = *((unsigned char *)v17 + v18[10]);
  *((unsigned char *)v16 + v18[11]) = *((unsigned char *)v17 + v18[11]);
  *((unsigned char *)v16 + v18[12]) = *((unsigned char *)v17 + v18[12]);
  *((unsigned char *)v16 + v18[13]) = *((unsigned char *)v17 + v18[13]);
  *((unsigned char *)v16 + v18[14]) = *((unsigned char *)v17 + v18[14]);
  uint64_t v28 = v18[15];
  uint64_t v29 = (void *)((char *)v16 + v28);
  uint64_t v30 = (void *)((char *)v17 + v28);
  *uint64_t v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000E7ADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = (_OWORD *)(a1 + v4);
  uint64_t v6 = a2 + v4;
  long long v7 = *(_OWORD *)(a2 + v4 + 16);
  *uint64_t v5 = *(_OWORD *)(a2 + v4);
  v5[1] = v7;
  _OWORD v5[2] = *(_OWORD *)(a2 + v4 + 32);
  uint64_t v8 = (int *)type metadata accessor for Game();
  uint64_t v9 = v8[7];
  long long v10 = (char *)v5 + v9;
  long long v11 = (const void *)(v6 + v9);
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_100005B18(&qword_100140C48);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  *(void *)((char *)v5 + v8[8]) = *(void *)(v6 + v8[8]);
  *((unsigned char *)v5 + v8[9]) = *(unsigned char *)(v6 + v8[9]);
  *((unsigned char *)v5 + v8[10]) = *(unsigned char *)(v6 + v8[10]);
  *((unsigned char *)v5 + v8[11]) = *(unsigned char *)(v6 + v8[11]);
  *((unsigned char *)v5 + v8[12]) = *(unsigned char *)(v6 + v8[12]);
  *((unsigned char *)v5 + v8[13]) = *(unsigned char *)(v6 + v8[13]);
  *((unsigned char *)v5 + v8[14]) = *(unsigned char *)(v6 + v8[14]);
  *(_OWORD *)((char *)v5 + v8[15]) = *(_OWORD *)(v6 + v8[15]);
  return a1;
}

uint64_t sub_1000E7CD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  if (*(void *)(a1 + 104))
  {
    uint64_t v11 = *(void *)(a2 + 104);
    if (v11)
    {
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = v11;
      swift_bridgeObjectRelease();
      uint64_t v12 = *(void *)(a2 + 120);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = v12;
      swift_bridgeObjectRelease();
      uint64_t v13 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = v13;
      swift_bridgeObjectRelease();
      uint64_t v14 = *(void *)(a2 + 152);
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = v14;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_100006D1C(a1 + 96);
  }
  long long v15 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v15;
  long long v16 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v16;
LABEL_6:
  uint64_t v17 = *(int *)(a3 + 28);
  long long v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = *(void *)(a2 + v17 + 8);
  *long long v18 = *(void *)(a2 + v17);
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = v19[3];
  uint64_t v18[2] = v19[2];
  v18[3] = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = v19[5];
  v18[4] = v19[4];
  v18[5] = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = (int *)type metadata accessor for Game();
  uint64_t v24 = v23[7];
  int v25 = (char *)v18 + v24;
  size_t v26 = (char *)v19 + v24;
  uint64_t v27 = type metadata accessor for Date();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  uint64_t v39 = v25;
  LODWORD(v25) = v29(v25, 1, v27);
  int v30 = v29(v26, 1, v27);
  if (v25)
  {
    if (!v30)
    {
      (*(void (**)(void *, char *, uint64_t))(v28 + 32))(v39, v26, v27);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v39, 0, 1, v27);
      goto LABEL_14;
    }
    size_t v31 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
    long long v32 = v39;
  }
  else
  {
    if (!v30)
    {
      (*(void (**)(void *, char *, uint64_t))(v28 + 40))(v39, v26, v27);
      goto LABEL_14;
    }
    (*(void (**)(void *, uint64_t))(v28 + 8))(v39, v27);
    size_t v31 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
    long long v32 = v39;
  }
  memcpy(v32, v26, v31);
LABEL_14:
  *(void *)((char *)v18 + v23[8]) = *(void *)((char *)v19 + v23[8]);
  *((unsigned char *)v18 + v23[9]) = *((unsigned char *)v19 + v23[9]);
  *((unsigned char *)v18 + v23[10]) = *((unsigned char *)v19 + v23[10]);
  *((unsigned char *)v18 + v23[11]) = *((unsigned char *)v19 + v23[11]);
  *((unsigned char *)v18 + v23[12]) = *((unsigned char *)v19 + v23[12]);
  *((unsigned char *)v18 + v23[13]) = *((unsigned char *)v19 + v23[13]);
  *((unsigned char *)v18 + v23[14]) = *((unsigned char *)v19 + v23[14]);
  uint64_t v33 = v23[15];
  char v34 = (void *)((char *)v18 + v33);
  uint64_t v35 = (void *)((char *)v19 + v33);
  uint64_t v37 = *v35;
  uint64_t v36 = v35[1];
  *char v34 = v37;
  v34[1] = v36;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000E8018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000E802C);
}

uint64_t sub_1000E802C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Game();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000E80DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000E80F0);
}

uint64_t sub_1000E80F0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Game();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for AccessPointDataIntent()
{
  uint64_t result = qword_100145C48;
  if (!qword_100145C48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000E81E4()
{
  uint64_t result = type metadata accessor for Game();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000E8290(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005B18(&qword_100145C98);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100006650(a1, a1[3]);
  sub_1000E8A38();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v15) = *(unsigned char *)v3;
  char v25 = 0;
  sub_100041750();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    char v25 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    long long v9 = *(_OWORD *)(v3 + 120);
    long long v21 = *(_OWORD *)(v3 + 104);
    long long v22 = v9;
    long long v23 = *(_OWORD *)(v3 + 136);
    uint64_t v24 = *(void *)(v3 + 152);
    long long v10 = *(_OWORD *)(v3 + 56);
    long long v17 = *(_OWORD *)(v3 + 40);
    long long v18 = v10;
    long long v11 = *(_OWORD *)(v3 + 88);
    long long v19 = *(_OWORD *)(v3 + 72);
    long long v20 = v11;
    long long v12 = *(_OWORD *)(v3 + 24);
    long long v15 = *(_OWORD *)(v3 + 8);
    long long v16 = v12;
    v14[15] = 2;
    sub_1000066E8();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    type metadata accessor for AccessPointDataIntent();
    LOBYTE(v15) = 3;
    type metadata accessor for Game();
    sub_100086B7C(&qword_100142C58);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000E84F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = type metadata accessor for Game();
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005B18(&qword_100145C88);
  uint64_t v24 = *(void *)(v6 - 8);
  uint64_t v25 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AccessPointDataIntent();
  __chkstk_darwin(v9);
  long long v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  uint64_t v27 = a1;
  sub_100006650(a1, v12);
  sub_1000E8A38();
  size_t v26 = v8;
  uint64_t v13 = v41;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v13) {
    return sub_100007188((uint64_t)v27);
  }
  uint64_t v41 = v3;
  uint64_t v14 = (uint64_t)v5;
  uint64_t v15 = v24;
  char v28 = 0;
  sub_100041D04();
  uint64_t v16 = v25;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  *long long v11 = v31;
  LOBYTE(v31) = 1;
  v11[1] = KeyedDecodingContainer.decode(_:forKey:)() & 1;
  char v30 = 2;
  sub_1000071D8();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  long long v17 = v38;
  *(_OWORD *)(v11 + 104) = v37;
  *(_OWORD *)(v11 + 120) = v17;
  *(_OWORD *)(v11 + 136) = v39;
  long long v18 = v34;
  *(_OWORD *)(v11 + 40) = v33;
  *(_OWORD *)(v11 + 56) = v18;
  long long v19 = v36;
  *(_OWORD *)(v11 + 72) = v35;
  *(_OWORD *)(v11 + 88) = v19;
  long long v20 = v32;
  *(_OWORD *)(v11 + 8) = v31;
  *((void *)v11 + 19) = v40;
  *(_OWORD *)(v11 + 24) = v20;
  char v29 = 3;
  sub_100086B7C(&qword_100142C68);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v26, v16);
  sub_1000863E4(v14, (uint64_t)&v11[*(int *)(v9 + 28)]);
  sub_1000E8A8C((uint64_t)v11, v23);
  sub_100007188((uint64_t)v27);
  return sub_1000E8AF0((uint64_t)v11);
}

uint64_t sub_1000E88B8()
{
  uint64_t result = 0x65736143657375;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6867694864616F6CLL;
      break;
    case 2:
      uint64_t result = 0x726579616C70;
      break;
    case 3:
      uint64_t result = 1701667175;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000E8948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000E8D58(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000E8970(uint64_t a1)
{
  unint64_t v2 = sub_1000E8A38();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000E89AC(uint64_t a1)
{
  unint64_t v2 = sub_1000E8A38();

  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_1000E89E8(void *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x8000000100113680;
}

uint64_t sub_1000E8A08@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000E84F0(a1, a2);
}

uint64_t sub_1000E8A20(void *a1)
{
  return sub_1000E8290(a1);
}

unint64_t sub_1000E8A38()
{
  unint64_t result = qword_100145C90;
  if (!qword_100145C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145C90);
  }
  return result;
}

uint64_t sub_1000E8A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccessPointDataIntent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000E8AF0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AccessPointDataIntent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for AccessPointDataIntent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000E8C18);
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

ValueMetadata *type metadata accessor for AccessPointDataIntent.CodingKeys()
{
  return &type metadata for AccessPointDataIntent.CodingKeys;
}

unint64_t sub_1000E8C54()
{
  unint64_t result = qword_100145CA0;
  if (!qword_100145CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145CA0);
  }
  return result;
}

unint64_t sub_1000E8CAC()
{
  unint64_t result = qword_100145CA8;
  if (!qword_100145CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145CA8);
  }
  return result;
}

unint64_t sub_1000E8D04()
{
  unint64_t result = qword_100145CB0;
  if (!qword_100145CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145CB0);
  }
  return result;
}

uint64_t sub_1000E8D58(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65736143657375 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6867694864616F6CLL && a2 == 0xEE0073746867696CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x726579616C70 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1701667175 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t AccessPointRequiredData.game.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AccessPointRequiredData();
  return sub_1000EA5EC(v1 + *(int *)(v3 + 24), a1, (uint64_t (*)(void))type metadata accessor for Game);
}

uint64_t type metadata accessor for AccessPointRequiredData()
{
  uint64_t result = qword_100145D40;
  if (!qword_100145D40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AccessPointRequiredData.isPlayerOnboarded.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AccessPointRequiredData() + 28));
}

uint64_t AccessPointRequiredData.friendRequests.getter()
{
  type metadata accessor for AccessPointRequiredData();

  return swift_bridgeObjectRetain();
}

uint64_t AccessPointRequiredData.challengesCount.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AccessPointRequiredData() + 36));
}

uint64_t AccessPointRequiredData.completedAchievementsCount.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AccessPointRequiredData() + 40));
}

uint64_t AccessPointRequiredData.achievementsCount.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AccessPointRequiredData() + 44));
}

uint64_t AccessPointRequiredData.leaderboardsCount.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AccessPointRequiredData() + 48));
}

uint64_t AccessPointRequiredData.leaderboardName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AccessPointRequiredData() + 52));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccessPointRequiredData.leaderboardRank.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AccessPointRequiredData() + 56));
}

uint64_t AccessPointRequiredData.leaderboardFriendCount.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AccessPointRequiredData() + 60));
}

uint64_t AccessPointRequiredData.ascAdamID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AccessPointRequiredData() + 64));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccessPointRequiredData.artwork.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AccessPointRequiredData() + 68);

  return sub_100083F34(v3, a1);
}

uint64_t AccessPointRequiredData.ascTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AccessPointRequiredData() + 72));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccessPointRequiredData.ascSubtitle.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AccessPointRequiredData() + 76));
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_1000E922C(char a1)
{
  unint64_t result = 0x65736143657375;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x726579616C70;
      break;
    case 2:
      unint64_t result = 1701667175;
      break;
    case 3:
    case 7:
    case 8:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x6552646E65697266;
      break;
    case 5:
      unint64_t result = 0x676E656C6C616863;
      break;
    case 6:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 9:
    case 10:
      unint64_t result = 0x6F6272656461656CLL;
      break;
    case 11:
      unint64_t result = 0xD000000000000016;
      break;
    case 12:
      unint64_t result = 0x496D616441637361;
      break;
    case 13:
      unint64_t result = 0x6B726F77747261;
      break;
    case 14:
      unint64_t result = 0x656C746954637361;
      break;
    case 15:
      unint64_t result = 0x6974627553637361;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1000E9420()
{
  return sub_1000E922C(*v0);
}

uint64_t sub_1000E9428@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000EC7F4(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000E9450(unsigned char *a1@<X8>)
{
  *a1 = 16;
}

uint64_t sub_1000E945C(uint64_t a1)
{
  unint64_t v2 = sub_1000E9A10();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000E9498(uint64_t a1)
{
  unint64_t v2 = sub_1000E9A10();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t AccessPointRequiredData.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005B18(&qword_100145CB8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006650(a1, a1[3]);
  sub_1000E9A10();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v28 = *v3;
  char v27 = 0;
  sub_100041750();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    long long v9 = *(_OWORD *)(v3 + 120);
    long long v23 = *(_OWORD *)(v3 + 104);
    long long v24 = v9;
    long long v25 = *(_OWORD *)(v3 + 136);
    uint64_t v26 = *((void *)v3 + 19);
    long long v10 = *(_OWORD *)(v3 + 56);
    long long v19 = *(_OWORD *)(v3 + 40);
    long long v20 = v10;
    long long v11 = *(_OWORD *)(v3 + 88);
    long long v21 = *(_OWORD *)(v3 + 72);
    long long v22 = v11;
    long long v12 = *(_OWORD *)(v3 + 24);
    long long v17 = *(_OWORD *)(v3 + 8);
    long long v18 = v12;
    char v16 = 1;
    sub_1000066E8();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    uint64_t v13 = type metadata accessor for AccessPointRequiredData();
    LOBYTE(v17) = 2;
    type metadata accessor for Game();
    sub_1000EA5A4(&qword_100142C58, (void (*)(uint64_t))type metadata accessor for Game);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v17) = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    *(void *)&long long v17 = *(void *)&v3[*(int *)(v13 + 32)];
    char v16 = 4;
    sub_100005B18(&qword_100145CC8);
    sub_1000EA534(&qword_100145CD0, (void (*)(void))sub_1000066E8);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v17) = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v17) = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v17) = 7;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v17) = 8;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v17) = 9;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    LOBYTE(v17) = 10;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v17) = 11;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v17) = 12;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    LOBYTE(v17) = 13;
    type metadata accessor for MediaArtwork();
    sub_1000EA5A4(&qword_100140048, (void (*)(uint64_t))&type metadata accessor for MediaArtwork);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    LOBYTE(v17) = 14;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    LOBYTE(v17) = 15;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1000E9A10()
{
  unint64_t result = qword_100145CC0;
  if (!qword_100145CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145CC0);
  }
  return result;
}

uint64_t AccessPointRequiredData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v4 = sub_100005B18(&qword_100142B48);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Game();
  __chkstk_darwin(v7);
  long long v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100005B18(&qword_100145CD8);
  uint64_t v10 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  long long v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = (int *)type metadata accessor for AccessPointRequiredData();
  __chkstk_darwin(v55);
  uint64_t v41 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v40 = a1;
  sub_100006650(a1, v14);
  sub_1000E9A10();
  long long v38 = v12;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100007188((uint64_t)v40);
  }
  uint64_t v15 = (uint64_t)v6;
  LOBYTE(v43) = 0;
  sub_100041D04();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v16 = v41;
  *uint64_t v41 = v45;
  char v44 = 1;
  sub_1000071D8();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  *(_OWORD *)(v16 + 104) = v51;
  long long v17 = v53;
  *(_OWORD *)(v16 + 120) = v52;
  *(_OWORD *)(v16 + 136) = v17;
  long long v18 = v48;
  *(_OWORD *)(v16 + 40) = v47;
  *(_OWORD *)(v16 + 56) = v18;
  long long v19 = v50;
  *(_OWORD *)(v16 + 72) = v49;
  *(_OWORD *)(v16 + 88) = v19;
  long long v20 = v46;
  *(_OWORD *)(v16 + 8) = v45;
  *((void *)v16 + 19) = v54;
  *(_OWORD *)(v16 + 24) = v20;
  LOBYTE(v43) = 2;
  sub_1000EA5A4(&qword_100142C68, (void (*)(uint64_t))type metadata accessor for Game);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  long long v21 = v55;
  sub_1000863E4((uint64_t)v9, (uint64_t)&v16[v55[6]]);
  LOBYTE(v43) = 3;
  v16[v21[7]] = KeyedDecodingContainer.decode(_:forKey:)() & 1;
  sub_100005B18(&qword_100145CC8);
  char v42 = 4;
  sub_1000EA534(&qword_100145CE0, (void (*)(void))sub_1000071D8);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  *(void *)&v16[v21[8]] = v43;
  LOBYTE(v43) = 5;
  *(void *)&v16[v21[9]] = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v43) = 6;
  *(void *)&v16[v21[10]] = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v43) = 7;
  *(void *)&v16[v21[11]] = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v43) = 8;
  *(void *)&v16[v21[12]] = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v43) = 9;
  uint64_t v22 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  long long v23 = (uint64_t *)&v41[v55[13]];
  *long long v23 = v22;
  v23[1] = v24;
  LOBYTE(v43) = 10;
  *(void *)&v41[v55[14]] = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v43) = 11;
  *(void *)&v41[v55[15]] = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v43) = 12;
  uint64_t v25 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v26 = (uint64_t *)&v41[v55[16]];
  uint64_t *v26 = v25;
  v26[1] = v27;
  type metadata accessor for MediaArtwork();
  LOBYTE(v43) = 13;
  sub_1000EA5A4(&qword_100140068, (void (*)(uint64_t))&type metadata accessor for MediaArtwork);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  sub_100084064(v15, (uint64_t)&v41[v55[17]]);
  LOBYTE(v43) = 14;
  uint64_t v28 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v29 = (uint64_t *)&v41[v55[18]];
  *char v29 = v28;
  v29[1] = v30;
  LOBYTE(v43) = 15;
  uint64_t v31 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v33 = v32;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v38, v39);
  uint64_t v34 = (uint64_t)v41;
  long long v35 = (uint64_t *)&v41[v55[19]];
  *long long v35 = v31;
  v35[1] = v33;
  sub_1000EA5EC(v34, v37, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
  sub_100007188((uint64_t)v40);
  return sub_1000EA654(v34, (uint64_t (*)(void))type metadata accessor for AccessPointRequiredData);
}

uint64_t sub_1000EA534(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B448(&qword_100145CC8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000EA5A4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000EA5EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000EA654(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000EA6B4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AccessPointRequiredData.init(from:)(a1, a2);
}

uint64_t sub_1000EA6CC(void *a1)
{
  return AccessPointRequiredData.encode(to:)(a1);
}

unsigned char *initializeBufferWithCopyOfBuffer for AccessPointRequiredData(unsigned char *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (unsigned char *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    *((void *)v4 + 1) = a2[1];
    *((void *)v4 + 2) = v7;
    uint64_t v8 = a2[4];
    *((void *)v4 + 3) = a2[3];
    *((void *)v4 + 4) = v8;
    uint64_t v9 = a2[6];
    *((void *)v4 + 5) = a2[5];
    *((void *)v4 + 6) = v9;
    uint64_t v10 = a2[8];
    *((void *)v4 + 7) = a2[7];
    *((void *)v4 + 8) = v10;
    uint64_t v11 = a2[10];
    *((void *)v4 + 9) = a2[9];
    *((void *)v4 + 10) = v11;
    v4[88] = *((unsigned char *)a2 + 88);
    uint64_t v12 = a2[13];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12)
    {
      *((void *)v4 + 12) = a2[12];
      *((void *)v4 + 13) = v12;
      uint64_t v13 = a2[15];
      *((void *)v4 + 14) = a2[14];
      *((void *)v4 + 15) = v13;
      uint64_t v14 = a2[17];
      *((void *)v4 + 16) = a2[16];
      *((void *)v4 + 17) = v14;
      uint64_t v15 = a2[19];
      *((void *)v4 + 18) = a2[18];
      *((void *)v4 + 19) = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v17 = *((_OWORD *)a2 + 7);
      *((_OWORD *)v4 + 6) = *((_OWORD *)a2 + 6);
      *((_OWORD *)v4 + 7) = v17;
      long long v18 = *((_OWORD *)a2 + 9);
      *((_OWORD *)v4 + 8) = *((_OWORD *)a2 + 8);
      *((_OWORD *)v4 + 9) = v18;
    }
    uint64_t v19 = a3[6];
    long long v20 = &v4[v19];
    uint64_t v21 = (uint64_t)a2 + v19;
    uint64_t v22 = *(uint64_t *)((char *)a2 + v19 + 8);
    *long long v20 = *(uint64_t *)((char *)a2 + v19);
    v20[1] = v22;
    uint64_t v23 = *(uint64_t *)((char *)a2 + v19 + 24);
    v20[2] = *(uint64_t *)((char *)a2 + v19 + 16);
    v20[3] = v23;
    uint64_t v24 = *(uint64_t *)((char *)a2 + v19 + 40);
    v20[4] = *(uint64_t *)((char *)a2 + v19 + 32);
    v20[5] = v24;
    uint64_t v25 = (int *)type metadata accessor for Game();
    uint64_t v26 = v25[7];
    __dst = (char *)v20 + v26;
    unint64_t v60 = (const void *)(v21 + v26);
    uint64_t v27 = type metadata accessor for Date();
    uint64_t v59 = *(void *)(v27 - 8);
    char v61 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v59 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v61(v60, 1, v27))
    {
      uint64_t v28 = sub_100005B18(&qword_100140C48);
      memcpy(__dst, v60, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v59 + 16))(__dst, v60, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(__dst, 0, 1, v27);
    }
    *(void *)((char *)v20 + v25[8]) = *(void *)(v21 + v25[8]);
    *((unsigned char *)v20 + v25[9]) = *(unsigned char *)(v21 + v25[9]);
    *((unsigned char *)v20 + v25[10]) = *(unsigned char *)(v21 + v25[10]);
    *((unsigned char *)v20 + v25[11]) = *(unsigned char *)(v21 + v25[11]);
    *((unsigned char *)v20 + v25[12]) = *(unsigned char *)(v21 + v25[12]);
    *((unsigned char *)v20 + v25[13]) = *(unsigned char *)(v21 + v25[13]);
    *((unsigned char *)v20 + v25[14]) = *(unsigned char *)(v21 + v25[14]);
    uint64_t v29 = v25[15];
    uint64_t v30 = (void *)((char *)v20 + v29);
    uint64_t v31 = (void *)(v21 + v29);
    uint64_t v62 = v31[1];
    *uint64_t v30 = *v31;
    v30[1] = v62;
    uint64_t v32 = a3[8];
    v4[a3[7]] = *((unsigned char *)a2 + a3[7]);
    *(void *)&v4[v32] = *(uint64_t *)((char *)a2 + v32);
    uint64_t v33 = a3[10];
    *(void *)&v4[a3[9]] = *(uint64_t *)((char *)a2 + a3[9]);
    *(void *)&v4[v33] = *(uint64_t *)((char *)a2 + v33);
    uint64_t v34 = a3[12];
    *(void *)&v4[a3[11]] = *(uint64_t *)((char *)a2 + a3[11]);
    *(void *)&v4[v34] = *(uint64_t *)((char *)a2 + v34);
    uint64_t v35 = a3[13];
    uint64_t v36 = a3[14];
    uint64_t v37 = &v4[v35];
    long long v38 = (uint64_t *)((char *)a2 + v35);
    uint64_t v39 = v38[1];
    *uint64_t v37 = *v38;
    v37[1] = v39;
    *(void *)&v4[v36] = *(uint64_t *)((char *)a2 + v36);
    uint64_t v40 = a3[16];
    *(void *)&v4[a3[15]] = *(uint64_t *)((char *)a2 + a3[15]);
    uint64_t v41 = &v4[v40];
    char v42 = (uint64_t *)((char *)a2 + v40);
    uint64_t v43 = v42[1];
    *uint64_t v41 = *v42;
    v41[1] = v43;
    uint64_t v44 = a3[17];
    __dsta = &v4[v44];
    long long v45 = (char *)a2 + v44;
    uint64_t v46 = type metadata accessor for MediaArtwork();
    uint64_t v47 = *(void *)(v46 - 8);
    long long v48 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v48(v45, 1, v46))
    {
      uint64_t v49 = sub_100005B18(&qword_100142B48);
      memcpy(__dsta, v45, *(void *)(*(void *)(v49 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v47 + 16))(__dsta, v45, v46);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v47 + 56))(__dsta, 0, 1, v46);
    }
    uint64_t v50 = a3[18];
    uint64_t v51 = a3[19];
    long long v52 = &v4[v50];
    long long v53 = (uint64_t *)((char *)a2 + v50);
    uint64_t v54 = v53[1];
    *long long v52 = *v53;
    v52[1] = v54;
    uint64_t v55 = &v4[v51];
    uint64_t v56 = (uint64_t *)((char *)a2 + v51);
    uint64_t v57 = v56[1];
    *uint64_t v55 = *v56;
    v55[1] = v57;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AccessPointRequiredData(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 104))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v4 + *(int *)(type metadata accessor for Game() + 28);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = a1 + *(int *)(a2 + 68);
  uint64_t v9 = type metadata accessor for MediaArtwork();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AccessPointRequiredData(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v10 = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v10)
  {
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = v10;
    uint64_t v11 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = v11;
    uint64_t v12 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = v12;
    uint64_t v13 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v14 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v14;
    long long v15 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v15;
  }
  uint64_t v16 = a3[6];
  long long v17 = (void *)(a1 + v16);
  uint64_t v18 = a2 + v16;
  uint64_t v19 = *(void *)(a2 + v16 + 8);
  void *v17 = *(void *)(a2 + v16);
  v17[1] = v19;
  uint64_t v20 = *(void *)(a2 + v16 + 24);
  _OWORD v17[2] = *(void *)(a2 + v16 + 16);
  v17[3] = v20;
  uint64_t v21 = *(void *)(a2 + v16 + 40);
  v17[4] = *(void *)(a2 + v16 + 32);
  v17[5] = v21;
  uint64_t v22 = (int *)type metadata accessor for Game();
  uint64_t v23 = v22[7];
  __dst = (char *)v17 + v23;
  uint64_t v57 = (const void *)(v18 + v23);
  uint64_t v24 = type metadata accessor for Date();
  uint64_t v56 = *(void *)(v24 - 8);
  uint64_t v58 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v56 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v58(v57, 1, v24))
  {
    uint64_t v25 = sub_100005B18(&qword_100140C48);
    memcpy(__dst, v57, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v56 + 16))(__dst, v57, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(__dst, 0, 1, v24);
  }
  *(void *)((char *)v17 + v22[8]) = *(void *)(v18 + v22[8]);
  *((unsigned char *)v17 + v22[9]) = *(unsigned char *)(v18 + v22[9]);
  *((unsigned char *)v17 + v22[10]) = *(unsigned char *)(v18 + v22[10]);
  *((unsigned char *)v17 + v22[11]) = *(unsigned char *)(v18 + v22[11]);
  *((unsigned char *)v17 + v22[12]) = *(unsigned char *)(v18 + v22[12]);
  *((unsigned char *)v17 + v22[13]) = *(unsigned char *)(v18 + v22[13]);
  *((unsigned char *)v17 + v22[14]) = *(unsigned char *)(v18 + v22[14]);
  uint64_t v26 = v22[15];
  uint64_t v27 = (void *)((char *)v17 + v26);
  uint64_t v28 = (void *)(v18 + v26);
  uint64_t v59 = v28[1];
  void *v27 = *v28;
  v27[1] = v59;
  uint64_t v29 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v29) = *(void *)(a2 + v29);
  uint64_t v30 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v30) = *(void *)(a2 + v30);
  uint64_t v31 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v31) = *(void *)(a2 + v31);
  uint64_t v32 = a3[13];
  uint64_t v33 = a3[14];
  uint64_t v34 = (void *)(a1 + v32);
  uint64_t v35 = (void *)(a2 + v32);
  uint64_t v36 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v36;
  *(void *)(a1 + v33) = *(void *)(a2 + v33);
  uint64_t v37 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  long long v38 = (void *)(a1 + v37);
  uint64_t v39 = (void *)(a2 + v37);
  uint64_t v40 = v39[1];
  void *v38 = *v39;
  v38[1] = v40;
  uint64_t v41 = a3[17];
  __dsta = (void *)(a1 + v41);
  char v42 = (const void *)(a2 + v41);
  uint64_t v43 = type metadata accessor for MediaArtwork();
  uint64_t v44 = *(void *)(v43 - 8);
  long long v45 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v44 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v45(v42, 1, v43))
  {
    uint64_t v46 = sub_100005B18(&qword_100142B48);
    memcpy(__dsta, v42, *(void *)(*(void *)(v46 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v44 + 16))(__dsta, v42, v43);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v44 + 56))(__dsta, 0, 1, v43);
  }
  uint64_t v47 = a3[18];
  uint64_t v48 = a3[19];
  uint64_t v49 = (void *)(a1 + v47);
  uint64_t v50 = (void *)(a2 + v47);
  uint64_t v51 = v50[1];
  *uint64_t v49 = *v50;
  v49[1] = v51;
  long long v52 = (void *)(a1 + v48);
  long long v53 = (void *)(a2 + v48);
  uint64_t v54 = v53[1];
  *long long v52 = *v53;
  v52[1] = v54;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AccessPointRequiredData(uint64_t a1, uint64_t a2, int *a3)
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
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v6 = (_OWORD *)(a1 + 96);
  uint64_t v7 = (long long *)(a2 + 96);
  uint64_t v8 = *(void *)(a2 + 104);
  if (*(void *)(a1 + 104))
  {
    if (v8)
    {
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = *(void *)(a2 + 152);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_100006D1C(a1 + 96);
      long long v9 = *(_OWORD *)(a2 + 144);
      long long v11 = *v7;
      long long v10 = *(_OWORD *)(a2 + 112);
      *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
      *(_OWORD *)(a1 + 144) = v9;
      *uint64_t v6 = v11;
      *(_OWORD *)(a1 + 112) = v10;
    }
  }
  else if (v8)
  {
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v12 = *v7;
    long long v13 = *(_OWORD *)(a2 + 112);
    long long v14 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v14;
    *uint64_t v6 = v12;
    *(_OWORD *)(a1 + 112) = v13;
  }
  uint64_t v54 = a3;
  uint64_t v15 = a3[6];
  uint64_t v16 = (void *)(a1 + v15);
  long long v17 = (void *)(a2 + v15);
  *uint64_t v16 = *(void *)(a2 + v15);
  v16[1] = *(void *)(a2 + v15 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16[2] = v17[2];
  v16[3] = v17[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16[4] = v17[4];
  v16[5] = v17[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = (int *)type metadata accessor for Game();
  uint64_t v19 = v18[7];
  uint64_t v20 = (char *)v16 + v19;
  uint64_t v21 = (char *)v17 + v19;
  uint64_t v22 = type metadata accessor for Date();
  uint64_t v52 = *(void *)(v22 - 8);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 48);
  long long v53 = v20;
  LODWORD(v20) = v23(v20, 1, v22);
  int v24 = v23(v21, 1, v22);
  if (v20)
  {
    if (v24)
    {
      size_t v25 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
      uint64_t v26 = v53;
LABEL_13:
      memcpy(v26, v21, v25);
      goto LABEL_16;
    }
    (*(void (**)(void *, char *, uint64_t))(v52 + 16))(v53, v21, v22);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v52 + 56))(v53, 0, 1, v22);
  }
  else
  {
    if (v24)
    {
      (*(void (**)(void *, uint64_t))(v52 + 8))(v53, v22);
      size_t v25 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
      uint64_t v26 = v53;
      goto LABEL_13;
    }
    (*(void (**)(void *, char *, uint64_t))(v52 + 24))(v53, v21, v22);
  }
LABEL_16:
  *(void *)((char *)v16 + v18[8]) = *(void *)((char *)v17 + v18[8]);
  *((unsigned char *)v16 + v18[9]) = *((unsigned char *)v17 + v18[9]);
  *((unsigned char *)v16 + v18[10]) = *((unsigned char *)v17 + v18[10]);
  *((unsigned char *)v16 + v18[11]) = *((unsigned char *)v17 + v18[11]);
  *((unsigned char *)v16 + v18[12]) = *((unsigned char *)v17 + v18[12]);
  *((unsigned char *)v16 + v18[13]) = *((unsigned char *)v17 + v18[13]);
  *((unsigned char *)v16 + v18[14]) = *((unsigned char *)v17 + v18[14]);
  uint64_t v27 = v18[15];
  uint64_t v28 = (void *)((char *)v16 + v27);
  uint64_t v29 = (void *)((char *)v17 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v54[7]) = *(unsigned char *)(a2 + v54[7]);
  *(void *)(a1 + v54[8]) = *(void *)(a2 + v54[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + v54[9]) = *(void *)(a2 + v54[9]);
  *(void *)(a1 + v54[10]) = *(void *)(a2 + v54[10]);
  *(void *)(a1 + v54[11]) = *(void *)(a2 + v54[11]);
  *(void *)(a1 + v54[12]) = *(void *)(a2 + v54[12]);
  uint64_t v30 = v54[13];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (void *)(a2 + v30);
  *uint64_t v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + v54[14]) = *(void *)(a2 + v54[14]);
  *(void *)(a1 + v54[15]) = *(void *)(a2 + v54[15]);
  uint64_t v33 = v54[16];
  uint64_t v34 = (void *)(a1 + v33);
  uint64_t v35 = (void *)(a2 + v33);
  *uint64_t v34 = *v35;
  v34[1] = v35[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v36 = v54[17];
  uint64_t v37 = (void *)(a1 + v36);
  long long v38 = (void *)(a2 + v36);
  uint64_t v39 = type metadata accessor for MediaArtwork();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v40 + 48);
  int v42 = v41(v37, 1, v39);
  int v43 = v41(v38, 1, v39);
  if (!v42)
  {
    if (!v43)
    {
      (*(void (**)(void *, void *, uint64_t))(v40 + 24))(v37, v38, v39);
      goto LABEL_22;
    }
    (*(void (**)(void *, uint64_t))(v40 + 8))(v37, v39);
    goto LABEL_21;
  }
  if (v43)
  {
LABEL_21:
    uint64_t v44 = sub_100005B18(&qword_100142B48);
    memcpy(v37, v38, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_22;
  }
  (*(void (**)(void *, void *, uint64_t))(v40 + 16))(v37, v38, v39);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
LABEL_22:
  uint64_t v45 = v54[18];
  uint64_t v46 = (void *)(a1 + v45);
  uint64_t v47 = (void *)(a2 + v45);
  *uint64_t v46 = *v47;
  v46[1] = v47[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v48 = v54[19];
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (void *)(a2 + v48);
  *uint64_t v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for AccessPointRequiredData(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = a3[6];
  uint64_t v7 = (_OWORD *)(a1 + v6);
  uint64_t v8 = a2 + v6;
  long long v9 = *(_OWORD *)(a2 + v6 + 16);
  *uint64_t v7 = *(_OWORD *)(a2 + v6);
  v7[1] = v9;
  void v7[2] = *(_OWORD *)(a2 + v6 + 32);
  long long v10 = (int *)type metadata accessor for Game();
  uint64_t v11 = v10[7];
  long long v12 = (char *)v7 + v11;
  long long v13 = (const void *)(v8 + v11);
  uint64_t v14 = type metadata accessor for Date();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_100005B18(&qword_100140C48);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  *(void *)((char *)v7 + v10[8]) = *(void *)(v8 + v10[8]);
  *((unsigned char *)v7 + v10[9]) = *(unsigned char *)(v8 + v10[9]);
  *((unsigned char *)v7 + v10[10]) = *(unsigned char *)(v8 + v10[10]);
  *((unsigned char *)v7 + v10[11]) = *(unsigned char *)(v8 + v10[11]);
  *((unsigned char *)v7 + v10[12]) = *(unsigned char *)(v8 + v10[12]);
  *((unsigned char *)v7 + v10[13]) = *(unsigned char *)(v8 + v10[13]);
  *((unsigned char *)v7 + v10[14]) = *(unsigned char *)(v8 + v10[14]);
  *(_OWORD *)((char *)v7 + v10[15]) = *(_OWORD *)(v8 + v10[15]);
  uint64_t v17 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  uint64_t v18 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v18) = *(void *)(a2 + v18);
  uint64_t v19 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  uint64_t v20 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  uint64_t v21 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(_OWORD *)(a1 + v21) = *(_OWORD *)(a2 + v21);
  uint64_t v22 = a3[17];
  uint64_t v23 = (void *)(a1 + v22);
  int v24 = (const void *)(a2 + v22);
  uint64_t v25 = type metadata accessor for MediaArtwork();
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
  {
    uint64_t v27 = sub_100005B18(&qword_100142B48);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v26 + 32))(v23, v24, v25);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  }
  uint64_t v28 = a3[19];
  *(_OWORD *)(a1 + a3[18]) = *(_OWORD *)(a2 + a3[18]);
  *(_OWORD *)(a1 + v28) = *(_OWORD *)(a2 + v28);
  return a1;
}

uint64_t assignWithTake for AccessPointRequiredData(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  if (*(void *)(a1 + 104))
  {
    uint64_t v11 = *(void *)(a2 + 104);
    if (v11)
    {
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = v11;
      swift_bridgeObjectRelease();
      uint64_t v12 = *(void *)(a2 + 120);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = v12;
      swift_bridgeObjectRelease();
      uint64_t v13 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = v13;
      swift_bridgeObjectRelease();
      uint64_t v14 = *(void *)(a2 + 152);
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = v14;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_100006D1C(a1 + 96);
  }
  long long v15 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v15;
  long long v16 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v16;
LABEL_6:
  uint64_t v73 = a3;
  uint64_t v17 = a3[6];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = *(void *)(a2 + v17 + 8);
  *uint64_t v18 = *(void *)(a2 + v17);
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = v19[3];
  uint64_t v18[2] = v19[2];
  v18[3] = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = v19[5];
  v18[4] = v19[4];
  v18[5] = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = (int *)type metadata accessor for Game();
  uint64_t v24 = v23[7];
  uint64_t v25 = (char *)v18 + v24;
  uint64_t v26 = (char *)v19 + v24;
  uint64_t v27 = type metadata accessor for Date();
  uint64_t v71 = *(void *)(v27 - 8);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
  os_log_type_t v72 = v25;
  LODWORD(v25) = v28(v25, 1, v27);
  int v29 = v28(v26, 1, v27);
  if (v25)
  {
    if (v29)
    {
      size_t v30 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
      uint64_t v31 = v72;
LABEL_11:
      memcpy(v31, v26, v30);
      goto LABEL_14;
    }
    (*(void (**)(void *, char *, uint64_t))(v71 + 32))(v72, v26, v27);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v71 + 56))(v72, 0, 1, v27);
  }
  else
  {
    if (v29)
    {
      (*(void (**)(void *, uint64_t))(v71 + 8))(v72, v27);
      size_t v30 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
      uint64_t v31 = v72;
      goto LABEL_11;
    }
    (*(void (**)(void *, char *, uint64_t))(v71 + 40))(v72, v26, v27);
  }
LABEL_14:
  *(void *)((char *)v18 + v23[8]) = *(void *)((char *)v19 + v23[8]);
  *((unsigned char *)v18 + v23[9]) = *((unsigned char *)v19 + v23[9]);
  *((unsigned char *)v18 + v23[10]) = *((unsigned char *)v19 + v23[10]);
  *((unsigned char *)v18 + v23[11]) = *((unsigned char *)v19 + v23[11]);
  *((unsigned char *)v18 + v23[12]) = *((unsigned char *)v19 + v23[12]);
  *((unsigned char *)v18 + v23[13]) = *((unsigned char *)v19 + v23[13]);
  *((unsigned char *)v18 + v23[14]) = *((unsigned char *)v19 + v23[14]);
  uint64_t v32 = v23[15];
  uint64_t v33 = (void *)((char *)v18 + v32);
  uint64_t v34 = (void *)((char *)v19 + v32);
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  *uint64_t v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  uint64_t v37 = v73[8];
  *(unsigned char *)(a1 + v73[7]) = *(unsigned char *)(a2 + v73[7]);
  *(void *)(a1 + v37) = *(void *)(a2 + v37);
  swift_bridgeObjectRelease();
  uint64_t v38 = v73[10];
  *(void *)(a1 + v73[9]) = *(void *)(a2 + v73[9]);
  *(void *)(a1 + v38) = *(void *)(a2 + v38);
  uint64_t v39 = v73[12];
  *(void *)(a1 + v73[11]) = *(void *)(a2 + v73[11]);
  *(void *)(a1 + v39) = *(void *)(a2 + v39);
  uint64_t v40 = v73[13];
  uint64_t v41 = (void *)(a1 + v40);
  int v42 = (uint64_t *)(a2 + v40);
  uint64_t v44 = *v42;
  uint64_t v43 = v42[1];
  *uint64_t v41 = v44;
  v41[1] = v43;
  swift_bridgeObjectRelease();
  uint64_t v45 = v73[15];
  *(void *)(a1 + v73[14]) = *(void *)(a2 + v73[14]);
  *(void *)(a1 + v45) = *(void *)(a2 + v45);
  uint64_t v46 = v73[16];
  uint64_t v47 = (void *)(a1 + v46);
  uint64_t v48 = (uint64_t *)(a2 + v46);
  uint64_t v50 = *v48;
  uint64_t v49 = v48[1];
  *uint64_t v47 = v50;
  v47[1] = v49;
  swift_bridgeObjectRelease();
  uint64_t v51 = v73[17];
  uint64_t v52 = (void *)(a1 + v51);
  long long v53 = (void *)(a2 + v51);
  uint64_t v54 = type metadata accessor for MediaArtwork();
  uint64_t v55 = *(void *)(v54 - 8);
  uint64_t v56 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v55 + 48);
  int v57 = v56(v52, 1, v54);
  int v58 = v56(v53, 1, v54);
  if (!v57)
  {
    if (!v58)
    {
      (*(void (**)(void *, void *, uint64_t))(v55 + 40))(v52, v53, v54);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v55 + 8))(v52, v54);
    goto LABEL_19;
  }
  if (v58)
  {
LABEL_19:
    uint64_t v59 = sub_100005B18(&qword_100142B48);
    memcpy(v52, v53, *(void *)(*(void *)(v59 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, void *, uint64_t))(v55 + 32))(v52, v53, v54);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v55 + 56))(v52, 0, 1, v54);
LABEL_20:
  uint64_t v60 = v73[18];
  char v61 = (void *)(a1 + v60);
  uint64_t v62 = (uint64_t *)(a2 + v60);
  uint64_t v64 = *v62;
  uint64_t v63 = v62[1];
  *char v61 = v64;
  v61[1] = v63;
  swift_bridgeObjectRelease();
  uint64_t v65 = v73[19];
  long long v66 = (void *)(a1 + v65);
  uint64_t v67 = (uint64_t *)(a2 + v65);
  uint64_t v69 = *v67;
  uint64_t v68 = v67[1];
  *long long v66 = v69;
  v66[1] = v68;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessPointRequiredData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000EC1C8);
}

uint64_t sub_1000EC1C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Game();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100005B18(&qword_100142B48);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 68);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for AccessPointRequiredData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000EC30C);
}

uint64_t sub_1000EC30C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Game();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100005B18(&qword_100142B48);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 68);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_1000EC43C()
{
  type metadata accessor for Game();
  if (v0 <= 0x3F)
  {
    sub_1000D3BB0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for AccessPointRequiredData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF1) {
    goto LABEL_17;
  }
  if (a2 + 15 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 15) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 15;
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
      return (*a1 | (v4 << 8)) - 15;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 15;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x10;
  int v8 = v6 - 16;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AccessPointRequiredData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 15 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 15) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF0)
  {
    unsigned int v6 = ((a2 - 241) >> 8) + 1;
    *uint64_t result = a2 + 15;
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
        JUMPOUT(0x1000EC6B4);
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
          *uint64_t result = a2 + 15;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessPointRequiredData.CodingKeys()
{
  return &type metadata for AccessPointRequiredData.CodingKeys;
}

unint64_t sub_1000EC6F0()
{
  unint64_t result = qword_100145DB0;
  if (!qword_100145DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145DB0);
  }
  return result;
}

unint64_t sub_1000EC748()
{
  unint64_t result = qword_100145DB8;
  if (!qword_100145DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145DB8);
  }
  return result;
}

unint64_t sub_1000EC7A0()
{
  unint64_t result = qword_100145DC0;
  if (!qword_100145DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145DC0);
  }
  return result;
}

uint64_t sub_1000EC7F4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65736143657375 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726579616C70 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701667175 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001000FEA20 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6552646E65697266 && a2 == 0xEE00737473657571 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x676E656C6C616863 && a2 == 0xEF746E756F437365 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x80000001000FEA40 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001000FEA60 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001000FEA80 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6F6272656461656CLL && a2 == 0xEF656D614E647261 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6F6272656461656CLL && a2 == 0xEF6B6E6152647261 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000001000FEAA0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x496D616441637361 && a2 == 0xE900000000000044 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x6B726F77747261 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x656C746954637361 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x6974627553637361 && a2 == 0xEB00000000656C74)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 15;
    }
    else {
      return 16;
    }
  }
}

id sub_1000ECEB4@<X0>(void *a1@<X8>)
{
  [self setForCurrentProcessAllowingPDF:1];
  id result = [objc_allocWithZone((Class)GKImageRestrictions) init];
  *a1 = result;
  return result;
}

uint64_t sub_1000ECF08@<X0>(void *a1@<X8>)
{
  id v2 = [self ams_sharedAccountStore];
  uint64_t result = sub_100069708(0, (unint64_t *)&unk_100145EC0);
  a1[3] = result;
  a1[4] = &protocol witness table for ACAccountStore;
  *a1 = v2;
  return result;
}

uint64_t sub_1000ECF7C(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_100005B18(&qword_100145EA8);
  v2[4] = swift_task_alloc();
  v2[5] = swift_task_alloc();
  type metadata accessor for Bag.Stubs();
  v2[6] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for Bag();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Bag.Profile();
  v2[12] = v4;
  v2[13] = *(void *)(v4 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  return _swift_task_switch(sub_1000ED130, 0, 0);
}

uint64_t sub_1000ED130()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Bag.Profile.init(name:version:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  Bag.Stubs.init()();
  Bag.init(mockProfile:stubs:)();
  v0[16] = static Bag.fetchBag(forProfile:)();
  uint64_t v5 = sub_100005B18(&qword_100145EB0);
  unint64_t v6 = sub_1000EF290();
  BOOL v7 = (void *)swift_task_alloc();
  v0[17] = v7;
  *BOOL v7 = v0;
  v7[1] = sub_1000ED294;
  uint64_t v8 = v0[5];
  return dispatch thunk of Future.then()(v8, v5, v6);
}

uint64_t sub_1000ED294()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_release();
    swift_errorRelease();
    uint64_t v1 = sub_1000ED5F0;
  }
  else
  {
    uint64_t v1 = sub_1000ED3B4;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_1000ED3B4()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[5];
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v1);
  uint64_t v4 = v0[11];
  uint64_t v6 = v0[8];
  uint64_t v5 = v0[9];
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[4];
  sub_1000EF2EC(v0[5], v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v4, v7);
  int v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v8, 1, v7);
  uint64_t v10 = v0[10];
  uint64_t v11 = v0[7];
  uint64_t v12 = v0[8];
  uint64_t v13 = v0[4];
  if (v9 == 1)
  {
    (*(void (**)(void, void, void))(v12 + 32))(v0[10], v0[9], v0[7]);
    sub_1000EF354(v13);
  }
  else
  {
    (*(void (**)(void, void))(v12 + 8))(v0[9], v0[7]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v10, v13, v11);
  }
  uint64_t v14 = v0[15];
  uint64_t v15 = v0[13];
  uint64_t v24 = v0[12];
  uint64_t v16 = v0[10];
  uint64_t v17 = v0[11];
  uint64_t v18 = v0[8];
  uint64_t v19 = v0[7];
  uint64_t v20 = v0[5];
  type metadata accessor for BagProfile();
  Bag.withValuesForKeys(_:)();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  v21(v16, v19);
  v21(v17, v19);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v24);
  sub_1000EF354(v20);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_1000ED5F0()
{
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[8] + 56))(v0[5], 1, 1, v0[7]);
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100007D4C(v1, (uint64_t)qword_100156CF8);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "GameObjectGraphBuilder - frameworkObjects: Unable to fetch bag. Using a mock bag.", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = v0[11];
  uint64_t v7 = v0[8];
  uint64_t v6 = v0[9];
  uint64_t v8 = v0[7];
  uint64_t v9 = v0[4];
  sub_1000EF2EC(v0[5], v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v5, v8);
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v9, 1, v8);
  uint64_t v11 = v0[10];
  uint64_t v12 = v0[7];
  uint64_t v13 = v0[8];
  uint64_t v14 = v0[4];
  if (v10 == 1)
  {
    (*(void (**)(void, void, void))(v13 + 32))(v0[10], v0[9], v0[7]);
    sub_1000EF354(v14);
  }
  else
  {
    (*(void (**)(void, void))(v13 + 8))(v0[9], v0[7]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v11, v14, v12);
  }
  uint64_t v15 = v0[15];
  uint64_t v16 = v0[13];
  uint64_t v25 = v0[12];
  uint64_t v17 = v0[10];
  uint64_t v18 = v0[11];
  uint64_t v19 = v0[8];
  uint64_t v20 = v0[7];
  uint64_t v21 = v0[5];
  type metadata accessor for BagProfile();
  Bag.withValuesForKeys(_:)();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  v22(v17, v20);
  v22(v18, v20);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v25);
  sub_1000EF354(v21);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t sub_1000ED8D0(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v3 = type metadata accessor for AppleServicesURLProtocol();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000ED990, 0, 0);
}

uint64_t sub_1000ED990()
{
  v0[8] = [self currentProcess];
  type metadata accessor for BaseObjectGraph();
  v0[9] = static BaseObjectGraph.current.getter();
  uint64_t v1 = sub_100005B18(&qword_100145EA0);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[10] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000EDA8C;
  return BaseObjectGraph.inject<A>(_:)(v0 + 2, v1, v1);
}

uint64_t sub_1000EDA8C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void **)(v2 + 64);
    swift_release();

    uint64_t v4 = sub_1000EDE3C;
  }
  else
  {
    swift_release();
    *(void *)(v2 + 96) = sub_100069708(0, &qword_100145E20);
    uint64_t v4 = sub_1000EDBE8;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000EDBE8()
{
  uint64_t v1 = v0[2];
  (*(void (**)(void, void, void))(v0[6] + 16))(v0[7], v0[4], v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[13] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000EDCA4;
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  return AMSURLSession.init(process:bag:urlProtocol:)(v4, v1, v3);
}

uint64_t sub_1000EDCA4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 112) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_1000EDEA0;
  }
  else
  {
    *(void *)(v4 + 120) = a1;
    uint64_t v5 = sub_1000EDDCC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000EDDCC()
{
  **(void **)(v0 + 24) = *(void *)(v0 + 120);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000EDE3C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000EDEA0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000EDF04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v29 = type metadata accessor for MetricsPipeline.Configuration();
  uint64_t v27 = *(void *)(v29 - 8);
  uint64_t v1 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v26 = (char *)&v23 - v4;
  uint64_t v5 = sub_100005B18(&qword_100144110);
  uint64_t v24 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Bag();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v23 - v13;
  type metadata accessor for BaseObjectGraph();
  static BaseObjectGraph.current.getter();
  BaseObjectGraph.inject<A>(_:)();
  uint64_t v23 = type metadata accessor for AMSMetricsEventRecorder();
  uint64_t v25 = v9;
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15(v12, v14, v8);
  if (qword_10013FC90 != -1) {
    swift_once();
  }
  Bag.subscript.getter();
  Bag.Value.current(or:)();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v5);
  uint64_t v16 = v23;
  uint64_t v17 = AMSMetricsEventRecorder.__allocating_init(bag:defaultTopic:)();
  v15(v12, v14, v8);
  uint64_t v31 = type metadata accessor for IntentMetricsEventLinter();
  uint64_t v32 = &protocol witness table for IntentMetricsEventLinter;
  sub_1000082EC(&v30);
  swift_retain();
  IntentMetricsEventLinter.init(objectGraph:)();
  MetricsPipeline.Configuration.init(bag:linter:anonymousTopics:)();
  uint64_t v31 = v16;
  uint64_t v32 = &protocol witness table for AMSMetricsEventRecorder;
  uint64_t v30 = v17;
  swift_retain();
  uint64_t v18 = v26;
  MetricsPipeline.Configuration.withRecorder(_:)();
  uint64_t v19 = v27;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v27 + 8);
  uint64_t v21 = v29;
  v20(v3, v29);
  sub_100007188((uint64_t)&v30);
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v3, v18, v21);
  MetricsPipeline.init(from:)();
  swift_release();
  swift_release();
  v20(v18, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v14, v8);
}

uint64_t sub_1000EE310@<X0>(uint64_t a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v1 = type metadata accessor for NativeIntentDispatcher();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v21 - v10;
  __chkstk_darwin(v9);
  uint64_t v28 = (char *)&v21 - v12;
  unint64_t v26 = 0xD000000000000011;
  unint64_t v27 = 0x80000001000FEAC0;
  NativeIntentDispatcher.init()();
  sub_1000EE664();
  NativeIntentDispatcher.registering<A>(_:)();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v25 = v11;
  v13(v11, v1);
  unint64_t v26 = 0xD000000000000013;
  unint64_t v27 = 0x80000001000FEAE0;
  NativeIntentDispatcher.init()();
  sub_1000EE6B8();
  NativeIntentDispatcher.registering<A>(_:)();
  uint64_t v22 = v8;
  v13(v8, v1);
  uint64_t v23 = v13;
  NativeIntentDispatcher.init()();
  sub_1000EE70C();
  NativeIntentDispatcher.registering<A>(_:)();
  v13(v5, v1);
  sub_100005B18(&qword_100145DE8);
  uint64_t v14 = *(void *)(v2 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v16 = swift_allocObject() + v15;
  uint64_t v17 = *(void (**)(unint64_t, char *, uint64_t))(v2 + 16);
  v17(v16, v28, v1);
  v17(v16 + v14, v25, v1);
  uint64_t v18 = v22;
  v17(v16 + 2 * v14, v22, v1);
  NativeIntentDispatcher.init()();
  NativeIntentDispatcher.register(contentsOf:)();
  NativeIntentDispatcher.register(contentsOf:)();
  NativeIntentDispatcher.register(contentsOf:)();
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v19 = v23;
  v23(v18, v1);
  v19(v25, v1);
  return ((uint64_t (*)(char *, uint64_t))v19)(v28, v1);
}

unint64_t sub_1000EE664()
{
  unint64_t result = qword_100145DD0;
  if (!qword_100145DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145DD0);
  }
  return result;
}

unint64_t sub_1000EE6B8()
{
  unint64_t result = qword_100145DD8;
  if (!qword_100145DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145DD8);
  }
  return result;
}

unint64_t sub_1000EE70C()
{
  unint64_t result = qword_100145DE0;
  if (!qword_100145DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145DE0);
  }
  return result;
}

uint64_t sub_1000EE760(uint64_t a1, uint64_t a2)
{
  uint64_t v43 = a2;
  uint64_t v44 = a1;
  uint64_t v47 = type metadata accessor for AppleServicesURLProtocol();
  uint64_t v2 = *(void *)(v47 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v47);
  uint64_t v4 = type metadata accessor for BagProfile();
  uint64_t v42 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v42 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v48 = type metadata accessor for Dependency();
  uint64_t v6 = *(void *)(v48 - 8);
  uint64_t v7 = __chkstk_darwin(v48);
  uint64_t v46 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v45 = (char *)&v41 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v41 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  unint64_t v16 = (char *)&v41 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v41 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v41 - v20;
  type metadata accessor for GKImageRestrictions();
  uint64_t v51 = v21;
  Dependency.init<A>(satisfying:with:)();
  uint64_t v49 = v19;
  Dependency.init<A>(satisfying:with:)();
  sub_100005B18((uint64_t *)&unk_100145DF0);
  uint64_t v50 = v16;
  Dependency.init<A>(satisfying:with:)();
  v52[3] = &type metadata for GameOverlayUIFeatureFlags;
  v52[4] = sub_100007D84();
  LOBYTE(v52[0]) = 2;
  LOBYTE(v16) = isFeatureEnabled(_:)();
  sub_100007188((uint64_t)v52);
  if (v16)
  {
    type metadata accessor for Bag();
    sub_1000EEE80(v43, (uint64_t)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v22 = v13;
    unint64_t v23 = (*(unsigned __int8 *)(v42 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
    uint64_t v24 = swift_allocObject() + v23;
    uint64_t v13 = v22;
    sub_1000EEFEC((uint64_t)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v24);
    Dependency.init<A>(satisfying:with:)();
    sub_100069708(0, &qword_100145E20);
    uint64_t v25 = v47;
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))((char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v44, v47);
    unint64_t v26 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
    uint64_t v27 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v27 + v26, (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v25);
    uint64_t v28 = v45;
    Dependency.init<A>(satisfying:with:)();
    type metadata accessor for MetricsPipeline();
    uint64_t v29 = v46;
    Dependency.init<A>(satisfying:with:)();
    type metadata accessor for BaseObjectGraph();
    sub_100005B18(&qword_100142658);
    unint64_t v30 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_10010F300;
    unint64_t v32 = v31 + v30;
    uint64_t v33 = v48;
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 16))(v32, v13, v48);
    BaseObjectGraph.__allocating_init(name:_:)();
    dispatch thunk of BaseObjectGraph.adding(dependency:)();
    uint64_t v47 = dispatch thunk of BaseObjectGraph.adding(dependency:)();
    swift_release();
    swift_release();
    uint64_t v34 = *(void (**)(char *, uint64_t))(v6 + 8);
    v34(v29, v33);
    v34(v28, v33);
    v34(v13, v33);
  }
  else
  {
    type metadata accessor for BaseObjectGraph();
    uint64_t v47 = BaseObjectGraph.__allocating_init(name:_:)();
    uint64_t v33 = v48;
  }
  sub_100069708(0, (unint64_t *)&unk_100145E00);
  v52[0] = [self currentProcess];
  Dependency.init<A>(satisfying:with:)();
  type metadata accessor for BaseObjectGraph();
  sub_100005B18(&qword_100142658);
  unint64_t v35 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_10010F300;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 16))(v36 + v35, v51, v33);
  BaseObjectGraph.__allocating_init(name:_:)();
  uint64_t v37 = v49;
  dispatch thunk of BaseObjectGraph.adding(dependency:)();
  uint64_t v38 = v50;
  dispatch thunk of BaseObjectGraph.adding(dependency:)();
  dispatch thunk of BaseObjectGraph.adding(allDependenciesOf:)();
  uint64_t v48 = dispatch thunk of BaseObjectGraph.adding(dependency:)();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v39 = *(void (**)(char *, uint64_t))(v6 + 8);
  v39(v13, v33);
  v39(v38, v33);
  v39(v37, v33);
  v39(v51, v33);
  return v48;
}

uint64_t sub_1000EEE80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BagProfile();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000EEEE4()
{
  uint64_t v1 = (int *)(type metadata accessor for BagProfile() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = type metadata accessor for Bag.Stubs();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_1000EEFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BagProfile();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000EF050(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for BagProfile() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000243C4;
  return sub_1000ECF7C(a1, v5);
}

uint64_t sub_1000EF128()
{
  uint64_t v1 = type metadata accessor for AppleServicesURLProtocol();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000EF1B8(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for AppleServicesURLProtocol() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_10003E30C;
  return sub_1000ED8D0(a1, v5);
}

unint64_t sub_1000EF290()
{
  unint64_t result = qword_100145EB8;
  if (!qword_100145EB8)
  {
    sub_10000B448(&qword_100145EB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100145EB8);
  }
  return result;
}

uint64_t sub_1000EF2EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005B18(&qword_100145EA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000EF354(uint64_t a1)
{
  uint64_t v2 = sub_100005B18(&qword_100145EA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t StrokeFocusEffect.init(shape:color:strokeWidth:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1);
  uint64_t result = type metadata accessor for StrokeFocusEffect();
  *(void *)(a4 + *(int *)(result + 52)) = a2;
  *(double *)(a4 + *(int *)(result + 56)) = a5;
  return result;
}

uint64_t type metadata accessor for StrokeFocusEffect()
{
  return swift_getGenericMetadata();
}

uint64_t View.focusEffect<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = *(void *)(a2 - 8);
  uint64_t v9 = __chkstk_darwin(a1);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v14 + 16))(v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v4, a2);
  return sub_1000EF7EC((uint64_t)v13, (uint64_t)v11, a3, a4);
}

uint64_t sub_1000EF5E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 - 8);
  uint64_t v7 = __chkstk_darwin(a1);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, a1, a4);
  return _ShapeView.init(shape:style:fillStyle:)();
}

uint64_t View.focusEffectPreview()()
{
  return swift_release();
}

uint64_t sub_1000EF7EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1);
  uint64_t v6 = (int *)type metadata accessor for FocusEffectView();
  uint64_t v7 = a4 + v6[9];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(v7, a2, AssociatedTypeWitness);
  uint64_t v9 = a4 + v6[10];
  *(unsigned char *)uint64_t v9 = FocusState.init<>()() & 1;
  *(void *)(v9 + 8) = v10;
  *(unsigned char *)(v9 + 16) = v11 & 1;
  uint64_t v12 = a4 + v6[11];
  uint64_t result = swift_getKeyPath();
  *(void *)uint64_t v12 = result;
  *(unsigned char *)(v12 + 8) = 0;
  return result;
}

uint64_t StrokeFocusEffect.applyEffect(isFocused:content:)()
{
  return View.overlay<A>(alignment:content:)();
}

uint64_t sub_1000EFA6C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X3>, void *a5@<X5>, char *a6@<X8>)
{
  uint64_t v42 = a4;
  uint64_t v43 = a5;
  int v34 = a2;
  uint64_t v33 = a1;
  uint64_t v41 = a6;
  uint64_t v7 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v10;
  uint64_t v12 = type metadata accessor for _StrokedShape();
  uint64_t v40 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v33 - v13;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v46 = v12;
  uint64_t v47 = &type metadata for Color;
  uint64_t v35 = WitnessTable;
  uint64_t v48 = WitnessTable;
  uint64_t v49 = &protocol witness table for Color;
  uint64_t v16 = type metadata accessor for _ShapeView();
  uint64_t v39 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v37 = (char *)&v33 - v17;
  uint64_t v18 = type metadata accessor for ModifiedContent();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v36 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v38 = (char *)&v33 - v22;
  uint64_t v23 = v7;
  uint64_t v24 = *(void (**)(char *))(v7 + 16);
  uint64_t v25 = v33;
  v24(v9);
  if (v34)
  {
    uint64_t v46 = a3;
    uint64_t v47 = v42;
    uint64_t v48 = v11;
    uint64_t v49 = v43;
    type metadata accessor for StrokeFocusEffect();
  }
  Shape.stroke(lineWidth:)();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, a3);
  uint64_t v46 = a3;
  uint64_t v47 = v42;
  uint64_t v48 = v11;
  uint64_t v49 = v43;
  uint64_t v46 = *(void *)(v25 + *(int *)(type metadata accessor for StrokeFocusEffect() + 52));
  unint64_t v26 = v37;
  sub_1000EF5E4((uint64_t)&v46, 256, v12, (uint64_t)&type metadata for Color);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v12);
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v28 = v36;
  View.padding(_:)();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v16);
  uint64_t v44 = v27;
  uint64_t v45 = &protocol witness table for _PaddingLayout;
  swift_getWitnessTable();
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  unint64_t v30 = v38;
  v29(v38, v28, v18);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v19 + 8);
  v31(v28, v18);
  v29(v41, v30, v18);
  return ((uint64_t (*)(char *, uint64_t))v31)(v30, v18);
}

uint64_t FillFocusBackgroundEffect.init(shape:color:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1);
  uint64_t result = type metadata accessor for FillFocusBackgroundEffect();
  *(void *)(a4 + *(int *)(result + 52)) = a2;
  return result;
}

uint64_t FillFocusBackgroundEffect.applyEffect(isFocused:content:)()
{
  return View.background<A>(alignment:content:)();
}

uint64_t sub_1000F009C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, void *a6@<X5>, char *a7@<X8>)
{
  uint64_t v28 = a4;
  uint64_t v29 = a6;
  unint64_t v30 = a7;
  uint64_t v11 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = v14;
  unint64_t v32 = &type metadata for Color;
  uint64_t v33 = v15;
  int v34 = &protocol witness table for Color;
  uint64_t v16 = type metadata accessor for _ShapeView();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v27 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, a3);
  if (a2)
  {
    uint64_t v31 = a3;
    unint64_t v32 = v28;
    uint64_t v33 = a5;
    int v34 = v29;
    uint64_t v23 = *(void *)(a1 + *(int *)(type metadata accessor for FillFocusBackgroundEffect() + 52));
    swift_retain();
  }
  else
  {
    uint64_t v23 = static Color.clear.getter();
  }
  uint64_t v31 = v23;
  sub_1000EF5E4((uint64_t)&v31, 256, a3, (uint64_t)&type metadata for Color);
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, a3);
  swift_getWitnessTable();
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v24(v22, v20, v16);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v17 + 8);
  v25(v20, v16);
  v24(v30, v22, v16);
  return ((uint64_t (*)(char *, uint64_t))v25)(v22, v16);
}

uint64_t sub_1000F0348@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v29 = *(void *)(a1 + 24);
  uint64_t v30 = v4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v7 = (char *)&v28 - v6;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v39 = AssociatedTypeWitness;
  uint64_t v40 = AssociatedConformanceWitness;
  uint64_t v9 = AssociatedConformanceWitness;
  uint64_t v28 = AssociatedConformanceWitness;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v31 = OpaqueTypeMetadata2;
  uint64_t v34 = *(void *)(OpaqueTypeMetadata2 - 8);
  __chkstk_darwin(OpaqueTypeMetadata2);
  uint64_t v12 = (char *)&v28 - v11;
  uint64_t v39 = AssociatedTypeWitness;
  uint64_t v40 = v9;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v39 = OpaqueTypeMetadata2;
  uint64_t v40 = OpaqueTypeConformance2;
  uint64_t v13 = swift_getOpaqueTypeMetadata2();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v28 - v18;
  char v20 = sub_1000F0710(a1);
  (*(void (**)(void, uint64_t, uint64_t))(v29 + 40))(v20 & 1, v2 + *(int *)(a1 + 36), v30);
  View.focusEffectDisabled(_:)();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v7, AssociatedTypeWitness);
  uint64_t v21 = (char *)(v2 + *(int *)(a1 + 40));
  char v22 = *v21;
  uint64_t v23 = *((void *)v21 + 1);
  LOBYTE(v21) = v21[16];
  char v36 = v22;
  uint64_t v37 = v23;
  char v38 = (char)v21;
  sub_100005B18(&qword_1001460C0);
  FocusState.projectedValue.getter();
  uint64_t v24 = v31;
  View.focused(_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v24);
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v25(v19, v17, v13);
  unint64_t v26 = *(void (**)(char *, uint64_t))(v14 + 8);
  v26(v17, v13);
  v25(v35, v19, v13);
  return ((uint64_t (*)(char *, uint64_t))v26)(v19, v13);
}

uint64_t sub_1000F0710(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = __chkstk_darwin(a1);
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = (char *)(v1 + *(int *)(v5 + 40));
  char v9 = *v8;
  uint64_t v10 = *((void *)v8 + 1);
  LOBYTE(v8) = v8[16];
  v17[8] = v9;
  uint64_t v18 = v10;
  char v19 = (char)v8;
  sub_100005B18(&qword_1001460C0);
  FocusState.wrappedValue.getter();
  char v11 = v20;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v7, v2, a1);
  if (v11)
  {
    char v12 = 1;
  }
  else
  {
    uint64_t v13 = &v7[*(int *)(a1 + 44)];
    uint64_t v14 = *(void *)v13;
    char v15 = v13[8];
    sub_1000F2024(*(void *)v13, v15);
    char v12 = sub_100035798(v14, v15);
    sub_10003A524(v14, v15);
  }
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, a1);
  return v12 & 1;
}

uint64_t sub_1000F0874()
{
  sub_1000F2C7C();
  EnvironmentValues.subscript.getter();
  return v1;
}

uint64_t sub_1000F08B0@<X0>(unsigned char *a1@<X8>)
{
  sub_1000F2C7C();
  uint64_t result = EnvironmentValues.subscript.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_1000F0900@<X0>(unsigned char *a1@<X8>)
{
  sub_1000F2C7C();
  uint64_t result = EnvironmentValues.subscript.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_1000F0950()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_1000F099C()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_1000F09E8()
{
  return sub_1000F0A30((uint64_t (*)(void, void, void, void, void, void))sub_1000EFA6C);
}

uint64_t type metadata accessor for FillFocusBackgroundEffect()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1000F0A18()
{
  return sub_1000F0A30((uint64_t (*)(void, void, void, void, void, void))sub_1000F009C);
}

uint64_t sub_1000F0A30(uint64_t (*a1)(void, void, void, void, void, void))
{
  return a1(*(void *)(v1 + 48), *(unsigned __int8 *)(v1 + 56), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1000F0A4C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 40);
}

uint64_t sub_1000F0A54()
{
  return sub_1000F0A84();
}

uint64_t sub_1000F0A6C()
{
  return sub_1000F0A84();
}

uint64_t sub_1000F0A84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000F0AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 48);
}

uint64_t sub_1000F0AC0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1000F0B6C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    char v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v10 = *v11;
    *(void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000F0C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_1000F0D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = v6 + a2;
  unint64_t v9 = (v8 & 0xFFFFFFFFFFFFFFF8) + 15;
  *int v7 = *(void *)(v8 & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(v9 & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1000F0DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1000F0E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  swift_release();
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1000F0ECC(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1000F1020);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_1000F1034(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if (v7 < 0x7FFFFFFF)
            {
              char v19 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0) {
                uint64_t v20 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v20 = a2 - 1;
              }
              *char v19 = v20;
            }
            else
            {
              uint64_t v18 = *(void (**)(void))(v6 + 56);
              v18();
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    int v17 = ~v8 + a2;
    bzero(a1, ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x1000F1224);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t sub_1000F124C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 40);
}

uint64_t sub_1000F1254()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1000F12F0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000F13E8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();

  return swift_release();
}

uint64_t sub_1000F1458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 48) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 48) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_1000F14D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 40) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 40) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1000F1564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1000F15E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_1000F1664(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1000F17B0);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_1000F17C4(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x1000F19A0);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          uint64_t v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0) {
            uint64_t v19 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v19 = a2 - 1;
          }
          *uint64_t v18 = v19;
        }
        else
        {
          unint64_t v17 = *(void (**)(void))(v6 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t sub_1000F19C8()
{
  type metadata accessor for FocusEffectView();

  return swift_getWitnessTable();
}

uint64_t type metadata accessor for FocusEffectView()
{
  return sub_100097F94();
}

uint64_t sub_1000F1A28()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000F1B68()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000F1C48()
{
  return swift_getWitnessTable();
}

unint64_t sub_1000F1CB8()
{
  unint64_t result = qword_100146038[0];
  if (!qword_100146038[0])
  {
    sub_10000B448(&qword_100146030);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100146038);
  }
  return result;
}

uint64_t sub_1000F1D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_1000F1D1C()
{
  uint64_t AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return AssociatedTypeWitness;
}

uint64_t *sub_1000F1E20(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v7 + v10) & ~v10;
  uint64_t v13 = *(void *)(v9 + 64);
  unint64_t v14 = ((v13 + v12 + 31) & 0xFFFFFFFFFFFFFFF8) + 9;
  unsigned int v15 = v10 | *(_DWORD *)(v6 + 80) & 0xF8;
  if (v15 > 7 || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0 || v14 > 0x18)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + (((v15 | 7) + 16) & ~(unint64_t)(v15 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v19 = AssociatedTypeWitness;
    uint64_t v20 = ~v10;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    unint64_t v21 = ((unint64_t)a1 + v11) & v20;
    unint64_t v22 = ((unint64_t)a2 + v11) & v20;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(v21, v22, v19);
    unint64_t v23 = (v21 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v24 = (v22 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v23 = *(unsigned char *)v24;
    *(void *)(v23 + 8) = *(void *)(v24 + 8);
    *(unsigned char *)(v23 + 16) = *(unsigned char *)(v24 + 16);
    unint64_t v25 = (v21 + v13 + 31) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v26 = (v22 + v13 + 31) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v27 = *(void *)v26;
    LOBYTE(v21) = *(unsigned char *)(v26 + 8);
    swift_retain();
    sub_1000F2024(v27, v21);
    *(void *)unint64_t v25 = v27;
    *(unsigned char *)(v25 + 8) = v21;
  }
  return a1;
}

uint64_t sub_1000F2024(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000F2030(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(uint64_t, void))v3)(a1, *(void *)(a2 + 16));
  uint64_t v4 = *(void *)(v3 + 56) + a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = v6 + 8;
  unint64_t v8 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v8, AssociatedTypeWitness);
  unint64_t v9 = v8 + *(void *)(v7 + 56);
  swift_release();
  unint64_t v10 = (v9 + 31) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void *)v10;
  char v12 = *(unsigned char *)(v10 + 8);

  return sub_10003A524(v11, v12);
}

uint64_t sub_1000F2128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (v6 + v10 + a1) & ~v10;
  uint64_t v12 = (v6 + v10 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v12, AssociatedTypeWitness);
  uint64_t v13 = *(void *)(v9 + 48);
  uint64_t v14 = v13 + v11;
  uint64_t v15 = v13 + v12;
  unint64_t v16 = (v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = (v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v16 = *(unsigned char *)v17;
  *(void *)(v16 + 8) = *(void *)(v17 + 8);
  *(unsigned char *)(v16 + 16) = *(unsigned char *)(v17 + 16);
  unint64_t v18 = (v14 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (v15 + 31) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = *(void *)v19;
  LOBYTE(v12) = *(unsigned char *)(v19 + 8);
  swift_retain();
  sub_1000F2024(v20, v12);
  *(void *)unint64_t v18 = v20;
  *(unsigned char *)(v18 + 8) = v12;
  return a1;
}

uint64_t sub_1000F2268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (v6 + v10 + a1) & ~v10;
  uint64_t v12 = (v6 + v10 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v11, v12, AssociatedTypeWitness);
  uint64_t v13 = *(void *)(v9 + 40);
  uint64_t v14 = v13 + v11;
  uint64_t v15 = v13 + v12;
  unint64_t v16 = (v13 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = (v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v16 = *(unsigned char *)v17;
  *(void *)(v16 + 8) = *(void *)(v17 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(v16 + 16) = *(unsigned char *)(v17 + 16);
  unint64_t v18 = (v14 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (v15 + 31) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = *(void *)v19;
  LOBYTE(v15) = *(unsigned char *)(v19 + 8);
  sub_1000F2024(*(void *)v19, v15);
  uint64_t v21 = *(void *)v18;
  char v22 = *(unsigned char *)(v18 + 8);
  *(void *)unint64_t v18 = v20;
  *(unsigned char *)(v18 + 8) = v15;
  sub_10003A524(v21, v22);
  return a1;
}

uint64_t sub_1000F23C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (v6 + v10 + a1) & ~v10;
  uint64_t v12 = (v6 + v10 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v11, v12, AssociatedTypeWitness);
  uint64_t v13 = *(void *)(v9 + 32);
  uint64_t v14 = v13 + v11;
  uint64_t v15 = v13 + v12;
  unint64_t v16 = (v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = (v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  long long v18 = *(_OWORD *)v17;
  *(unsigned char *)(v16 + 16) = *(unsigned char *)(v17 + 16);
  *(_OWORD *)unint64_t v16 = v18;
  unint64_t v19 = (v14 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v15 + 31) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  *(void *)unint64_t v19 = v21;
  return a1;
}

uint64_t sub_1000F24E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (v6 + v10 + a1) & ~v10;
  uint64_t v12 = (v6 + v10 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v11, v12, AssociatedTypeWitness);
  uint64_t v13 = *(void *)(v9 + 24);
  uint64_t v14 = v13 + v11;
  uint64_t v15 = v13 + v12;
  unint64_t v16 = (v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = (v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v16 = *(unsigned char *)v17;
  *(void *)(v16 + 8) = *(void *)(v17 + 8);
  swift_release();
  *(unsigned char *)(v16 + 16) = *(unsigned char *)(v17 + 16);
  unint64_t v18 = (v14 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (v15 + 31) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = *(void *)v19;
  LOBYTE(v19) = *(unsigned char *)(v19 + 8);
  uint64_t v21 = *(void *)v18;
  char v22 = *(unsigned char *)(v18 + 8);
  *(void *)unint64_t v18 = v20;
  *(unsigned char *)(v18 + 8) = v19;
  sub_10003A524(v21, v22);
  return a1;
}

uint64_t sub_1000F262C(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = *(void *)(v8 + 64);
  if (v9 <= v7) {
    unsigned int v12 = v7;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v8 + 84);
  }
  if (v12 <= 0x7FFFFFFE) {
    unsigned int v12 = 2147483646;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v13 = *(void *)(v6 + 64) + v10;
  if (v12 < a2)
  {
    unint64_t v14 = ((v11 + (v13 & ~v10) + 31) & 0xFFFFFFFFFFFFFFF8) + 9;
    if (v14 < 4) {
      unsigned int v15 = ((a2 - v12 + 255) >> (8 * v14)) + 1;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v15 >= 0x10000) {
      unsigned int v16 = 4;
    }
    else {
      unsigned int v16 = 2;
    }
    if (v15 < 0x100) {
      unsigned int v16 = 1;
    }
    if (v15 >= 2) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    switch(v17)
    {
      case 1:
        int v18 = a1[v14];
        if (!a1[v14]) {
          break;
        }
        goto LABEL_24;
      case 2:
        int v18 = *(unsigned __int16 *)&a1[v14];
        if (*(_WORD *)&a1[v14]) {
          goto LABEL_24;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1000F28C8);
      case 4:
        int v18 = *(_DWORD *)&a1[v14];
        if (!v18) {
          break;
        }
LABEL_24:
        int v20 = (v18 - 1) << (8 * v14);
        if (v14 >= 4) {
          int v20 = 0;
        }
        if (v14 == 1) {
          int v21 = *a1;
        }
        else {
          int v21 = *(_DWORD *)a1;
        }
        int v26 = v12 + (v21 | v20);
        return (v26 + 1);
      default:
        break;
    }
  }
  if (v7 == v12)
  {
    char v22 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v6 + 48);
    return v22(a1, v7, v5);
  }
  else
  {
    unint64_t v23 = (unint64_t)&a1[v13] & ~v10;
    if (v9 == v12)
    {
      unint64_t v24 = *(uint64_t (**)(unint64_t))(v8 + 48);
      return v24(v23);
    }
    else
    {
      unint64_t v25 = *(void *)(((v11 + v23 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      if (v25 >= 0xFFFFFFFF) {
        LODWORD(v25) = -1;
      }
      int v26 = v25 - 1;
      if (v26 < 0) {
        int v26 = -1;
      }
      return (v26 + 1);
    }
  }
}

void sub_1000F28DC(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v29 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v11 = *(_DWORD *)(v10 + 84);
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = *(void *)(v10 + 64);
  if (v11 <= v9) {
    unsigned int v14 = v9;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v10 + 84);
  }
  if (v14 <= 0x7FFFFFFE) {
    unsigned int v14 = 2147483646;
  }
  uint64_t v15 = *(void *)(v8 + 64) + v12;
  size_t v16 = ((v13 + (v15 & ~v12) + 31) & 0xFFFFFFFFFFFFFFF8) + 9;
  char v17 = 8 * v16;
  if (v14 >= a3)
  {
    int v20 = 0;
    if (v14 >= a2)
    {
LABEL_19:
      uint64_t v21 = ~v12;
      switch(v20)
      {
        case 1:
          a1[v16] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_36;
        case 2:
          *(_WORD *)&a1[v16] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_36;
        case 3:
          goto LABEL_52;
        case 4:
          *(_DWORD *)&a1[v16] = 0;
          goto LABEL_35;
        default:
LABEL_35:
          if (a2)
          {
LABEL_36:
            if (v9 == v14)
            {
              unint64_t v25 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v29 + 56);
              v25(a1, a2, v9, v7);
            }
            else
            {
              unint64_t v26 = (unint64_t)&a1[v15] & v21;
              if (v11 == v14)
              {
                uint64_t v27 = *(void (**)(unint64_t, uint64_t))(v10 + 56);
                v27(v26, a2);
              }
              else
              {
                unint64_t v28 = (v13 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
                if (a2 > 0x7FFFFFFE)
                {
                  *(unsigned char *)(v28 + 16) = 0;
                  *(void *)unint64_t v28 = (a2 - 0x7FFFFFFF);
                  *(void *)(v28 + 8) = 0;
                }
                else
                {
                  *(void *)(v28 + 8) = a2;
                }
              }
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    if (v16 <= 3) {
      unsigned int v18 = ((a3 - v14 + 255) >> v17) + 1;
    }
    else {
      unsigned int v18 = 2;
    }
    if (v18 >= 0x10000) {
      int v19 = 4;
    }
    else {
      int v19 = 2;
    }
    if (v18 < 0x100) {
      int v19 = 1;
    }
    if (v18 >= 2) {
      int v20 = v19;
    }
    else {
      int v20 = 0;
    }
    if (v14 >= a2) {
      goto LABEL_19;
    }
  }
  unsigned int v22 = ~v14 + a2;
  if (v16 < 4) {
    int v23 = (v22 >> v17) + 1;
  }
  else {
    int v23 = 1;
  }
  if (v16 >= 4) {
    unsigned int v24 = v22;
  }
  else {
    unsigned int v24 = v22;
  }
  bzero(a1, v16);
  if (v16 == 1) {
    *a1 = v24;
  }
  else {
    *(_DWORD *)a1 = v24;
  }
  switch(v20)
  {
    case 1:
      a1[v16] = v23;
      break;
    case 2:
      *(_WORD *)&a1[v16] = v23;
      break;
    case 3:
LABEL_52:
      __break(1u);
      JUMPOUT(0x1000F2BF8);
    case 4:
      *(_DWORD *)&a1[v16] = v23;
      break;
    default:
      return;
  }
}

uint64_t sub_1000F2C20()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1000F2C68(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1000F2C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, &protocol witness table for Bool);
}

unint64_t sub_1000F2C7C()
{
  unint64_t result = qword_1001460C8;
  if (!qword_1001460C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001460C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewFocusEffect()
{
  return &type metadata for PreviewFocusEffect;
}

uint64_t sub_1000F2CE0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000F2DC4()
{
  return swift_deallocClassInstance();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

void sub_1000F2EC8()
{
  uint64_t v0 = type metadata accessor for GameOverlayUIConfig.ServiceKind();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((byte_100142F70 & 1) == 0)
  {
    uint64_t v4 = static GameOverlayUIConfig.machServiceDomain.getter();
    uint64_t v6 = v5;
    uint64_t v7 = *(void (**)(char *, void, uint64_t))(v1 + 104);
    v7(v3, enum case for GameOverlayUIConfig.ServiceKind.dashboard(_:), v0);
    sub_10008EBD8(v4, v6);
    uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
    v8(v3, v0);
    v7(v3, enum case for GameOverlayUIConfig.ServiceKind.auth(_:), v0);
    sub_10008EBD8(v4, v6);
    v8(v3, v0);
    v7(v3, enum case for GameOverlayUIConfig.ServiceKind.multiplayer(_:), v0);
    sub_10008EBD8(v4, v6);
    v8(v3, v0);
    v7(v3, enum case for GameOverlayUIConfig.ServiceKind.internalUse(_:), v0);
    sub_10008EBD8(v4, v6);
    swift_bridgeObjectRelease();
    v8(v3, v0);
    byte_100142F70 = 1;
  }
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100007D4C(v9, (uint64_t)qword_100156CF8);
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Listeners started", v12, 2u);
    swift_slowDealloc();
  }

  int v13 = static CommandLine.argc.getter();
  unsigned int v14 = (char **)static CommandLine.unsafeArgv.getter();
  type metadata accessor for AppDelegate();
  uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  size_t v16 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v16)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    size_t v16 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  UIApplicationMain(v13, v14, 0, v16);
}

uint64_t type metadata accessor for GameOverlayUIApp()
{
  return self;
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

id sub_1000F321C(void *a1, void *a2, void *a3)
{
  if (qword_10013FBB0 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100007D4C(v6, (uint64_t)qword_100156CF8);
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  int v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    os_log_type_t type = v14;
    uint64_t v15 = swift_slowAlloc();
    size_t v16 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 138412802;
    id v17 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *size_t v16 = v10;

    *(_WORD *)(v15 + 12) = 2112;
    id v18 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v16[1] = v11;

    *(_WORD *)(v15 + 22) = 2112;
    id v19 = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v16[2] = v12;

    _os_log_impl((void *)&_mh_execute_header, v13, type, "Application: %@, configuration for connecting scene session: %@, options: %@", (uint8_t *)v15, 0x20u);
    sub_100005B18(&qword_100142A40);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v20 = [v11 role];
  id v21 = [objc_allocWithZone((Class)UISceneConfiguration) initWithName:0 sessionRole:v20];

  sub_1000F34F4();
  [v21 setSceneClass:swift_getObjCClassFromMetadata()];
  type metadata accessor for GameOverlayUIRemoteAlertSceneDelegate();
  [v21 setDelegateClass:swift_getObjCClassFromMetadata()];
  return v21;
}

unint64_t sub_1000F34F4()
{
  unint64_t result = qword_1001461F0;
  if (!qword_1001461F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1001461F0);
  }
  return result;
}

uint64_t sub_1000F3534()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000F364C()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000F3764()
{
  return Hasher._finalize()();
}

Swift::Int sub_1000F3898()
{
  return Hasher._finalize()();
}

uint64_t AccessPointUseCase.isEphemeral.getter(unsigned __int8 a1)
{
  return (a1 < 7u) & (0x79u >> a1);
}

unint64_t AccessPointUseCase.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6F50737365636361;
      break;
    case 2:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000020;
      break;
    case 5:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 6:
      unint64_t result = 0x6142656D61476E69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t AccessPointPageIntent.init(useCase:showHighlights:newToGameCenter:player:game:)@<X0>(char a1@<W0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  long long v7 = *(_OWORD *)(a4 + 112);
  *(_OWORD *)(a6 + 104) = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(a6 + 120) = v7;
  *(_OWORD *)(a6 + 136) = *(_OWORD *)(a4 + 128);
  long long v8 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(a6 + 40) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(a6 + 56) = v8;
  long long v9 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(a6 + 72) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(a6 + 88) = v9;
  long long v10 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(a6 + 8) = *(_OWORD *)a4;
  *(unsigned char *)a6 = a1;
  *(unsigned char *)(a6 + 1) = a2;
  *(unsigned char *)(a6 + 2) = a3;
  *(void *)(a6 + 152) = *(void *)(a4 + 144);
  *(_OWORD *)(a6 + 24) = v10;
  uint64_t v11 = a6 + *(int *)(type metadata accessor for AccessPointPageIntent() + 32);

  return sub_1000863E4(a5, v11);
}

unint64_t AccessPointUseCase.jsRepresentation(in:)@<X0>(void *a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  unint64_t v4 = 0xD000000000000011;
  unint64_t v5 = 0x80000001000FC0B0;
  switch(a2)
  {
    case 1:
      unint64_t v5 = 0xEF796C6E4F746E69;
      unint64_t v4 = 0x6F50737365636361;
      break;
    case 2:
      unint64_t v4 = 0xD00000000000001BLL;
      uint64_t v6 = "welcomeBannerAndAccessPoint";
      goto LABEL_7;
    case 3:
      uint64_t v6 = "achievementBanner";
      goto LABEL_7;
    case 4:
      unint64_t v4 = 0xD000000000000020;
      uint64_t v6 = "leaderboardBeatFriendScoreBanner";
      goto LABEL_7;
    case 5:
      unint64_t v4 = 0xD00000000000001ELL;
      uint64_t v6 = "leaderboardTopPercentageBanner";
LABEL_7:
      unint64_t v5 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    case 6:
      unint64_t v5 = 0xEC00000072656E6ELL;
      unint64_t v4 = 0x6142656D61476E69;
      break;
    default:
      break;
  }
  unint64_t v11 = v4;
  unint64_t v12 = v5;
  id v7 = a1;
  uint64_t v8 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  id v9 = [self valueWithObject:v8 inContext:v7];
  swift_unknownObjectRelease();

  a3[3] = sub_100005B18(&qword_1001461F8);
  unint64_t result = sub_1000F47C8();
  a3[4] = result;
  *a3 = v9;
  return result;
}

uint64_t sub_1000F3CF0(unsigned __int8 *a1, char *a2)
{
  return sub_100008CAC(*a1, *a2);
}

Swift::Int sub_1000F3CFC()
{
  return sub_1000F3764();
}

uint64_t sub_1000F3D08()
{
  return sub_1000F364C();
}

Swift::Int sub_1000F3D10()
{
  return sub_1000F3764();
}

unint64_t sub_1000F3D18@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s13GameOverlayUI18AccessPointUseCaseO8rawValueACSgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_1000F3D48@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AccessPointUseCase.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000F3D74()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_1000F3DD4()
{
  return RawRepresentable<>.encode(to:)();
}

unint64_t sub_1000F3E24@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return AccessPointUseCase.jsRepresentation(in:)(a1, *v2, a2);
}

JSValue sub_1000F3E40(JSContext a1)
{
  return CustomJSValueConvertible._jsValue(in:)(a1);
}

void *AccessPointPageIntent.kind.unsafeMutableAddressor()
{
  return &static AccessPointPageIntent.kind;
}

unint64_t static AccessPointPageIntent.kind.getter()
{
  return 0xD000000000000015;
}

uint64_t AccessPointPageIntent.showHighlights.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t AccessPointPageIntent.newToGameCenter.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t AccessPointPageIntent.game.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AccessPointPageIntent();
  return sub_1000F4888(v1 + *(int *)(v3 + 32), a1, (uint64_t (*)(void))type metadata accessor for Game);
}

uint64_t sub_1000F3EE0()
{
  uint64_t result = 0x65736143657375;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x68676948776F6873;
      break;
    case 2:
      uint64_t result = 0x6D61476F5477656ELL;
      break;
    case 3:
      uint64_t result = 0x726579616C70;
      break;
    case 4:
      uint64_t result = 1701667175;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000F3F98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000F5FD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000F3FC0(uint64_t a1)
{
  unint64_t v2 = sub_1000F4834();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000F3FFC(uint64_t a1)
{
  unint64_t v2 = sub_1000F4834();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t AccessPointPageIntent.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005B18(&qword_100146208);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100006650(a1, a1[3]);
  sub_1000F4834();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v15) = *(unsigned char *)v3;
  char v25 = 0;
  sub_100041750();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    LOBYTE(v15) = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v25 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    long long v9 = *(_OWORD *)(v3 + 120);
    long long v21 = *(_OWORD *)(v3 + 104);
    long long v22 = v9;
    long long v23 = *(_OWORD *)(v3 + 136);
    uint64_t v24 = *(void *)(v3 + 152);
    long long v10 = *(_OWORD *)(v3 + 56);
    long long v17 = *(_OWORD *)(v3 + 40);
    long long v18 = v10;
    long long v11 = *(_OWORD *)(v3 + 88);
    long long v19 = *(_OWORD *)(v3 + 72);
    long long v20 = v11;
    long long v12 = *(_OWORD *)(v3 + 24);
    long long v15 = *(_OWORD *)(v3 + 8);
    long long v16 = v12;
    v14[15] = 3;
    sub_1000066E8();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    type metadata accessor for AccessPointPageIntent();
    LOBYTE(v15) = 4;
    type metadata accessor for Game();
    sub_100086B7C(&qword_100142C58);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t AccessPointPageIntent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v23 = type metadata accessor for Game();
  __chkstk_darwin(v23);
  unint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005B18(&qword_100146218);
  uint64_t v24 = *(void *)(v5 - 8);
  uint64_t v25 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AccessPointPageIntent();
  __chkstk_darwin(v8);
  long long v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a1[3];
  unint64_t v26 = a1;
  sub_100006650(a1, v11);
  sub_1000F4834();
  uint64_t v12 = v40;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v12) {
    return sub_100007188((uint64_t)v26);
  }
  uint64_t v40 = v8;
  uint64_t v13 = (uint64_t)v4;
  uint64_t v14 = v24;
  char v27 = 0;
  sub_100041D04();
  uint64_t v15 = v25;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  *long long v10 = v30;
  LOBYTE(v30) = 1;
  v10[1] = KeyedDecodingContainer.decode(_:forKey:)() & 1;
  LOBYTE(v30) = 2;
  v10[2] = KeyedDecodingContainer.decode(_:forKey:)() & 1;
  char v29 = 3;
  sub_1000071D8();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  long long v16 = v37;
  *(_OWORD *)(v10 + 104) = v36;
  *(_OWORD *)(v10 + 120) = v16;
  *(_OWORD *)(v10 + 136) = v38;
  long long v17 = v33;
  *(_OWORD *)(v10 + 40) = v32;
  *(_OWORD *)(v10 + 56) = v17;
  long long v18 = v35;
  *(_OWORD *)(v10 + 72) = v34;
  *(_OWORD *)(v10 + 88) = v18;
  long long v19 = v31;
  *(_OWORD *)(v10 + 8) = v30;
  *((void *)v10 + 19) = v39;
  *(_OWORD *)(v10 + 24) = v19;
  char v28 = 4;
  sub_100086B7C(&qword_100142C68);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v15);
  sub_1000863E4(v13, (uint64_t)&v10[*(int *)(v40 + 32)]);
  sub_1000F4888((uint64_t)v10, v22, (uint64_t (*)(void))type metadata accessor for AccessPointPageIntent);
  sub_100007188((uint64_t)v26);
  return sub_1000F48F0((uint64_t)v10);
}

void sub_1000F46E0(void *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x8000000100113CF0;
}

uint64_t sub_1000F4700@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AccessPointPageIntent.init(from:)(a1, a2);
}

uint64_t sub_1000F4718(void *a1)
{
  return AccessPointPageIntent.encode(to:)(a1);
}

unint64_t _s13GameOverlayUI18AccessPointUseCaseO8rawValueACSgSS_tcfC_0(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10012FC70, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 7) {
    return 7;
  }
  else {
    return v3;
  }
}

uint64_t type metadata accessor for AccessPointPageIntent()
{
  uint64_t result = qword_100146280;
  if (!qword_100146280) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1000F47C8()
{
  unint64_t result = qword_100146200;
  if (!qword_100146200)
  {
    sub_10000B448(&qword_1001461F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100146200);
  }
  return result;
}

unint64_t sub_1000F4834()
{
  unint64_t result = qword_100146210;
  if (!qword_100146210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100146210);
  }
  return result;
}

uint64_t sub_1000F4888(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000F48F0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AccessPointPageIntent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000F4950()
{
  unint64_t result = qword_100146220;
  if (!qword_100146220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100146220);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AccessPointUseCase(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x1000F4A70);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessPointUseCase()
{
  return &type metadata for AccessPointUseCase;
}

uint64_t initializeBufferWithCopyOfBuffer for AccessPointPageIntent(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v16 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(_WORD *)(a1 + 1) = *(_WORD *)((char *)a2 + 1);
    uint64_t v7 = a2[2];
    *(void *)(v4 + 8) = a2[1];
    *(void *)(v4 + 16) = v7;
    uint64_t v8 = a2[4];
    *(void *)(v4 + 24) = a2[3];
    *(void *)(v4 + 32) = v8;
    uint64_t v9 = a2[6];
    *(void *)(v4 + 40) = a2[5];
    *(void *)(v4 + 48) = v9;
    uint64_t v10 = a2[8];
    *(void *)(v4 + 56) = a2[7];
    *(void *)(v4 + 64) = v10;
    uint64_t v11 = a2[10];
    *(void *)(v4 + 72) = a2[9];
    *(void *)(v4 + 80) = v11;
    *(unsigned char *)(v4 + 88) = *((unsigned char *)a2 + 88);
    uint64_t v12 = a2[13];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12)
    {
      *(void *)(v4 + 96) = a2[12];
      *(void *)(v4 + 104) = v12;
      uint64_t v13 = a2[15];
      *(void *)(v4 + 112) = a2[14];
      *(void *)(v4 + 120) = v13;
      uint64_t v14 = a2[17];
      *(void *)(v4 + 128) = a2[16];
      *(void *)(v4 + 136) = v14;
      uint64_t v15 = a2[19];
      *(void *)(v4 + 144) = a2[18];
      *(void *)(v4 + 152) = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v17 = *((_OWORD *)a2 + 7);
      *(_OWORD *)(v4 + 96) = *((_OWORD *)a2 + 6);
      *(_OWORD *)(v4 + 112) = v17;
      long long v18 = *((_OWORD *)a2 + 9);
      *(_OWORD *)(v4 + 128) = *((_OWORD *)a2 + 8);
      *(_OWORD *)(v4 + 144) = v18;
    }
    uint64_t v19 = *(int *)(a3 + 32);
    long long v20 = (void *)(v4 + v19);
    uint64_t v21 = (uint64_t)a2 + v19;
    uint64_t v22 = *(uint64_t *)((char *)a2 + v19 + 8);
    *long long v20 = *(uint64_t *)((char *)a2 + v19);
    v20[1] = v22;
    uint64_t v23 = *(uint64_t *)((char *)a2 + v19 + 24);
    v20[2] = *(uint64_t *)((char *)a2 + v19 + 16);
    v20[3] = v23;
    uint64_t v24 = *(uint64_t *)((char *)a2 + v19 + 40);
    v20[4] = *(uint64_t *)((char *)a2 + v19 + 32);
    v20[5] = v24;
    uint64_t v25 = (int *)type metadata accessor for Game();
    uint64_t v26 = v25[7];
    __dst = (char *)v20 + v26;
    long long v35 = (const void *)(v21 + v26);
    uint64_t v27 = type metadata accessor for Date();
    uint64_t v28 = *(void *)(v27 - 8);
    long long v36 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v28 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v36(v35, 1, v27))
    {
      uint64_t v29 = sub_100005B18(&qword_100140C48);
      memcpy(__dst, v35, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v28 + 16))(__dst, v35, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(__dst, 0, 1, v27);
    }
    *(void *)((char *)v20 + v25[8]) = *(void *)(v21 + v25[8]);
    *((unsigned char *)v20 + v25[9]) = *(unsigned char *)(v21 + v25[9]);
    *((unsigned char *)v20 + v25[10]) = *(unsigned char *)(v21 + v25[10]);
    *((unsigned char *)v20 + v25[11]) = *(unsigned char *)(v21 + v25[11]);
    *((unsigned char *)v20 + v25[12]) = *(unsigned char *)(v21 + v25[12]);
    *((unsigned char *)v20 + v25[13]) = *(unsigned char *)(v21 + v25[13]);
    *((unsigned char *)v20 + v25[14]) = *(unsigned char *)(v21 + v25[14]);
    uint64_t v30 = v25[15];
    long long v31 = (void *)((char *)v20 + v30);
    long long v32 = (void *)(v21 + v30);
    uint64_t v33 = v32[1];
    *long long v31 = *v32;
    v31[1] = v33;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AccessPointPageIntent(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 104))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v4 + *(int *)(type metadata accessor for Game() + 28);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AccessPointPageIntent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  uint64_t v10 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v10;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v11 = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11)
  {
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = v11;
    uint64_t v12 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = v12;
    uint64_t v13 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = v13;
    uint64_t v14 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v15 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v15;
    long long v16 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v16;
  }
  uint64_t v17 = *(int *)(a3 + 32);
  long long v18 = (void *)(a1 + v17);
  uint64_t v19 = a2 + v17;
  uint64_t v20 = *(void *)(a2 + v17 + 8);
  *long long v18 = *(void *)(a2 + v17);
  v18[1] = v20;
  uint64_t v21 = *(void *)(a2 + v17 + 24);
  uint64_t v18[2] = *(void *)(a2 + v17 + 16);
  v18[3] = v21;
  uint64_t v22 = *(void *)(a2 + v17 + 40);
  v18[4] = *(void *)(a2 + v17 + 32);
  v18[5] = v22;
  uint64_t v23 = (int *)type metadata accessor for Game();
  uint64_t v24 = v23[7];
  __dst = (char *)v18 + v24;
  uint64_t v33 = (const void *)(v19 + v24);
  uint64_t v25 = type metadata accessor for Date();
  uint64_t v26 = *(void *)(v25 - 8);
  long long v34 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v26 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v34(v33, 1, v25))
  {
    uint64_t v27 = sub_100005B18(&qword_100140C48);
    memcpy(__dst, v33, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v26 + 16))(__dst, v33, v25);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(__dst, 0, 1, v25);
  }
  *(void *)((char *)v18 + v23[8]) = *(void *)(v19 + v23[8]);
  *((unsigned char *)v18 + v23[9]) = *(unsigned char *)(v19 + v23[9]);
  *((unsigned char *)v18 + v23[10]) = *(unsigned char *)(v19 + v23[10]);
  *((unsigned char *)v18 + v23[11]) = *(unsigned char *)(v19 + v23[11]);
  *((unsigned char *)v18 + v23[12]) = *(unsigned char *)(v19 + v23[12]);
  *((unsigned char *)v18 + v23[13]) = *(unsigned char *)(v19 + v23[13]);
  *((unsigned char *)v18 + v23[14]) = *(unsigned char *)(v19 + v23[14]);
  uint64_t v28 = v23[15];
  uint64_t v29 = (void *)((char *)v18 + v28);
  uint64_t v30 = (void *)(v19 + v28);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AccessPointPageIntent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v6 = (_OWORD *)(a1 + 96);
  uint64_t v7 = (long long *)(a2 + 96);
  uint64_t v8 = *(void *)(a2 + 104);
  if (*(void *)(a1 + 104))
  {
    if (v8)
    {
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = *(void *)(a2 + 152);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_100006D1C(a1 + 96);
      long long v9 = *(_OWORD *)(a2 + 144);
      long long v11 = *v7;
      long long v10 = *(_OWORD *)(a2 + 112);
      *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
      *(_OWORD *)(a1 + 144) = v9;
      *uint64_t v6 = v11;
      *(_OWORD *)(a1 + 112) = v10;
    }
  }
  else if (v8)
  {
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v12 = *v7;
    long long v13 = *(_OWORD *)(a2 + 112);
    long long v14 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v14;
    *uint64_t v6 = v12;
    *(_OWORD *)(a1 + 112) = v13;
  }
  uint64_t v15 = *(int *)(a3 + 32);
  long long v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *long long v16 = *(void *)(a2 + v15);
  v16[1] = *(void *)(a2 + v15 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16[2] = v17[2];
  v16[3] = v17[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16[4] = v17[4];
  v16[5] = v17[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v18 = (int *)type metadata accessor for Game();
  uint64_t v19 = v18[7];
  uint64_t v20 = (char *)v16 + v19;
  uint64_t v21 = (char *)v17 + v19;
  uint64_t v22 = type metadata accessor for Date();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  long long v32 = v20;
  LODWORD(v20) = v24(v20, 1, v22);
  int v25 = v24(v21, 1, v22);
  if (v20)
  {
    if (!v25)
    {
      (*(void (**)(void *, char *, uint64_t))(v23 + 16))(v32, v21, v22);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v32, 0, 1, v22);
      goto LABEL_16;
    }
    size_t v26 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
    uint64_t v27 = v32;
  }
  else
  {
    if (!v25)
    {
      (*(void (**)(void *, char *, uint64_t))(v23 + 24))(v32, v21, v22);
      goto LABEL_16;
    }
    (*(void (**)(void *, uint64_t))(v23 + 8))(v32, v22);
    size_t v26 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
    uint64_t v27 = v32;
  }
  memcpy(v27, v21, v26);
LABEL_16:
  *(void *)((char *)v16 + v18[8]) = *(void *)((char *)v17 + v18[8]);
  *((unsigned char *)v16 + v18[9]) = *((unsigned char *)v17 + v18[9]);
  *((unsigned char *)v16 + v18[10]) = *((unsigned char *)v17 + v18[10]);
  *((unsigned char *)v16 + v18[11]) = *((unsigned char *)v17 + v18[11]);
  *((unsigned char *)v16 + v18[12]) = *((unsigned char *)v17 + v18[12]);
  *((unsigned char *)v16 + v18[13]) = *((unsigned char *)v17 + v18[13]);
  *((unsigned char *)v16 + v18[14]) = *((unsigned char *)v17 + v18[14]);
  uint64_t v28 = v18[15];
  uint64_t v29 = (void *)((char *)v16 + v28);
  uint64_t v30 = (void *)((char *)v17 + v28);
  *uint64_t v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for AccessPointPageIntent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = (_OWORD *)(a1 + v4);
  uint64_t v6 = a2 + v4;
  long long v7 = *(_OWORD *)(a2 + v4 + 16);
  *uint64_t v5 = *(_OWORD *)(a2 + v4);
  v5[1] = v7;
  _OWORD v5[2] = *(_OWORD *)(a2 + v4 + 32);
  uint64_t v8 = (int *)type metadata accessor for Game();
  uint64_t v9 = v8[7];
  long long v10 = (char *)v5 + v9;
  long long v11 = (const void *)(v6 + v9);
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_100005B18(&qword_100140C48);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  *(void *)((char *)v5 + v8[8]) = *(void *)(v6 + v8[8]);
  *((unsigned char *)v5 + v8[9]) = *(unsigned char *)(v6 + v8[9]);
  *((unsigned char *)v5 + v8[10]) = *(unsigned char *)(v6 + v8[10]);
  *((unsigned char *)v5 + v8[11]) = *(unsigned char *)(v6 + v8[11]);
  *((unsigned char *)v5 + v8[12]) = *(unsigned char *)(v6 + v8[12]);
  *((unsigned char *)v5 + v8[13]) = *(unsigned char *)(v6 + v8[13]);
  *((unsigned char *)v5 + v8[14]) = *(unsigned char *)(v6 + v8[14]);
  *(_OWORD *)((char *)v5 + v8[15]) = *(_OWORD *)(v6 + v8[15]);
  return a1;
}

uint64_t assignWithTake for AccessPointPageIntent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  if (*(void *)(a1 + 104))
  {
    uint64_t v11 = *(void *)(a2 + 104);
    if (v11)
    {
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = v11;
      swift_bridgeObjectRelease();
      uint64_t v12 = *(void *)(a2 + 120);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = v12;
      swift_bridgeObjectRelease();
      uint64_t v13 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = v13;
      swift_bridgeObjectRelease();
      uint64_t v14 = *(void *)(a2 + 152);
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = v14;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_100006D1C(a1 + 96);
  }
  long long v15 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v15;
  long long v16 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v16;
LABEL_6:
  uint64_t v17 = *(int *)(a3 + 32);
  long long v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = *(void *)(a2 + v17 + 8);
  *long long v18 = *(void *)(a2 + v17);
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = v19[3];
  uint64_t v18[2] = v19[2];
  v18[3] = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = v19[5];
  v18[4] = v19[4];
  v18[5] = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = (int *)type metadata accessor for Game();
  uint64_t v24 = v23[7];
  int v25 = (char *)v18 + v24;
  size_t v26 = (char *)v19 + v24;
  uint64_t v27 = type metadata accessor for Date();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  uint64_t v39 = v25;
  LODWORD(v25) = v29(v25, 1, v27);
  int v30 = v29(v26, 1, v27);
  if (v25)
  {
    if (!v30)
    {
      (*(void (**)(void *, char *, uint64_t))(v28 + 32))(v39, v26, v27);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v39, 0, 1, v27);
      goto LABEL_14;
    }
    size_t v31 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
    long long v32 = v39;
  }
  else
  {
    if (!v30)
    {
      (*(void (**)(void *, char *, uint64_t))(v28 + 40))(v39, v26, v27);
      goto LABEL_14;
    }
    (*(void (**)(void *, uint64_t))(v28 + 8))(v39, v27);
    size_t v31 = *(void *)(*(void *)(sub_100005B18(&qword_100140C48) - 8) + 64);
    long long v32 = v39;
  }
  memcpy(v32, v26, v31);
LABEL_14:
  *(void *)((char *)v18 + v23[8]) = *(void *)((char *)v19 + v23[8]);
  *((unsigned char *)v18 + v23[9]) = *((unsigned char *)v19 + v23[9]);
  *((unsigned char *)v18 + v23[10]) = *((unsigned char *)v19 + v23[10]);
  *((unsigned char *)v18 + v23[11]) = *((unsigned char *)v19 + v23[11]);
  *((unsigned char *)v18 + v23[12]) = *((unsigned char *)v19 + v23[12]);
  *((unsigned char *)v18 + v23[13]) = *((unsigned char *)v19 + v23[13]);
  *((unsigned char *)v18 + v23[14]) = *((unsigned char *)v19 + v23[14]);
  uint64_t v33 = v23[15];
  long long v34 = (void *)((char *)v18 + v33);
  long long v35 = (void *)((char *)v19 + v33);
  uint64_t v37 = *v35;
  uint64_t v36 = v35[1];
  *long long v34 = v37;
  v34[1] = v36;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessPointPageIntent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000F5BB4);
}

uint64_t sub_1000F5BB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Game();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AccessPointPageIntent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000F5C78);
}

uint64_t sub_1000F5C78(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Game();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1000F5D20()
{
  uint64_t result = type metadata accessor for Game();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AccessPointPageIntent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x1000F5E98);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessPointPageIntent.CodingKeys()
{
  return &type metadata for AccessPointPageIntent.CodingKeys;
}

unint64_t sub_1000F5ED4()
{
  unint64_t result = qword_1001462C8;
  if (!qword_1001462C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001462C8);
  }
  return result;
}

unint64_t sub_1000F5F2C()
{
  unint64_t result = qword_1001462D0;
  if (!qword_1001462D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001462D0);
  }
  return result;
}

unint64_t sub_1000F5F84()
{
  unint64_t result = qword_1001462D8;
  if (!qword_1001462D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001462D8);
  }
  return result;
}

uint64_t sub_1000F5FD8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65736143657375 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x68676948776F6873 && a2 == 0xEE0073746867696CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D61476F5477656ELL && a2 == 0xEF7265746E654365 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x726579616C70 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1701667175 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

unint64_t sub_1000F6228()
{
  unint64_t result = qword_1001462E0;
  if (!qword_1001462E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001462E0);
  }
  return result;
}

id GameLayerBackgroundBlurView.makeUIView(context:)()
{
  id v0 = [objc_allocWithZone((Class)UIVisualEffectView) init];
  sub_1000F6538();
  sub_1000F6694();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v0 setBackgroundEffects:isa];

  NSString v2 = String._bridgeToObjectiveC()();
  [v0 _setGroupName:v2];

  return v0;
}

uint64_t sub_1000F6340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000F673C();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000F63A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000F673C();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000F6408()
{
}

id sub_1000F6430(void *a1)
{
  double v19 = 0.0;
  double v20 = 0.0;
  double v17 = 0.0;
  double v18 = 0.0;
  [a1 getRed:&v20 green:&v19 blue:&v18 alpha:&v17];
  double v3 = 1.0 - v17;
  long long v4 = 0u;
  long long v5 = 0u;
  double v6 = 1.0 - v17;
  long long v7 = 0u;
  long long v8 = 0u;
  double v9 = 1.0 - v17;
  long long v10 = 0u;
  long long v11 = 0u;
  double v12 = 1.0 - v17;
  double v13 = v17 * v20;
  double v14 = v17 * v19;
  double v15 = v17 * v18;
  double v16 = v17;
  id v1 = [self colorEffectMatrix:&v3];

  return v1;
}

id sub_1000F6538()
{
  sub_100005B18(&qword_100144420);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100111BB0;
  id result = [self effectWithBlurRadius:100.0];
  if (result)
  {
    *(void *)(v0 + 32) = result;
    *(void *)(v0 + 40) = [self colorEffectSaturate:2.0];
    id v2 = [self whiteColor];
    id v3 = [v2 colorWithAlphaComponent:0.05];

    id v4 = sub_1000F6430(v3);
    *(void *)(v0 + 48) = v4;
    id v5 = [objc_allocWithZone((Class)UIColor) initWithRed:0.062745098 green:0.062745098 blue:0.062745098 alpha:0.5];
    id v6 = sub_1000F6430(v5);

    *(void *)(v0 + 56) = v6;
    specialized Array._endMutation()();
    return (id)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_1000F6694()
{
  unint64_t result = qword_100144440;
  if (!qword_100144440)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100144440);
  }
  return result;
}

unint64_t sub_1000F66D8()
{
  unint64_t result = qword_1001462E8;
  if (!qword_1001462E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001462E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for GameLayerBackgroundBlurView()
{
  return &type metadata for GameLayerBackgroundBlurView;
}

unint64_t sub_1000F673C()
{
  unint64_t result = qword_1001462F0;
  if (!qword_1001462F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001462F0);
  }
  return result;
}

uint64_t sub_1000F6790@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for AccessPointHighlightComponent(0);
  uint64_t v3 = v2 - 8;
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  long long v8 = (char *)&v13 - v7;
  type metadata accessor for AccessPointHighlightComponent.GestureHandler(0);
  sub_1000F8A04(&qword_1001420C0, (void (*)(uint64_t))type metadata accessor for AccessPointHighlightComponent.GestureHandler);
  *(void *)id v6 = Environment.init<A>(_:)();
  v6[8] = v9 & 1;
  long long v10 = (uint64_t *)&v6[*(int *)(v3 + 28)];
  *long long v10 = swift_getKeyPath();
  sub_100005B18(&qword_100140FF0);
  swift_storeEnumTagMultiPayload();
  sub_1000F7B2C((uint64_t)v6, (uint64_t)v8);
  uint64_t v11 = sub_1000F724C((uint64_t)v8, (uint64_t)&_swiftEmptyDictionarySingleton);
  uint64_t result = sub_1000F7B90((uint64_t)v8);
  *a1 = v11;
  return result;
}

uint64_t sub_1000F68E8()
{
  sub_100005B18(&qword_100146310);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10010F300;
  uint64_t v1 = type metadata accessor for AccessPointHighlight(0);
  uint64_t result = sub_1000F8A04(&qword_1001437C8, (void (*)(uint64_t))type metadata accessor for AccessPointHighlight);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = result;
  off_1001462F8 = (_UNKNOWN *)v0;
  return result;
}

uint64_t sub_1000F6978()
{
  if (qword_10013FCF8 != -1) {
    swift_once();
  }
  uint64_t v0 = off_1001462F8;
  uint64_t v1 = *((void *)off_1001462F8 + 2);
  if (v1)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v2 = 0;
    uint64_t v3 = _swiftEmptyArrayStorage;
    do
    {
      long long v13 = v0[v2 + 2];
      long long v14 = v13;
      sub_100005B18(&qword_100146308);
      uint64_t v4 = String.init<A>(describing:)();
      uint64_t v6 = v5;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_100036B34(0, v3[2] + 1, 1, v3);
      }
      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1) {
        uint64_t v3 = sub_100036B34((void *)(v7 > 1), v8 + 1, 1, v3);
      }
      ++v2;
      v3[2] = v8 + 1;
      char v9 = &v3[4 * v8];
      v9[4] = v4;
      v9[5] = v6;
      *((_OWORD *)v9 + 3) = v13;
    }
    while (v1 != v2);
    swift_bridgeObjectRelease_n();
    if (v3[2]) {
      goto LABEL_11;
    }
LABEL_13:
    long long v10 = _swiftEmptyDictionarySingleton;
    goto LABEL_14;
  }
  if (!_swiftEmptyArrayStorage[2]) {
    goto LABEL_13;
  }
LABEL_11:
  sub_100005B18(&qword_1001425F0);
  long long v10 = (void *)static _DictionaryStorage.allocate(capacity:)();
LABEL_14:
  *(void *)&long long v14 = v10;
  uint64_t v11 = swift_bridgeObjectRetain();
  sub_1000F7470(v11, 1, &v14);
  uint64_t result = swift_bridgeObjectRelease();
  static ComponentKinds.table = v14;
  return result;
}

uint64_t *ComponentKinds.table.unsafeMutableAddressor()
{
  if (qword_10013FD00 != -1) {
    swift_once();
  }
  return &static ComponentKinds.table;
}

uint64_t static ComponentKinds.table.getter()
{
  if (qword_10013FD00 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

unint64_t sub_1000F6C14()
{
  unint64_t result = qword_100146300;
  if (!qword_100146300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100146300);
  }
  return result;
}

unint64_t sub_1000F6C68()
{
  if (qword_10013FD00 != -1) {
    swift_once();
  }
  uint64_t v0 = swift_bridgeObjectRetain();
  unint64_t v1 = sub_1000F7804(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1000F6CD8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1000F6D00(a1, a2, a3);
}

ValueMetadata *type metadata accessor for ComponentKinds()
{
  return &type metadata for ComponentKinds;
}

uint64_t sub_1000F6D00@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = type metadata accessor for JSONContext();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = type metadata accessor for JSONObject();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_100091854(a1);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    uint64_t v14 = v11;
    sub_10003D160((uint64_t)a2, (uint64_t)v31);
    *(void *)&long long v33 = v12;
    *((void *)&v33 + 1) = v13;
    uint64_t v34 = v14;
    sub_1000082EC(v32);
    dispatch thunk of Decodable.init(from:)();
    if (v3) {
      return sub_10009193C((uint64_t)v32);
    }
LABEL_7:
    long long v30 = v33;
    uint64_t v22 = v33;
    uint64_t v23 = sub_100006650(v32, v33);
    *(_OWORD *)(a3 + 24) = v30;
    uint64_t v24 = sub_1000082EC((uint64_t *)a3);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v24, v23, v22);
    return sub_100007188((uint64_t)v32);
  }
  uint64_t v16 = sub_100091854(a1);
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = v17;
    uint64_t v21 = v18;
    sub_10003D160((uint64_t)a2, (uint64_t)v31);
    uint64_t result = JSONObject.init(from:)();
    if (v3) {
      return result;
    }
    sub_100006650(a2, a2[3]);
    dispatch thunk of Decoder.userInfo.getter();
    JSONContext.init(userInfo:)();
    *(void *)&long long v33 = v19;
    *((void *)&v33 + 1) = v20;
    uint64_t v34 = v21;
    sub_1000082EC(v32);
    dispatch thunk of ExpressibleByJSON.init(deserializing:using:)();
    goto LABEL_7;
  }
  uint64_t v25 = type metadata accessor for DecodingError();
  swift_allocError();
  uint64_t v27 = v26;
  sub_100005B18(&qword_100140060);
  uint64_t *v27 = a1;
  sub_100006650(a2, a2[3]);
  dispatch thunk of Decoder.codingPath.getter();
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease();
  v32[0] = 60;
  v32[1] = 0xE100000000000000;
  v28._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v28);
  swift_bridgeObjectRelease();
  v29._object = (void *)0x80000001000FD660;
  v29._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v29);
  DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, enum case for DecodingError.typeMismatch(_:), v25);
  return swift_willThrow();
}

unint64_t sub_1000F708C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000F7104(a1, a2, v4);
}

unint64_t sub_1000F7104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        uint64_t v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            double v15 = (void *)(v9 + 16 * i);
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

uint64_t sub_1000F724C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OpaqueMetatype();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AccessPointHighlight(0);
  swift_bridgeObjectRetain();
  OpaqueMetatype.init(_:)();
  uint64_t v20 = type metadata accessor for AccessPointHighlightComponent(0);
  uint64_t v21 = sub_1000F8A04(&qword_1001437B0, (void (*)(uint64_t))type metadata accessor for AccessPointHighlightComponent);
  uint64_t v8 = sub_1000082EC((uint64_t *)&v19);
  sub_1000F7BEC(a1, (uint64_t)v8);
  sub_100069BBC(&v19, (uint64_t)v17);
  LOBYTE(a1) = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = a2;
  uint64_t v9 = sub_1000F7C50((uint64_t)v17, v18);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  sub_1000F8630((uint64_t)v11, (uint64_t)v7, a1, &v16);
  sub_100007188((uint64_t)v17);
  uint64_t v13 = v16;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v13;
}

uint64_t sub_1000F7470(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  long long v42 = *(_OWORD *)(a1 + 48);
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_1000DC324(v8, v7);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_1000705F4();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    long long v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v20 = (uint64_t *)(v19[6] + 16 * v11);
    *uint64_t v20 = v8;
    v20[1] = v7;
    *(_OWORD *)(v19[7] + 16 * v11) = v42;
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v23;
    uint64_t v24 = v4 - 1;
    if (v4 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (unint64_t i = (_OWORD *)(a1 + 80); ; i += 2)
    {
      uint64_t v27 = *((void *)i - 2);
      uint64_t v26 = *((void *)i - 1);
      long long v43 = *i;
      Swift::String v28 = (void *)*a3;
      swift_bridgeObjectRetain();
      unint64_t v29 = sub_1000DC324(v27, v26);
      uint64_t v31 = v28[2];
      BOOL v32 = (v30 & 1) == 0;
      BOOL v22 = __OFADD__(v31, v32);
      uint64_t v33 = v31 + v32;
      if (v22) {
        break;
      }
      char v34 = v30;
      if (v28[3] < v33)
      {
        sub_10006EFEC(v33, 1);
        unint64_t v29 = sub_1000DC324(v27, v26);
        if ((v34 & 1) != (v35 & 1)) {
          goto LABEL_25;
        }
      }
      if (v34) {
        goto LABEL_10;
      }
      uint64_t v36 = (void *)*a3;
      *(void *)(*a3 + 8 * (v29 >> 6) + 64) |= 1 << v29;
      uint64_t v37 = (uint64_t *)(v36[6] + 16 * v29);
      *uint64_t v37 = v27;
      v37[1] = v26;
      *(_OWORD *)(v36[7] + 16 * v29) = v43;
      uint64_t v38 = v36[2];
      BOOL v22 = __OFADD__(v38, 1);
      uint64_t v39 = v38 + 1;
      if (v22) {
        goto LABEL_24;
      }
      v36[2] = v39;
      if (!--v24) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_10006EFEC(v14, a2 & 1);
  unint64_t v16 = sub_1000DC324(v8, v7);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    swift_allocError();
    swift_willThrow();
    swift_errorRetain();
    sub_100005B18(&qword_100142A90);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return swift_errorRelease();
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
LABEL_26:
  _StringGuts.grow(_:)(30);
  v40._object = (void *)0x80000001000FD6C0;
  v40._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v40);
  _print_unlocked<A, B>(_:_:)();
  v41._countAndFlagsBits = 39;
  v41._object = (void *)0xE100000000000000;
  String.append(_:)(v41);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_1000F7804(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100005B18(&qword_100143260);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = _swiftEmptyDictionarySingleton;
  }
  uint64_t v31 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v30 = (unint64_t)(63 - v3) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v8 = &qword_100146308;
  uint64_t v9 = (uint64_t *)&unk_100143270;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v17 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_36;
  }
  if (v17 >= v30) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v31 + 8 * v17);
  int64_t v19 = i + 1;
  if (!v18)
  {
    int64_t v19 = i + 2;
    if (i + 2 >= v30) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v31 + 8 * v19);
    if (!v18)
    {
      int64_t v19 = i + 3;
      if (i + 3 >= v30) {
        goto LABEL_33;
      }
      unint64_t v18 = *(void *)(v31 + 8 * v19);
      if (!v18)
      {
        int64_t v19 = i + 4;
        if (i + 4 >= v30) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v31 + 8 * v19);
        if (!v18)
        {
          int64_t v19 = i + 5;
          if (i + 5 >= v30) {
            goto LABEL_33;
          }
          unint64_t v18 = *(void *)(v31 + 8 * v19);
          if (!v18)
          {
            int64_t v19 = i + 6;
            if (i + 6 >= v30) {
              goto LABEL_33;
            }
            unint64_t v18 = *(void *)(v31 + 8 * v19);
            int64_t v20 = i + 6;
            if (!v18)
            {
              while (1)
              {
                int64_t v19 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_37;
                }
                if (v19 >= v30) {
                  break;
                }
                unint64_t v18 = *(void *)(v31 + 8 * v19);
                ++v20;
                if (v18) {
                  goto LABEL_27;
                }
              }
LABEL_33:
              sub_100092098();
              return (unint64_t)v2;
            }
          }
        }
      }
    }
  }
LABEL_27:
  unint64_t v5 = (v18 - 1) & v18;
  unint64_t v16 = __clz(__rbit64(v18)) + (v19 << 6);
  for (i = v19; ; unint64_t v16 = v15 | (i << 6))
  {
    uint64_t v21 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v16);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    swift_bridgeObjectRetain();
    sub_100005B18(v8);
    sub_100005B18(v9);
    swift_dynamicCast();
    unint64_t result = sub_1000F708C(v23, v22);
    unint64_t v24 = result;
    if (v25)
    {
      unint64_t v32 = v5;
      uint64_t v10 = v1;
      int64_t v11 = i;
      uint64_t v12 = v9;
      BOOL v13 = v8;
      uint64_t v14 = (uint64_t *)(v2[6] + 16 * result);
      unint64_t result = swift_bridgeObjectRelease();
      *uint64_t v14 = v23;
      v14[1] = v22;
      uint64_t v8 = v13;
      uint64_t v9 = v12;
      int64_t i = v11;
      uint64_t v1 = v10;
      unint64_t v5 = v32;
      *(void *)(v2[7] + 8 * v24) = v33;
      if (!v32) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v26 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v26 = v23;
    v26[1] = v22;
    *(void *)(v2[7] + 8 * result) = v33;
    uint64_t v27 = v2[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_35;
    }
    v2[2] = v29;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v15 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000F7B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccessPointHighlightComponent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000F7B90(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AccessPointHighlightComponent(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000F7BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccessPointHighlightComponent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000F7C50(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_1000F7CA0(uint64_t a1)
{
  type metadata accessor for OpaqueMetatype();
  sub_1000F8A04(&qword_100146320, (void (*)(uint64_t))&type metadata accessor for OpaqueMetatype);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_1000F8470(a1, v2);
}

void *sub_1000F7D38()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OpaqueMetatype();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B18(&qword_100146318);
  uint64_t v6 = *v0;
  uint64_t v7 = static _DictionaryStorage.copy(original:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_26:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v23 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  uint64_t v24 = v6 + 64;
  int64_t v25 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v26 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v25) {
      goto LABEL_24;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_24;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v11);
      if (!v20)
      {
        int64_t v11 = v19 + 2;
        if (v19 + 2 >= v25) {
          goto LABEL_24;
        }
        unint64_t v20 = *(void *)(v24 + 8 * v11);
        if (!v20)
        {
          int64_t v11 = v19 + 3;
          if (v19 + 3 >= v25)
          {
LABEL_24:
            uint64_t result = (void *)swift_release();
            uint64_t v1 = v23;
            goto LABEL_26;
          }
          unint64_t v20 = *(void *)(v24 + 8 * v11);
          int64_t v21 = v19 + 3;
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v14 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 40 * v16;
    sub_10003D160(*(void *)(v6 + 56) + v18, (uint64_t)v27);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
    uint64_t result = (void *)sub_100069BBC(v27, *(void *)(v8 + 56) + v18);
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v25) {
      goto LABEL_24;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_23;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1000F8004(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v43 = type metadata accessor for OpaqueMetatype();
  uint64_t v5 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_100005B18(&qword_100146318);
  int v44 = a2;
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v10 = v9;
  if (*(void *)(v8 + 16))
  {
    uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v12 = *(void *)(v8 + 64);
    uint64_t v39 = (void *)(v8 + 64);
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v12;
    int64_t v40 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v37 = v2;
    uint64_t v38 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v45 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v15 = v9 + 64;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    uint64_t v41 = v8;
    long long v42 = v7;
    while (1)
    {
      if (v14)
      {
        unint64_t v19 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v20 = v19 | (v17 << 6);
      }
      else
      {
        int64_t v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v21 >= v40) {
          goto LABEL_35;
        }
        unint64_t v22 = v39[v21];
        ++v17;
        if (!v22)
        {
          int64_t v17 = v21 + 1;
          if (v21 + 1 >= v40) {
            goto LABEL_35;
          }
          unint64_t v22 = v39[v17];
          if (!v22)
          {
            int64_t v17 = v21 + 2;
            if (v21 + 2 >= v40) {
              goto LABEL_35;
            }
            unint64_t v22 = v39[v17];
            if (!v22)
            {
              int64_t v17 = v21 + 3;
              if (v21 + 3 >= v40)
              {
LABEL_35:
                swift_release();
                uint64_t v3 = v37;
                if (v44)
                {
                  uint64_t v36 = 1 << *(unsigned char *)(v8 + 32);
                  if (v36 >= 64) {
                    bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                  }
                  else {
                    *uint64_t v39 = -1 << v36;
                  }
                  *(void *)(v8 + 16) = 0;
                }
                break;
              }
              unint64_t v22 = v39[v17];
              for (int64_t i = v21 + 3; !v22; ++i)
              {
                int64_t v17 = i + 1;
                if (__OFADD__(i, 1)) {
                  goto LABEL_42;
                }
                if (v17 >= v40) {
                  goto LABEL_35;
                }
                unint64_t v22 = v39[v17];
              }
            }
          }
        }
        unint64_t v14 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      uint64_t v24 = v5;
      uint64_t v25 = *(void *)(v5 + 72);
      unint64_t v26 = *(void *)(v8 + 48) + v25 * v20;
      uint64_t v27 = v42;
      uint64_t v28 = v43;
      if (v44)
      {
        (*v45)(v42, v26, v43);
        sub_100069BBC((long long *)(*(void *)(v8 + 56) + 40 * v20), (uint64_t)v46);
      }
      else
      {
        (*v38)(v42, v26, v43);
        sub_10003D160(*(void *)(v8 + 56) + 40 * v20, (uint64_t)v46);
      }
      sub_1000F8A04(&qword_100146320, (void (*)(uint64_t))&type metadata accessor for OpaqueMetatype);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v29 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v15 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v18 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      (*v45)((char *)(*(void *)(v10 + 48) + v25 * v18), (unint64_t)v27, v28);
      uint64_t result = sub_100069BBC(v46, *(void *)(v10 + 56) + 40 * v18);
      ++*(void *)(v10 + 16);
      uint64_t v5 = v24;
      uint64_t v8 = v41;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

unint64_t sub_1000F8470(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for OpaqueMetatype();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1000F8A04(&qword_100146328, (void (*)(uint64_t))&type metadata accessor for OpaqueMetatype);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_1000F8630(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v8 = type metadata accessor for OpaqueMetatype();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = type metadata accessor for AccessPointHighlightComponent(0);
  uint64_t v33 = sub_1000F8A04(&qword_1001437B0, (void (*)(uint64_t))type metadata accessor for AccessPointHighlightComponent);
  uint64_t v12 = sub_1000082EC((uint64_t *)&v31);
  sub_1000F7B2C(a1, (uint64_t)v12);
  uint64_t v13 = (void *)*a4;
  unint64_t v15 = sub_1000F7CA0(a2);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a3 & 1) != 0)
  {
LABEL_7:
    int64_t v21 = (void *)*a4;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = v21[7] + 40 * v15;
      sub_100007188(v22);
      return sub_100069BBC(&v31, v22);
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a3 & 1) == 0)
  {
    sub_1000F7D38();
    goto LABEL_7;
  }
  sub_1000F8004(v18, a3 & 1);
  unint64_t v24 = sub_1000F7CA0(a2);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v15 = v24;
  int64_t v21 = (void *)*a4;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  uint64_t v26 = sub_1000F7C50((uint64_t)&v31, v32);
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v30 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v29 + 16))(v28);
  sub_1000F88E8(v15, (uint64_t)v11, (uint64_t)v28, v21);
  return sub_100007188((uint64_t)&v31);
}

uint64_t sub_1000F88E8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v16 = type metadata accessor for AccessPointHighlightComponent(0);
  uint64_t v17 = sub_1000F8A04(&qword_1001437B0, (void (*)(uint64_t))type metadata accessor for AccessPointHighlightComponent);
  uint64_t v8 = sub_1000082EC((uint64_t *)&v15);
  sub_1000F7B2C(a3, (uint64_t)v8);
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v9 = a4[6];
  uint64_t v10 = type metadata accessor for OpaqueMetatype();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a2, v10);
  uint64_t result = sub_100069BBC(&v15, a4[7] + 40 * a1);
  uint64_t v12 = a4[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a4[2] = v14;
  }
  return result;
}

uint64_t sub_1000F8A04(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static CharacterSet.urlHostAllowed.getter()
{
  return static CharacterSet.urlHostAllowed.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.scheme.getter()
{
  return URL.scheme.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.didSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.willSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t static GKMetricsBridge.sharedPipeline.getter()
{
  return static GKMetricsBridge.sharedPipeline.getter();
}

uint64_t type metadata accessor for GKMetricsBridge()
{
  return type metadata accessor for GKMetricsBridge();
}

uint64_t static GKPlayerGroupView.create()()
{
  return static GKPlayerGroupView.create()();
}

uint64_t GKPlayerGroupView.configure(players:messagesGroupIdentifier:playerSelectionProxy:)()
{
  return GKPlayerGroupView.configure(players:messagesGroupIdentifier:playerSelectionProxy:)();
}

uint64_t type metadata accessor for GKPlayerGroupView()
{
  return type metadata accessor for GKPlayerGroupView();
}

uint64_t OnboardingOverlayView.init(gameBundleID:dismissAction:)()
{
  return OnboardingOverlayView.init(gameBundleID:dismissAction:)();
}

uint64_t type metadata accessor for OnboardingOverlayView()
{
  return type metadata accessor for OnboardingOverlayView();
}

uint64_t DashboardLaunchContext.init(rawValue:)()
{
  return DashboardLaunchContext.init(rawValue:)();
}

uint64_t type metadata accessor for DashboardLaunchContext()
{
  return type metadata accessor for DashboardLaunchContext();
}

uint64_t JetDashboardViewController.__allocating_init(nibName:bundle:launchContext:request:)()
{
  return JetDashboardViewController.__allocating_init(nibName:bundle:launchContext:request:)();
}

uint64_t type metadata accessor for JetDashboardViewController()
{
  return type metadata accessor for JetDashboardViewController();
}

uint64_t PlayerProfileViewController.__allocating_init(playerId:navigationProxy:objectGraph:)()
{
  return PlayerProfileViewController.__allocating_init(playerId:navigationProxy:objectGraph:)();
}

uint64_t type metadata accessor for PlayerProfileViewController()
{
  return type metadata accessor for PlayerProfileViewController();
}

uint64_t DashboardSplitViewController.init(launchContext:request:navigationProxy:)()
{
  return DashboardSplitViewController.init(launchContext:request:navigationProxy:)();
}

uint64_t DashboardSplitViewController.dismissHandler.setter()
{
  return DashboardSplitViewController.dismissHandler.setter();
}

uint64_t type metadata accessor for DashboardSplitViewController()
{
  return type metadata accessor for DashboardSplitViewController();
}

uint64_t static GKHostAppMetricsFieldsProvider.hostAppKey.getter()
{
  return static GKHostAppMetricsFieldsProvider.hostAppKey.getter();
}

uint64_t dispatch thunk of BaseJetCollectionViewController.dismissHandler.setter()
{
  return dispatch thunk of BaseJetCollectionViewController.dismissHandler.setter();
}

uint64_t ActivitySharingRepromptOverlayView.init(recipientName:dismissAction:)()
{
  return ActivitySharingRepromptOverlayView.init(recipientName:dismissAction:)();
}

uint64_t type metadata accessor for ActivitySharingRepromptOverlayView()
{
  return type metadata accessor for ActivitySharingRepromptOverlayView();
}

uint64_t static GCUILocalizedStrings.OVERLAY_ACHIEVEMENT_HIGHLIGHT_SUBTITLE(total:)()
{
  return static GCUILocalizedStrings.OVERLAY_ACHIEVEMENT_HIGHLIGHT_SUBTITLE(total:)();
}

uint64_t static GCUILocalizedStrings.OVERLAY_FRIEND_REQUESTS_HIGHLIGHT_TITLE(count:)()
{
  return static GCUILocalizedStrings.OVERLAY_FRIEND_REQUESTS_HIGHLIGHT_TITLE(count:)();
}

uint64_t static GCUILocalizedStrings.OVERLAY_FRIEND_REQUESTS_HIGHLIGHT_SUBTITLE(alias:count:)()
{
  return static GCUILocalizedStrings.OVERLAY_FRIEND_REQUESTS_HIGHLIGHT_SUBTITLE(alias:count:)();
}

uint64_t static GCUILocalizedStrings.OVERLAY_ACHIEVEMENT_HIGHLIGHT_SUBTITLE_INPROGRESS(completed:total:)()
{
  return static GCUILocalizedStrings.OVERLAY_ACHIEVEMENT_HIGHLIGHT_SUBTITLE_INPROGRESS(completed:total:)();
}

uint64_t static GCUILocalizedStrings.OVERLAY_LEADERBOARD_HIGHLIGHT_SUBTITLE_FRIEND_RANK(rank:total:)()
{
  return static GCUILocalizedStrings.OVERLAY_LEADERBOARD_HIGHLIGHT_SUBTITLE_FRIEND_RANK(rank:total:)();
}

uint64_t static GCUILocalizedStrings.OVERLAY_LEADERBOARD_HIGHLIGHT_SUBTITLE_GET_STARTED(leaderboardName:)()
{
  return static GCUILocalizedStrings.OVERLAY_LEADERBOARD_HIGHLIGHT_SUBTITLE_GET_STARTED(leaderboardName:)();
}

uint64_t type metadata accessor for GCUILocalizedStrings()
{
  return type metadata accessor for GCUILocalizedStrings();
}

uint64_t type metadata accessor for _JetViewDefaultFailed()
{
  return type metadata accessor for _JetViewDefaultFailed();
}

uint64_t _JetViewDefaultWorking.init()()
{
  return _JetViewDefaultWorking.init()();
}

uint64_t type metadata accessor for _JetViewDefaultWorking()
{
  return type metadata accessor for _JetViewDefaultWorking();
}

uint64_t Jet.init(startUpWith:working:failed:content:)()
{
  return Jet.init(startUpWith:working:failed:content:)();
}

uint64_t type metadata accessor for JetStartUpProcedure()
{
  return type metadata accessor for JetStartUpProcedure();
}

uint64_t type metadata accessor for JetStartUpDecoration()
{
  return type metadata accessor for JetStartUpDecoration();
}

uint64_t JetStartUpCoordinator.init(startUpProcedure:transaction:makeObjects:)()
{
  return JetStartUpCoordinator.init(startUpProcedure:transaction:makeObjects:)();
}

uint64_t JetStartUpCoordinator.extend(startUpProcedure:withDependencies:)()
{
  return JetStartUpCoordinator.extend(startUpProcedure:withDependencies:)();
}

uint64_t type metadata accessor for JetStartUpCoordinator()
{
  return type metadata accessor for JetStartUpCoordinator();
}

uint64_t IntentView.init(what:transaction:configuration:working:failed:content:)()
{
  return IntentView.init(what:transaction:configuration:working:failed:content:)();
}

uint64_t ComponentView.init(_:content:)()
{
  return ComponentView.init(_:content:)();
}

uint64_t FlowAuthority.init(content:)()
{
  return FlowAuthority.init(content:)();
}

uint64_t _ComponentBody.init(_:)()
{
  return _ComponentBody.init(_:)();
}

uint64_t MediaArtworkStyle.transaction.getter()
{
  return MediaArtworkStyle.transaction.getter();
}

uint64_t static MediaArtworkProtocol.supportsPrefetching.getter()
{
  return static MediaArtworkProtocol.supportsPrefetching.getter();
}

uint64_t static MediaArtworkProtocol.allowsDuplicateRegistration.getter()
{
  return static MediaArtworkProtocol.allowsDuplicateRegistration.getter();
}

uint64_t MediaArtworkProtocol.cache<A>(_:allowStandaloneFetches:)()
{
  return MediaArtworkProtocol.cache<A>(_:allowStandaloneFetches:)();
}

uint64_t IntentViewConfiguration.init()()
{
  return IntentViewConfiguration.init()();
}

uint64_t type metadata accessor for IntentViewConfiguration()
{
  return type metadata accessor for IntentViewConfiguration();
}

uint64_t FlowActionImplementation.init(following:)()
{
  return FlowActionImplementation.init(following:)();
}

uint64_t AlertActionImplementation.init<A>(following:)()
{
  return AlertActionImplementation.init<A>(following:)();
}

uint64_t FlowBackActionImplementation.init<A>(following:)()
{
  return FlowBackActionImplementation.init<A>(following:)();
}

uint64_t MediaArtworkStyleConfiguration.subscript.getter()
{
  return MediaArtworkStyleConfiguration.subscript.getter();
}

uint64_t MediaArtworkStyleConfiguration.image.getter()
{
  return MediaArtworkStyleConfiguration.image.getter();
}

uint64_t ExternalURLActionImplementation.init()()
{
  return ExternalURLActionImplementation.init()();
}

uint64_t Component<>._buttonStyle(for:)()
{
  return Component<>._buttonStyle(for:)();
}

uint64_t type metadata accessor for InGameBannerData.BannerType()
{
  return type metadata accessor for InGameBannerData.BannerType();
}

uint64_t InGameBannerData.body.getter()
{
  return InGameBannerData.body.getter();
}

uint64_t InGameBannerData.type.getter()
{
  return InGameBannerData.type.getter();
}

uint64_t InGameBannerData.image.getter()
{
  return InGameBannerData.image.getter();
}

uint64_t InGameBannerData.title.getter()
{
  return InGameBannerData.title.getter();
}

uint64_t static InGameBannerData.decode(data:)()
{
  return static InGameBannerData.decode(data:)();
}

uint64_t type metadata accessor for InGameBannerData()
{
  return type metadata accessor for InGameBannerData();
}

uint64_t static GKLog.trace.getter()
{
  return static GKLog.trace.getter();
}

uint64_t static GKLog.general.getter()
{
  return static GKLog.general.getter();
}

uint64_t static GameOverlayUIConfig.machServiceDomain.getter()
{
  return static GameOverlayUIConfig.machServiceDomain.getter();
}

uint64_t static GameOverlayUIConfig.ServiceKind.from(name:)()
{
  return static GameOverlayUIConfig.ServiceKind.from(name:)();
}

uint64_t GameOverlayUIConfig.ServiceKind.rawValue.getter()
{
  return GameOverlayUIConfig.ServiceKind.rawValue.getter();
}

uint64_t type metadata accessor for GameOverlayUIConfig.ServiceKind()
{
  return type metadata accessor for GameOverlayUIConfig.ServiceKind();
}

uint64_t dispatch thunk of GameOverlayUIConfig.SharedResources.connectionQueue(kind:)()
{
  return dispatch thunk of GameOverlayUIConfig.SharedResources.connectionQueue(kind:)();
}

uint64_t dispatch thunk of GameOverlayUIConfig.SharedResources.interface(kind:)()
{
  return dispatch thunk of GameOverlayUIConfig.SharedResources.interface(kind:)();
}

uint64_t GameOverlayUIConfig.SharedResources.__allocating_init()()
{
  return GameOverlayUIConfig.SharedResources.__allocating_init()();
}

uint64_t type metadata accessor for GameOverlayUIConfig.SharedResources()
{
  return type metadata accessor for GameOverlayUIConfig.SharedResources();
}

uint64_t AccessPointAnchoring.bottom.getter()
{
  return AccessPointAnchoring.bottom.getter();
}

uint64_t AccessPointAnchoring.leading.getter()
{
  return AccessPointAnchoring.leading.getter();
}

uint64_t AccessPointAnchoring.centered.getter()
{
  return AccessPointAnchoring.centered.getter();
}

uint64_t AccessPointAnchoring.init(rawValue:)()
{
  return AccessPointAnchoring.init(rawValue:)();
}

uint64_t type metadata accessor for AccessPointAnchoring()
{
  return type metadata accessor for AccessPointAnchoring();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
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

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t FocusState.wrappedValue.getter()
{
  return FocusState.wrappedValue.getter();
}

uint64_t FocusState.projectedValue.getter()
{
  return FocusState.projectedValue.getter();
}

uint64_t FocusState.init<>()()
{
  return FocusState.init<>()();
}

uint64_t TapGesture.init(count:)()
{
  return TapGesture.init(count:)();
}

uint64_t type metadata accessor for TapGesture()
{
  return type metadata accessor for TapGesture();
}

uint64_t _ShapeView.init(shape:style:fillStyle:)()
{
  return _ShapeView.init(shape:style:fillStyle:)();
}

uint64_t type metadata accessor for _ShapeView()
{
  return type metadata accessor for _ShapeView();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t DragGesture.init<A>(minimumDistance:coordinateSpace:)()
{
  return DragGesture.init<A>(minimumDistance:coordinateSpace:)();
}

uint64_t DragGesture.Value.translation.getter()
{
  return DragGesture.Value.translation.getter();
}

uint64_t type metadata accessor for DragGesture()
{
  return type metadata accessor for DragGesture();
}

uint64_t Environment.init<A>(_:)()
{
  return Environment.init<A>(_:)();
}

uint64_t static GestureMask.all.getter()
{
  return static GestureMask.all.getter();
}

uint64_t static Transaction._loading.getter()
{
  return static Transaction._loading.getter();
}

uint64_t TimelineView<>.init(_:content:)()
{
  return TimelineView<>.init(_:content:)();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t static AnyTransition.scale(scale:anchor:)()
{
  return static AnyTransition.scale(scale:anchor:)();
}

uint64_t static AnyTransition.opacity.getter()
{
  return static AnyTransition.opacity.getter();
}

uint64_t AnyTransition.init<A>(_:)()
{
  return AnyTransition.init<A>(_:)();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t GeometryProxy.frame<A>(in:)()
{
  return GeometryProxy.frame<A>(in:)();
}

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t static ShaderLibrary.subscript.getter()
{
  return static ShaderLibrary.subscript.getter();
}

uint64_t type metadata accessor for _StrokedShape()
{
  return type metadata accessor for _StrokedShape();
}

uint64_t type metadata accessor for _TaskModifier()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t withAnimation<A>(_:completionCriteria:_:completion:)()
{
  return withAnimation<A>(_:completionCriteria:_:completion:)();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t MoveTransition.init(edge:)()
{
  return MoveTransition.init(edge:)();
}

uint64_t type metadata accessor for MoveTransition()
{
  return type metadata accessor for MoveTransition();
}

uint64_t ShaderFunction.dynamicallyCall(withArguments:)()
{
  return ShaderFunction.dynamicallyCall(withArguments:)();
}

uint64_t type metadata accessor for ShaderFunction()
{
  return type metadata accessor for ShaderFunction();
}

uint64_t DynamicTypeSize.isAccessibilitySize.getter()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t type metadata accessor for _BlendModeEffect()
{
  return type metadata accessor for _BlendModeEffect();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t type metadata accessor for _OverlayModifier()
{
  return type metadata accessor for _OverlayModifier();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t EnvironmentValues.dynamicTypeSize.setter()
{
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.tintColor.getter()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t EnvironmentValues.tintColor.setter()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t EnvironmentValues.subscript.getter()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t EnvironmentValues.subscript.setter()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t OpacityTransition.init()()
{
  return OpacityTransition.init()();
}

uint64_t type metadata accessor for OpacityTransition()
{
  return type metadata accessor for OpacityTransition();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t UIHostingController.init(coder:rootView:)()
{
  return UIHostingController.init(coder:rootView:)();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t type metadata accessor for _BackgroundModifier()
{
  return type metadata accessor for _BackgroundModifier();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for LocalCoordinateSpace()
{
  return type metadata accessor for LocalCoordinateSpace();
}

uint64_t RectangleCornerRadii.init(topLeft:topRight:bottomRight:bottomLeft:)()
{
  return RectangleCornerRadii.init(topLeft:topRight:bottomRight:bottomLeft:)();
}

uint64_t type metadata accessor for GlobalCoordinateSpace()
{
  return type metadata accessor for GlobalCoordinateSpace();
}

uint64_t static HierarchicalShapeStyle.quaternary.getter()
{
  return static HierarchicalShapeStyle.quaternary.getter();
}

uint64_t type metadata accessor for UnevenRoundedRectangle()
{
  return type metadata accessor for UnevenRoundedRectangle();
}

uint64_t static CoordinateSpaceProtocol<>.local.getter()
{
  return static CoordinateSpaceProtocol<>.local.getter();
}

uint64_t static CoordinateSpaceProtocol<>.global.getter()
{
  return static CoordinateSpaceProtocol<>.global.getter();
}

uint64_t AnimationTimelineSchedule.init(minimumInterval:paused:)()
{
  return AnimationTimelineSchedule.init(minimumInterval:paused:)();
}

uint64_t type metadata accessor for AnimationTimelineSchedule()
{
  return type metadata accessor for AnimationTimelineSchedule();
}

uint64_t static MatchedGeometryProperties.frame.getter()
{
  return static MatchedGeometryProperties.frame.getter();
}

uint64_t static AnimationCompletionCriteria.logicallyComplete.getter()
{
  return static AnimationCompletionCriteria.logicallyComplete.getter();
}

uint64_t type metadata accessor for AnimationCompletionCriteria()
{
  return type metadata accessor for AnimationCompletionCriteria();
}

uint64_t UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t static UIViewControllerRepresentable._layoutOptions(_:)()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t UIViewControllerRepresentable._identifiedViewTree(in:)()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewControllerRepresentable.body.getter()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t UIViewControllerRepresentable<>.makeCoordinator()()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Font.largeTitle.getter()
{
  return static Font.largeTitle.getter();
}

uint64_t static Font.subheadline.getter()
{
  return static Font.subheadline.getter();
}

uint64_t static Font.title.getter()
{
  return static Font.title.getter();
}

uint64_t static Font.Weight.bold.getter()
{
  return static Font.Weight.bold.getter();
}

uint64_t static Font.title2.getter()
{
  return static Font.title2.getter();
}

uint64_t static Font.footnote.getter()
{
  return static Font.footnote.getter();
}

uint64_t static Font.headline.getter()
{
  return static Font.headline.getter();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.mediaArtworkStyle<A>(_:)()
{
  return View.mediaArtworkStyle<A>(_:)();
}

uint64_t View.startUpDecoration(_:)()
{
  return View.startUpDecoration(_:)();
}

uint64_t View.automationSemantics(_:)()
{
  return View.automationSemantics(_:)();
}

uint64_t View.mediaArtworkProtocol<A>(_:)()
{
  return View.mediaArtworkProtocol<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.background<A>(alignment:content:)()
{
  return View.background<A>(alignment:content:)();
}

uint64_t View.fontWeight(_:)()
{
  return View.fontWeight(_:)();
}

uint64_t View.environment<A>(_:)()
{
  return View.environment<A>(_:)();
}

uint64_t View.environment<A>(_:_:)()
{
  return View.environment<A>(_:_:)();
}

uint64_t View.layerEffect(_:maxSampleOffset:isEnabled:)()
{
  return View.layerEffect(_:maxSampleOffset:isEnabled:)();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.focusEffectDisabled(_:)()
{
  return View.focusEffectDisabled(_:)();
}

uint64_t View.simultaneousGesture<A>(_:including:)()
{
  return View.simultaneousGesture<A>(_:including:)();
}

uint64_t View.focused(_:)()
{
  return View.focused(_:)();
}

uint64_t View.gesture<A>(_:including:)()
{
  return View.gesture<A>(_:including:)();
}

uint64_t View.overlay<A>(alignment:content:)()
{
  return View.overlay<A>(alignment:content:)();
}

uint64_t View.padding(_:)()
{
  return View.padding(_:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t static Color.accentColor.getter()
{
  return static Color.accentColor.getter();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.teal.getter()
{
  return static Color.teal.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t static Color.secondary.getter()
{
  return static Color.secondary.getter();
}

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t Image.init(_:bundle:)()
{
  return Image.init(_:bundle:)();
}

uint64_t Shape.stroke(lineWidth:)()
{
  return Shape.stroke(lineWidth:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t type metadata accessor for State()
{
  return type metadata accessor for State();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t static Shader.Argument._float(_:)()
{
  return static Shader.Argument._float(_:)();
}

uint64_t static Shader.Argument._float2(_:_:)()
{
  return static Shader.Argument._float2(_:_:)();
}

uint64_t type metadata accessor for Shader.Argument()
{
  return type metadata accessor for Shader.Argument();
}

uint64_t type metadata accessor for Shader()
{
  return type metadata accessor for Shader();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t type metadata accessor for Binding()
{
  return type metadata accessor for Binding();
}

uint64_t type metadata accessor for Capsule()
{
  return type metadata accessor for Capsule();
}

uint64_t Gesture.onEnded(_:)()
{
  return Gesture.onEnded(_:)();
}

uint64_t Gesture<>.onChanged(_:)()
{
  return Gesture<>.onChanged(_:)();
}

uint64_t AnyShape.init<A>(_:)()
{
  return AnyShape.init<A>(_:)();
}

uint64_t static Material.regular.getter()
{
  return static Material.regular.getter();
}

uint64_t type metadata accessor for Material()
{
  return type metadata accessor for Material();
}

uint64_t static Alignment.topLeading.getter()
{
  return static Alignment.topLeading.getter();
}

uint64_t static Alignment.topTrailing.getter()
{
  return static Alignment.topTrailing.getter();
}

uint64_t static Alignment.bottomTrailing.getter()
{
  return static Alignment.bottomTrailing.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Alignment.leading.getter()
{
  return static Alignment.leading.getter();
}

uint64_t static Animation.interpolatingSpring(mass:stiffness:damping:initialVelocity:)()
{
  return static Animation.interpolatingSpring(mass:stiffness:damping:initialVelocity:)();
}

uint64_t Animation.delay(_:)()
{
  return Animation.delay(_:)();
}

uint64_t static Animation.spring(response:dampingFraction:blendDuration:)()
{
  return static Animation.spring(response:dampingFraction:blendDuration:)();
}

uint64_t type metadata accessor for BlendMode()
{
  return type metadata accessor for BlendMode();
}

uint64_t Namespace.wrappedValue.getter()
{
  return Namespace.wrappedValue.getter();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

uint64_t static UnitPoint.leading.getter()
{
  return static UnitPoint.leading.getter();
}

uint64_t Dependency.init<A>(satisfying:with:)()
{
  return Dependency.init<A>(satisfying:with:)();
}

{
  return Dependency.init<A>(satisfying:with:)();
}

{
  return Dependency.init<A>(satisfying:with:)();
}

uint64_t type metadata accessor for Dependency()
{
  return type metadata accessor for Dependency();
}

uint64_t JSONObject.init(from:)()
{
  return JSONObject.init(from:)();
}

uint64_t JSONObject.decode<A>(_:withUserInfo:)()
{
  return JSONObject.decode<A>(_:withUserInfo:)();
}

uint64_t type metadata accessor for JSONObject()
{
  return type metadata accessor for JSONObject();
}

uint64_t type metadata accessor for EmptyAction()
{
  return type metadata accessor for EmptyAction();
}

uint64_t dispatch thunk of static IntentModel.kind.getter()
{
  return dispatch thunk of static IntentModel.kind.getter();
}

uint64_t IntentModel._canonicalIntentModel.getter()
{
  return IntentModel._canonicalIntentModel.getter();
}

uint64_t IntentModel._canonicalized.getter()
{
  return IntentModel._canonicalized.getter();
}

uint64_t IntentModel<>.kind.getter()
{
  return IntentModel<>.kind.getter();
}

uint64_t JSONContext.addingValue<A>(_:forProperty:)()
{
  return JSONContext.addingValue<A>(_:forProperty:)();
}

uint64_t static JSONContext.Property<A>.actionTypes.getter()
{
  return static JSONContext.Property<A>.actionTypes.getter();
}

uint64_t static JSONContext.Property<A>.intentTypes.getter()
{
  return static JSONContext.Property<A>.intentTypes.getter();
}

uint64_t static JSONContext.Property<A>.actionKindTable.getter()
{
  return static JSONContext.Property<A>.actionKindTable.getter();
}

uint64_t JSONContext.init(userInfo:)()
{
  return JSONContext.init(userInfo:)();
}

uint64_t type metadata accessor for JSONContext()
{
  return type metadata accessor for JSONContext();
}

uint64_t JSONContext.subscript.getter()
{
  return JSONContext.subscript.getter();
}

uint64_t static MetricsData.makeMetricsImpressionsData(fields:configuration:impressionsEventVersion:)()
{
  return static MetricsData.makeMetricsImpressionsData(fields:configuration:impressionsEventVersion:)();
}

uint64_t static MetricsData.makeMetricsClickData(targetID:targetType:fields:configuration:)()
{
  return static MetricsData.makeMetricsClickData(targetID:targetType:fields:configuration:)();
}

uint64_t MetricsData.Configuration.init(defaultTopic:defaultIncludingFields:defaultExcludingFields:shouldFlush:)()
{
  return MetricsData.Configuration.init(defaultTopic:defaultIncludingFields:defaultExcludingFields:shouldFlush:)();
}

uint64_t type metadata accessor for MetricsData.Configuration()
{
  return type metadata accessor for MetricsData.Configuration();
}

uint64_t MetricsData.init(topic:shouldFlush:fields:includingFields:excludingFields:)()
{
  return MetricsData.init(topic:shouldFlush:fields:includingFields:excludingFields:)();
}

uint64_t MetricsData.fields.getter()
{
  return MetricsData.fields.getter();
}

uint64_t type metadata accessor for MetricsData()
{
  return type metadata accessor for MetricsData();
}

uint64_t PageMetrics.pageFields.getter()
{
  return PageMetrics.pageFields.getter();
}

uint64_t PageMetrics.Instruction.init(data:invocationPoints:)()
{
  return PageMetrics.Instruction.init(data:invocationPoints:)();
}

uint64_t type metadata accessor for PageMetrics.Instruction()
{
  return type metadata accessor for PageMetrics.Instruction();
}

uint64_t PageMetrics.init(instructions:pageFields:custom:clickLocationFields:)()
{
  return PageMetrics.init(instructions:pageFields:custom:clickLocationFields:)();
}

uint64_t static PageMetrics.InvocationPoint.appExit.getter()
{
  return static PageMetrics.InvocationPoint.appExit.getter();
}

uint64_t static PageMetrics.InvocationPoint.pageExit.getter()
{
  return static PageMetrics.InvocationPoint.pageExit.getter();
}

uint64_t static PageMetrics.InvocationPoint.pageEnter.getter()
{
  return static PageMetrics.InvocationPoint.pageEnter.getter();
}

uint64_t type metadata accessor for PageMetrics.InvocationPoint()
{
  return type metadata accessor for PageMetrics.InvocationPoint();
}

uint64_t static PageMetrics.notInstrumented.getter()
{
  return static PageMetrics.notInstrumented.getter();
}

uint64_t type metadata accessor for PageMetrics()
{
  return type metadata accessor for PageMetrics();
}

uint64_t MediaArtwork.ProtocolRequest.matchResult.getter()
{
  return MediaArtwork.ProtocolRequest.matchResult.getter();
}

uint64_t MediaArtwork.ProtocolRequest.size.getter()
{
  return MediaArtwork.ProtocolRequest.size.getter();
}

uint64_t MediaArtwork.ProtocolRequest.scale.getter()
{
  return MediaArtwork.ProtocolRequest.scale.getter();
}

uint64_t MediaArtwork.URLImageProtocol.__allocating_init()()
{
  return MediaArtwork.URLImageProtocol.__allocating_init()();
}

uint64_t type metadata accessor for MediaArtwork.URLImageProtocol()
{
  return type metadata accessor for MediaArtwork.URLImageProtocol();
}

uint64_t MediaArtwork.init(urlTemplate:sourceImageSize:colors:)()
{
  return MediaArtwork.init(urlTemplate:sourceImageSize:colors:)();
}

uint64_t MediaArtwork.resize(_:croppedTo:)()
{
  return MediaArtwork.resize(_:croppedTo:)();
}

uint64_t type metadata accessor for MediaArtwork()
{
  return type metadata accessor for MediaArtwork();
}

uint64_t static ActionMetrics.notInstrumented.getter()
{
  return static ActionMetrics.notInstrumented.getter();
}

uint64_t ActionMetrics.init(data:custom:)()
{
  return ActionMetrics.init(data:custom:)();
}

uint64_t ActionMetrics.data.getter()
{
  return ActionMetrics.data.getter();
}

uint64_t type metadata accessor for ActionMetrics()
{
  return type metadata accessor for ActionMetrics();
}

uint64_t type metadata accessor for ActionOutcome()
{
  return type metadata accessor for ActionOutcome();
}

uint64_t LRUMultiCache.init(keyLimit:valueLimit:)()
{
  return LRUMultiCache.init(keyLimit:valueLimit:)();
}

uint64_t URLExpression.MatchResult.host.getter()
{
  return URLExpression.MatchResult.host.getter();
}

uint64_t URLExpression.MatchResult.query.getter()
{
  return URLExpression.MatchResult.query.getter();
}

uint64_t type metadata accessor for URLExpression.MatchResult()
{
  return type metadata accessor for URLExpression.MatchResult();
}

uint64_t URLExpression.init(schemePattern:hostPattern:pathPattern:queryPattern:)()
{
  return URLExpression.init(schemePattern:hostPattern:pathPattern:queryPattern:)();
}

uint64_t URLExpression.match(_:)()
{
  return URLExpression.match(_:)();
}

uint64_t type metadata accessor for URLExpression()
{
  return type metadata accessor for URLExpression();
}

uint64_t type metadata accessor for AnyActionTypes()
{
  return type metadata accessor for AnyActionTypes();
}

uint64_t AnyActionTypes.init(_:)()
{
  return AnyActionTypes.init(_:)();
}

uint64_t AnyIntentModel.init<A>(_:)()
{
  return AnyIntentModel.init<A>(_:)();
}

uint64_t type metadata accessor for AnyIntentTypes()
{
  return type metadata accessor for AnyIntentTypes();
}

uint64_t AnyIntentTypes.init(_:)()
{
  return AnyIntentTypes.init(_:)();
}

uint64_t ComponentModel.contextMenu.getter()
{
  return ComponentModel.contextMenu.getter();
}

uint64_t type metadata accessor for CompoundAction()
{
  return type metadata accessor for CompoundAction();
}

uint64_t type metadata accessor for OpaqueMetatype()
{
  return type metadata accessor for OpaqueMetatype();
}

uint64_t OpaqueMetatype.init(_:)()
{
  return OpaqueMetatype.init(_:)();
}

uint64_t BaseObjectGraph.inject<A>(_:)()
{
  return BaseObjectGraph.inject<A>(_:)();
}

uint64_t BaseObjectGraph.__allocating_init(name:_:)()
{
  return BaseObjectGraph.__allocating_init(name:_:)();
}

uint64_t dispatch thunk of BaseObjectGraph.adding(dependency:)()
{
  return dispatch thunk of BaseObjectGraph.adding(dependency:)();
}

uint64_t dispatch thunk of BaseObjectGraph.adding(allDependenciesOf:)()
{
  return dispatch thunk of BaseObjectGraph.adding(allDependenciesOf:)();
}

uint64_t static BaseObjectGraph.current.getter()
{
  return static BaseObjectGraph.current.getter();
}

uint64_t type metadata accessor for BaseObjectGraph()
{
  return type metadata accessor for BaseObjectGraph();
}

uint64_t MetricsPipeline.Configuration.withRecorder(_:)()
{
  return MetricsPipeline.Configuration.withRecorder(_:)();
}

uint64_t MetricsPipeline.Configuration.init(bag:linter:anonymousTopics:)()
{
  return MetricsPipeline.Configuration.init(bag:linter:anonymousTopics:)();
}

uint64_t type metadata accessor for MetricsPipeline.Configuration()
{
  return type metadata accessor for MetricsPipeline.Configuration();
}

uint64_t MetricsPipeline.init(from:)()
{
  return MetricsPipeline.init(from:)();
}

uint64_t MetricsPipeline.process(_:using:)()
{
  return MetricsPipeline.process(_:using:)();
}

uint64_t type metadata accessor for MetricsPipeline()
{
  return type metadata accessor for MetricsPipeline();
}

uint64_t type metadata accessor for QueryExpression.MatchResult()
{
  return type metadata accessor for QueryExpression.MatchResult();
}

uint64_t QueryExpression.MatchResult.subscript.getter()
{
  return QueryExpression.MatchResult.subscript.getter();
}

uint64_t ActionDispatcher.add(contentsOf:)()
{
  return ActionDispatcher.add(contentsOf:)();
}

uint64_t ActionDispatcher.add<A>(_:)()
{
  return ActionDispatcher.add<A>(_:)();
}

uint64_t ActionDispatcher.next.setter()
{
  return ActionDispatcher.next.setter();
}

uint64_t ActionDispatcher.init()()
{
  return ActionDispatcher.init()();
}

uint64_t static MetricsEventType.impressions.getter()
{
  return static MetricsEventType.impressions.getter();
}

uint64_t static MetricsEventType.page.getter()
{
  return static MetricsEventType.page.getter();
}

uint64_t static MetricsEventType.click.getter()
{
  return static MetricsEventType.click.getter();
}

uint64_t MetricsEventType.rawValue.getter()
{
  return MetricsEventType.rawValue.getter();
}

uint64_t type metadata accessor for MetricsEventType()
{
  return type metadata accessor for MetricsEventType();
}

uint64_t ScalarDictionary.init()()
{
  return ScalarDictionary.init()();
}

uint64_t type metadata accessor for ScalarDictionary()
{
  return type metadata accessor for ScalarDictionary();
}

uint64_t dispatch thunk of ExpressibleByJSON.init(deserializing:using:)()
{
  return dispatch thunk of ExpressibleByJSON.init(deserializing:using:)();
}

uint64_t ExpressibleByJSON.init(tryDeserializing:using:)()
{
  return ExpressibleByJSON.init(tryDeserializing:using:)();
}

uint64_t ImpressionMetrics.ID.init(parent:element:index:)()
{
  return ImpressionMetrics.ID.init(parent:element:index:)();
}

uint64_t type metadata accessor for ImpressionMetrics.ID()
{
  return type metadata accessor for ImpressionMetrics.ID();
}

uint64_t ImpressionMetrics.init(id:fields:custom:commonFields:clickLocationFields:)()
{
  return ImpressionMetrics.init(id:fields:custom:commonFields:clickLocationFields:)();
}

uint64_t type metadata accessor for ImpressionMetrics()
{
  return type metadata accessor for ImpressionMetrics();
}

uint64_t ImpressionsContext.withPosition(_:)()
{
  return ImpressionsContext.withPosition(_:)();
}

uint64_t ImpressionsContext.init()()
{
  return ImpressionsContext.init()();
}

uint64_t type metadata accessor for ImpressionsContext()
{
  return type metadata accessor for ImpressionsContext();
}

uint64_t static AutomationSemantics.page(name:id:)()
{
  return static AutomationSemantics.page(name:id:)();
}

uint64_t type metadata accessor for AutomationSemantics()
{
  return type metadata accessor for AutomationSemantics();
}

uint64_t ShelfBasedPageModel<>.presentation.getter()
{
  return ShelfBasedPageModel<>.presentation.getter();
}

uint64_t IntentImplementation.intentKind.getter()
{
  return IntentImplementation.intentKind.getter();
}

uint64_t MetricsFieldsContext.addingValue<A>(_:forProperty:)()
{
  return MetricsFieldsContext.addingValue<A>(_:forProperty:)();
}

uint64_t static MetricsFieldsContext.Property<A>.impressionsTracker.getter()
{
  return static MetricsFieldsContext.Property<A>.impressionsTracker.getter();
}

uint64_t static MetricsFieldsContext.Property<A>.pageFields.getter()
{
  return static MetricsFieldsContext.Property<A>.pageFields.getter();
}

uint64_t MetricsFieldsContext.init()()
{
  return MetricsFieldsContext.init()();
}

uint64_t type metadata accessor for MetricsFieldsContext()
{
  return type metadata accessor for MetricsFieldsContext();
}

uint64_t static FlowActionPresentation.tabSelect.getter()
{
  return static FlowActionPresentation.tabSelect.getter();
}

uint64_t NativeIntentDispatcher.registering<A>(_:)()
{
  return NativeIntentDispatcher.registering<A>(_:)();
}

uint64_t NativeIntentDispatcher.next.setter()
{
  return NativeIntentDispatcher.next.setter();
}

uint64_t NativeIntentDispatcher.register(contentsOf:)()
{
  return NativeIntentDispatcher.register(contentsOf:)();
}

uint64_t NativeIntentDispatcher.init()()
{
  return NativeIntentDispatcher.init()();
}

uint64_t type metadata accessor for NativeIntentDispatcher()
{
  return type metadata accessor for NativeIntentDispatcher();
}

uint64_t AMSMetricsEventRecorder.__allocating_init(bag:defaultTopic:)()
{
  return AMSMetricsEventRecorder.__allocating_init(bag:defaultTopic:)();
}

uint64_t type metadata accessor for AMSMetricsEventRecorder()
{
  return type metadata accessor for AMSMetricsEventRecorder();
}

uint64_t BasicImpressionsTracker.elementDidEnterView(_:on:with:)()
{
  return BasicImpressionsTracker.elementDidEnterView(_:on:with:)();
}

uint64_t BasicImpressionsTracker.elementDidLeaveView(_:on:with:)()
{
  return BasicImpressionsTracker.elementDidLeaveView(_:on:with:)();
}

uint64_t BasicImpressionsTracker.__allocating_init(threshold:)()
{
  return BasicImpressionsTracker.__allocating_init(threshold:)();
}

uint64_t type metadata accessor for BasicImpressionsTracker()
{
  return type metadata accessor for BasicImpressionsTracker();
}

uint64_t type metadata accessor for AppleServicesURLProtocol()
{
  return type metadata accessor for AppleServicesURLProtocol();
}

JSValue __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CustomJSValueConvertible._jsValue(in:)(JSContext in)
{
  return (JSValue)CustomJSValueConvertible._jsValue(in:)(in.super.isa);
}

JSValue __swiftcall CustomJSValueConvertible.makeValue(in:)(JSContext in)
{
  return (JSValue)CustomJSValueConvertible.makeValue(in:)(in.super.isa);
}

uint64_t IntentMetricsEventLinter.init(objectGraph:)()
{
  return IntentMetricsEventLinter.init(objectGraph:)();
}

uint64_t type metadata accessor for IntentMetricsEventLinter()
{
  return type metadata accessor for IntentMetricsEventLinter();
}

uint64_t _defaultActionKindLookup.getter()
{
  return _defaultActionKindLookup.getter();
}

uint64_t EmptyActionImplementation.init()()
{
  return EmptyActionImplementation.init()();
}

uint64_t CompoundActionImplementation.init()()
{
  return CompoundActionImplementation.init()();
}

uint64_t static MetricsFieldInclusionRequest.pageFields.getter()
{
  return static MetricsFieldInclusionRequest.pageFields.getter();
}

uint64_t static MetricsFieldInclusionRequest.impressions.getter()
{
  return static MetricsFieldInclusionRequest.impressions.getter();
}

uint64_t type metadata accessor for MetricsFieldInclusionRequest()
{
  return type metadata accessor for MetricsFieldInclusionRequest();
}

uint64_t static Bag.fetchBag(forProfile:)()
{
  return static Bag.fetchBag(forProfile:)();
}

uint64_t Bag.init(mockProfile:stubs:)()
{
  return Bag.init(mockProfile:stubs:)();
}

uint64_t type metadata accessor for Bag.ValueOverride()
{
  return type metadata accessor for Bag.ValueOverride();
}

uint64_t Bag.withValuesForKeys(_:)()
{
  return Bag.withValuesForKeys(_:)();
}

uint64_t Bag.Stubs.init()()
{
  return Bag.Stubs.init()();
}

uint64_t type metadata accessor for Bag.Stubs()
{
  return type metadata accessor for Bag.Stubs();
}

uint64_t Bag.Value.current(or:)()
{
  return Bag.Value.current(or:)();
}

uint64_t Bag.subscript.getter()
{
  return Bag.subscript.getter();
}

uint64_t Bag.Profile.init(name:version:)()
{
  return Bag.Profile.init(name:version:)();
}

uint64_t type metadata accessor for Bag.Profile()
{
  return type metadata accessor for Bag.Profile();
}

uint64_t type metadata accessor for Bag()
{
  return type metadata accessor for Bag();
}

uint64_t type metadata accessor for Models.FlowBackAction()
{
  return type metadata accessor for Models.FlowBackAction();
}

uint64_t Models.ExternalURLAction.init(actionMetrics:url:isSensitive:)()
{
  return Models.ExternalURLAction.init(actionMetrics:url:isSensitive:)();
}

uint64_t type metadata accessor for Models.ExternalURLAction()
{
  return type metadata accessor for Models.ExternalURLAction();
}

uint64_t PageID.init(with:)()
{
  return PageID.init(with:)();
}

uint64_t type metadata accessor for PageID()
{
  return type metadata accessor for PageID();
}

uint64_t Promise.resolve(_:)()
{
  return Promise.resolve(_:)();
}

uint64_t Promise.__allocating_init()()
{
  return Promise.__allocating_init()();
}

uint64_t type metadata accessor for ShelfID()
{
  return type metadata accessor for ShelfID();
}

uint64_t DeepLink.url.getter()
{
  return DeepLink.url.getter();
}

uint64_t type metadata accessor for DeepLink()
{
  return type metadata accessor for DeepLink();
}

uint64_t type metadata accessor for JSONError()
{
  return type metadata accessor for JSONError();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.Keys.description.getter()
{
  return Dictionary.Keys.description.getter();
}

uint64_t Dictionary<>.init(jsonContext:)()
{
  return Dictionary<>.init(jsonContext:)();
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

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
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

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

{
  return String.init<A>(_:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

{
  return RawRepresentable<>.init(from:)();
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

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return AsyncStream.Continuation.yield(_:)();
}

Swift::Void __swiftcall AsyncStream.Continuation.finish()()
{
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

uint64_t dispatch thunk of Decodable.init(from:)()
{
  return dispatch thunk of Decodable.init(from:)();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._forceBridgeFromObjectiveC(_:result:)()
{
  return static Set._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t type metadata accessor for GKImageRestrictions()
{
  return type metadata accessor for GKImageRestrictions();
}

uint64_t NSSet.init(arrayLiteral:)()
{
  return NSSet.init(arrayLiteral:)();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
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

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.addingPercentEncoding(withAllowedCharacters:)()
{
  return StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
}

uint64_t StringProtocol.removingPercentEncoding.getter()
{
  return StringProtocol.removingPercentEncoding.getter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
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

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
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

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t type metadata accessor for DecodingError()
{
  return type metadata accessor for DecodingError();
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

uint64_t static _DictionaryStorage.convert(_:capacity:)()
{
  return static _DictionaryStorage.convert(_:capacity:)();
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

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
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

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
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

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return dispatch thunk of SingleValueDecodingContainer.decode(_:)();
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

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.codingPath.getter()
{
  return dispatch thunk of Decoder.codingPath.getter();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return dispatch thunk of Decoder.singleValueContainer()();
}

uint64_t dispatch thunk of Decoder.userInfo.getter()
{
  return dispatch thunk of Decoder.userInfo.getter();
}

uint64_t Decoder.withUserInfo(_:)()
{
  return Decoder.withUserInfo(_:)();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t BSValueWithRect()
{
  return _BSValueWithRect();
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

uint64_t GKImageURLKeyForSize()
{
  return _GKImageURLKeyForSize();
}

uint64_t GKIsXRUIIdiomShouldUsePadUI()
{
  return _GKIsXRUIIdiomShouldUsePadUI();
}

uint64_t GKUISetRemote()
{
  return _GKUISetRemote();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return _swift_initEnumMetadataSingleCase();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}