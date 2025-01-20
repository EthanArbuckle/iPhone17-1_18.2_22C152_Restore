int main(int argc, const char **argv, const char **envp)
{
  id v3;

  qword_100025B10 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for MessageFilterManager()) init];
  v3 = [self serviceListener];
  qword_100025B18 = (uint64_t)v3;
  [v3 setDelegate:qword_100025B10];
  [v3 resume];
  exit(1);
}

uint64_t sub_100004D74(uint64_t a1)
{
  uint64_t v2 = sub_100005684(&qword_100024F08, type metadata accessor for ILMessageFilterError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100004DE0(uint64_t a1)
{
  uint64_t v2 = sub_100005684(&qword_100024F08, type metadata accessor for ILMessageFilterError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100004E50(uint64_t a1)
{
  uint64_t v2 = sub_100005684(&qword_100024F40, type metadata accessor for ILMessageFilterError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_100004EBC()
{
  return *v0;
}

uint64_t sub_100004EC4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100004ECC(uint64_t a1)
{
  uint64_t v2 = sub_100005684(&qword_100024F48, type metadata accessor for ILMessageFilterPrivateError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100004F38(uint64_t a1)
{
  uint64_t v2 = sub_100005684(&qword_100024F48, type metadata accessor for ILMessageFilterPrivateError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100004FA4(uint64_t a1)
{
  uint64_t v2 = sub_100005684(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100005010()
{
  return sub_10001AA40();
}

uint64_t sub_100005020(uint64_t a1)
{
  uint64_t v2 = sub_100005684(&qword_100024F40, type metadata accessor for ILMessageFilterError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_10000508C(uint64_t a1)
{
  uint64_t v2 = sub_100005684(&qword_100024F40, type metadata accessor for ILMessageFilterError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000050F8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100005684(&qword_100024F40, type metadata accessor for ILMessageFilterError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100005188()
{
  id v1 = *v0;
  uint64_t v2 = sub_10001AB10();

  return v2;
}

uint64_t sub_1000051C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005684(&qword_100024F40, type metadata accessor for ILMessageFilterError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

void *sub_100005240@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100005250(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000525C()
{
  return sub_10001AA40();
}

uint64_t sub_10000526C(uint64_t a1)
{
  uint64_t v2 = sub_100005684(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000052D8(uint64_t a1)
{
  uint64_t v2 = sub_100005684(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100005344(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100005684(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_1000053D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005684(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100005450()
{
  return sub_10001AC50();
}

void type metadata accessor for ILMessageFilterError(uint64_t a1)
{
}

void type metadata accessor for ILMessageFilterPrivateError(uint64_t a1)
{
}

uint64_t sub_1000054D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005684(&qword_100024F40, type metadata accessor for ILMessageFilterError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

BOOL sub_10000555C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100005570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005684(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_1000055F4()
{
  return sub_100005684(&qword_100024EE8, type metadata accessor for ILMessageFilterPrivateError);
}

uint64_t sub_10000563C()
{
  return sub_100005684(&qword_100024EF0, type metadata accessor for ILMessageFilterPrivateError);
}

uint64_t sub_100005684(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000056CC()
{
  return sub_100005684(&qword_100024EF8, type metadata accessor for ILMessageFilterError);
}

uint64_t sub_100005714()
{
  return sub_100005684(&qword_100024F00, type metadata accessor for ILMessageFilterError);
}

uint64_t sub_10000575C()
{
  return sub_100005684(&qword_100024F08, type metadata accessor for ILMessageFilterError);
}

uint64_t sub_1000057A4()
{
  return sub_100005684(&qword_100024F10, type metadata accessor for ILMessageFilterError);
}

uint64_t sub_1000057EC()
{
  return sub_100005684(&qword_100024F18, type metadata accessor for ILMessageFilterError);
}

uint64_t sub_100005834()
{
  return sub_100005684(&qword_100024F20, _s3__C4CodeOMa_0);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
}

uint64_t sub_100005890()
{
  return sub_100005684(&qword_100024F28, _s3__C4CodeOMa_0);
}

unint64_t sub_1000058DC()
{
  unint64_t result = qword_100024F30;
  if (!qword_100024F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024F30);
  }
  return result;
}

uint64_t sub_100005930()
{
  return sub_100005684(&qword_100024F38, _s3__C4CodeOMa_0);
}

uint64_t sub_100005978()
{
  return sub_100005684(&qword_100024F40, type metadata accessor for ILMessageFilterError);
}

uint64_t sub_1000059C0()
{
  return sub_100005684(&qword_100024F48, type metadata accessor for ILMessageFilterPrivateError);
}

uint64_t sub_100005A08()
{
  return sub_100005684(&qword_100024F50, type metadata accessor for ILMessageFilterPrivateError);
}

uint64_t sub_100005A50()
{
  return sub_100005684(&qword_100024F58, type metadata accessor for ILMessageFilterPrivateError);
}

uint64_t sub_100005A98()
{
  return sub_100005684(&qword_100024F60, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_100005AF4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100005B3C()
{
  return sub_100005684(&qword_100024F68, type metadata accessor for Code);
}

uint64_t sub_100005B84()
{
  return sub_100005684(&qword_100024F70, type metadata accessor for Code);
}

uint64_t sub_100005BCC()
{
  return sub_100005684(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
}

uint64_t sub_100005C28()
{
  sub_100005C88();
  uint64_t result = sub_10001AB20();
  qword_100025B20 = result;
  return result;
}

unint64_t sub_100005C88()
{
  unint64_t result = qword_100024F88;
  if (!qword_100024F88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100024F88);
  }
  return result;
}

uint64_t sub_100005CC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = a7;
  uint64_t v30 = a5;
  uint64_t v31 = a6;
  uint64_t v32 = a3;
  uint64_t v33 = a4;
  uint64_t v35 = sub_10001A9B0();
  uint64_t v38 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10001A9D0();
  uint64_t v36 = *(void *)(v14 - 8);
  uint64_t v37 = v14;
  __chkstk_darwin(v14);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10001A950();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  __chkstk_darwin(v17);
  uint64_t v34 = *(void *)(v8 + 16);
  sub_100006E20(a1, (uint64_t)v41);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v17);
  unint64_t v20 = (*(unsigned __int8 *)(v18 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v21 = (char *)swift_allocObject();
  sub_100007268(v41, (uint64_t)(v21 + 16));
  *((void *)v21 + 7) = v29;
  *((void *)v21 + 8) = a8;
  uint64_t v22 = v31;
  *((void *)v21 + 9) = v30;
  *((void *)v21 + 10) = v22;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v21[v20], (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  v23 = &v21[(v19 + v20 + 7) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v24 = v33;
  *(void *)v23 = v32;
  *((void *)v23 + 1) = v24;
  aBlock[4] = sub_100006FD0;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = &unk_100020A40;
  v25 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10001A9C0();
  v39 = &_swiftEmptyArrayStorage;
  sub_100007220((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  uint64_t v26 = v35;
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v25);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v26);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v37);
  return swift_release();
}

void sub_100006098(uint64_t a1, void (*a2)(void, void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v39 = a8;
  uint64_t v38 = a7;
  uint64_t v37 = a6;
  uint64_t v44 = a4;
  uint64_t v45 = a5;
  v46 = a2;
  uint64_t v47 = a3;
  uint64_t v35 = sub_10001A950();
  uint64_t v36 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_10001A860();
  uint64_t v41 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  v40 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v12 = swift_allocObject();
  long long v43 = xmmword_10001B730;
  *(_OWORD *)(v12 + 16) = xmmword_10001B730;
  sub_100006E20(a1, (uint64_t)aBlock);
  sub_100007084(&qword_100025040);
  uint64_t v13 = sub_10001AA70();
  uint64_t v15 = v14;
  *(void *)(v12 + 56) = &type metadata for String;
  unint64_t v16 = sub_10000716C();
  *(void *)(v12 + 64) = v16;
  *(void *)(v12 + 32) = v13;
  *(void *)(v12 + 40) = v15;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  sub_100006E20(a1, (uint64_t)aBlock);
  sub_100007084(&qword_100025050);
  if (swift_dynamicCast())
  {
    sub_100007268(v49, (uint64_t)v51);
    uint64_t v17 = sub_100010758(v51, v44, v45);
    if (v18 >> 60 == 15)
    {
      sub_10001AAB0();
      sub_10001A9A0();
      type metadata accessor for ILMessageFilterError(0);
      *(void *)&v49[0] = 1;
      sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
      sub_100007220(&qword_100024F40, type metadata accessor for ILMessageFilterError);
      sub_10001A8D0();
      uint64_t v19 = (void *)aBlock[0];
      v46(0, aBlock[0]);
    }
    else
    {
      uint64_t v24 = v17;
      unint64_t v25 = v18;
      (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v10, v37, v35);
      uint64_t v26 = v40;
      sub_10001A830();
      sub_10001A810();
      v52.value._object = (void *)0x800000010001C180;
      v52.value._countAndFlagsBits = 0xD00000000000001FLL;
      v53._countAndFlagsBits = 0x2D746E65746E6F43;
      v53._object = (void *)0xEC00000065707954;
      sub_10001A850(v52, v53);
      sub_1000074E8(v24, v25);
      sub_10001A840();
      id v27 = [self ephemeralSessionConfiguration];
      NSString v28 = sub_10001AA30();
      objc_msgSend(v27, "set_sourceApplicationBundleIdentifier:", v28);

      id v29 = [self sessionWithConfiguration:v27];
      Class v30 = sub_10001A820();
      uint64_t v31 = swift_allocObject();
      uint64_t v32 = v47;
      *(void *)(v31 + 16) = v46;
      *(void *)(v31 + 24) = v32;
      aBlock[4] = sub_100007578;
      aBlock[5] = v31;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100006CFC;
      aBlock[3] = &unk_100020A90;
      uint64_t v33 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      id v34 = [v29 dataTaskWithRequest:v30 completionHandler:v33];
      _Block_release(v33);

      [v34 resume];
      [v29 finishTasksAndInvalidate];

      sub_100007580(v24, v25);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v26, v42);
    }
    sub_100006F80((uint64_t)v51);
  }
  else
  {
    uint64_t v50 = 0;
    memset(v49, 0, sizeof(v49));
    sub_1000071C0((uint64_t)v49);
    sub_10001AAB0();
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = v43;
    sub_100006E20(a1, (uint64_t)aBlock);
    uint64_t v21 = sub_10001AA70();
    *(void *)(v20 + 56) = &type metadata for String;
    *(void *)(v20 + 64) = v16;
    *(void *)(v20 + 32) = v21;
    *(void *)(v20 + 40) = v22;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    type metadata accessor for ILMessageFilterError(0);
    v51[0] = 1;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_100007220(&qword_100024F40, type metadata accessor for ILMessageFilterError);
    sub_10001A8D0();
    v23 = (void *)aBlock[0];
    v46(0, aBlock[0]);
  }
}

void sub_10000679C(uint64_t a1, unint64_t a2, void *a3, void *a4, void (*a5)(void))
{
  if (!a3 || ((self, (v10 = swift_dynamicCastObjCClass()) != 0) ? (BOOL v11 = a2 >> 60 == 15) : (BOOL v11 = 1), v11))
  {
    if (a4)
    {
      swift_errorRetain();
      if (qword_100024E70 != -1) {
        swift_once();
      }
      sub_10001AAB0();
      sub_100007084(&qword_100025038);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_10001B730;
      swift_errorRetain();
      sub_100007084(&qword_100025A00);
      uint64_t v13 = sub_10001AA50();
      uint64_t v15 = v14;
      *(void *)(v12 + 56) = &type metadata for String;
      *(void *)(v12 + 64) = sub_10000716C();
      *(void *)(v12 + 32) = v13;
      *(void *)(v12 + 40) = v15;
      sub_10001A9A0();
      swift_bridgeObjectRelease();
      type metadata accessor for ILMessageFilterError(0);
      sub_100007084(&qword_100025060);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10001B730;
      *(void *)(inited + 32) = sub_10001AA40();
      *(void *)(inited + 40) = v17;
      swift_getErrorValue();
      *(void *)(inited + 72) = v25;
      unint64_t v18 = sub_1000075EC((uint64_t *)(inited + 48));
      (*(void (**)(uint64_t *))(*(void *)(v25 - 8) + 16))(v18);
      sub_100006BD0(inited);
      sub_100007220(&qword_100024F40, type metadata accessor for ILMessageFilterError);
      sub_10001A8D0();
      ((void (*)(void, void *))a5)(0, a4);
      swift_errorRelease();
    }
    else
    {
      if (qword_100024E70 != -1) {
        swift_once();
      }
      sub_10001AAB0();
      sub_10001A9A0();
      type metadata accessor for ILMessageFilterError(0);
      sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
      sub_100007220(&qword_100024F40, type metadata accessor for ILMessageFilterError);
      sub_10001A8D0();
      a5(0);
    }
  }
  else
  {
    uint64_t v19 = v10;
    id v20 = objc_allocWithZone((Class)ILNetworkResponse);
    id v24 = a3;
    sub_100007650(a1, a2);
    Class isa = sub_10001A960().super.isa;
    id v22 = [v20 initWithURLResponse:v19 data:isa];

    id v23 = v22;
    ((void (*)(id, void *))a5)(v22, a4);

    sub_100007580(a1, a2);
  }
}

unint64_t sub_100006BD0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007084((uint64_t *)&unk_100025A10);
  uint64_t v2 = sub_10001ABD0();
  v3 = (void *)v2;
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
    sub_100007664(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100007280(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000076CC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_100006CFC(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = a2;
  uint64_t v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v8 = v6;
    uint64_t v6 = (void *)sub_10001A970();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  id v11 = a3;
  id v12 = a4;
  v7(v6, v10, a3, a4);

  sub_100007580((uint64_t)v6, v10);

  return swift_release();
}

uint64_t sub_100006DC4()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for NetworkOperation()
{
  return self;
}

uint64_t sub_100006E20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006E84()
{
  uint64_t v1 = sub_10001A950();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 88) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  sub_100006F80(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100006F80(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_100006FD0()
{
  uint64_t v1 = *(void *)(sub_10001A950() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (void (*)(void, void))v0[7];
  uint64_t v4 = v0[8];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  uint64_t v7 = (uint64_t)v0 + v2;
  id v8 = (void *)((char *)v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];

  sub_100006098((uint64_t)(v0 + 2), v3, v4, v5, v6, v7, v9, v10);
}

uint64_t sub_10000706C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000707C()
{
  return swift_release();
}

uint64_t sub_100007084(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000070C8()
{
  unint64_t result = qword_100025A80;
  if (!qword_100025A80)
  {
    sub_100007124(&qword_100025030);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025A80);
  }
  return result;
}

uint64_t sub_100007124(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000716C()
{
  unint64_t result = qword_100025048;
  if (!qword_100025048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025048);
  }
  return result;
}

uint64_t sub_1000071C0(uint64_t a1)
{
  uint64_t v2 = sub_100007084(&qword_100025058);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007220(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100007268(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_100007280(uint64_t a1, uint64_t a2)
{
  sub_10001AC40();
  sub_10001AA80();
  Swift::Int v4 = sub_10001AC50();

  return sub_10000733C(a1, a2, v4);
}

unint64_t sub_1000072F8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10001AB60(*(void *)(v2 + 40));

  return sub_100007420(a1, v4);
}

unint64_t sub_10000733C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10001ABF0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10001ABF0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100007420(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000076DC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10001AB70();
      sub_100007738((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000074E8(uint64_t a1, unint64_t a2)
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

uint64_t sub_100007540()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100007578(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  sub_10000679C(a1, a2, a3, a4, *(void (**)(void))(v4 + 16));
}

uint64_t sub_100007580(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100007594(a1, a2);
  }
  return a1;
}

uint64_t sub_100007594(uint64_t a1, unint64_t a2)
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

uint64_t *sub_1000075EC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100007650(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000074E8(a1, a2);
  }
  return a1;
}

uint64_t sub_100007664(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007084(&qword_100025068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1000076CC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000076DC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100007738(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007794(uint64_t a1)
{
  uint64_t v1 = a1;
  id v22 = 0;
  id v2 = [self serviceDetailsWithServiceSpecifier:a1 error:&v22];
  id v3 = v22;
  if (v2)
  {
    uint64_t v4 = v2;
    sub_100007B8C(0, qword_100025080);
    unint64_t v5 = sub_10001AAA0();
    id v6 = v3;

    if (qword_100024E70 != -1) {
      goto LABEL_19;
    }
    while (1)
    {
      sub_100007084(&qword_100025038);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_10001B730;
      *(void *)(v7 + 56) = sub_100007B8C(0, &qword_100025070);
      *(void *)(v7 + 64) = sub_100007B24();
      *(void *)(v7 + 32) = v1;
      id v8 = (id)v1;
      sub_10001AAC0();
      sub_10001A9A0();
      swift_bridgeObjectRelease();
      if (v5 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v1 = sub_10001ABA0();
        if (!v1)
        {
LABEL_21:
          swift_bridgeObjectRelease();
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v1 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v1) {
          goto LABEL_21;
        }
      }
      uint64_t v9 = 4;
      while (1)
      {
        id v10 = (v5 & 0xC000000000000001) != 0 ? (id)sub_10001AB90() : *(id *)(v5 + 8 * v9);
        BOOL v11 = v10;
        uint64_t v12 = v9 - 3;
        if (__OFADD__(v9 - 4, 1)) {
          break;
        }
        unsigned int v13 = [v10 isApproved];

        if (v13)
        {
          swift_bridgeObjectRelease();
          uint64_t v1 = 1;
          goto LABEL_22;
        }
        ++v9;
        if (v12 == v1)
        {
          swift_bridgeObjectRelease();
          goto LABEL_16;
        }
      }
      __break(1u);
LABEL_19:
      swift_once();
    }
  }
  id v14 = v22;
  uint64_t v15 = (void *)sub_10001A8F0();

  swift_willThrow();
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10001B7D0;
  *(void *)(v16 + 56) = sub_100007B8C(0, &qword_100025070);
  *(void *)(v16 + 64) = sub_100007B24();
  *(void *)(v16 + 32) = v1;
  id v22 = v15;
  id v17 = (id)v1;
  swift_errorRetain();
  sub_100007084(&qword_100025A00);
  uint64_t v18 = sub_10001AA70();
  uint64_t v20 = v19;
  *(void *)(v16 + 96) = &type metadata for String;
  *(void *)(v16 + 104) = sub_10000716C();
  *(void *)(v16 + 72) = v18;
  *(void *)(v16 + 80) = v20;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_errorRelease();
LABEL_16:
  uint64_t v1 = 0;
LABEL_22:
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t sub_100007B24()
{
  unint64_t result = qword_100025078;
  if (!qword_100025078)
  {
    sub_100007B8C(255, &qword_100025070);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025078);
  }
  return result;
}

uint64_t sub_100007B8C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100007BCC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100007C44@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = type metadata accessor for NetworkOperation();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  a2[3] = v3;
  a2[4] = (uint64_t)&off_100020A08;
  *a2 = v4;

  return _objc_retain_x1();
}

void sub_100007CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  id v6 = (void *)_SWCServiceTypeMessageFiltering;
  id v7 = objc_allocWithZone((Class)_SWCServiceSpecifier);
  id v8 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  NSString v9 = sub_10001AA30();
  swift_bridgeObjectRelease();
  NSString v10 = sub_10001AA30();
  swift_bridgeObjectRelease();
  id v12 = [v7 initWithServiceType:v8 applicationIdentifier:v9 domain:v10];

  char v11 = sub_100007794((uint64_t)v12);
  a5(v11 & 1);
}

uint64_t sub_100007DBC(void *a1, void *a2, uint64_t a3, uint64_t (*a4)(void *, void *))
{
  uint64_t v4 = a4;
  if (!a1)
  {
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_10001B7D0;
    sub_100006E20(a3, (uint64_t)&v25);
    sub_100007084(&qword_100025040);
    uint64_t v9 = sub_10001AA70();
    uint64_t v11 = v10;
    *(void *)(v8 + 56) = &type metadata for String;
    unint64_t v12 = sub_10000716C();
    *(void *)(v8 + 64) = v12;
    *(void *)(v8 + 32) = v9;
    *(void *)(v8 + 40) = v11;
    uint64_t v25 = a2;
    swift_errorRetain();
    sub_100007084(&qword_100025208);
    uint64_t v13 = sub_10001AA70();
    *(void *)(v8 + 96) = &type metadata for String;
    *(void *)(v8 + 104) = v12;
    *(void *)(v8 + 72) = v13;
    *(void *)(v8 + 80) = v14;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    uint64_t v4 = a4;
  }
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10001B7D0;
  uint64_t v25 = a1;
  id v16 = a1;
  sub_100007084(&qword_100025210);
  uint64_t v17 = sub_10001AA70();
  uint64_t v19 = v18;
  *(void *)(v15 + 56) = &type metadata for String;
  unint64_t v20 = sub_10000716C();
  *(void *)(v15 + 64) = v20;
  *(void *)(v15 + 32) = v17;
  *(void *)(v15 + 40) = v19;
  uint64_t v25 = a2;
  swift_errorRetain();
  sub_100007084(&qword_100025208);
  uint64_t v21 = sub_10001AA70();
  *(void *)(v15 + 96) = &type metadata for String;
  *(void *)(v15 + 104) = v20;
  *(void *)(v15 + 72) = v21;
  *(void *)(v15 + 80) = v22;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  return v4(a1, a2);
}

uint64_t sub_100008040()
{
  sub_100006F80(v0 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1000080C8()
{
  sub_100008040();

  return _swift_deallocClassInstance(v0, 168, 7);
}

uint64_t type metadata accessor for RequestOperation()
{
  return sub_100008A6C();
}

uint64_t sub_100008114()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100008158()
{
  sub_100008A5C(*(void *)(v0 + 16));

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for OneTimeOperation()
{
  return sub_100008A6C();
}

uint64_t sub_1000081A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 8);
}

void *sub_1000081B4(void *result)
{
  if (*result >= 0xFFFFFFFFuLL) {
    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_1000081D0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_retain();
  }
  return a1;
}

unint64_t *sub_10000821C(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      unint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  unint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 sub_1000082AC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *sub_1000082B8(void *a1, uint64_t a2)
{
  if (*a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    swift_release();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_release();
  return a1;
}

uint64_t sub_100008324(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t sub_100008374(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

uint64_t sub_1000083C8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1000083E4(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *__n128 result = v2;
  return result;
}

uint64_t type metadata accessor for OneTimeOperation.Availability()
{
  return sub_100008A6C();
}

uint64_t initializeBufferWithCopyOfBuffer for RequestOperationNSExtension(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for RequestOperationNSExtension()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RequestOperationNSExtension(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RequestOperationNSExtension(void *a1, void *a2)
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
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for RequestOperationNSExtension(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

void *assignWithTake for RequestOperationNSExtension(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestOperationNSExtension(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RequestOperationNSExtension(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RequestOperationNSExtension()
{
  return &type metadata for RequestOperationNSExtension;
}

void sub_100008734(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_100016590();
  if (!v5)
  {
    if (qword_100024E70 == -1) {
      goto LABEL_10;
    }
LABEL_15:
    swift_once();
    goto LABEL_10;
  }
  uint64_t v6 = v4;
  uint64_t v7 = v5;
  id v8 = sub_100016840();
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = [v8 bundleIdentifier];

    if (v10)
    {
      uint64_t v11 = sub_10001AA40();
      uint64_t v13 = v12;

      id v14 = sub_100016840();
      uint64_t v15 = v14;
      if (v14)
      {
        id v16 = [v14 bundleVersion];

        if (v16)
        {
          uint64_t v15 = (void *)sub_10001AA40();
          uint64_t v18 = v17;

LABEL_13:
          id v21 = sub_1000166D0();
          uint64_t v22 = v23;

          goto LABEL_14;
        }
        uint64_t v15 = 0;
      }
      uint64_t v18 = 0;
      goto LABEL_13;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_100024E70 != -1) {
    goto LABEL_15;
  }
LABEL_10:
  sub_10001AAB0();
  sub_100007084(&qword_100025038);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_10001B730;
  *(void *)(v19 + 56) = sub_1000089C4();
  *(void *)(v19 + 64) = sub_100008A04();
  *(void *)(v19 + 32) = a1;
  id v20 = a1;
  sub_10001A9A0();
  swift_bridgeObjectRelease();

  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v11 = 0;
  uint64_t v13 = 0;
  uint64_t v15 = 0;
  uint64_t v18 = 0;
  id v21 = 0;
  uint64_t v22 = 0;
LABEL_14:
  *a2 = v6;
  a2[1] = v7;
  a2[2] = v11;
  a2[3] = v13;
  a2[4] = (uint64_t)v15;
  a2[5] = v18;
  a2[6] = (uint64_t)v21;
  a2[7] = v22;
  a2[8] = 0;
  a2[9] = 0;
}

unint64_t sub_1000089C4()
{
  unint64_t result = qword_1000259E0;
  if (!qword_1000259E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000259E0);
  }
  return result;
}

unint64_t sub_100008A04()
{
  unint64_t result = qword_100025218;
  if (!qword_100025218)
  {
    sub_1000089C4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025218);
  }
  return result;
}

uint64_t sub_100008A5C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100008A6C()
{
  return swift_getGenericMetadata();
}

uint64_t sub_100008A9C(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10001B730;
  *(void *)(v7 + 56) = sub_100007B8C(0, (unint64_t *)&unk_100025A50);
  *(void *)(v7 + 64) = sub_100009DE4();
  *(void *)(v7 + 32) = a1;
  id v8 = a1;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v3;
  v9[3] = a2;
  v9[4] = a3;
  swift_retain();
  swift_retain();
  sub_100010B78((uint64_t)sub_100009E8C, (uint64_t)v9);
  id v10 = (void *)swift_allocObject();
  v10[2] = a2;
  v10[3] = a3;
  v10[4] = v3;
  v10[5] = v8;
  id v11 = v8;
  swift_retain();
  swift_retain();
  sub_100010F28((uint64_t)sub_100009EE0, (uint64_t)v10);

  return swift_release();
}

uint64_t sub_100008C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10001A9B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001A9D0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = *(void *)(a2 + 16);
  id v16 = (void *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  aBlock[4] = sub_10000A5E4;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = &unk_100020F00;
  uint64_t v17 = _Block_copy(aBlock);
  swift_errorRetain();
  swift_retain();
  swift_retain();
  sub_10001A9C0();
  v19[1] = &_swiftEmptyArrayStorage;
  sub_100009FEC((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return swift_release();
}

uint64_t sub_100008F04(uint64_t a1, uint64_t a2, void (*a3)(void *, uint64_t))
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_10001B730;
    swift_errorRetain();
    sub_100007084(&qword_100025A00);
    uint64_t v6 = sub_10001AA70();
    uint64_t v8 = v7;
    *(void *)(v5 + 56) = &type metadata for String;
    *(void *)(v5 + 64) = sub_10000716C();
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = v8;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
  }
  uint64_t v9 = *(void *)(a2 + 176);
  if (!v9)
  {
    swift_errorRetain();
    uint64_t v9 = a1;
  }
  swift_errorRetain();
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10001B7D0;
  id v11 = *(id *)(a2 + 168);
  sub_100007084(&qword_100025390);
  uint64_t v12 = sub_10001AA70();
  uint64_t v14 = v13;
  *(void *)(v10 + 56) = &type metadata for String;
  unint64_t v15 = sub_10000716C();
  *(void *)(v10 + 64) = v15;
  *(void *)(v10 + 32) = v12;
  *(void *)(v10 + 40) = v14;
  swift_errorRetain();
  sub_100007084(&qword_100025208);
  uint64_t v16 = sub_10001AA70();
  *(void *)(v10 + 96) = &type metadata for String;
  *(void *)(v10 + 104) = v15;
  *(void *)(v10 + 72) = v16;
  *(void *)(v10 + 80) = v17;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void **)(a2 + 168);
  id v19 = v18;
  a3(v18, v9);

  return swift_errorRelease();
}

void sub_100009188(uint64_t a1, uint64_t a2, void (*a3)(void, void), uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10 = swift_allocObject();
  sub_100009F24(a1, (uint64_t)&v26);
  if (v27)
  {
    sub_100007268(&v26, v10 + 16);
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = a5;
    *(void *)(v11 + 24) = a6;
    uint64_t v12 = *(void *)(v10 + 40);
    uint64_t v13 = *(void *)(v10 + 48);
    sub_10000A0D8(v10 + 16, v12);
    uint64_t v14 = *(void (**)(void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v13 + 16);
    swift_retain();
    id v15 = a6;
    v14(sub_10000A074, v11, v12, v13);
    sub_100006E20(v10 + 16, (uint64_t)&v26);
    uint64_t v16 = v27;
    uint64_t v17 = v28;
    sub_10000A128(&v26, v27);
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = a5;
    v18[3] = v15;
    v18[4] = v10;
    id v19 = *(void (**)(id, uint64_t (*)(void *, uint64_t), void *, uint64_t, uint64_t))(v17 + 32);
    swift_retain();
    id v20 = v15;
    swift_retain();
    v19(v20, sub_10000A1B4, v18, v16, v17);
    swift_release();
    sub_100006F80((uint64_t)&v26);
    swift_release();
  }
  else
  {
    sub_100009F8C((uint64_t)&v26);
    swift_deallocUninitializedObject();
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_10001B730;
    sub_100009F24(a1, (uint64_t)&v26);
    sub_100007084(&qword_100025380);
    uint64_t v22 = sub_10001AA70();
    uint64_t v24 = v23;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 64) = sub_10000716C();
    *(void *)(v21 + 32) = v22;
    *(void *)(v21 + 40) = v24;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    type metadata accessor for ILMessageFilterPrivateError(0);
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_100009FEC(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
    sub_10001A8D0();
    uint64_t v25 = (void *)v26;
    a3(0, v26);
  }
}

uint64_t sub_1000094BC(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v10 = sub_10001A9B0();
  uint64_t v23 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10001A9D0();
  uint64_t v13 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  id v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(a3 + 16);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a4;
  v16[4] = a2;
  v16[5] = a3;
  v16[6] = a5;
  aBlock[4] = sub_10000A218;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = &unk_100020E60;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = a1;
  id v19 = a4;
  swift_errorRetain();
  swift_retain();
  swift_retain();
  sub_10001A9C0();
  uint64_t v24 = &_swiftEmptyArrayStorage;
  sub_100009FEC((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v22);
  return swift_release();
}

uint64_t sub_10000978C(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    uint64_t v9 = qword_100024E70;
    id v10 = a1;
    if (v9 != -1) {
      swift_once();
    }
    sub_100007084(&qword_100025038);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_10001B730;
    v27[0] = v10;
    sub_100007B8C(0, &qword_100025388);
    id v12 = v10;
    uint64_t v13 = sub_10001AA70();
    uint64_t v15 = v14;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_10000716C();
    *(void *)(v11 + 32) = v13;
    *(void *)(v11 + 40) = v15;
    sub_10001AAC0();
    sub_10001A9A0();

    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_10001B7D0;
    *(void *)(v17 + 56) = sub_100007B8C(0, (unint64_t *)&unk_100025A50);
    *(void *)(v17 + 64) = sub_100009DE4();
    *(void *)(v17 + 32) = a2;
    v27[0] = a3;
    id v18 = a2;
    swift_errorRetain();
    sub_100007084(&qword_100025208);
    uint64_t v19 = sub_10001AA70();
    uint64_t v21 = v20;
    *(void *)(v17 + 96) = &type metadata for String;
    *(void *)(v17 + 104) = sub_10000716C();
    *(void *)(v17 + 72) = v19;
    *(void *)(v17 + 80) = v21;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    id v12 = 0;
  }
  uint64_t v22 = *(void **)(a4 + 168);
  *(void *)(a4 + 168) = a1;
  id v23 = v12;

  *(void *)(a4 + 176) = a3;
  swift_errorRetain();
  swift_errorRelease();
  swift_beginAccess();
  sub_100006E20(a5 + 16, (uint64_t)v27);
  uint64_t v24 = v28;
  uint64_t v25 = v29;
  sub_10000A128(v27, v28);
  (*(void (**)(uint64_t, uint64_t))(v25 + 40))(v24, v25);
  return sub_100006F80((uint64_t)v27);
}

uint64_t sub_100009A70()
{
  return swift_errorRelease();
}

uint64_t sub_100009AA0()
{
  sub_100006F80(v0 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_errorRelease();

  return _swift_deallocClassInstance(v0, 184, 7);
}

void sub_100009B50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (a1)
  {
    v5[4] = a1;
    v5[5] = a2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1000125B0;
    v5[3] = &unk_100020F50;
    uint64_t v4 = _Block_copy(v5);
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  [v3 setDeferQueryRequestToNetwork:v4];
  _Block_release(v4);
}

uint64_t sub_100009BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *v3;
  v8[4] = a2;
  v8[5] = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100009CB8;
  v8[3] = &unk_100020F28;
  uint64_t v6 = _Block_copy(v8);
  swift_retain();
  [v5 handleQueryRequest:a1 completion:v6];
  _Block_release(v6);
  return swift_release();
}

void sub_100009CB8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_100009D44()
{
  return [*v0 finish];
}

uint64_t type metadata accessor for QueryRequestOperation()
{
  uint64_t result = qword_100025248;
  if (!qword_100025248) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100009DA0()
{
  return swift_initClassMetadata2();
}

unint64_t sub_100009DE4()
{
  unint64_t result = qword_100025378;
  if (!qword_100025378)
  {
    sub_100007B8C(255, (unint64_t *)&unk_100025A50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025378);
  }
  return result;
}

uint64_t sub_100009E4C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100009E8C(uint64_t a1)
{
  return sub_100008C48(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100009E98()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100009EE0(uint64_t a1, uint64_t a2)
{
  sub_100009188(a1, a2, *(void (**)(void, void))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40));
}

uint64_t sub_100009EEC()
{
  sub_100006F80(v0 + 16);

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100009F24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007084(&qword_100025380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009F8C(uint64_t a1)
{
  uint64_t v2 = sub_100007084(&qword_100025380);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009FEC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000A034()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000A074(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  id v6 = *(id *)(v2 + 24);
  sub_10000A240(v6, a1, a2, v5);
}

uint64_t sub_10000A0D8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

void *sub_10000A128(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000A16C()
{
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000A1B4(void *a1, uint64_t a2)
{
  return sub_1000094BC(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_10000A1C0()
{
  swift_errorRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000A218()
{
  return sub_10000978C(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_10000A228(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A238()
{
  return swift_release();
}

uint64_t sub_10000A240(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10001A9B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10001A9D0();
  uint64_t v12 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[3] = sub_100007B8C(0, (unint64_t *)&unk_100025A50);
  v24[4] = &off_100021CC0;
  v24[0] = a1;
  uint64_t v19 = *(void *)(a4 + 16);
  sub_100006E20((uint64_t)v24, (uint64_t)v23);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a4;
  v15[3] = a2;
  v15[4] = a3;
  sub_100007268(v23, (uint64_t)(v15 + 5));
  aBlock[4] = sub_10000A58C;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = &unk_100020EB0;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = a1;
  swift_retain();
  swift_retain();
  sub_10001A9C0();
  uint64_t v21 = &_swiftEmptyArrayStorage;
  sub_100009FEC((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v20);
  swift_release();
  return sub_100006F80((uint64_t)v24);
}

uint64_t sub_10000A544()
{
  swift_release();
  swift_release();
  sub_100006F80(v0 + 40);

  return _swift_deallocObject(v0, 80, 7);
}

void sub_10000A58C()
{
  sub_100011640(*(void *)(v0 + 16), *(void (**)(void, void))(v0 + 24), *(void *)(v0 + 32), v0 + 40);
}

uint64_t sub_10000A59C()
{
  swift_errorRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000A5E4()
{
  return sub_100008F04(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(void *, uint64_t))(v0 + 32));
}

uint64_t sub_10000A610(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10001A9E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (uint64_t *)((char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *(void **)(v3 + 56);
  *uint64_t v9 = v10;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, enum case for DispatchPredicate.onQueue(_:), v6);
  id v11 = v10;
  LOBYTE(v10) = sub_10001A9F0();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  if (v10)
  {
    swift_beginAccess();
    sub_10000D0C8(v3 + 16, (uint64_t)&v27);
    if (v28)
    {
      sub_100007268(&v27, (uint64_t)v30);
      uint64_t v13 = swift_allocObject();
      swift_weakInit();
      uint64_t v14 = v31;
      uint64_t v15 = v32;
      sub_10000A0D8((uint64_t)v30, v31);
      (*(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v15 + 16))(sub_10000D168, v13, v14, v15);
      uint64_t v16 = swift_allocObject();
      swift_weakInit();
      uint64_t v17 = v31;
      uint64_t v18 = v32;
      sub_10000A0D8((uint64_t)v30, v31);
      (*(void (**)(uint64_t (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v18 + 40))(sub_10000D170, v16, v17, v18);
      uint64_t v19 = swift_allocObject();
      swift_weakInit();
      uint64_t v20 = v31;
      uint64_t v21 = v32;
      sub_10000A0D8((uint64_t)v30, v31);
      (*(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v21 + 64))(sub_10000D178, v19, v20, v21);
      sub_100006E20((uint64_t)v30, (uint64_t)&v27);
      uint64_t v22 = v28;
      uint64_t v23 = v29;
      sub_10000A128(&v27, v28);
      uint64_t v24 = (void *)swift_allocObject();
      v24[2] = v3;
      v24[3] = a1;
      v24[4] = a2;
      uint64_t v25 = *(void (**)(void *, uint64_t (*)(uint64_t, uint64_t), void *, uint64_t, uint64_t))(v23 + 80);
      swift_retain();
      swift_retain();
      v25(&_swiftEmptyArrayStorage, sub_10000D1C0, v24, v22, v23);
      swift_release();
      sub_100006F80((uint64_t)&v27);
      return sub_100006F80((uint64_t)v30);
    }
    else
    {
      return sub_10000D2AC((uint64_t)&v27, &qword_100025448);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000A96C(uint64_t a1)
{
  uint64_t v2 = sub_10001A9B0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001A9D0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v11 = result;
    v14[1] = *(void *)(result + 56);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a1;
    *(void *)(v12 + 24) = v11;
    aBlock[4] = sub_10000D60C;
    aBlock[5] = v12;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000D05C;
    aBlock[3] = &unk_100021200;
    uint64_t v13 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    sub_10001A9C0();
    v14[2] = &_swiftEmptyArrayStorage;
    sub_100009FEC((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100007084(&qword_100025030);
    sub_1000070C8();
    sub_10001AB40();
    sub_10001AAF0();
    _Block_release(v13);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_10000AC44(uint64_t a1, uint64_t a2)
{
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001B730;
  *(void *)&long long v12 = a1;
  swift_unknownObjectRetain();
  sub_100007084(&qword_100025460);
  uint64_t v5 = sub_10001AA70();
  uint64_t v7 = v6;
  *(void *)(v4 + 56) = &type metadata for String;
  *(void *)(v4 + 64) = sub_10000716C();
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v7;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_10000D0C8(a2 + 16, (uint64_t)&v12);
  uint64_t v8 = *((void *)&v13 + 1);
  uint64_t result = sub_10000D2AC((uint64_t)&v12, &qword_100025448);
  if (v8)
  {
    uint64_t v14 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    swift_beginAccess();
    sub_10000D244((uint64_t)&v12, a2 + 16);
    swift_endAccess();
    uint64_t v10 = *(void (**)(void))(a2 + 64);
    if (v10)
    {
      swift_retain();
      v10(0);
      sub_100008A5C((uint64_t)v10);
      uint64_t v11 = *(void *)(a2 + 64);
    }
    else
    {
      uint64_t v11 = 0;
    }
    *(void *)(a2 + 64) = 0;
    *(void *)(a2 + 72) = 0;
    return sub_100008A5C(v11);
  }
  return result;
}

uint64_t sub_10000AE10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001A9B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10001A9D0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v13 = result;
    v16[1] = *(void *)(result + 56);
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = a1;
    void v14[3] = a2;
    v14[4] = v13;
    aBlock[4] = sub_10000D5BC;
    aBlock[5] = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000D05C;
    aBlock[3] = &unk_1000211B0;
    uint64_t v15 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_errorRetain();
    swift_retain();
    sub_10001A9C0();
    v16[2] = &_swiftEmptyArrayStorage;
    sub_100009FEC((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100007084(&qword_100025030);
    sub_1000070C8();
    sub_10001AB40();
    sub_10001AAF0();
    _Block_release(v15);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_10000B0F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001B7D0;
  swift_unknownObjectRetain();
  sub_100007084(&qword_100025460);
  uint64_t v6 = sub_10001AA70();
  uint64_t v8 = v7;
  *(void *)(v5 + 56) = &type metadata for String;
  unint64_t v9 = sub_10000716C();
  *(void *)(v5 + 64) = v9;
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v8;
  *(void *)&long long v16 = a2;
  swift_errorRetain();
  sub_100007084(&qword_100025208);
  uint64_t v10 = sub_10001AA70();
  *(void *)(v5 + 96) = &type metadata for String;
  *(void *)(v5 + 104) = v9;
  *(void *)(v5 + 72) = v10;
  *(void *)(v5 + 80) = v11;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_10000D0C8(a3 + 16, (uint64_t)&v16);
  uint64_t v12 = *((void *)&v17 + 1);
  uint64_t result = sub_10000D2AC((uint64_t)&v16, &qword_100025448);
  if (v12)
  {
    uint64_t v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    swift_beginAccess();
    sub_10000D244((uint64_t)&v16, a3 + 16);
    swift_endAccess();
    uint64_t v14 = *(void (**)(uint64_t))(a3 + 64);
    if (v14)
    {
      swift_retain();
      v14(a2);
      sub_100008A5C((uint64_t)v14);
      uint64_t v15 = *(void *)(a3 + 64);
    }
    else
    {
      uint64_t v15 = 0;
    }
    *(void *)(a3 + 64) = 0;
    *(void *)(a3 + 72) = 0;
    return sub_100008A5C(v15);
  }
  return result;
}

uint64_t sub_10000B304(uint64_t a1)
{
  uint64_t v2 = sub_10001A9B0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001A9D0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v11 = result;
    v14[1] = *(void *)(result + 56);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a1;
    *(void *)(v12 + 24) = v11;
    aBlock[4] = sub_10000D56C;
    aBlock[5] = v12;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000D05C;
    aBlock[3] = &unk_100021160;
    uint64_t v13 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    sub_10001A9C0();
    v14[2] = &_swiftEmptyArrayStorage;
    sub_100009FEC((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100007084(&qword_100025030);
    sub_1000070C8();
    sub_10001AB40();
    sub_10001AAF0();
    _Block_release(v13);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_10000B5DC(uint64_t a1, uint64_t a2)
{
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_10001AAB0();
  sub_100007084(&qword_100025038);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001B730;
  *(void *)&long long v13 = a1;
  swift_unknownObjectRetain();
  sub_100007084(&qword_100025460);
  uint64_t v5 = sub_10001AA70();
  uint64_t v7 = v6;
  *(void *)(v4 + 56) = &type metadata for String;
  *(void *)(v4 + 64) = sub_10000716C();
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v7;
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_10000D0C8(a2 + 16, (uint64_t)&v13);
  uint64_t v8 = *((void *)&v14 + 1);
  uint64_t result = sub_10000D2AC((uint64_t)&v13, &qword_100025448);
  if (v8)
  {
    uint64_t v15 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    swift_beginAccess();
    sub_10000D244((uint64_t)&v13, a2 + 16);
    swift_endAccess();
    uint64_t v10 = *(void (**)(void))(a2 + 64);
    if (v10)
    {
      type metadata accessor for ILMessageFilterPrivateError(0);
      swift_retain();
      sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
      sub_100009FEC(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
      sub_10001A8D0();
      uint64_t v11 = (void *)v13;
      v10(v13);
      sub_100008A5C((uint64_t)v10);

      uint64_t v12 = *(void *)(a2 + 64);
    }
    else
    {
      uint64_t v12 = 0;
    }
    *(void *)(a2 + 64) = 0;
    *(void *)(a2 + 72) = 0;
    return sub_100008A5C(v12);
  }
  return result;
}

uint64_t sub_10000B828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_10001A9B0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  long long v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10001A9D0();
  uint64_t v14 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  long long v16 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[1] = *(void *)(a3 + 56);
  long long v17 = (void *)swift_allocObject();
  v17[2] = a4;
  v17[3] = a5;
  v17[4] = a2;
  v17[5] = a1;
  v17[6] = a3;
  aBlock[4] = sub_10000D21C;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = &unk_100021098;
  uint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  swift_errorRetain();
  swift_unknownObjectRetain();
  swift_retain();
  sub_10001A9C0();
  uint64_t v22 = &_swiftEmptyArrayStorage;
  sub_100009FEC((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v21);
  return swift_release();
}

uint64_t sub_10000BAF4(void (*a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a4)
  {
    uint64_t v8 = swift_unknownObjectRetain();
    uint64_t v9 = sub_10000BCAC(v8);
    uint64_t v11 = v10;
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_10001B730;
    swift_errorRetain();
    sub_100007084(&qword_100025208);
    uint64_t v13 = sub_10001AA70();
    uint64_t v15 = v14;
    *(void *)(v12 + 56) = &type metadata for String;
    *(void *)(v12 + 64) = sub_10000716C();
    *(void *)(v12 + 32) = v13;
    *(void *)(v12 + 40) = v15;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    uint64_t v18 = 0;
    memset(v17, 0, sizeof(v17));
    swift_beginAccess();
    sub_10000D244((uint64_t)v17, a5 + 16);
    swift_endAccess();
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  a1(v9, v11, a3);
  return swift_unknownObjectRelease();
}

uint64_t sub_10000BCAC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100007084(&qword_100025450);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10001A990();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v37 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v38 = (char *)&v34 - v11;
  uint64_t v12 = sub_10001A9E0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (uint64_t *)((char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  long long v16 = *(void **)(v2 + 56);
  *uint64_t v15 = v16;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v15, enum case for DispatchPredicate.onQueue(_:), v12);
  id v17 = v16;
  LOBYTE(v16) = sub_10001A9F0();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v13 + 8))(v15, v12);
  if (v16)
  {
    swift_beginAccess();
    sub_10000D0C8(v2 + 16, (uint64_t)&v39);
    if (v40)
    {
      sub_100007268(&v39, (uint64_t)v41);
      *(void *)&long long v39 = a1;
      swift_unknownObjectRetain();
      sub_100007084(&qword_100025458);
      int v19 = swift_dynamicCast();
      uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
      if (v19)
      {
        v20(v6, 0, 1, v7);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
        {
          uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
          uint64_t v22 = v38;
          v21(v38, v6, v7);
          uint64_t v23 = v42;
          uint64_t v24 = v43;
          sub_10000A128(v41, v42);
          uint64_t v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 88))(v22, v23, v24);
          if (v26)
          {
            uint64_t v27 = v25;
            uint64_t ObjectType = swift_getObjectType();
            uint64_t v28 = swift_allocObject();
            uint64_t v35 = (void (*)(unint64_t, char *, uint64_t))v21;
            uint64_t v29 = v28;
            swift_weakInit();
            Class v30 = v37;
            (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v37, v22, v7);
            unint64_t v31 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
            uint64_t v32 = swift_allocObject();
            *(void *)(v32 + 16) = v29;
            v35(v32 + v31, v30, v7);
            uint64_t v33 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v27 + 16);
            swift_retain();
            v33(sub_10000D3D4, v32, ObjectType, v27);
            (*(void (**)(char *, uint64_t))(v8 + 8))(v38, v7);
            swift_release();
          }
          else
          {
            (*(void (**)(char *, uint64_t))(v8 + 8))(v22, v7);
          }
          sub_100006F80((uint64_t)v41);
          return v26;
        }
      }
      else
      {
        v20(v6, 1, 1, v7);
      }
      sub_10000D2AC((uint64_t)v6, &qword_100025450);
      sub_100006F80((uint64_t)v41);
    }
    else
    {
      sub_10000D2AC((uint64_t)&v39, &qword_100025448);
    }
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C154(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10001A9B0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v22 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001A9D0();
  uint64_t v21 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10001A990();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v19 = *(void *)(result + 56);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v9);
    uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
    uint64_t v20 = v6;
    uint64_t v15 = (v14 + 16) & ~v14;
    uint64_t v16 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v16 + v15, (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
    *(void *)(v16 + ((v11 + v15 + 7) & 0xFFFFFFFFFFFFFFF8)) = v13;
    aBlock[4] = sub_10000D4DC;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000D05C;
    aBlock[3] = &unk_100021110;
    id v17 = _Block_copy(aBlock);
    swift_retain();
    sub_10001A9C0();
    uint64_t v23 = &_swiftEmptyArrayStorage;
    sub_100009FEC((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100007084(&qword_100025030);
    sub_1000070C8();
    uint64_t v18 = v22;
    sub_10001AB40();
    sub_10001AAF0();
    _Block_release(v17);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v18, v3);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v20);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_10000C500(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001A990();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_10001AAB0();
  sub_100007084(&qword_100025038);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10001B730;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v9 = sub_10001AA70();
  uint64_t v11 = v10;
  *(void *)(v8 + 56) = &type metadata for String;
  *(void *)(v8 + 64) = sub_10000716C();
  *(void *)(v8 + 32) = v9;
  *(void *)(v8 + 40) = v11;
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_10000D0C8(a2 + 16, (uint64_t)&v18);
  uint64_t v12 = *((void *)&v19 + 1);
  uint64_t result = sub_10000D2AC((uint64_t)&v18, &qword_100025448);
  if (v12)
  {
    uint64_t v20 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    swift_beginAccess();
    sub_10000D244((uint64_t)&v18, a2 + 16);
    swift_endAccess();
    uint64_t v14 = *(void (**)(void))(a2 + 64);
    if (v14)
    {
      type metadata accessor for ILMessageFilterPrivateError(0);
      v17[1] = 3;
      swift_retain();
      sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
      sub_100009FEC(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
      sub_10001A8D0();
      uint64_t v15 = (void *)v18;
      v14(v18);
      sub_100008A5C((uint64_t)v14);

      uint64_t v16 = *(void *)(a2 + 64);
    }
    else
    {
      uint64_t v16 = 0;
    }
    *(void *)(a2 + 64) = 0;
    *(void *)(a2 + 72) = 0;
    return sub_100008A5C(v16);
  }
  return result;
}

uint64_t sub_10000C7D0()
{
  sub_10000D2AC(v0 + 16, &qword_100025448);

  sub_100008A5C(*(void *)(v0 + 64));

  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t sub_10000C820(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 64);
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = a2;
  return sub_100008A5C(v4);
}

void sub_10000C838(unint64_t a1, void *a2, uint64_t a3)
{
  sub_10000C928(a1);
  v6.super.Class isa = sub_10001AA90().super.isa;
  swift_bridgeObjectRelease();
  if (a2)
  {
    v7[4] = a2;
    v7[5] = a3;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 1107296256;
    v7[2] = sub_10000CB5C;
    v7[3] = &unk_100021250;
    a2 = _Block_copy(v7);
    swift_retain();
    swift_release();
  }
  [v3 beginExtensionRequestWithInputItems:v6.super.isa completion:a2];
  _Block_release(a2);
}

char *sub_10000C928(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_10001ABA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (char *)v3;
  }
  uint64_t v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_10000D614(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_10001AB90();
        sub_10000D634();
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10000D614(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_10000D614((char *)(v6 > 1), v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_1000076CC(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_10000D634();
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10000D614(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_10000D614((char *)(v10 > 1), v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_1000076CC(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000CB5C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_10000CBDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (a1)
  {
    v5[4] = a1;
    v5[5] = a2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_10000CC88;
    v5[3] = &unk_1000212C8;
    uint64_t v4 = _Block_copy(v5);
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  [v3 setRequestCompletionBlock:v4];
  _Block_release(v4);
}

uint64_t sub_10000CC88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  if (a3) {
    uint64_t v4 = sub_10001AAA0();
  }
  else {
    uint64_t v4 = 0;
  }
  swift_retain();
  uint64_t v5 = swift_unknownObjectRetain();
  v3(v5, v4);
  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_10000CD18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (a1)
  {
    v5[4] = a1;
    v5[5] = a2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_10000CB5C;
    v5[3] = &unk_1000212A0;
    uint64_t v4 = _Block_copy(v5);
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  [v3 setRequestCancellationBlock:v4];
  _Block_release(v4);
}

void sub_10000CDC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (a1)
  {
    v5[4] = a1;
    v5[5] = a2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_10000CE70;
    v5[3] = &unk_100021278;
    uint64_t v4 = _Block_copy(v5);
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  [v3 setRequestInterruptionBlock:v4];
  _Block_release(v4);
}

uint64_t sub_10000CE70(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_10000CED0(unint64_t a1, void *a2, uint64_t a3)
{
}

id sub_10000CEF4()
{
  uint64_t v1 = *v0;
  Class isa = sub_10001A980().super.isa;
  id v3 = [v1 _extensionContextForUUID:isa];

  return v3;
}

void sub_10000CF58(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  id v6 = [v3 _auxiliaryConnection];
  if (v6)
  {
    unint64_t v7 = v6;
    if (a1)
    {
      v9[4] = a1;
      v9[5] = a2;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 1107296256;
      v9[2] = sub_10000D05C;
      v9[3] = &unk_100021228;
      uint64_t v8 = _Block_copy(v9);
      swift_retain();
      swift_release();
    }
    else
    {
      uint64_t v8 = 0;
    }
    [v7 setInvalidationHandler:v8];
    sub_100008A5C(a1);
    _Block_release(v8);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000D05C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t type metadata accessor for ExtensionRequest()
{
  return self;
}

uint64_t sub_10000D0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007084(&qword_100025448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D130()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D168(uint64_t a1)
{
  return sub_10000A96C(a1);
}

uint64_t sub_10000D170(uint64_t a1, uint64_t a2)
{
  return sub_10000AE10(a1, a2);
}

uint64_t sub_10000D178(uint64_t a1)
{
  return sub_10000B304(a1);
}

uint64_t sub_10000D180()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000D1C0(uint64_t a1, uint64_t a2)
{
  return sub_10000B828(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_10000D1CC()
{
  swift_release();
  swift_errorRelease();
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000D21C()
{
  return sub_10000BAF4(*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_10000D22C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000D23C()
{
  return swift_release();
}

uint64_t sub_10000D244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007084(&qword_100025448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D2AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007084(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D308()
{
  uint64_t v1 = sub_10001A990();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000D3D4()
{
  uint64_t v1 = *(void *)(sub_10001A990() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_10000C154(v2, v3);
}

uint64_t sub_10000D438()
{
  uint64_t v1 = sub_10001A990();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10000D4DC()
{
  uint64_t v1 = *(void *)(sub_10001A990() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_10000C500(v0 + v2, v3);
}

uint64_t sub_10000D56C()
{
  return sub_10000B5DC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10000D574()
{
  swift_unknownObjectRelease();
  swift_errorRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000D5BC()
{
  return sub_10000B0F8(v0[2], v0[3], v0[4]);
}

uint64_t sub_10000D5CC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D60C()
{
  return sub_10000AC44(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

char *sub_10000D614(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D674(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

unint64_t sub_10000D634()
{
  unint64_t result = qword_100025468;
  if (!qword_100025468)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100025468);
  }
  return result;
}

char *sub_10000D674(char *result, int64_t a2, char a3, char *a4)
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
    sub_100007084(&qword_100025470);
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
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  swift_release();
  return v10;
}

uint64_t sub_10000D7C8(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10001B730;
  *(void *)(v7 + 56) = sub_10000E9AC();
  *(void *)(v7 + 64) = sub_10000ECF8(&qword_1000255C8, (void (*)(uint64_t))sub_10000E9AC);
  *(void *)(v7 + 32) = a1;
  id v8 = a1;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v3;
  v9[3] = a2;
  v9[4] = a3;
  swift_retain();
  swift_retain();
  sub_100010BA0((uint64_t)sub_10000EA2C, (uint64_t)v9);
  unint64_t v10 = (void *)swift_allocObject();
  v10[2] = a2;
  v10[3] = a3;
  v10[4] = v3;
  v10[5] = v8;
  id v11 = v8;
  swift_retain();
  swift_retain();
  sub_100010F50((uint64_t)sub_10000EA80, (uint64_t)v10);

  return swift_release();
}

uint64_t sub_10000D994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10001A9B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001A9D0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = *(void *)(a2 + 16);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  void v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  aBlock[4] = sub_10000F0D4;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = &unk_1000214B0;
  id v17 = _Block_copy(aBlock);
  swift_errorRetain();
  swift_retain();
  swift_retain();
  sub_10001A9C0();
  v19[1] = &_swiftEmptyArrayStorage;
  sub_10000ECF8((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return swift_release();
}

uint64_t sub_10000DC50(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v3 = a3;
  if (a1)
  {
    swift_errorRetain();
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_10001B730;
    swift_errorRetain();
    sub_100007084(&qword_100025A00);
    uint64_t v7 = sub_10001AA70();
    uint64_t v9 = v8;
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 64) = sub_10000716C();
    *(void *)(v6 + 32) = v7;
    *(void *)(v6 + 40) = v9;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    uint64_t v3 = a3;
  }
  uint64_t v10 = *(void *)(a2 + 168);
  if (!v10)
  {
    swift_errorRetain();
    uint64_t v10 = a1;
  }
  swift_errorRetain();
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10001B730;
  swift_errorRetain();
  sub_100007084(&qword_100025208);
  uint64_t v12 = sub_10001AA70();
  uint64_t v14 = v13;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 64) = sub_10000716C();
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = v14;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  v3(v10);
  return swift_errorRelease();
}

void sub_10000DEAC(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10 = swift_allocObject();
  sub_10000EAC4(a1, (uint64_t)&v26);
  if (v27)
  {
    sub_100007268(&v26, v10 + 16);
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = a5;
    *(void *)(v11 + 24) = a6;
    uint64_t v12 = *(void *)(v10 + 40);
    uint64_t v13 = *(void *)(v10 + 48);
    sub_10000A0D8(v10 + 16, v12);
    uint64_t v14 = *(void (**)(void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v13 + 16);
    swift_retain();
    id v15 = a6;
    v14(sub_10000EBCC, v11, v12, v13);
    sub_100006E20(v10 + 16, (uint64_t)&v26);
    uint64_t v16 = v27;
    uint64_t v17 = v28;
    sub_10000A128(&v26, v27);
    long long v18 = (void *)swift_allocObject();
    v18[2] = a5;
    v18[3] = v15;
    v18[4] = v10;
    long long v19 = *(void (**)(id, uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(v17 + 32);
    swift_retain();
    id v20 = v15;
    swift_retain();
    v19(v20, sub_10000EC78, v18, v16, v17);
    swift_release();
    sub_100006F80((uint64_t)&v26);
    swift_release();
  }
  else
  {
    sub_10000EB2C((uint64_t)&v26);
    swift_deallocUninitializedObject();
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_10001B730;
    sub_10000EAC4(a1, (uint64_t)&v26);
    sub_100007084(&qword_1000255D0);
    uint64_t v22 = sub_10001AA70();
    uint64_t v24 = v23;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 64) = sub_10000716C();
    *(void *)(v21 + 32) = v22;
    *(void *)(v21 + 40) = v24;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    type metadata accessor for ILMessageFilterPrivateError(0);
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_10000ECF8(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
    sub_10001A8D0();
    uint64_t v25 = (void *)v26;
    a3(v26);
  }
}

uint64_t sub_10000E1DC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8 = sub_10001A9B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10001A9D0();
  uint64_t v12 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(void *)(a2 + 16);
  id v15 = (void *)swift_allocObject();
  v15[2] = a1;
  v15[3] = a3;
  v15[4] = a2;
  v15[5] = a4;
  aBlock[4] = sub_10000ECD4;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = &unk_100021410;
  uint64_t v16 = _Block_copy(aBlock);
  swift_errorRetain();
  id v17 = a3;
  swift_retain();
  swift_retain();
  sub_10001A9C0();
  uint64_t v21 = &_swiftEmptyArrayStorage;
  sub_10000ECF8((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v20);
  return swift_release();
}

uint64_t sub_10000E49C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_10001B7D0;
    *(void *)(v8 + 56) = sub_10000E9AC();
    *(void *)(v8 + 64) = sub_10000ECF8(&qword_1000255C8, (void (*)(uint64_t))sub_10000E9AC);
    *(void *)(v8 + 32) = a2;
    v16[0] = a1;
    swift_errorRetain();
    id v9 = a2;
    sub_100007084(&qword_100025A00);
    uint64_t v10 = sub_10001AA70();
    uint64_t v12 = v11;
    *(void *)(v8 + 96) = &type metadata for String;
    *(void *)(v8 + 104) = sub_10000716C();
    *(void *)(v8 + 72) = v10;
    *(void *)(v8 + 80) = v12;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
  }
  *(void *)(a3 + 168) = a1;
  swift_errorRetain();
  swift_errorRelease();
  swift_beginAccess();
  sub_100006E20(a4 + 16, (uint64_t)v16);
  uint64_t v13 = v17;
  uint64_t v14 = v18;
  sub_10000A128(v16, v17);
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(v13, v14);
  return sub_100006F80((uint64_t)v16);
}

uint64_t sub_10000E698()
{
  return swift_errorRelease();
}

uint64_t sub_10000E6A0()
{
  sub_100006F80(v0 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_errorRelease();

  return _swift_deallocClassInstance(v0, 176, 7);
}

void sub_10000E748(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (a1)
  {
    v5[4] = a1;
    v5[5] = a2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1000125B0;
    v5[3] = &unk_100021500;
    uint64_t v4 = _Block_copy(v5);
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  [v3 setDeferReportRequestToNetwork:v4];
  _Block_release(v4);
}

uint64_t sub_10000E7F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = *v3;
  v8[4] = a2;
  v8[5] = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_10000E8B0;
  v8[3] = &unk_1000214D8;
  uint64_t v6 = _Block_copy(v8);
  swift_retain();
  [v5 handleReportRequest:a1 completion:v6];
  _Block_release(v6);
  return swift_release();
}

void sub_10000E8B0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t type metadata accessor for ReportRequestOperation()
{
  uint64_t result = qword_1000254A0;
  if (!qword_1000254A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000E968()
{
  return swift_initClassMetadata2();
}

unint64_t sub_10000E9AC()
{
  unint64_t result = qword_100025A40;
  if (!qword_100025A40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100025A40);
  }
  return result;
}

uint64_t sub_10000E9EC()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000EA2C(uint64_t a1)
{
  return sub_10000D994(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10000EA38()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10000EA80(uint64_t a1, uint64_t a2)
{
  sub_10000DEAC(a1, a2, *(void (**)(void))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40));
}

uint64_t sub_10000EA8C()
{
  sub_100006F80(v0 + 16);

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000EAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007084(&qword_1000255D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000EB2C(uint64_t a1)
{
  uint64_t v2 = sub_100007084(&qword_1000255D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000EB8C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000EBCC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  id v6 = *(id *)(v2 + 24);
  sub_10000ED40(v6, a1, a2, v5);
}

uint64_t sub_10000EC30()
{
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000EC78(uint64_t a1)
{
  return sub_10000E1DC(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_10000EC84()
{
  swift_errorRelease();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000ECD4()
{
  return sub_10000E49C(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_10000ECE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000ECF0()
{
  return swift_release();
}

uint64_t sub_10000ECF8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000ED40(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10001A9B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10001A9D0();
  uint64_t v12 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[3] = sub_10000E9AC();
  v24[4] = &off_100021D00;
  v24[0] = a1;
  uint64_t v19 = *(void *)(a4 + 16);
  sub_100006E20((uint64_t)v24, (uint64_t)v23);
  id v15 = (void *)swift_allocObject();
  v15[2] = a4;
  v15[3] = a2;
  v15[4] = a3;
  sub_100007268(v23, (uint64_t)(v15 + 5));
  aBlock[4] = sub_10000F07C;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = &unk_100021460;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = a1;
  swift_retain();
  swift_retain();
  sub_10001A9C0();
  uint64_t v21 = &_swiftEmptyArrayStorage;
  sub_10000ECF8((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v20);
  swift_release();
  return sub_100006F80((uint64_t)v24);
}

uint64_t sub_10000F034()
{
  swift_release();
  swift_release();
  sub_100006F80(v0 + 40);

  return _swift_deallocObject(v0, 80, 7);
}

void sub_10000F07C()
{
  sub_100011660(*(void *)(v0 + 16), *(void (**)(void, void))(v0 + 24), *(void *)(v0 + 32), v0 + 40);
}

uint64_t sub_10000F08C()
{
  swift_errorRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000F0D4()
{
  return sub_10000DC50(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(uint64_t))(v0 + 32));
}

uint64_t sub_10000F100()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_10000F110(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a2 + 8) + 8))();
  uint64_t v3 = sub_10000F15C(v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_10000F15C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100007084(&qword_100025690);
    uint64_t v2 = (void *)sub_10001ABD0();
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
  id v6 = (char *)(v2 + 8);
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
    id v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_100010B14(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1000076CC(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1000076CC(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1000076CC(v36, v37);
    sub_1000076CC(v37, &v33);
    uint64_t result = sub_10001AB60(v2[5]);
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
    uint64_t result = (uint64_t)sub_1000076CC(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_100010B70();
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

unint64_t sub_10000F524()
{
  return 0xD000000000000011;
}

uint64_t sub_10000F544()
{
  return 0x7972657571;
}

uint64_t sub_10000F558()
{
  return 0x74726F706572;
}

uint64_t sub_10000F56C()
{
  return 0x6966697373616C63;
}

unint64_t sub_10000F590()
{
  id v1 = [*v0 jsonDictionary];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_10001AA10();

    return v3;
  }
  else
  {
    return sub_100006BD0((uint64_t)&_swiftEmptyArrayStorage);
  }
}

uint64_t type metadata accessor for JSONRequestBuilder()
{
  return self;
}

double sub_10000F640@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100007280(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10001028C();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1000076CC((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_10000FD6C(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_10000F744(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007084((uint64_t *)&unk_100025A10);
  uint64_t v6 = sub_10001ABC0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    long long v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *long long v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_1000076CC(v24, v35);
      }
      else
      {
        sub_100010B14((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_10001AC40();
      sub_10001AA80();
      uint64_t result = sub_10001AC50();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      int64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *int64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_1000076CC(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_10000FA44(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007084(&qword_100025688);
  char v42 = a2;
  uint64_t v6 = sub_10001ABC0();
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
    unint64_t v24 = (void *)(v5 + 64);
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
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
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
    sub_10001AC40();
    sub_10001AA80();
    uint64_t result = sub_10001AC50();
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
    int64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *int64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_10000FD6C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10001AB50();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10001AC40();
        swift_bridgeObjectRetain();
        sub_10001AA80();
        Swift::Int v10 = sub_10001AC50();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            _OWORD *v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            _OWORD *v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_10000FF44(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  Swift::Int v10 = (void *)*v4;
  unint64_t v12 = sub_100007280(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10001028C();
      goto LABEL_7;
    }
    sub_10000F744(v15, a4 & 1);
    unint64_t v21 = sub_100007280(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_10001AC00();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_100006F80((uint64_t)v19);
    return sub_1000076CC(a1, v19);
  }
LABEL_13:
  sub_100010220(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_100010098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_100007280(a3, a4);
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
    sub_100010474();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      void *v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000FA44(v17, a5 & 1);
  unint64_t v23 = sub_100007280(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_10001AC00();
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
  unint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
  v25[1] = a4;
  int64_t v26 = (void *)(v20[7] + 16 * v14);
  *int64_t v26 = a1;
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
  void v20[2] = v29;

  return swift_bridgeObjectRetain();
}

_OWORD *sub_100010220(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1000076CC(a4, (_OWORD *)(a5[7] + 32 * a1));
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

void *sub_10001028C()
{
  id v1 = v0;
  sub_100007084((uint64_t *)&unk_100025A10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001ABB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *id v1 = v4;
    return result;
  }
  unint64_t v25 = v1;
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
      goto LABEL_30;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_100010B14(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_1000076CC(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    id v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_100010474()
{
  id v1 = v0;
  sub_100007084(&qword_100025688);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001ABB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
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
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    int64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *int64_t v24 = v21;
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

void *sub_100010630(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = &_swiftEmptyDictionarySingleton;
  if (!a2)
  {
    id v4 = [objc_allocWithZone((Class)NSNull) init];
    unint64_t v9 = sub_100010A74();
    *(void *)&long long v8 = v4;
    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    swift_bridgeObjectRetain();
    sub_100010AB4((uint64_t)&v8);
    sub_10000F640(0x6E6F6973726576, 0xE700000000000000, &v6);
    sub_100010AB4((uint64_t)&v6);
    return v10;
  }
  unint64_t v7 = &type metadata for String;
  *(void *)&long long v6 = a1;
  *((void *)&v6 + 1) = a2;
  sub_1000076CC(&v6, &v8);
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  sub_1000076CC(&v8, &v6);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_10000FF44(&v6, 0x6E6F6973726576, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
  uint64_t v3 = &_swiftEmptyDictionarySingleton;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_100010758(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100007084(&qword_100025060);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001BBD0;
  *(void *)(inited + 32) = 0x6E6F69737265765FLL;
  *(void *)(inited + 40) = 0xE800000000000000;
  *(void *)(inited + 48) = 1;
  *(void *)(inited + 72) = &type metadata for Int;
  *(void *)(inited + 80) = 7368801;
  *(void *)(inited + 88) = 0xE300000000000000;
  unint64_t v7 = sub_100010630(a2, a3);
  *(void *)(inited + 120) = sub_100007084(&qword_100025670);
  *(void *)(inited + 96) = v7;
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_10000A128(a1, v8);
  *(void *)(inited + 128) = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 16))(v8, v9);
  *(void *)(inited + 136) = v10;
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_10000A128(a1, v11);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 24))(v11, v12);
  *(void *)(inited + 168) = sub_100007084(&qword_100025678);
  *(void *)(inited + 144) = v13;
  sub_100006BD0(inited);
  unint64_t v14 = self;
  Class isa = sub_10001AA00().super.isa;
  swift_bridgeObjectRelease();
  id v26 = 0;
  id v16 = [v14 dataWithJSONObject:isa options:0 error:&v26];

  id v17 = v26;
  if (v16)
  {
    uint64_t v18 = sub_10001A970();
  }
  else
  {
    uint64_t v19 = v17;
    uint64_t v20 = (void *)sub_10001A8F0();

    swift_willThrow();
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_10001B730;
    id v26 = v20;
    swift_errorRetain();
    sub_100007084(&qword_100025A00);
    uint64_t v22 = sub_10001AA50();
    uint64_t v24 = v23;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 64) = sub_10000716C();
    *(void *)(v21 + 32) = v22;
    *(void *)(v21 + 40) = v24;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    return 0;
  }
  return v18;
}

unint64_t sub_100010A74()
{
  unint64_t result = qword_100025680;
  if (!qword_100025680)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100025680);
  }
  return result;
}

uint64_t sub_100010AB4(uint64_t a1)
{
  uint64_t v2 = sub_100007084(&qword_100025A30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100010B14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100010B70()
{
  return swift_release();
}

uint64_t sub_100010B78(uint64_t a1, uint64_t a2)
{
  return sub_100010BC8(a1, a2, (uint64_t)&unk_100021BC8, (uint64_t)sub_100014B70, (uint64_t)&unk_100021BE0);
}

uint64_t sub_100010BA0(uint64_t a1, uint64_t a2)
{
  return sub_100010BC8(a1, a2, (uint64_t)&unk_100021A60, (uint64_t)sub_100014B70, (uint64_t)&unk_100021A78);
}

uint64_t sub_100010BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v19[0] = a5;
  uint64_t v9 = sub_10001A9B0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10001A9D0();
  uint64_t v13 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  unint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(void *)(v5 + 16);
  id v16 = (void *)swift_allocObject();
  v16[2] = v5;
  void v16[3] = a1;
  v16[4] = a2;
  aBlock[4] = a4;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = v19[0];
  id v17 = _Block_copy(aBlock);
  swift_retain();
  sub_1000144C8(a1);
  sub_10001A9C0();
  uint64_t v21 = &_swiftEmptyArrayStorage;
  sub_100013D58((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v17);
  sub_100008A5C(a1);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v20);
  return swift_release();
}

uint64_t sub_100010E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1 + 24;
  swift_beginAccess();
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  sub_10000A0D8(v6, v8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  sub_1000144C8(a2);
  v9(a2, a3, v8, v7);
  return swift_endAccess();
}

uint64_t sub_100010F28(uint64_t a1, uint64_t a2)
{
  return sub_100010F78(a1, a2, (uint64_t)&unk_100021AB0, (uint64_t)sub_100014768, (uint64_t)&unk_100021AC8);
}

uint64_t sub_100010F50(uint64_t a1, uint64_t a2)
{
  return sub_100010F78(a1, a2, (uint64_t)&unk_100021948, (uint64_t)sub_100014530, (uint64_t)&unk_100021960);
}

uint64_t sub_100010F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v20[0] = a5;
  uint64_t v7 = v5;
  uint64_t v10 = sub_10001A9B0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10001A9D0();
  uint64_t v14 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  id v16 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[1] = *(void *)(v7 + 16);
  id v17 = (void *)swift_allocObject();
  _OWORD v17[2] = v7;
  v17[3] = a1;
  void v17[4] = a2;
  aBlock[4] = a4;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = v20[0];
  uint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_10001A9C0();
  uint64_t v22 = &_swiftEmptyArrayStorage;
  sub_100013D58((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v21);
  return swift_release();
}

uint64_t sub_10001121C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10001B730;
  uint64_t v10 = a1 + 24;
  swift_beginAccess();
  sub_100006E20(v10, (uint64_t)v17);
  sub_100006E20((uint64_t)v17, (uint64_t)v16);
  sub_100007084(&qword_1000257F8);
  uint64_t v11 = sub_10001AA70();
  uint64_t v13 = v12;
  sub_100006F80((uint64_t)v17);
  *(void *)(v9 + 56) = &type metadata for String;
  *(void *)(v9 + 64) = sub_10000716C();
  *(void *)(v9 + 32) = v11;
  *(void *)(v9 + 40) = v13;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  sub_100006E20(v10, (uint64_t)v17);
  sub_10000A128(v17, v17[3]);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  swift_retain();
  sub_10000A610(a5, v14);
  swift_release();
  return sub_100006F80((uint64_t)v17);
}

uint64_t sub_1000113D4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_OWORD *, void), uint64_t a5, uint64_t *a6, void (*a7)(_OWORD *, _OWORD *), uint64_t *a8)
{
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  swift_unknownObjectRetain();
  sub_100007084(&qword_100025800);
  sub_100007084(a6);
  if (swift_dynamicCast())
  {
    a7(v20, v24);
    sub_100006E20((uint64_t)v24, (uint64_t)v20);
    a4(v20, 0);
    sub_10000D2AC((uint64_t)v20, a8);
    return sub_100006F80((uint64_t)v24);
  }
  else
  {
    uint64_t v21 = 0;
    memset(v20, 0, sizeof(v20));
    sub_10000D2AC((uint64_t)v20, a8);
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_10001B730;
    *(void *)&v24[0] = a1;
    *((void *)&v24[0] + 1) = a2;
    swift_unknownObjectRetain();
    uint64_t v16 = sub_10001AA70();
    uint64_t v18 = v17;
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 64) = sub_10000716C();
    *(void *)(v15 + 32) = v16;
    *(void *)(v15 + 40) = v18;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    uint64_t v25 = 0;
    memset(v24, 0, sizeof(v24));
    type metadata accessor for ILMessageFilterPrivateError(0);
    uint64_t v22 = 0;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_100013D58(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
    sub_10001A8D0();
    uint64_t v19 = *(void **)&v20[0];
    a4(v24, *(void *)&v20[0]);

    return sub_10000D2AC((uint64_t)v24, a8);
  }
}

void sub_100011640(uint64_t a1, void (*a2)(void, void), uint64_t a3, uint64_t a4)
{
}

void sub_100011660(uint64_t a1, void (*a2)(void, void), uint64_t a3, uint64_t a4)
{
}

void sub_100011680(uint64_t a1, void (*a2)(void, void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v57 = a6;
  uint64_t v56 = a5;
  uint64_t v55 = a4;
  uint64_t v60 = a3;
  v59 = a2;
  uint64_t v7 = sub_100007084(&qword_100025820);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10001A950();
  uint64_t v58 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v58 + 64);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)v45 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)v45 - v16;
  long long v18 = *(_OWORD *)(a1 + 112);
  long long v65 = *(_OWORD *)(a1 + 96);
  long long v66 = v18;
  long long v67 = *(_OWORD *)(a1 + 128);
  long long v19 = *(_OWORD *)(a1 + 80);
  long long v63 = *(_OWORD *)(a1 + 64);
  long long v64 = v19;
  uint64_t v20 = *((void *)&v66 + 1);
  sub_10001436C((uint64_t)&v63);
  swift_bridgeObjectRetain();
  sub_1000126B4(v20, v9);
  swift_bridgeObjectRelease();
  sub_1000143D8((uint64_t)&v63);
  v54 = (char *)v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = v17;
  uint64_t v22 = v58;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v9, 1, v10) == 1)
  {
    sub_10000D2AC((uint64_t)v9, &qword_100025820);
LABEL_8:
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_10001B730;
    v62[2] = v65;
    v62[3] = v66;
    v62[4] = v67;
    v62[1] = v64;
    v62[0] = v63;
    sub_10001436C((uint64_t)&v63);
    uint64_t v41 = sub_10001AA70();
    uint64_t v43 = v42;
    *(void *)(v40 + 56) = &type metadata for String;
    *(void *)(v40 + 64) = sub_10000716C();
    *(void *)(v40 + 32) = v41;
    *(void *)(v40 + 40) = v43;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    type metadata accessor for ILMessageFilterError(0);
    uint64_t v61 = 2;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_100013D58(&qword_100024F40, type metadata accessor for ILMessageFilterError);
    sub_10001A8D0();
    uint64_t v44 = *(void **)&v62[0];
    v59(0, *(void *)&v62[0]);

    return;
  }
  uint64_t v23 = v9;
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  v24(v15, v23, v10);
  uint64_t v25 = sub_10001A920();
  if (!v26)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v10);
    goto LABEL_8;
  }
  uint64_t v27 = v26;
  uint64_t v52 = v25;
  uint64_t v50 = *((void *)&v63 + 1);
  uint64_t v51 = v63;
  BOOL v28 = v21;
  v24(v21, v15, v10);
  v48 = v24;
  uint64_t v29 = qword_100024E70;
  swift_bridgeObjectRetain();
  uint64_t v49 = v27;
  if (v29 != -1) {
    swift_once();
  }
  uint64_t v47 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *))qword_100025B20;
  sub_100007084(&qword_100025038);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_10001B730;
  v46 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  uint64_t v31 = v54;
  v46(v54, v21, v10);
  uint64_t v32 = sub_10001AA70();
  Swift::String v53 = v28;
  uint64_t v34 = v33;
  *(void *)(v30 + 56) = &type metadata for String;
  *(void *)(v30 + 64) = sub_10000716C();
  *(void *)(v30 + 32) = v32;
  *(void *)(v30 + 40) = v34;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  uint64_t v47 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *))(a1 + 152);
  v45[1] = *(void *)(a1 + 160);
  sub_100006E20(v55, (uint64_t)v62);
  v46(v31, v53, v10);
  unint64_t v35 = (*(unsigned __int8 *)(v22 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v36 = (char *)swift_allocObject();
  uint64_t v37 = v52;
  *((void *)v36 + 2) = a1;
  *((void *)v36 + 3) = v37;
  uint64_t v38 = v49;
  long long v39 = v59;
  *((void *)v36 + 4) = v49;
  *((void *)v36 + 5) = v39;
  *((void *)v36 + 6) = v60;
  sub_100007268(v62, (uint64_t)(v36 + 56));
  v48(&v36[v35], v31, v10);
  swift_retain();
  swift_retain();
  swift_retain();
  v47(v51, v50, v37, v38, v57, v36);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v53, v10);
}

void sub_100011E58(char a1, void *a2, uint64_t a3, uint64_t a4, void (*a5)(void, void), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v41 = a7;
  uint64_t v42 = a8;
  uint64_t v43 = a3;
  uint64_t v44 = a4;
  uint64_t v15 = sub_10001A9B0();
  uint64_t v48 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  v46 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_10001A9D0();
  uint64_t v45 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  long long v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10001A950();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  __chkstk_darwin(v19);
  if (a1)
  {
    uint64_t v40 = a11;
    uint64_t v39 = a10;
    uint64_t v38 = a9;
    uint64_t v22 = a2;
    uint64_t v44 = a2[2];
    sub_100006E20(v41, (uint64_t)v51);
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))((char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v42, v19);
    uint64_t v23 = *(unsigned __int8 *)(v20 + 80);
    uint64_t v43 = v15;
    uint64_t v24 = a6;
    uint64_t v25 = (v23 + 80) & ~v23;
    uint64_t v26 = (char *)swift_allocObject();
    *((void *)v26 + 2) = v22;
    *((void *)v26 + 3) = a5;
    *((void *)v26 + 4) = v24;
    sub_100007268(v51, (uint64_t)(v26 + 40));
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(&v26[v25], (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v19);
    aBlock[4] = v39;
    aBlock[5] = v26;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000D05C;
    aBlock[3] = v40;
    uint64_t v27 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    sub_10001A9C0();
    uint64_t v49 = &_swiftEmptyArrayStorage;
    sub_100013D58((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100007084(&qword_100025030);
    sub_1000070C8();
    BOOL v28 = v46;
    uint64_t v29 = v43;
    sub_10001AB40();
    sub_10001AAF0();
    _Block_release(v27);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v28, v29);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v18, v47);
    swift_release();
  }
  else
  {
    uint64_t v30 = a5;
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_10001B7D0;
    uint64_t v32 = a2[8];
    uint64_t v33 = a2[9];
    *(void *)(v31 + 56) = &type metadata for String;
    unint64_t v34 = sub_10000716C();
    *(void *)(v31 + 32) = v32;
    *(void *)(v31 + 40) = v33;
    *(void *)(v31 + 96) = &type metadata for String;
    *(void *)(v31 + 104) = v34;
    uint64_t v35 = v43;
    uint64_t v36 = v44;
    *(void *)(v31 + 64) = v34;
    *(void *)(v31 + 72) = v35;
    *(void *)(v31 + 80) = v36;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    type metadata accessor for ILMessageFilterError(0);
    *(void *)&v51[0] = 3;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_100013D58(&qword_100024F40, type metadata accessor for ILMessageFilterError);
    sub_10001A8D0();
    uint64_t v37 = (void *)aBlock[0];
    v30(0, aBlock[0]);
  }
}

void sub_10001239C(void *a1, void (*a2)(void, id), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void (*v9)(id *__return_ptr, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  long long v21[2];
  id v22[5];

  uint64_t v9 = *(void (**)(id *__return_ptr, uint64_t))(a1[18] + 16);
  if (v9)
  {
    uint64_t v12 = swift_retain();
    v9(v22, v12);
    sub_10000A128(v22, (uint64_t)v22[3]);
    uint64_t v14 = a1[10];
    uint64_t v13 = a1[11];
    uint64_t v15 = a1[12];
    uint64_t v16 = a1[13];
    long long v18 = v15;
    sub_100006E20(a4, (uint64_t)v21);
    uint64_t v17 = swift_allocObject();
    sub_100007268(v21, v17 + 16);
    *(void *)(v17 + 56) = a2;
    *(void *)(v17 + 64) = a3;
    swift_retain();
    sub_100005CC8(a4, a5, v14, v13, v18, v16, a7, v17);
    sub_100008A5C((uint64_t)v9);
    swift_release();
    sub_100006F80((uint64_t)v22);
  }
  else
  {
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_10001A9A0();
    type metadata accessor for ILMessageFilterError(0);
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_100013D58(&qword_100024F40, type metadata accessor for ILMessageFilterError);
    sub_10001A8D0();
    a2(0, v22[0]);
  }
}

uint64_t sub_1000125B0(uint64_t a1, void *aBlock)
{
  uint64_t v2 = *(void (**)(void, uint64_t))(a1 + 32);
  uint64_t v3 = _Block_copy(aBlock);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_100014AF4, v4);
  swift_release();

  return swift_release();
}

void sub_100012644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_10001A8E0();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_1000126B4@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t v4 = sub_100007084(&qword_100025820);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10001A950();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, 1, 1, v7);
  }
  sub_10001A940();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_10000D2AC((uint64_t)v6, &qword_100025820);
    type metadata accessor for ILMessageFilterError(0);
    uint64_t v19 = 2;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_100013D58(&qword_100024F40, type metadata accessor for ILMessageFilterError);
    sub_10001A8D0();
    return swift_willThrow();
  }
  long long v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v18(v10, v6, v7);
  sub_10001A930();
  if (!v12) {
    goto LABEL_11;
  }
  uint64_t v13 = sub_10001AA60();
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  if (v13 == 0x7370747468 && v15 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v17 = sub_10001ABF0();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
LABEL_11:
      type metadata accessor for ILMessageFilterError(0);
      uint64_t v19 = 2;
      sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
      sub_100013D58(&qword_100024F40, type metadata accessor for ILMessageFilterError);
      sub_10001A8D0();
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
  }
  v18(a2, v10, v7);
  return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
}

uint64_t sub_100012A18(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10001B730;
  *(void *)(v7 + 56) = sub_100007B8C(0, (unint64_t *)&unk_1000259A0);
  *(void *)(v7 + 64) = sub_100013C34();
  *(void *)(v7 + 32) = a1;
  id v8 = a1;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v3;
  v9[3] = a2;
  v9[4] = a3;
  swift_retain();
  swift_retain();
  sub_100010BC8((uint64_t)sub_100013CA0, (uint64_t)v9, (uint64_t)&unk_1000218A8, (uint64_t)sub_1000144A8, (uint64_t)&unk_1000218C0);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a2;
  v10[3] = a3;
  v10[4] = v3;
  v10[5] = v8;
  id v11 = v8;
  swift_retain();
  swift_retain();
  sub_100010F78((uint64_t)sub_100013CF4, (uint64_t)v10, (uint64_t)&unk_100021678, (uint64_t)sub_100013D04, (uint64_t)&unk_100021690);

  return swift_release();
}

uint64_t sub_100012C0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10001A9B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001A9D0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = *(void *)(a2 + 16);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  void v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  aBlock[4] = sub_100014520;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = &unk_100021910;
  char v17 = _Block_copy(aBlock);
  swift_errorRetain();
  swift_retain();
  swift_retain();
  sub_10001A9C0();
  v19[1] = &_swiftEmptyArrayStorage;
  sub_100013D58((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return swift_release();
}

uint64_t sub_100012EC8(uint64_t a1, uint64_t a2, void (*a3)(void *, uint64_t))
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_10001B730;
    swift_errorRetain();
    sub_100007084(&qword_100025A00);
    uint64_t v6 = sub_10001AA70();
    uint64_t v8 = v7;
    *(void *)(v5 + 56) = &type metadata for String;
    *(void *)(v5 + 64) = sub_10000716C();
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = v8;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
  }
  uint64_t v9 = *(void *)(a2 + 176);
  if (!v9)
  {
    swift_errorRetain();
    uint64_t v9 = a1;
  }
  swift_errorRetain();
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10001B7D0;
  id v11 = *(id *)(a2 + 168);
  sub_100007084(&qword_100025828);
  uint64_t v12 = sub_10001AA70();
  uint64_t v14 = v13;
  *(void *)(v10 + 56) = &type metadata for String;
  unint64_t v15 = sub_10000716C();
  *(void *)(v10 + 64) = v15;
  *(void *)(v10 + 32) = v12;
  *(void *)(v10 + 40) = v14;
  swift_errorRetain();
  sub_100007084(&qword_100025208);
  uint64_t v16 = sub_10001AA70();
  *(void *)(v10 + 96) = &type metadata for String;
  *(void *)(v10 + 104) = v15;
  *(void *)(v10 + 72) = v16;
  *(void *)(v10 + 80) = v17;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  long long v18 = *(void **)(a2 + 168);
  id v19 = v18;
  a3(v18, v9);

  return swift_errorRelease();
}

void sub_10001314C(uint64_t a1, uint64_t a2, void (*a3)(void, void), uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10 = swift_allocObject();
  sub_100013E18(a1, (uint64_t)&v26);
  if (v27)
  {
    sub_100007268(&v26, v10 + 16);
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = a5;
    *(void *)(v11 + 24) = a6;
    uint64_t v12 = *(void *)(v10 + 40);
    uint64_t v13 = *(void *)(v10 + 48);
    sub_10000A0D8(v10 + 16, v12);
    uint64_t v14 = *(void (**)(void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v13 + 16);
    swift_retain();
    id v15 = a6;
    v14(sub_100013EC0, v11, v12, v13);
    sub_100006E20(v10 + 16, (uint64_t)&v26);
    uint64_t v16 = v27;
    uint64_t v17 = v28;
    sub_10000A128(&v26, v27);
    long long v18 = (void *)swift_allocObject();
    v18[2] = a5;
    v18[3] = v15;
    v18[4] = v10;
    id v19 = *(void (**)(id, uint64_t (*)(void *, uint64_t), void *, uint64_t, uint64_t))(v17 + 32);
    swift_retain();
    id v20 = v15;
    swift_retain();
    v19(v20, sub_100013F6C, v18, v16, v17);
    swift_release();
    sub_100006F80((uint64_t)&v26);
    swift_release();
  }
  else
  {
    sub_10000D2AC((uint64_t)&v26, &qword_100025810);
    swift_deallocUninitializedObject();
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_10001B730;
    sub_100013E18(a1, (uint64_t)&v26);
    sub_100007084(&qword_100025810);
    uint64_t v22 = sub_10001AA70();
    uint64_t v24 = v23;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 64) = sub_10000716C();
    *(void *)(v21 + 32) = v22;
    *(void *)(v21 + 40) = v24;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    type metadata accessor for ILMessageFilterPrivateError(0);
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_100013D58(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
    sub_10001A8D0();
    uint64_t v25 = (void *)v26;
    a3(0, v26);
  }
}

uint64_t sub_100013488(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v10 = sub_10001A9B0();
  uint64_t v23 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10001A9D0();
  uint64_t v13 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  id v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(a3 + 16);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  void v16[3] = a4;
  v16[4] = a2;
  v16[5] = a3;
  v16[6] = a5;
  aBlock[4] = sub_100013FD0;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = &unk_100021780;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = a1;
  id v19 = a4;
  swift_errorRetain();
  swift_retain();
  swift_retain();
  sub_10001A9C0();
  uint64_t v24 = &_swiftEmptyArrayStorage;
  sub_100013D58((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v22);
  return swift_release();
}

uint64_t sub_100013758(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    uint64_t v9 = qword_100024E70;
    id v10 = a1;
    if (v9 != -1) {
      swift_once();
    }
    sub_100007084(&qword_100025038);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_10001B730;
    v27[0] = v10;
    sub_100007B8C(0, &qword_100025818);
    id v12 = v10;
    uint64_t v13 = sub_10001AA70();
    uint64_t v15 = v14;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_10000716C();
    *(void *)(v11 + 32) = v13;
    *(void *)(v11 + 40) = v15;
    sub_10001AAC0();
    sub_10001A9A0();

    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_10001B7D0;
    *(void *)(v17 + 56) = sub_100007B8C(0, (unint64_t *)&unk_1000259A0);
    *(void *)(v17 + 64) = sub_100013C34();
    *(void *)(v17 + 32) = a2;
    v27[0] = a3;
    id v18 = a2;
    swift_errorRetain();
    sub_100007084(&qword_100025208);
    uint64_t v19 = sub_10001AA70();
    uint64_t v21 = v20;
    *(void *)(v17 + 96) = &type metadata for String;
    *(void *)(v17 + 104) = sub_10000716C();
    *(void *)(v17 + 72) = v19;
    *(void *)(v17 + 80) = v21;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    id v12 = 0;
  }
  uint64_t v22 = *(void **)(a4 + 168);
  *(void *)(a4 + 168) = a1;
  id v23 = v12;

  *(void *)(a4 + 176) = a3;
  swift_errorRetain();
  swift_errorRelease();
  swift_beginAccess();
  sub_100006E20(a5 + 16, (uint64_t)v27);
  uint64_t v24 = v28;
  uint64_t v25 = v29;
  sub_10000A128(v27, v28);
  (*(void (**)(uint64_t, uint64_t))(v25 + 40))(v24, v25);
  return sub_100006F80((uint64_t)v27);
}

void sub_100013A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (a1)
  {
    v5[4] = a1;
    v5[5] = a2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1000125B0;
    v5[3] = &unk_100021C30;
    uint64_t v4 = _Block_copy(v5);
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  [v3 setDeferQueryRequestToNetwork:v4];
  _Block_release(v4);
}

uint64_t sub_100013AE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *v3;
  v8[4] = a2;
  v8[5] = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100009CB8;
  v8[3] = &unk_100021C08;
  uint64_t v6 = _Block_copy(v8);
  swift_retain();
  [v5 handleCapabilitiesQueryRequest:a1 completion:v6];
  _Block_release(v6);
  return swift_release();
}

uint64_t type metadata accessor for CapabilitiesQueryRequestOperation()
{
  uint64_t result = qword_1000256C0;
  if (!qword_1000256C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100013BF0()
{
  return swift_initClassMetadata2();
}

unint64_t sub_100013C34()
{
  unint64_t result = qword_1000257F0;
  if (!qword_1000257F0)
  {
    sub_100007B8C(255, (unint64_t *)&unk_1000259A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000257F0);
  }
  return result;
}

uint64_t sub_100013CA0(uint64_t a1)
{
  return sub_100012C0C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100013CAC()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100013CF4(uint64_t a1, uint64_t a2)
{
  sub_10001314C(a1, a2, *(void (**)(void, void))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40));
}

uint64_t sub_100013D04()
{
  return sub_10001121C(v0[2], v0[3], v0[4], (uint64_t)&unk_1000216C8, (uint64_t)sub_100013DA0);
}

uint64_t sub_100013D40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100013D50()
{
  return swift_release();
}

uint64_t sub_100013D58(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100013DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000113D4(a1, a2, a3, *(void (**)(_OWORD *, void))(v3 + 16), *(void *)(v3 + 24), &qword_100025808, (void (*)(_OWORD *, _OWORD *))sub_100007268, &qword_100025810);
}

uint64_t sub_100013DE0()
{
  sub_100006F80(v0 + 16);

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100013E18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007084(&qword_100025810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013E80()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100013EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  id v6 = *(id *)(v2 + 24);
  sub_100013FE0(v6, a1, a2, v5);
}

uint64_t sub_100013F24()
{
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100013F6C(void *a1, uint64_t a2)
{
  return sub_100013488(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_100013F78()
{
  swift_errorRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100013FD0()
{
  return sub_100013758(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_100013FE0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10001A9B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10001A9D0();
  uint64_t v12 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[3] = sub_100007B8C(0, (unint64_t *)&unk_1000259A0);
  v24[4] = &off_100021C80;
  v24[0] = a1;
  uint64_t v19 = *(void *)(a4 + 16);
  sub_100006E20((uint64_t)v24, (uint64_t)v23);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a4;
  v15[3] = a2;
  v15[4] = a3;
  sub_100007268(v23, (uint64_t)(v15 + 5));
  aBlock[4] = sub_10001432C;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = &unk_1000217D0;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = a1;
  swift_retain();
  swift_retain();
  sub_10001A9C0();
  uint64_t v21 = &_swiftEmptyArrayStorage;
  sub_100013D58((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_1000070C8();
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v20);
  swift_release();
  return sub_100006F80((uint64_t)v24);
}

uint64_t sub_1000142E4()
{
  swift_release();
  swift_release();
  sub_100006F80(v0 + 40);

  return _swift_deallocObject(v0, 80, 7);
}

void sub_10001432C()
{
  sub_100011680(*(void *)(v0 + 16), *(void (**)(void, void))(v0 + 24), *(void *)(v0 + 32), v0 + 40, (uint64_t)&unk_100021808, (uint64_t)sub_100014448);
}

uint64_t sub_10001436C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000143D8(uint64_t a1)
{
  return a1;
}

void sub_100014448(char a1)
{
}

void sub_100014474()
{
}

uint64_t sub_100014498(void *a1, void *a2)
{
  return sub_100007DBC(a1, a2, v2 + 16, *(uint64_t (**)(void *, void *))(v2 + 56));
}

uint64_t sub_1000144A8()
{
  return sub_100010E78(v0[2], v0[3], v0[4]);
}

uint64_t sub_1000144C8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000144D8()
{
  swift_errorRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100014520()
{
  return sub_100012EC8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(void *, uint64_t))(v0 + 32));
}

uint64_t sub_100014530()
{
  return sub_10001121C(v0[2], v0[3], v0[4], (uint64_t)&unk_100021998, (uint64_t)sub_10001456C);
}

uint64_t sub_10001456C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000113D4(a1, a2, a3, *(void (**)(_OWORD *, void))(v3 + 16), *(void *)(v3 + 24), &qword_100025830, (void (*)(_OWORD *, _OWORD *))sub_100007268, &qword_1000255D0);
}

void sub_1000145B0(char a1)
{
}

void sub_1000145D8(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(sub_10001A950() - 8);
  sub_100011E58(a1, *(void **)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(void (**)(void, void))(v4 + 40), *(void *)(v4 + 48), v4 + 56, v4 + ((*(unsigned __int8 *)(v9 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), a2, a3, a4);
}

void sub_10001467C()
{
}

void sub_10001469C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_10001A950() - 8);
  sub_10001239C(*(void **)(v2 + 16), *(void (**)(void, id))(v2 + 24), *(void *)(v2 + 32), v2 + 40, v2 + ((*(unsigned __int8 *)(v5 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a1, a2);
}

uint64_t sub_100014728()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100014768()
{
  return sub_10001121C(v0[2], v0[3], v0[4], (uint64_t)&unk_100021B00, (uint64_t)sub_1000147DC);
}

uint64_t sub_1000147A4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000147DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000113D4(a1, a2, a3, *(void (**)(_OWORD *, void))(v3 + 16), *(void *)(v3 + 24), &qword_100025838, (void (*)(_OWORD *, _OWORD *))sub_100007268, &qword_100025380);
}

uint64_t sub_100014820()
{
  uint64_t v1 = sub_10001A950();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 96) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100006F80(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100014904(char a1)
{
}

uint64_t sub_100014930()
{
  uint64_t v1 = sub_10001A950();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 80) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  sub_100006F80(v0 + 40);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100014A0C()
{
}

uint64_t sub_100014A30()
{
  sub_100006F80(v0 + 16);
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100014A74()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100014ABC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100014AF4(uint64_t a1, uint64_t a2)
{
  sub_100012644(a1, a2, *(void *)(v2 + 16));
}

void *sub_100014B74(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = &_swiftEmptyDictionarySingleton;
  uint64_t v4 = (*(uint64_t (**)(void))(a2 + 16))();
  if (v5)
  {
    uint64_t v19 = &type metadata for String;
    *(void *)&long long v18 = v4;
    *((void *)&v18 + 1) = v5;
    sub_1000076CC(&v18, &v20);
    if (v21)
    {
LABEL_3:
      sub_1000076CC(&v20, &v18);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_10000FF44(&v18, 0x7265646E6573, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
      uint64_t v22 = &_swiftEmptyDictionarySingleton;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = [objc_allocWithZone((Class)NSNull) init];
    unint64_t v21 = sub_100010A74();
    *(void *)&long long v20 = v7;
    if (v21) {
      goto LABEL_3;
    }
  }
  sub_100010AB4((uint64_t)&v20);
  sub_10000F640(0x7265646E6573, 0xE600000000000000, &v18);
  sub_100010AB4((uint64_t)&v18);
LABEL_6:
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  if (v9)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    char v12 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v20 = &_swiftEmptyDictionarySingleton;
    sub_100010098(v10, v11, 1954047348, 0xE400000000000000, v12);
    id v13 = (id)v20;
    swift_bridgeObjectRelease();
    unint64_t v14 = sub_100007084(&qword_100025840);
  }
  else
  {
    id v13 = [objc_allocWithZone((Class)NSNull) init];
    unint64_t v14 = sub_100010A74();
  }
  unint64_t v21 = v14;
  *(void *)&long long v20 = v13;
  sub_1000076CC(&v20, &v18);
  uint64_t v15 = v22;
  char v16 = swift_isUniquelyReferenced_nonNull_native();
  sub_10000FF44(&v18, 0x6567617373656DLL, 0xE700000000000000, v16);
  swift_bridgeObjectRelease();
  return v15;
}

void *sub_100014D94()
{
  return &_swiftEmptyDictionarySingleton;
}

uint64_t sub_100014DA0(uint64_t a1, uint64_t a2)
{
  return sub_100014DC4(a1, a2, (SEL *)&selRef_sender);
}

uint64_t sub_100014DAC(uint64_t a1, uint64_t a2)
{
  return sub_100014DC4(a1, a2, (SEL *)&selRef_messageBody);
}

void *sub_100014DB8(uint64_t a1)
{
  return sub_100014B74(a1, (uint64_t)&off_100021CA0);
}

uint64_t sub_100014DC4(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4 = [*v3 *a3];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = sub_10001AA40();

  return v6;
}

void *sub_100014E28(uint64_t a1)
{
  return sub_100014B74(a1, (uint64_t)&off_100021CE0);
}

id sub_100014E34(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = v3;
  uint64_t v7 = sub_100016590();
  if (!v8)
  {

    a1 = v6;
LABEL_7:

    type metadata accessor for ReportClassificationOperation();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v9 = v7;
  uint64_t v10 = v8;
  id v11 = sub_100016840();
  if (!v11
    || (char v12 = v11, v13 = [v11 bundleVersion], v12, !v13))
  {

    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v14 = sub_10001AA40();
  uint64_t v16 = v15;

  id v17 = (uint64_t *)&v6[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_applicationIdentifier];
  *id v17 = v9;
  v17[1] = v10;
  long long v18 = (uint64_t *)&v6[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_applicationVersion];
  *long long v18 = v14;
  v18[1] = v16;
  *(void *)&v6[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_queue] = a2;
  *(void *)&v6[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_nsExtension] = a1;
  uint64_t v19 = &v6[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_urlHostAuthorizationCheck];
  *(void *)uint64_t v19 = sub_10001506C;
  *((void *)v19 + 1) = 0;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a2;
  sub_100007084((uint64_t *)&unk_1000259F0);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = 0;
  *(void *)(v21 + 24) = 0;
  uint64_t v22 = swift_allocObject();
  swift_weakInit();
  id v23 = (void *)swift_allocObject();
  long long v23[2] = v22;
  v23[3] = sub_100016504;
  v23[4] = v20;
  uint64_t v24 = *(void *)(v21 + 16);
  *(void *)(v21 + 16) = sub_100016584;
  *(void *)(v21 + 24) = v23;
  id v25 = a2;
  id v26 = a1;
  sub_100008A5C(v24);
  *(void *)&v6[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_networkOperationGenerator] = v21;

  v29.receiver = v6;
  v29.super_class = (Class)type metadata accessor for ReportClassificationOperation();
  id v27 = objc_msgSendSuper2(&v29, "init");

  return v27;
}

void sub_10001506C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  uint64_t v6 = (void *)_SWCServiceTypeSpamReporting;
  id v7 = objc_allocWithZone((Class)_SWCServiceSpecifier);
  id v8 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  NSString v9 = sub_10001AA30();
  swift_bridgeObjectRelease();
  NSString v10 = sub_10001AA30();
  swift_bridgeObjectRelease();
  id v12 = [v7 initWithServiceType:v8 applicationIdentifier:v9 domain:v10];

  char v11 = sub_100007794((uint64_t)v12);
  a5(v11 & 1);
}

void sub_100015178(char *a1, void (*a2)(void, void), uint64_t a3, uint64_t a4)
{
  uint64_t v61 = a4;
  long long v64 = a2;
  uint64_t v65 = a3;
  uint64_t v5 = sub_100007084(&qword_100025820);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10001A950();
  uint64_t v63 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v63 + 64);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v11 = __chkstk_darwin(v10);
  id v13 = (char *)&v50 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v50 - v14;
  v62 = a1;
  id v16 = *(id *)&a1[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_nsExtension];
  sub_1000166EC();
  sub_1000126B4(v17, v7);
  uint64_t v59 = v9;
  uint64_t v60 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v18 = v62;

  swift_bridgeObjectRelease();
  uint64_t v19 = v63;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v63 + 48))(v7, 1, v8) == 1)
  {
    sub_100016120((uint64_t)v7);
LABEL_8:
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_10001B730;
    *(void *)&v66[0] = v16;
    sub_1000089C4();
    id v45 = v16;
    uint64_t v46 = sub_10001AA70();
    uint64_t v48 = v47;
    *(void *)(v44 + 56) = &type metadata for String;
    *(void *)(v44 + 64) = sub_10000716C();
    *(void *)(v44 + 32) = v46;
    *(void *)(v44 + 40) = v48;
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    type metadata accessor for ILMessageFilterError(0);
    uint64_t v67 = 2;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_100016444(&qword_100024F40, type metadata accessor for ILMessageFilterError);
    sub_10001A8D0();
    uint64_t v49 = *(void **)&v66[0];
    v64(0, *(void *)&v66[0]);

    return;
  }
  uint64_t v20 = v8;
  uint64_t v21 = v7;
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
  v22(v13, v21, v8);
  uint64_t v23 = sub_10001A920();
  if (!v24)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v13, v8);
    goto LABEL_8;
  }
  uint64_t v25 = v24;
  uint64_t v58 = v23;
  id v26 = v15;
  v22(v15, v13, v8);
  uint64_t v56 = v22;
  uint64_t v27 = qword_100024E70;
  swift_bridgeObjectRetain();
  uint64_t v57 = v25;
  uint64_t v55 = v19 + 32;
  if (v27 != -1) {
    swift_once();
  }
  Swift::String v53 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(char), char *))qword_100025B20;
  sub_100007084(&qword_100025038);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_10001B730;
  uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  objc_super v29 = v60;
  v51(v60, v26, v8);
  uint64_t v30 = sub_10001AA70();
  uint64_t v31 = v26;
  v54 = v26;
  uint64_t v32 = v30;
  uint64_t v34 = v33;
  *(void *)(v28 + 56) = &type metadata for String;
  *(void *)(v28 + 64) = sub_10000716C();
  *(void *)(v28 + 32) = v32;
  *(void *)(v28 + 40) = v34;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(char), char *))&v18[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_urlHostAuthorizationCheck];
  uint64_t v36 = *(void *)&v18[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_applicationIdentifier
                      + 8];
  uint64_t v52 = *(void *)&v18[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_applicationIdentifier];
  Swift::String v53 = v35;
  sub_100006E20(v61, (uint64_t)v66);
  v51(v29, v31, v20);
  unint64_t v37 = (*(unsigned __int8 *)(v19 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v38 = (char *)swift_allocObject();
  uint64_t v39 = v57;
  uint64_t v40 = v58;
  *((void *)v38 + 2) = v18;
  *((void *)v38 + 3) = v40;
  uint64_t v41 = v64;
  uint64_t v42 = v65;
  *((void *)v38 + 4) = v39;
  *((void *)v38 + 5) = v41;
  *((void *)v38 + 6) = v42;
  sub_100007268(v66, (uint64_t)(v38 + 56));
  v56(&v38[v37], v29, v20);
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v43 = v18;
  swift_retain();
  v53(v52, v36, v40, v39, sub_100016264, v38);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v54, v20);
}

void sub_100015888(char a1, char *a2, uint64_t a3, uint64_t a4, void (*a5)(void, void), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v36 = a8;
  uint64_t v37 = a3;
  uint64_t v42 = a5;
  uint64_t v43 = a6;
  uint64_t v38 = a4;
  uint64_t v11 = sub_10001A9B0();
  uint64_t v41 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10001A9D0();
  uint64_t v39 = *(void *)(v14 - 8);
  uint64_t v40 = v14;
  __chkstk_darwin(v14);
  id v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10001A950();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v38 = *(void *)&a2[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_queue];
    sub_100006E20(a7, (uint64_t)v46);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v36, v17);
    unint64_t v21 = (*(unsigned __int8 *)(v18 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    uint64_t v22 = (char *)swift_allocObject();
    uint64_t v23 = v42;
    uint64_t v24 = v43;
    *((void *)v22 + 2) = a2;
    *((void *)v22 + 3) = v23;
    *((void *)v22 + 4) = v24;
    sub_100007268(v46, (uint64_t)(v22 + 40));
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v22[v21], v20, v17);
    aBlock[4] = sub_1000163C0;
    aBlock[5] = v22;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000D05C;
    aBlock[3] = &unk_100021D60;
    uint64_t v25 = _Block_copy(aBlock);
    id v26 = a2;
    swift_retain();
    sub_10001A9C0();
    uint64_t v44 = &_swiftEmptyArrayStorage;
    sub_100016444((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100007084(&qword_100025030);
    sub_1000070C8();
    sub_10001AB40();
    sub_10001AAF0();
    _Block_release(v25);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v13, v11);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v16, v40);
    swift_release();
  }
  else
  {
    uint64_t v27 = v42;
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_10001B7D0;
    uint64_t v30 = *(void *)&a2[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_applicationIdentifier];
    uint64_t v29 = *(void *)&a2[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_applicationIdentifier
                       + 8];
    *(void *)(v28 + 56) = &type metadata for String;
    unint64_t v31 = sub_10000716C();
    *(void *)(v28 + 32) = v30;
    *(void *)(v28 + 40) = v29;
    *(void *)(v28 + 96) = &type metadata for String;
    *(void *)(v28 + 104) = v31;
    uint64_t v32 = v37;
    uint64_t v33 = v38;
    *(void *)(v28 + 64) = v31;
    *(void *)(v28 + 72) = v32;
    *(void *)(v28 + 80) = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10001A9A0();
    swift_bridgeObjectRelease();
    type metadata accessor for ILMessageFilterError(0);
    *(void *)&v46[0] = 3;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_100016444(&qword_100024F40, type metadata accessor for ILMessageFilterError);
    sub_10001A8D0();
    uint64_t v34 = (void *)aBlock[0];
    v27(0, aBlock[0]);
  }
}

void sub_100015D9C(uint64_t a1, void (*a2)(void, id), uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v7)(id *__return_ptr, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  long long v17[2];
  id v18[5];

  id v7 = *(void (**)(id *__return_ptr, uint64_t))(*(void *)(a1
                                                                    + OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_networkOperationGenerator)
                                                        + 16);
  if (v7)
  {
    uint64_t v10 = swift_retain();
    v7(v18, v10);
    sub_10000A128(v18, (uint64_t)v18[3]);
    uint64_t v11 = *(void *)(a1
                    + OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_applicationIdentifier
                    + 8);
    uint64_t v15 = *(void *)(a1
                    + OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_applicationIdentifier);
    id v13 = *(void *)(a1
                    + OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_applicationVersion);
    uint64_t v12 = *(void *)(a1
                    + OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_applicationVersion
                    + 8);
    sub_100006E20(a4, (uint64_t)v17);
    uint64_t v14 = swift_allocObject();
    sub_100007268(v17, v14 + 16);
    *(void *)(v14 + 56) = a2;
    *(void *)(v14 + 64) = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100005CC8(a4, a5, v15, v11, v13, v12, (uint64_t)sub_100014498, v14);
    sub_100008A5C((uint64_t)v7);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100006F80((uint64_t)v18);
  }
  else
  {
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_10001A9A0();
    type metadata accessor for ILMessageFilterError(0);
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_100016444(&qword_100024F40, type metadata accessor for ILMessageFilterError);
    sub_10001A8D0();
    a2(0, v18[0]);
  }
}

id sub_100016030()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReportClassificationOperation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ReportClassificationOperation()
{
  return self;
}

uint64_t sub_100016120(uint64_t a1)
{
  uint64_t v2 = sub_100007084(&qword_100025820);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100016180()
{
  uint64_t v1 = sub_10001A950();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 96) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  swift_bridgeObjectRelease();
  swift_release();
  sub_100006F80(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100016264(char a1)
{
  uint64_t v3 = *(void *)(sub_10001A950() - 8);
  uint64_t v4 = (char *)v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void (*)(void, void))v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v3 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  sub_100015888(a1, v4, v5, v6, v7, v8, (uint64_t)(v1 + 7), v9);
}

uint64_t sub_1000162E4()
{
  uint64_t v1 = sub_10001A950();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 80) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  swift_release();
  sub_100006F80(v0 + 40);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_1000163C0()
{
  uint64_t v1 = *(void *)(sub_10001A950() - 8);
  uint64_t v2 = v0[2];
  uint64_t v3 = (void (*)(void, id))v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (uint64_t)v0 + ((*(unsigned __int8 *)(v1 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_100015D9C(v2, v3, v4, (uint64_t)(v0 + 5), v5);
}

uint64_t sub_10001642C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001643C()
{
  return swift_release();
}

uint64_t sub_100016444(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001648C()
{
  sub_100006F80(v0 + 16);
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1000164CC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100016504@<X0>(uint64_t *a1@<X8>)
{
  return sub_100007C44(*(void *)(v1 + 16), a1);
}

uint64_t sub_10001650C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100016544()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100016584()
{
  return sub_100017128(*(void *)(v0 + 16), *(uint64_t (**)(uint64_t))(v0 + 24));
}

uint64_t sub_100016590()
{
  id v0 = sub_100016840();
  if (!v0)
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_11:
    sub_10000D2AC((uint64_t)&v7, &qword_100025A30);
    return 0;
  }
  uint64_t v1 = v0;
  id v2 = [v0 entitlements];

  NSString v3 = sub_10001AA30();
  sub_100016D90();
  id v4 = [v2 objectForKey:v3 ofClass:swift_getObjCClassFromMetadata()];

  if (v4)
  {
    sub_10001AB30();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100016DD0((uint64_t)v6, (uint64_t)&v7);
  if (!*((void *)&v8 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return *(void *)&v6[0];
  }
  else {
    return 0;
  }
}

id sub_1000166D0()
{
  return sub_100016708(0xD000000000000022, 0x800000010001CBF0);
}

id sub_1000166EC()
{
  return sub_100016708(0xD000000000000031, 0x800000010001CC90);
}

id sub_100016708(uint64_t a1, uint64_t a2)
{
  id result = [v2 attributes];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = sub_10001AA10();

    *(void *)&long long v12 = a1;
    *((void *)&v12 + 1) = a2;
    sub_10001AB80();
    if (*(void *)(v7 + 16) && (unint64_t v8 = sub_1000072F8((uint64_t)v11), (v9 & 1) != 0))
    {
      sub_100010B14(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v12);
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_100007738((uint64_t)v11);
    if (*((void *)&v13 + 1))
    {
      if (swift_dynamicCast()) {
        return (id)v10;
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_10000D2AC((uint64_t)&v12, &qword_100025A30);
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100016840()
{
  uint64_t v1 = v0;
  sub_100007084(&qword_100025820);
  ((void (*)(void))__chkstk_darwin)();
  NSString v3 = &v21[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_10001A950();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = &v21[-v10];
  __chkstk_darwin(v9);
  long long v13 = &v21[-v12];
  id v14 = [v1 _plugIn];
  if (!v14) {
    return 0;
  }
  id v15 = [v14 containingUrl];
  if (!v15)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_6;
  }
  id v16 = v15;
  sub_10001A910();

  uint64_t v17 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32);
  v17(v3, v11, v4);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_6:
    swift_unknownObjectRelease();
    sub_10000D2AC((uint64_t)v3, &qword_100025820);
    return 0;
  }
  v17(v13, v3, v4);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v8, v13, v4);
  id v18 = objc_allocWithZone((Class)LSApplicationRecord);
  id v20 = sub_100016C3C((uint64_t)v8, 0);
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v13, v4);
  swift_unknownObjectRelease();
  return v20;
}

id sub_100016C3C(uint64_t a1, char a2)
{
  NSString v3 = v2;
  sub_10001A900(__stack_chk_guard);
  uint64_t v7 = v6;
  id v16 = 0;
  id v8 = [v3 initWithURL:v6 allowPlaceholder:a2 & 1 error:&v16];

  id v9 = v16;
  if (v8)
  {
    uint64_t v10 = sub_10001A950();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
    id v12 = v9;
    v11(a1, v10);
  }
  else
  {
    id v13 = v16;
    sub_10001A8F0();

    swift_willThrow();
    uint64_t v14 = sub_10001A950();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
  }
  return v8;
}

unint64_t sub_100016D90()
{
  unint64_t result = qword_1000258A0;
  if (!qword_1000258A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000258A0);
  }
  return result;
}

uint64_t sub_100016DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007084(&qword_100025A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100016E38(char a1, void *a2, uint64_t a3, uint64_t a4)
{
  NSString v8 = sub_10001AA30();
  id v9 = [a2 valueForEntitlement:v8];

  if (v9)
  {
    sub_10001AB30();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_10001A454((uint64_t)v16, (uint64_t)v17, &qword_100025A30);
  if (v18)
  {
    sub_100007084(&qword_100025A38);
    if (swift_dynamicCast())
    {
      if (a1)
      {
        if (a1 == 1) {
          uint64_t v10 = 0xD000000000000011;
        }
        else {
          uint64_t v10 = 0x74726F706572;
        }
        if (a1 == 1) {
          uint64_t v11 = 0x800000010001C090;
        }
        else {
          uint64_t v11 = 0xE600000000000000;
        }
      }
      else
      {
        uint64_t v11 = 0xE500000000000000;
        uint64_t v10 = 0x7972657571;
      }
      char v13 = sub_100017060(v10, v11, v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v13 & 1;
    }
  }
  else
  {
    sub_100010AB4((uint64_t)v17);
  }
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_10001AAB0();
  sub_100007084(&qword_100025038);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10001B730;
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 64) = sub_10000716C();
  *(void *)(v12 + 32) = a3;
  *(void *)(v12 + 40) = a4;
  swift_bridgeObjectRetain();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  char v13 = 0;
  return v13 & 1;
}

uint64_t sub_100017060(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_10001ABF0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  id v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_10001ABF0() & 1) != 0) {
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

uint64_t sub_100017128(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = Strong;
    uint64_t v5 = *(void *)(Strong + 16);
    *(void *)(v4 + 16) = 0;
    *(void *)(v4 + 24) = 0;
    sub_100008A5C(v5);
    uint64_t Strong = swift_release();
  }
  return a2(Strong);
}

id sub_1000171EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MessageFilterManager()
{
  return self;
}

uint64_t sub_1000172FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100017308(*a1, *a2);
}

uint64_t sub_100017308(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0xD000000000000011;
    }
    else {
      unint64_t v3 = 0x74726F706572;
    }
    if (v2 == 1) {
      unint64_t v4 = 0x800000010001C090;
    }
    else {
      unint64_t v4 = 0xE600000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0xD000000000000011;
      }
      else {
        unint64_t v6 = 0x74726F706572;
      }
      if (v5 == 1) {
        unint64_t v7 = 0x800000010001C090;
      }
      else {
        unint64_t v7 = 0xE600000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE500000000000000;
    unint64_t v3 = 0x7972657571;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE500000000000000;
  if (v3 != 0x7972657571)
  {
LABEL_21:
    char v8 = sub_10001ABF0();
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

Swift::Int sub_100017414()
{
  return sub_10001AC50();
}

uint64_t sub_1000174B4()
{
  sub_10001AA80();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100017540()
{
  return sub_10001AC50();
}

uint64_t sub_1000175DC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000185A4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10001760C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE500000000000000;
  unint64_t v4 = 0x800000010001C090;
  unint64_t v5 = 0xD000000000000011;
  if (v2 != 1)
  {
    unint64_t v5 = 0x74726F706572;
    unint64_t v4 = 0xE600000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x7972657571;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_100017668(void *a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_10001B730;
    swift_errorRetain();
    sub_100007084(&qword_100025208);
    uint64_t v4 = sub_10001AA70();
    uint64_t v6 = v5;
    *(void *)(v3 + 56) = &type metadata for String;
    *(void *)(v3 + 64) = sub_10000716C();
    *(void *)(v3 + 32) = v4;
    *(void *)(v3 + 40) = v6;
    sub_10001A9A0();
  }
  else if (a1)
  {
    uint64_t v9 = qword_100024E70;
    id v10 = a1;
    if (v9 != -1) {
      swift_once();
    }
    sub_100007084(&qword_100025038);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_10001B7D0;
    *(void *)(v11 + 56) = sub_100007B8C(0, &qword_100025A60);
    *(void *)(v11 + 64) = sub_10001A404(&qword_100025A68, &qword_100025A60);
    *(void *)(v11 + 32) = a3;
    *(void *)(v11 + 96) = sub_100007B8C(0, &qword_100025A90);
    *(void *)(v11 + 104) = sub_10001A404(&qword_100025A98, &qword_100025A90);
    *(void *)(v11 + 72) = v10;
    id v12 = v10;
    id v13 = a3;
    sub_10001AAC0();
    sub_10001A9A0();
  }
  else
  {
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_10001B730;
    sub_100007084(&qword_100025208);
    uint64_t v15 = sub_10001AA70();
    uint64_t v17 = v16;
    *(void *)(v14 + 56) = &type metadata for String;
    *(void *)(v14 + 64) = sub_10000716C();
    *(void *)(v14 + 32) = v15;
    *(void *)(v14 + 40) = v17;
    sub_10001A9A0();
  }
  return swift_bridgeObjectRelease();
}

void sub_100017A34(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_10001A8E0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_100017AB0(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, void *))
{
  char v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v8);
  _Block_release(v8);
  _Block_release(v8);
}

unint64_t sub_100017B40(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007084((uint64_t *)&unk_100025A10);
  uint64_t v2 = sub_10001ABD0();
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
    sub_100007664(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100017C6C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000076CC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100017C6C(uint64_t a1, uint64_t a2)
{
  sub_10001AC40();
  sub_10001AA80();
  Swift::Int v4 = sub_10001AC50();

  return sub_100017CE4(a1, a2, v4);
}

unint64_t sub_100017CE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_10001ABF0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_10001ABF0() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_10001ABF0()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_100017E2C(uint64_t a1, _OWORD *a2, void *a3, uint64_t a4)
{
  v18[3] = type metadata accessor for ExtensionRequest();
  v18[4] = &off_100020FF8;
  v18[0] = a1;
  *(void *)(a4 + 168) = 0;
  *(void *)(a4 + 176) = 0;
  sub_100006E20((uint64_t)v18, (uint64_t)v17);
  *(void *)(a4 + 16) = a3;
  sub_100006E20((uint64_t)v17, a4 + 24);
  long long v8 = a2[3];
  *(_OWORD *)(a4 + 96) = a2[2];
  *(_OWORD *)(a4 + 112) = v8;
  *(_OWORD *)(a4 + 128) = a2[4];
  long long v9 = a2[1];
  *(_OWORD *)(a4 + 64) = *a2;
  *(_OWORD *)(a4 + 80) = v9;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  sub_100007084((uint64_t *)&unk_1000259F0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  BOOL v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = sub_10001A7F4;
  v13[4] = v10;
  uint64_t v14 = *(void *)(v11 + 16);
  *(void *)(v11 + 16) = sub_10001A7F8;
  *(void *)(v11 + 24) = v13;
  id v15 = a3;
  sub_100008A5C(v14);
  sub_100006F80((uint64_t)v17);
  *(void *)(a4 + 144) = v11;
  *(void *)(a4 + 152) = sub_100007CB0;
  *(void *)(a4 + 160) = 0;
  sub_100006F80((uint64_t)v18);
  return a4;
}

uint64_t sub_100017FA0(uint64_t a1, _OWORD *a2, void *a3, uint64_t a4)
{
  v18[3] = type metadata accessor for ExtensionRequest();
  v18[4] = &off_100020FF8;
  v18[0] = a1;
  *(void *)(a4 + 168) = 0;
  sub_100006E20((uint64_t)v18, (uint64_t)v17);
  *(void *)(a4 + 16) = a3;
  sub_100006E20((uint64_t)v17, a4 + 24);
  long long v8 = a2[3];
  *(_OWORD *)(a4 + 96) = a2[2];
  *(_OWORD *)(a4 + 112) = v8;
  *(_OWORD *)(a4 + 128) = a2[4];
  long long v9 = a2[1];
  *(_OWORD *)(a4 + 64) = *a2;
  *(_OWORD *)(a4 + 80) = v9;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  sub_100007084((uint64_t *)&unk_1000259F0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  BOOL v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = sub_10001A7F4;
  v13[4] = v10;
  uint64_t v14 = *(void *)(v11 + 16);
  *(void *)(v11 + 16) = sub_10001A7F8;
  *(void *)(v11 + 24) = v13;
  id v15 = a3;
  sub_100008A5C(v14);
  sub_100006F80((uint64_t)v17);
  *(void *)(a4 + 144) = v11;
  *(void *)(a4 + 152) = sub_100007CB0;
  *(void *)(a4 + 160) = 0;
  sub_100006F80((uint64_t)v18);
  return a4;
}

uint64_t sub_100018114(uint64_t a1, _OWORD *a2, void *a3, uint64_t a4)
{
  v18[3] = type metadata accessor for ExtensionRequest();
  v18[4] = &off_100020FF8;
  v18[0] = a1;
  *(void *)(a4 + 168) = 0;
  *(void *)(a4 + 176) = 0;
  sub_100006E20((uint64_t)v18, (uint64_t)v17);
  *(void *)(a4 + 16) = a3;
  sub_100006E20((uint64_t)v17, a4 + 24);
  long long v8 = a2[3];
  *(_OWORD *)(a4 + 96) = a2[2];
  *(_OWORD *)(a4 + 112) = v8;
  *(_OWORD *)(a4 + 128) = a2[4];
  long long v9 = a2[1];
  *(_OWORD *)(a4 + 64) = *a2;
  *(_OWORD *)(a4 + 80) = v9;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  sub_100007084((uint64_t *)&unk_1000259F0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  BOOL v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = sub_100016504;
  v13[4] = v10;
  uint64_t v14 = *(void *)(v11 + 16);
  *(void *)(v11 + 16) = sub_100016584;
  *(void *)(v11 + 24) = v13;
  id v15 = a3;
  sub_100008A5C(v14);
  sub_100006F80((uint64_t)v17);
  *(void *)(a4 + 144) = v11;
  *(void *)(a4 + 152) = sub_100007CB0;
  *(void *)(a4 + 160) = 0;
  sub_100006F80((uint64_t)v18);
  return a4;
}

uint64_t sub_100018288(void *a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v8 = sub_10001A9B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10001A9D0();
  uint64_t v12 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[3] = sub_100007B8C(0, &qword_100025A60);
  v25[4] = &off_1000215D8;
  v25[0] = a1;
  uint64_t v20 = *(void *)&a4[OBJC_IVAR____TtC38com_apple_IdentityLookup_MessageFilter29ReportClassificationOperation_queue];
  sub_100006E20((uint64_t)v25, (uint64_t)v24);
  id v15 = (void *)swift_allocObject();
  v15[2] = a4;
  v15[3] = a2;
  v15[4] = a3;
  sub_100007268(v24, (uint64_t)(v15 + 5));
  aBlock[4] = sub_10001A56C;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D05C;
  aBlock[3] = &unk_100022020;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = a1;
  uint64_t v18 = a4;
  swift_retain();
  sub_10001A9C0();
  uint64_t v22 = &_swiftEmptyArrayStorage;
  sub_10001A380((unint64_t *)&unk_100025A70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007084(&qword_100025030);
  sub_10001A594((unint64_t *)&qword_100025A80, &qword_100025030);
  sub_10001AB40();
  sub_10001AAF0();
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v21);
  swift_release();
  return sub_100006F80((uint64_t)v25);
}

uint64_t sub_1000185A4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100020910;
  v6._object = a2;
  unint64_t v4 = sub_10001ABE0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000185F0(char a1)
{
  uint64_t result = (uint64_t)[self currentConnection];
  if (result)
  {
    Swift::OpaquePointer v3 = (void *)result;
    if (sub_100016E38(a1, (void *)result, 0xD000000000000027, 0x800000010001CE50))
    {

      return 1;
    }
    else
    {
      if (qword_100024E70 != -1) {
        swift_once();
      }
      sub_10001AAB0();
      sub_100007084(&qword_100025038);
      uint64_t v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_10001B7D0;
      *(void *)(v4 + 56) = sub_100007B8C(0, &qword_100025A20);
      *(void *)(v4 + 64) = sub_10001A404(&qword_100025A28, &qword_100025A20);
      *(void *)(v4 + 32) = v3;
      id v5 = v3;
      uint64_t v6 = sub_10001AA70();
      uint64_t v8 = v7;
      *(void *)(v4 + 96) = &type metadata for String;
      *(void *)(v4 + 104) = sub_10000716C();
      *(void *)(v4 + 72) = v6;
      *(void *)(v4 + 80) = v8;
      sub_10001A9A0();
      swift_bridgeObjectRelease();

      return 0;
    }
  }
  return result;
}

id sub_1000187A8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  NSString v4 = sub_10001AA30();
  swift_bridgeObjectRelease();
  id v20 = 0;
  id v5 = [self extensionWithIdentifier:v4 error:&v20];

  if (v5)
  {
    uint64_t v6 = qword_100024E70;
    id v7 = v20;
    id v8 = v5;
    if (v6 != -1) {
      swift_once();
    }
    sub_100007084(&qword_100025038);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_10001B730;
    id v20 = v5;
    sub_100007084(&qword_100025A08);
    uint64_t v10 = sub_10001AA70();
    uint64_t v12 = v11;
    *(void *)(v9 + 56) = &type metadata for String;
    *(void *)(v9 + 64) = sub_10000716C();
    *(void *)(v9 + 32) = v10;
    *(void *)(v9 + 40) = v12;
    sub_10001AAC0();
    sub_10001A9A0();
  }
  else
  {
    id v13 = v20;
    uint64_t v14 = (void *)sub_10001A8F0();

    swift_willThrow();
    if (qword_100024E70 != -1) {
      swift_once();
    }
    sub_10001AAB0();
    sub_100007084(&qword_100025038);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_10001B7D0;
    *(void *)(v15 + 56) = &type metadata for String;
    unint64_t v16 = sub_10000716C();
    *(void *)(v15 + 64) = v16;
    *(void *)(v15 + 32) = a1;
    *(void *)(v15 + 40) = a2;
    id v20 = v14;
    swift_bridgeObjectRetain();
    swift_errorRetain();
    sub_100007084(&qword_100025A00);
    uint64_t v17 = sub_10001AA70();
    *(void *)(v15 + 96) = &type metadata for String;
    *(void *)(v15 + 104) = v16;
    *(void *)(v15 + 72) = v17;
    *(void *)(v15 + 80) = v18;
    sub_10001A9A0();
    swift_errorRelease();
    id v5 = 0;
  }
  swift_bridgeObjectRelease();
  return v5;
}

void sub_100018A60(void *a1)
{
  uint64_t v2 = sub_10001AAE0();
  uint64_t v24 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  NSString v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001AAD0();
  __chkstk_darwin(v5);
  uint64_t v6 = sub_10001A9D0();
  __chkstk_darwin(v6 - 8);
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10001B730;
  *(void *)(v7 + 56) = sub_100007B8C(0, &qword_100025A60);
  *(void *)(v7 + 64) = sub_10001A404(&qword_100025A68, &qword_100025A60);
  *(void *)(v7 + 32) = a1;
  id v8 = a1;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  id v9 = [v8 extensionIdentifier];
  uint64_t v10 = sub_10001AA40();
  uint64_t v12 = v11;

  id v13 = sub_1000187A8(v10, v12);
  swift_bridgeObjectRelease();
  if (v13)
  {
    id v23 = v8;
    sub_100007B8C(0, &qword_1000259C0);
    id v14 = v13;
    sub_10001A9C0();
    uint64_t v25 = &_swiftEmptyArrayStorage;
    sub_10001A380(&qword_1000259C8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
    sub_100007084(&qword_1000259D0);
    sub_10001A594(&qword_1000259D8, &qword_1000259D0);
    sub_10001AB40();
    (*(void (**)(char *, void, uint64_t))(v24 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
    uint64_t v15 = (void *)sub_10001AB00();
    id v16 = objc_allocWithZone((Class)type metadata accessor for ReportClassificationOperation());
    uint64_t v17 = (char *)sub_100014E34(v14, v15);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = swift_allocObject();
      id v20 = v23;
      *(void *)(v19 + 16) = v23;
      id v21 = v20;
      sub_100018288(v21, (uint64_t)sub_10001A51C, v19, v18);

      swift_release();
    }
  }
}

void sub_100018E70(void *a1, void (**a2)(void, void, void))
{
  uint64_t v32 = sub_10001AAE0();
  uint64_t v30 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  unint64_t v31 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001AAD0();
  __chkstk_darwin(v5);
  uint64_t v6 = sub_10001A9D0();
  __chkstk_darwin(v6 - 8);
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = a2;
  _Block_copy(a2);
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10001B730;
  *(void *)(v7 + 56) = sub_100007B8C(0, (unint64_t *)&unk_100025A50);
  *(void *)(v7 + 64) = sub_10001A404((unint64_t *)&qword_100025378, (unint64_t *)&unk_100025A50);
  *(void *)(v7 + 32) = a1;
  id v8 = a1;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  if (sub_1000185F0(0))
  {
    id v9 = [v8 extensionIdentifier];
    uint64_t v10 = sub_10001AA40();
    uint64_t v12 = v11;

    id v13 = sub_1000187A8(v10, v12);
    swift_bridgeObjectRelease();
    if (v13)
    {
      id v14 = v13;
      sub_100008734(v14, v38);
      sub_10001A454((uint64_t)v38, (uint64_t)v39, &qword_1000259B8);
      if (*((void *)&v39[0] + 1))
      {
        _OWORD v40[2] = v39[2];
        v40[3] = v39[3];
        v40[4] = v39[4];
        v40[0] = v39[0];
        v40[1] = v39[1];
        sub_100007B8C(0, &qword_1000259C0);
        sub_10001A9C0();
        *(void *)&long long v35 = &_swiftEmptyArrayStorage;
        sub_10001A380(&qword_1000259C8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
        sub_100007084(&qword_1000259D0);
        sub_10001A594(&qword_1000259D8, &qword_1000259D0);
        sub_10001AB40();
        (*(void (**)(char *, void, uint64_t))(v30 + 104))(v31, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v32);
        uint64_t v15 = (void *)sub_10001AB00();
        uint64_t v36 = sub_100007B8C(0, (unint64_t *)&qword_1000259E0);
        uint64_t v37 = &off_100020F78;
        *(void *)&long long v35 = v14;
        uint64_t v16 = type metadata accessor for ExtensionRequest();
        uint64_t v17 = swift_allocObject();
        *(_OWORD *)(v17 + 32) = 0u;
        *(void *)(v17 + 48) = 0;
        *(_OWORD *)(v17 + 16) = 0u;
        *(void *)(v17 + 64) = 0;
        *(void *)(v17 + 72) = 0;
        sub_100007268(&v35, (uint64_t)v34);
        swift_beginAccess();
        id v18 = v14;
        id v19 = v15;
        sub_10000D244((uint64_t)v34, v17 + 16);
        swift_endAccess();
        *(void *)(v17 + 56) = v19;
        uint64_t v36 = v16;
        uint64_t v37 = (char **)&off_100020FF8;
        *(void *)&long long v35 = v17;
        type metadata accessor for QueryRequestOperation();
        uint64_t v20 = swift_allocObject();
        uint64_t v21 = sub_10000A0D8((uint64_t)&v35, v16);
        __chkstk_darwin(v21);
        id v23 = (uint64_t *)((char *)&v29 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
        (*(void (**)(uint64_t *))(v24 + 16))(v23);
        uint64_t v25 = *v23;
        id v26 = v19;
        swift_retain();
        sub_100017E2C(v25, v40, v26, v20);
        sub_100006F80((uint64_t)&v35);
        sub_100008A9C(v8, (uint64_t)sub_10001A4FC, v33);
        swift_release();

        swift_release();
        swift_release();
        return;
      }
    }
    type metadata accessor for ILMessageFilterPrivateError(0);
    *(void *)&long long v35 = 2;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_10001A380(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
  }
  else
  {
    type metadata accessor for ILMessageFilterPrivateError(0);
    *(void *)&v39[0] = 1;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_10001A380(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
  }
  sub_10001A8D0();
  uint64_t v27 = *(void **)&v40[0];
  uint64_t v28 = (void *)sub_10001A8E0();
  ((void (**)(void, void, void *))a2)[2](a2, 0, v28);
  swift_release();
}

void sub_100019564(void *a1, void (**a2)(void, void))
{
  uint64_t v32 = sub_10001AAE0();
  uint64_t v30 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  unint64_t v31 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001AAD0();
  __chkstk_darwin(v5);
  uint64_t v6 = sub_10001A9D0();
  __chkstk_darwin(v6 - 8);
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = a2;
  _Block_copy(a2);
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10001B730;
  *(void *)(v7 + 56) = sub_100007B8C(0, (unint64_t *)&qword_100025A40);
  *(void *)(v7 + 64) = sub_10001A404(&qword_1000255C8, (unint64_t *)&qword_100025A40);
  *(void *)(v7 + 32) = a1;
  id v8 = a1;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  if (sub_1000185F0(2))
  {
    id v9 = [v8 extensionIdentifier];
    uint64_t v10 = sub_10001AA40();
    uint64_t v12 = v11;

    id v13 = sub_1000187A8(v10, v12);
    swift_bridgeObjectRelease();
    if (v13)
    {
      id v14 = v13;
      sub_100008734(v14, v38);
      sub_10001A454((uint64_t)v38, (uint64_t)v39, &qword_1000259B8);
      if (*((void *)&v39[0] + 1))
      {
        _OWORD v40[2] = v39[2];
        v40[3] = v39[3];
        v40[4] = v39[4];
        v40[0] = v39[0];
        v40[1] = v39[1];
        sub_100007B8C(0, &qword_1000259C0);
        sub_10001A9C0();
        *(void *)&long long v35 = &_swiftEmptyArrayStorage;
        sub_10001A380(&qword_1000259C8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
        sub_100007084(&qword_1000259D0);
        sub_10001A594(&qword_1000259D8, &qword_1000259D0);
        sub_10001AB40();
        (*(void (**)(char *, void, uint64_t))(v30 + 104))(v31, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v32);
        uint64_t v15 = (void *)sub_10001AB00();
        uint64_t v36 = sub_100007B8C(0, (unint64_t *)&qword_1000259E0);
        uint64_t v37 = &off_100020F78;
        *(void *)&long long v35 = v14;
        uint64_t v16 = type metadata accessor for ExtensionRequest();
        uint64_t v17 = swift_allocObject();
        *(_OWORD *)(v17 + 32) = 0u;
        *(void *)(v17 + 48) = 0;
        *(_OWORD *)(v17 + 16) = 0u;
        *(void *)(v17 + 64) = 0;
        *(void *)(v17 + 72) = 0;
        sub_100007268(&v35, (uint64_t)v34);
        swift_beginAccess();
        id v18 = v14;
        id v19 = v15;
        sub_10000D244((uint64_t)v34, v17 + 16);
        swift_endAccess();
        *(void *)(v17 + 56) = v19;
        uint64_t v36 = v16;
        uint64_t v37 = (char **)&off_100020FF8;
        *(void *)&long long v35 = v17;
        type metadata accessor for ReportRequestOperation();
        uint64_t v20 = swift_allocObject();
        uint64_t v21 = sub_10000A0D8((uint64_t)&v35, v16);
        __chkstk_darwin(v21);
        id v23 = (uint64_t *)((char *)&v29 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
        (*(void (**)(uint64_t *))(v24 + 16))(v23);
        uint64_t v25 = *v23;
        id v26 = v19;
        swift_retain();
        sub_100017FA0(v25, v40, v26, v20);
        sub_100006F80((uint64_t)&v35);
        sub_10000D7C8(v8, (uint64_t)sub_10001A4B8, v33);
        swift_release();

        swift_release();
        swift_release();
        return;
      }
    }
    type metadata accessor for ILMessageFilterPrivateError(0);
    *(void *)&long long v35 = 2;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_10001A380(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
  }
  else
  {
    type metadata accessor for ILMessageFilterPrivateError(0);
    *(void *)&v39[0] = 1;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_10001A380(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
  }
  sub_10001A8D0();
  uint64_t v27 = *(void **)&v40[0];
  uint64_t v28 = (void *)sub_10001A8E0();
  ((void (**)(void, void *))a2)[2](a2, v28);
  swift_release();
}

void sub_100019C54(void *a1, void (**a2)(void, void, void))
{
  uint64_t v32 = sub_10001AAE0();
  uint64_t v30 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  unint64_t v31 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001AAD0();
  __chkstk_darwin(v5);
  uint64_t v6 = sub_10001A9D0();
  __chkstk_darwin(v6 - 8);
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = a2;
  _Block_copy(a2);
  if (qword_100024E70 != -1) {
    swift_once();
  }
  sub_100007084(&qword_100025038);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10001B730;
  *(void *)(v7 + 56) = sub_100007B8C(0, (unint64_t *)&unk_1000259A0);
  *(void *)(v7 + 64) = sub_10001A404((unint64_t *)&qword_1000257F0, (unint64_t *)&unk_1000259A0);
  *(void *)(v7 + 32) = a1;
  id v8 = a1;
  sub_10001AAC0();
  sub_10001A9A0();
  swift_bridgeObjectRelease();
  if (sub_1000185F0(0))
  {
    id v9 = [v8 extensionIdentifier];
    uint64_t v10 = sub_10001AA40();
    uint64_t v12 = v11;

    id v13 = sub_1000187A8(v10, v12);
    swift_bridgeObjectRelease();
    if (v13)
    {
      id v14 = v13;
      sub_100008734(v14, v38);
      sub_10001A454((uint64_t)v38, (uint64_t)v39, &qword_1000259B8);
      if (*((void *)&v39[0] + 1))
      {
        _OWORD v40[2] = v39[2];
        v40[3] = v39[3];
        v40[4] = v39[4];
        v40[0] = v39[0];
        v40[1] = v39[1];
        sub_100007B8C(0, &qword_1000259C0);
        sub_10001A9C0();
        *(void *)&long long v35 = &_swiftEmptyArrayStorage;
        sub_10001A380(&qword_1000259C8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
        sub_100007084(&qword_1000259D0);
        sub_10001A594(&qword_1000259D8, &qword_1000259D0);
        sub_10001AB40();
        (*(void (**)(char *, void, uint64_t))(v30 + 104))(v31, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v32);
        uint64_t v15 = (void *)sub_10001AB00();
        uint64_t v36 = sub_100007B8C(0, (unint64_t *)&qword_1000259E0);
        uint64_t v37 = &off_100020F78;
        *(void *)&long long v35 = v14;
        uint64_t v16 = type metadata accessor for ExtensionRequest();
        uint64_t v17 = swift_allocObject();
        *(_OWORD *)(v17 + 32) = 0u;
        *(void *)(v17 + 48) = 0;
        *(_OWORD *)(v17 + 16) = 0u;
        *(void *)(v17 + 64) = 0;
        *(void *)(v17 + 72) = 0;
        sub_100007268(&v35, (uint64_t)v34);
        swift_beginAccess();
        id v18 = v14;
        id v19 = v15;
        sub_10000D244((uint64_t)v34, v17 + 16);
        swift_endAccess();
        *(void *)(v17 + 56) = v19;
        uint64_t v36 = v16;
        uint64_t v37 = (char **)&off_100020FF8;
        *(void *)&long long v35 = v17;
        type metadata accessor for CapabilitiesQueryRequestOperation();
        uint64_t v20 = swift_allocObject();
        uint64_t v21 = sub_10000A0D8((uint64_t)&v35, v16);
        __chkstk_darwin(v21);
        id v23 = (uint64_t *)((char *)&v29 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
        (*(void (**)(uint64_t *))(v24 + 16))(v23);
        uint64_t v25 = *v23;
        id v26 = v19;
        swift_retain();
        sub_100018114(v25, v40, v26, v20);
        sub_100006F80((uint64_t)&v35);
        sub_100012A18(v8, (uint64_t)sub_10001A7F0, v33);
        swift_release();

        swift_release();
        swift_release();
        return;
      }
    }
    type metadata accessor for ILMessageFilterPrivateError(0);
    *(void *)&long long v35 = 2;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_10001A380(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
  }
  else
  {
    type metadata accessor for ILMessageFilterPrivateError(0);
    *(void *)&v39[0] = 1;
    sub_100017B40((uint64_t)&_swiftEmptyArrayStorage);
    sub_10001A380(&qword_1000259B0, type metadata accessor for ILMessageFilterPrivateError);
  }
  sub_10001A8D0();
  uint64_t v27 = *(void **)&v40[0];
  uint64_t v28 = (void *)sub_10001A8E0();
  ((void (**)(void, void, void *))a2)[2](a2, 0, v28);
  swift_release();
}

uint64_t sub_10001A348()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001A380(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001A3C8()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001A404(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007B8C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001A454(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007084(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_10001A4B8(uint64_t a1)
{
  sub_100017A34(a1, *(void *)(v1 + 16));
}

uint64_t sub_10001A4C0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001A4FC(uint64_t a1, uint64_t a2)
{
  sub_100012644(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10001A51C(void *a1, uint64_t a2)
{
  return sub_100017668(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_10001A524()
{
  swift_release();
  sub_100006F80(v0 + 40);

  return _swift_deallocObject(v0, 80, 7);
}

void sub_10001A56C()
{
  sub_100015178(*(char **)(v0 + 16), *(void (**)(void, void))(v0 + 24), *(void *)(v0 + 32), v0 + 40);
}

uint64_t sub_10001A57C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001A58C()
{
  return swift_release();
}

uint64_t sub_10001A594(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007124(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for MessageFilterManager.EntitlementCapability(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MessageFilterManager.EntitlementCapability(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MessageFilterManager.EntitlementCapability(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001A750);
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

uint64_t sub_10001A778(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001A780(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessageFilterManager.EntitlementCapability()
{
  return &type metadata for MessageFilterManager.EntitlementCapability;
}

unint64_t sub_10001A79C()
{
  unint64_t result = qword_100025AA0;
  if (!qword_100025AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025AA0);
  }
  return result;
}

uint64_t sub_10001A810()
{
  return URLRequest.httpMethod.setter();
}

Class sub_10001A820()
{
  return URLRequest._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_10001A830()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t sub_10001A840()
{
  return URLRequest.httpBody.setter();
}

void sub_10001A850(Swift::String_optional _, Swift::String forHTTPHeaderField)
{
}

uint64_t sub_10001A860()
{
  return type metadata accessor for URLRequest();
}

uint64_t sub_10001A8D0()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t sub_10001A8E0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10001A8F0()
{
  return _convertNSErrorToError(_:)();
}

void sub_10001A900(NSURL *retstr@<X8>)
{
}

uint64_t sub_10001A910()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001A920()
{
  return URL.host.getter();
}

uint64_t sub_10001A930()
{
  return URL.scheme.getter();
}

uint64_t sub_10001A940()
{
  return URL.init(string:)();
}

uint64_t sub_10001A950()
{
  return type metadata accessor for URL();
}

NSData sub_10001A960()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10001A970()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSUUID sub_10001A980()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_10001A990()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10001A9A0()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_10001A9B0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10001A9C0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10001A9D0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10001A9E0()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_10001A9F0()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary sub_10001AA00()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10001AA10()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001AA20()
{
  return dispatch thunk of Hashable.hash(into:)();
}

NSString sub_10001AA30()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001AA40()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001AA50()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10001AA60()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_10001AA70()
{
  return String.init<A>(reflecting:)();
}

uint64_t sub_10001AA80()
{
  return String.hash(into:)();
}

NSArray sub_10001AA90()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10001AAA0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001AAB0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10001AAC0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10001AAD0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10001AAE0()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10001AAF0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10001AB00()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10001AB10()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_10001AB20()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_10001AB30()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10001AB40()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10001AB50()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_10001AB60(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10001AB70()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10001AB80()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10001AB90()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10001ABA0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10001ABB0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10001ABC0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10001ABD0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_10001ABE0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10001ABF0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001AC00()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001AC30()
{
  return Error._userInfo.getter();
}

uint64_t sub_10001AC40()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10001AC50()
{
  return Hasher._finalize()();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_deallocUninitializedObject()
{
  return _swift_deallocUninitializedObject();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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