void *sub_1000021F4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100002204(void *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for AVAudioDeviceTestSequenceOutputMode()
{
  if (!qword_100031AE0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100031AE0);
    }
  }
}

void sub_10000226C(uint64_t a1)
{
}

void sub_100002288(uint64_t a1)
{
}

void sub_1000022A4(uint64_t a1)
{
}

void sub_1000022C0(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100021890();
  id v5 = [self UUIDWithString:v4];

  *a3 = v5;
}

id sub_100002328(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t), uint64_t a4)
{
  v56 = a3;
  uint64_t v57 = a4;
  uint64_t v7 = sub_1000217B0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000217D0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000217F0();
  uint64_t v16 = __chkstk_darwin(v15);
  v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  v22 = &v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxSerial];
  if (*(void *)&v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxSerial + 8])
  {
    sub_1000219E0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100021790();
    v23 = (void *)*sub_10000B198(&v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate], *(void *)&v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24]);
    id v24 = [v23 result];
    Class isa = sub_1000219B0().super.super.isa;
    [v24 setStatusCode:isa];

    return [v23 setFinished:1];
  }
  else
  {
    v48 = (char *)&v48 - v20;
    uint64_t v49 = v21;
    uint64_t v50 = v19;
    v51 = v14;
    uint64_t v52 = v12;
    v53 = v10;
    uint64_t v54 = v11;
    uint64_t v55 = v8;
    *(void *)v22 = a1;
    *((void *)v22 + 1) = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v27 = &v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxConnectionCompletion];
    uint64_t v28 = *(void *)&v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxConnectionCompletion];
    uint64_t v29 = v57;
    *(void *)v27 = v56;
    *((void *)v27 + 1) = v29;
    swift_retain();
    id result = (id)sub_10000B290(v28);
    v30 = *(void **)&v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager];
    if (v30)
    {
      v31 = v4;
      sub_100009DF0(&qword_100032128);
      uint64_t v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = xmmword_100023940;
      uint64_t v33 = qword_100031A60;
      id v34 = v30;
      uint64_t v57 = v7;
      v35 = v53;
      v36 = v51;
      if (v33 != -1) {
        swift_once();
      }
      v37 = (void *)qword_1000393B0;
      *(void *)(v32 + 32) = qword_1000393B0;
      aBlock[0] = v32;
      sub_1000219A0();
      sub_10000B730(0, &qword_1000320F0);
      id v38 = v37;
      Class v39 = sub_100021970().super.isa;
      swift_bridgeObjectRelease();
      [v34 scanForPeripheralsWithServices:v39 options:0];

      sub_10000B730(0, &qword_1000321B0);
      v40 = (void *)sub_100021A20();
      sub_1000217E0();
      v41 = v48;
      sub_100021800();
      v56 = *(void (**)(char *, uint64_t))(v49 + 8);
      v42 = v18;
      uint64_t v43 = v50;
      v56(v42, v50);
      uint64_t v44 = swift_allocObject();
      *(void *)(v44 + 16) = v31;
      aBlock[4] = sub_10000B850;
      aBlock[5] = v44;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100002AB8;
      aBlock[3] = &unk_10002CC78;
      v45 = _Block_copy(aBlock);
      id v46 = v31;
      swift_release();
      sub_1000217C0();
      aBlock[0] = _swiftEmptyArrayStorage;
      sub_10000B7C4(&qword_1000321B8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100009DF0(&qword_1000321C0);
      sub_10000B80C(&qword_1000321C8, &qword_1000321C0);
      uint64_t v47 = v57;
      sub_100021A80();
      sub_100021A10();
      _Block_release(v45);

      (*(void (**)(char *, uint64_t))(v55 + 8))(v35, v47);
      (*(void (**)(char *, uint64_t))(v52 + 8))(v36, v54);
      return (id)((uint64_t (*)(char *, uint64_t))v56)(v41, v43);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

char *sub_10000296C(char *result)
{
  if (!*(void *)&result[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBox])
  {
    uint64_t v1 = result;
    sub_1000219D0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100021790();
    id result = *(char **)&v1[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager];
    if (result)
    {
      [result stopScan];
      v2 = (void *)*sub_10000B198(&v1[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate], *(void *)&v1[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24]);
      id v3 = [v2 result];
      Class isa = sub_1000219B0().super.super.isa;
      [v3 setStatusCode:isa];

      return (char *)[v2 setFinished:1];
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_100002AB8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100002AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = v4;
  uint64_t v32 = a3;
  uint64_t v35 = sub_1000217B0();
  uint64_t v38 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  id v34 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000217D0();
  uint64_t v36 = *(void *)(v10 - 8);
  uint64_t v37 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000217F0();
  uint64_t v33 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v31 - v18;
  uint64_t v20 = &v5[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedAudioBoxToken];
  *(void *)uint64_t v20 = a1;
  *((void *)v20 + 1) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = &v5[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion];
  uint64_t v22 = *(void *)&v5[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion];
  *(void *)uint64_t v21 = v32;
  *((void *)v21 + 1) = a4;
  swift_retain();
  sub_10000B290(v22);
  sub_10000B730(0, &qword_1000321B0);
  v23 = (void *)sub_100021A20();
  sub_1000217E0();
  sub_100021800();
  id v24 = *(void (**)(char *, uint64_t))(v14 + 8);
  v24(v17, v13);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v5;
  aBlock[4] = sub_10000B7A4;
  aBlock[5] = v25;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100002AB8;
  aBlock[3] = &unk_10002CC28;
  v26 = _Block_copy(aBlock);
  v27 = v5;
  swift_release();
  sub_1000217C0();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10000B7C4(&qword_1000321B8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100009DF0(&qword_1000321C0);
  sub_10000B80C(&qword_1000321C8, &qword_1000321C0);
  uint64_t v28 = v34;
  uint64_t v29 = v35;
  sub_100021A80();
  sub_100021A10();
  _Block_release(v26);

  (*(void (**)(char *, uint64_t))(v38 + 8))(v28, v29);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v37);
  return ((uint64_t (*)(char *, uint64_t))v24)(v19, v33);
}

unsigned char *sub_100002F30(unsigned char *result)
{
  if ((result[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isAudioBoxAuthenticated] & 1) == 0)
  {
    uint64_t v1 = result;
    sub_1000219D0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100021790();
    uint64_t v2 = (void *)*sub_10000B198(&v1[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate], *(void *)&v1[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24]);
    id v3 = [v2 result];
    Class isa = sub_1000219B0().super.super.isa;
    [v3 setStatusCode:isa];

    return [v2 setFinished:1];
  }
  return result;
}

id sub_10000305C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v6 = (uint64_t *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedAudioBoxToken);
  uint64_t v7 = *(void *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedAudioBoxToken + 8);
  if (v7 && (*v6 == a1 ? (BOOL v8 = v7 == a2) : (BOOL v8 = 0), v8 || (sub_100021C40() & 1) != 0))
  {
    sub_1000219F0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100023950;
    *(void *)(v9 + 56) = &type metadata for String;
    *(void *)(v9 + 64) = sub_100009E38();
    *(void *)(v9 + 32) = a1;
    *(void *)(v9 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_100021790();
    swift_bridgeObjectRelease();
    *(unsigned char *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isAudioBoxAuthenticated) = 1;
    uint64_t v10 = (uint64_t *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion);
    uint64_t v11 = *(void (**)(uint64_t))(v3
                                         + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion);
    if (v11)
    {
      uint64_t v12 = swift_retain();
      v11(v12);
      sub_10000B290((uint64_t)v11);
      uint64_t v13 = *v10;
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t *v10 = 0;
    v10[1] = 0;
    return (id)sub_10000B290(v13);
  }
  else
  {
    sub_1000219D0();
    sub_100009DF0(&qword_1000320B0);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_100023960;
    *(void *)(v14 + 56) = &type metadata for String;
    id result = (id)sub_100009E38();
    *(void *)(v14 + 64) = result;
    *(void *)(v14 + 32) = a1;
    *(void *)(v14 + 40) = a2;
    uint64_t v16 = v6[1];
    if (v16)
    {
      uint64_t v17 = *v6;
      *(void *)(v14 + 96) = &type metadata for String;
      *(void *)(v14 + 104) = result;
      *(void *)(v14 + 72) = v17;
      *(void *)(v14 + 80) = v16;
      sub_10000B730(0, (unint64_t *)&qword_1000321A8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v18 = (void *)sub_100021A40();
      sub_100021790();
      swift_bridgeObjectRelease();

      uint64_t v19 = (void *)*sub_10000B198((void *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
      id v20 = [v19 result];
      Class isa = sub_1000219B0().super.super.isa;
      [v20 setStatusCode:isa];

      return [v19 setFinished:1];
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_100003354(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_100021630();
  swift_allocObject();
  sub_100021620();
  sub_10000B66C(a1, (uint64_t)v14);
  sub_10000B6C8();
  uint64_t v4 = sub_100021610();
  unint64_t v6 = v5;
  swift_release();
  uint64_t v7 = *(void **)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBox);
  if (v7
    && (BOOL v8 = *(void **)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagingCharacteristic)) != 0)
  {
    sub_100008C2C(v4, v6);
    id v9 = v7;
    id v10 = v8;
    sub_1000094FC(v4, v6, v9, (uint64_t)v10);
    sub_100008C84(v4, v6);
    sub_100008C84(v4, v6);
  }
  else
  {
    sub_1000219D0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100021790();
    uint64_t v11 = (void *)*sub_10000B198((void *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    id v12 = [v11 result];
    Class isa = sub_1000219B0().super.super.isa;
    [v12 setStatusCode:isa];

    [v11 setFinished:1];
    sub_100008C84(v4, v6);
  }
}

uint64_t sub_1000036A8()
{
  uint64_t v1 = OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagePacketsReceived;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagePacketsReceived);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (unint64_t *)(v2 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      unint64_t v6 = *v4;
      sub_100008C2C(v5, *v4);
      sub_100021760();
      sub_100008C84(v5, v6);
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  *(void *)(v0 + v1) = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  sub_100021600();
  swift_allocObject();
  sub_1000215F0();
  sub_100008C2C(0, 0xC000000000000000);
  sub_10000B428();
  sub_1000215E0();
  sub_100008C84(0, 0xC000000000000000);
  swift_release();
  sub_10000B47C((uint64_t)v16, (uint64_t)v15);
  sub_1000219F0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100009DF0(&qword_1000320B0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100023950;
  sub_10000B47C((uint64_t)v15, (uint64_t)v16);
  sub_10000B580((uint64_t)v15, (void (*)(void, void, void, void, void, void, void))sub_10000B4D8);
  uint64_t v8 = sub_100021900();
  uint64_t v10 = v9;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = sub_100009E38();
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v10;
  sub_100021790();
  swift_bridgeObjectRelease();
  sub_10000B47C((uint64_t)v15, (uint64_t)v16);
  if (!v17)
  {
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isAudioBoxAuthenticated))
    {
      sub_1000219D0();
      sub_100021790();
      goto LABEL_13;
    }
LABEL_12:
    sub_10000B198((void *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    sub_10001D074((uint64_t)v15);
    goto LABEL_13;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isAudioBoxAuthenticated)) {
    goto LABEL_12;
  }
  sub_1000219D0();
  sub_100021790();
  uint64_t v11 = (void *)*sub_10000B198((void *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
  id v12 = [v11 result];
  Class isa = sub_1000219B0().super.super.isa;
  [v12 setStatusCode:isa];

  [v11 setFinished:1];
LABEL_13:
  sub_10000B580((uint64_t)v15, (void (*)(void, void, void, void, void, void, void))sub_10000B5C4);
  return sub_100008C84(0, 0xC000000000000000);
}

void sub_100003B84(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v7 = v6;
  sub_1000219F0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100009DF0(&qword_1000320B0);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100023960;
  *(void *)(v13 + 56) = &type metadata for String;
  *(void *)(v13 + 64) = sub_100009E38();
  *(void *)(v13 + 32) = a1;
  *(void *)(v13 + 40) = a2;
  unint64_t v14 = a4 >> 62;
  uint64_t v15 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      LODWORD(v15) = HIDWORD(a3) - a3;
      if (__OFSUB__(HIDWORD(a3), a3))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        JUMPOUT(0x100003F24);
      }
      uint64_t v15 = (int)v15;
LABEL_8:
      uint64_t v32 = a5;
      *(void *)(v13 + 96) = &type metadata for Int;
      *(void *)(v13 + 104) = &protocol witness table for Int;
      *(void *)(v13 + 72) = v15;
      swift_bridgeObjectRetain();
      sub_100021790();
      swift_bridgeObjectRelease();
      uint64_t v19 = sub_1000098C8(a3, a4);
      uint64_t v21 = v20;
      uint64_t v22 = 0;
      switch((int)v14)
      {
        case 0:
          uint64_t v22 = BYTE6(a4);
          goto LABEL_14;
        case 1:
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v22 = HIDWORD(a3) - (int)a3;
LABEL_13:
          if ((v22 & 0x8000000000000000) == 0)
          {
LABEL_14:
            sub_100009DF0(&qword_1000320A8);
            uint64_t v25 = swift_allocObject();
            *(_OWORD *)(v25 + 16) = xmmword_100023950;
            *(void *)(v25 + 32) = a1;
            *(void *)(v25 + 40) = a2;
            *(void *)(v25 + 48) = v22;
            *(void *)(v25 + 56) = v19;
            *(void *)(v25 + 64) = v21;
            v34[0] = v25;
            memset(&v34[1], 0, 24);
            char v35 = 2;
            swift_bridgeObjectRetain();
            sub_100003354((uint64_t)v34);
            swift_bridgeObjectRelease();
            swift_beginAccess();
            sub_100021760();
            swift_endAccess();
            uint64_t v21 = 0;
            switch((int)v14)
            {
              case 0:
                uint64_t v21 = BYTE6(a4);
                goto LABEL_19;
              case 1:
                if (__OFSUB__(HIDWORD(a3), a3)) {
                  goto LABEL_29;
                }
                uint64_t v21 = HIDWORD(a3) - (int)a3;
LABEL_19:
                a3 = OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_filesToSend;
                uint64_t v19 = *(void *)(v7 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_filesToSend);
                swift_bridgeObjectRetain();
                a4 = a6;
                swift_retain();
                char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                *(void *)(v7 + a3) = v19;
                if (isUniquelyReferenced_nonNull_native) {
                  goto LABEL_20;
                }
                goto LABEL_24;
              case 2:
                uint64_t v27 = *(void *)(a3 + 16);
                uint64_t v26 = *(void *)(a3 + 24);
                uint64_t v21 = v26 - v27;
                if (!__OFSUB__(v26, v27)) {
                  goto LABEL_19;
                }
                goto LABEL_30;
              case 3:
                goto LABEL_19;
              default:
                goto LABEL_31;
            }
          }
          __break(1u);
LABEL_24:
          uint64_t v19 = (uint64_t)sub_1000090AC(0, *(void *)(v19 + 16) + 1, 1, (char *)v19);
          *(void *)(v7 + a3) = v19;
LABEL_20:
          unint64_t v30 = *(void *)(v19 + 16);
          unint64_t v29 = *(void *)(v19 + 24);
          if (v30 >= v29 >> 1)
          {
            uint64_t v19 = (uint64_t)sub_1000090AC((char *)(v29 > 1), v30 + 1, 1, (char *)v19);
            *(void *)(v7 + a3) = v19;
          }
          *(void *)(v19 + 16) = v30 + 1;
          uint64_t v31 = (void *)(v19 + 48 * v30);
          v31[4] = a1;
          v31[5] = a2;
          v31[6] = v21;
          v31[7] = v32;
          v31[8] = a4;
          v31[9] = 0;
          sub_100003F54();
          return;
        case 2:
          uint64_t v24 = *(void *)(a3 + 16);
          uint64_t v23 = *(void *)(a3 + 24);
          uint64_t v22 = v23 - v24;
          if (!__OFSUB__(v23, v24)) {
            goto LABEL_13;
          }
          goto LABEL_28;
        case 3:
          goto LABEL_14;
        default:
LABEL_31:
          JUMPOUT(0);
      }
    case 2uLL:
      uint64_t v17 = *(void *)(a3 + 16);
      uint64_t v16 = *(void *)(a3 + 24);
      BOOL v18 = __OFSUB__(v16, v17);
      uint64_t v15 = v16 - v17;
      if (!v18) {
        goto LABEL_8;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_8;
    default:
      uint64_t v15 = BYTE6(a4);
      goto LABEL_8;
  }
}

void sub_100003F54()
{
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel];
  if (!v3) {
    return;
  }
  id v4 = [v3 outputStream];
  if (!v4) {
    return;
  }
  id v75 = v4;
  if (![v4 hasSpaceAvailable])
  {

    return;
  }
  uint64_t v5 = (uint64_t *)&v0[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataToSend];
  swift_beginAccess();
  uint64_t v7 = *v5;
  unint64_t v6 = v5[1];
  uint64_t v8 = v75;
  switch(v6 >> 62)
  {
    case 1uLL:
      if ((v7 ^ (unint64_t)(v7 << 32)) >> 32) {
        goto LABEL_15;
      }
      goto LABEL_59;
    case 2uLL:
      uint64_t v10 = *(void *)(v7 + 16);
      uint64_t v11 = *(void *)(v7 + 24);
      if (v10 == v11) {
        goto LABEL_59;
      }
      if (v6 >> 62 == 2)
      {
        id v12 = v75;
        uint64_t v13 = v0;
        id v14 = v12;
        uint64_t v15 = v13;
        sub_100008C2C(v7, v6);
        swift_retain();
        swift_retain();
        uint64_t v2 = sub_100009E8C(v10, v11, v6 & 0x3FFFFFFFFFFFFFFFLL, v14, (uint64_t)v15);
        swift_release();
        swift_release();
        sub_100008C84(v7, v6);
      }
      else
      {
LABEL_15:
        uint64_t v16 = (void *)(int)v7;
        uint64_t v17 = v7 >> 32;
        if (v7 >> 32 < (int)v7)
        {
          __break(1u);
          goto LABEL_72;
        }
        id v18 = v75;
        uint64_t v19 = v0;
        sub_100008C2C(v7, v6);
        id v20 = v18;
        uint64_t v21 = v19;
        sub_100008C2C(v7, v6);
        uint64_t v2 = sub_100009E8C((int)v7, v7 >> 32, v6 & 0x3FFFFFFFFFFFFFFFLL, v20, (uint64_t)v21);
        sub_100008C84(v7, v6);
        sub_100008C84(v7, v6);
      }
LABEL_17:

      uint64_t v22 = (char *)[v75 streamError];
      if (v22)
      {
        uint64_t v23 = v22;
        sub_1000219D0();
        if (qword_100031A78 != -1) {
          goto LABEL_70;
        }
        while (1)
        {
          sub_100009DF0(&qword_1000320B0);
          uint64_t v24 = swift_allocObject();
          *(_OWORD *)(v24 + 16) = xmmword_100023950;
          v77 = v23;
          uint64_t v25 = v23;
          sub_100009DF0((uint64_t *)&unk_100032C10);
          uint64_t v26 = sub_100021900();
          uint64_t v28 = v27;
          *(void *)(v24 + 56) = &type metadata for String;
          *(void *)(v24 + 64) = sub_100009E38();
          *(void *)(v24 + 32) = v26;
          *(void *)(v24 + 40) = v28;
          sub_100021790();
          swift_bridgeObjectRelease();
          unint64_t v29 = &v0[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_filesToSend];
          unint64_t v30 = *(void **)&v0[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_filesToSend];
          if (v30[2])
          {
            uint64_t v32 = (void (*)(char *))v30[7];
            uint64_t v31 = (char *)v30[8];
            uint64_t v33 = v25;
            swift_retain();
            uint64_t v0 = v31;
            v32(v23);

            swift_release();
            if (*(void *)(*(void *)v29 + 16))
            {
              swift_bridgeObjectRetain();
              swift_retain();
              sub_100009F40(0, 1);

              swift_release();
              swift_bridgeObjectRelease();
              return;
            }
          }
LABEL_69:
          __break(1u);
LABEL_70:
          swift_once();
        }
      }
      v70 = v5;
      v0 += OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_filesToSend;
      uint64_t v16 = &type metadata for Int;
      uint64_t v1 = &protocol witness table for Int;
      long long v71 = xmmword_100023980;
      uint64_t v69 = v2;
      while (1)
      {
        uint64_t v17 = *(void *)v0;
        if (!*(void *)(*(void *)v0 + 16) || v2 < 1) {
          goto LABEL_47;
        }
        uint64_t v34 = *(void *)(v17 + 72);
        uint64_t v35 = *(void *)(v17 + 48);
        uint64_t v23 = (char *)(v35 - v34);
        if (__OFSUB__(v35, v34))
        {
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
LABEL_67:
          __break(1u);
LABEL_68:
          __break(1u);
          goto LABEL_69;
        }
        uint64_t v37 = *(void (**)(void))(v17 + 56);
        uint64_t v36 = *(char **)(v17 + 64);
        swift_bridgeObjectRetain();
        swift_retain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)uint64_t v0 = v17;
        if (v2 < (uint64_t)v23) {
          break;
        }
        if (isUniquelyReferenced_nonNull_native)
        {
          if (!*(void *)(v17 + 16)) {
            goto LABEL_62;
          }
        }
        else
        {
          uint64_t v17 = (uint64_t)sub_1000091C8(v17);
          *(void *)uint64_t v0 = v17;
          if (!*(void *)(v17 + 16)) {
            goto LABEL_62;
          }
        }
        uint64_t v39 = *(void *)(v17 + 72);
        BOOL v40 = __OFADD__(v39, v23);
        v41 = &v23[v39];
        if (v40) {
          goto LABEL_63;
        }
        v74 = v37;
        *(void *)(v17 + 72) = v41;
        sub_1000219F0();
        if (qword_100031A78 != -1) {
          swift_once();
        }
        sub_100009DF0(&qword_1000320B0);
        uint64_t v42 = swift_allocObject();
        *(_OWORD *)(v42 + 16) = xmmword_100023980;
        uint64_t v43 = *(void **)v0;
        if (!*(void *)(*(void *)v0 + 16)) {
          goto LABEL_64;
        }
        uint64_t v44 = (void *)v42;
        v72 = v23;
        uint64_t v73 = v2;
        v45 = v0;
        uint64_t v0 = (char *)v43[4];
        uint64_t v23 = (char *)v43[5];
        *(void *)(v42 + 56) = &type metadata for String;
        *(void *)(v42 + 64) = sub_100009E38();
        v44[4] = v0;
        v44[5] = v23;
        if (!v43[2]) {
          goto LABEL_65;
        }
        uint64_t v46 = v43[9];
        v44[12] = &type metadata for Int;
        v44[13] = &protocol witness table for Int;
        v44[9] = v46;
        if (!v43[2]) {
          goto LABEL_66;
        }
        uint64_t v47 = v43[6];
        v44[17] = &type metadata for Int;
        v44[18] = &protocol witness table for Int;
        v44[14] = v47;
        swift_bridgeObjectRetain();
        sub_100021790();
        swift_bridgeObjectRelease();
        uint64_t v0 = v36;
        v74(0);
        if (!*(void *)(*(void *)v45 + 16)) {
          goto LABEL_67;
        }
        uint64_t v0 = v45;
        swift_bridgeObjectRetain();
        swift_retain();
        sub_100009F40(0, 1);
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        v2 -= (uint64_t)v72;
        if (__OFSUB__(v73, v72)) {
          goto LABEL_68;
        }
      }
      if (isUniquelyReferenced_nonNull_native)
      {
        if (*(void *)(v17 + 16)) {
          goto LABEL_43;
        }
LABEL_73:
        __break(1u);
        goto LABEL_74;
      }
LABEL_72:
      uint64_t v17 = (uint64_t)sub_1000091C8(v17);
      *(void *)uint64_t v0 = v17;
      if (!*(void *)(v17 + 16)) {
        goto LABEL_73;
      }
LABEL_43:
      uint64_t v48 = *(void *)(v17 + 72);
      BOOL v40 = __OFADD__(v48, v2);
      uint64_t v49 = v48 + v2;
      if (v40)
      {
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      *(void *)(v17 + 72) = v49;
      sub_1000219F0();
      if (qword_100031A78 == -1) {
        goto LABEL_45;
      }
LABEL_75:
      swift_once();
LABEL_45:
      uint64_t v50 = v16;
      sub_100009DF0(&qword_1000320B0);
      uint64_t v51 = swift_allocObject();
      *(_OWORD *)(v51 + 16) = v71;
      uint64_t v52 = *(void **)v0;
      if (!*(void *)(*(void *)v0 + 16))
      {
        __break(1u);
LABEL_77:
        __break(1u);
      }
      v53 = (void *)v51;
      uint64_t v55 = v52[4];
      uint64_t v54 = v52[5];
      *(void *)(v51 + 56) = &type metadata for String;
      *(void *)(v51 + 64) = sub_100009E38();
      v53[4] = v55;
      v53[5] = v54;
      uint64_t v56 = v52[9];
      v53[12] = v50;
      v53[13] = v1;
      v53[9] = v56;
      uint64_t v57 = v52[6];
      v53[17] = v50;
      v53[18] = v1;
      v53[14] = v57;
      swift_bridgeObjectRetain();
      sub_100021790();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_47:
      uint64_t v58 = *v70;
      unint64_t v59 = v70[1];
      switch(v59 >> 62)
      {
        case 1uLL:
          LODWORD(v60) = HIDWORD(v58) - v58;
          if (__OFSUB__(HIDWORD(v58), v58)) {
            goto LABEL_77;
          }
          uint64_t v60 = (int)v60;
LABEL_56:
          if (v69 < v60) {
            goto LABEL_57;
          }
          goto LABEL_53;
        case 2uLL:
          uint64_t v62 = *(void *)(v58 + 16);
          uint64_t v61 = *(void *)(v58 + 24);
          BOOL v40 = __OFSUB__(v61, v62);
          uint64_t v60 = v61 - v62;
          if (!v40) {
            goto LABEL_56;
          }
          __break(1u);
LABEL_52:
          if (v69 < 0)
          {
LABEL_57:
            sub_100008C2C(v58, v59);
            uint64_t v63 = sub_100021780();
            uint64_t v65 = v64;
            sub_100008C84(v58, v59);
            uint64_t v66 = *v70;
            unint64_t v67 = v70[1];
            uint64_t *v70 = v63;
            v70[1] = v65;
            uint64_t v68 = sub_100008C84(v66, v67);
            sub_100003F54(v68);
          }
          else
          {
LABEL_53:
            *(_OWORD *)v70 = xmmword_100023970;
            sub_100008C84(v58, v59);
          }
          uint64_t v8 = v75;
          break;
        case 3uLL:
          goto LABEL_52;
        default:
          uint64_t v60 = BYTE6(v59);
          goto LABEL_56;
      }
LABEL_59:

      return;
    case 3uLL:
      goto LABEL_59;
    default:
      if ((v6 & 0xFF000000000000) == 0) {
        goto LABEL_59;
      }
      v77 = (char *)*v5;
      __int16 v78 = v6;
      char v79 = BYTE2(v6);
      char v80 = BYTE3(v6);
      char v81 = BYTE4(v6);
      char v82 = BYTE5(v6);
      id v9 = v75;
      sub_100008CDC(&v77, v9, (uint64_t)v0, &v76);

      uint64_t v2 = v76;
      goto LABEL_17;
  }
}

uint64_t sub_100004900()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedFiles);
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataReceived);
  uint64_t result = swift_beginAccess();
  while (1)
  {
    uint64_t v4 = *v1;
    if (!*(void *)(*v1 + 16)) {
      return result;
    }
    uint64_t v5 = *(void *)(v4 + 40);
    uint64_t v6 = *(void *)(v4 + 64);
    v17[0] = *(void *)(v4 + 32);
    v17[1] = v5;
    long long v7 = *(_OWORD *)(v4 + 48);
    long long v18 = v7;
    uint64_t v19 = v6;
    uint64_t v8 = *v2;
    unint64_t v9 = v2[1];
    switch(v9 >> 62)
    {
      case 1uLL:
        LODWORD(v10) = HIDWORD(v8) - v8;
        if (__OFSUB__(HIDWORD(v8), v8)) {
          goto LABEL_17;
        }
        unint64_t v10 = (int)v10;
LABEL_8:
        if ((v10 & 0x8000000000000000) != 0 || v10 < (unint64_t)v7) {
          return result;
        }
        if ((v7 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_16:
          __break(1u);
LABEL_17:
          __break(1u);
LABEL_18:
          __break(1u);
          JUMPOUT(0x100004B14);
        }
LABEL_13:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_100008C2C(v8, v9);
        uint64_t v14 = sub_100021770();
        unint64_t v16 = v15;
        sub_100008C84(v8, v9);
        swift_beginAccess();
        sub_100021710();
        swift_endAccess();
        sub_100004B24(v14, v16, v17);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (!*(void *)(*v1 + 16)) {
          goto LABEL_16;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_100009CC8(0, 1);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = sub_100008C84(v14, v16);
        break;
      case 2uLL:
        uint64_t v12 = *(void *)(v8 + 16);
        uint64_t v11 = *(void *)(v8 + 24);
        BOOL v13 = __OFSUB__(v11, v12);
        unint64_t v10 = v11 - v12;
        if (!v13) {
          goto LABEL_8;
        }
        goto LABEL_18;
      case 3uLL:
        if (!(void)v7) {
          goto LABEL_13;
        }
        return result;
      default:
        unint64_t v10 = BYTE6(v9);
        goto LABEL_8;
    }
  }
}

id sub_100004B24(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v7 = sub_1000098C8(a1, a2);
  uint64_t v9 = v8;
  uint64_t v11 = a3[3];
  uint64_t v10 = a3[4];
  BOOL v12 = v7 == v11 && v8 == v10;
  if (v12 || (uint64_t v13 = v7, (sub_100021C40() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    sub_10000B198((void *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    return sub_10001DC64(*a3, a3[1], a1, a2, 0);
  }
  else
  {
    sub_1000219D0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_100023960;
    *(void *)(v15 + 56) = &type metadata for String;
    unint64_t v16 = sub_100009E38();
    *(void *)(v15 + 32) = v11;
    *(void *)(v15 + 40) = v10;
    *(void *)(v15 + 96) = &type metadata for String;
    *(void *)(v15 + 104) = v16;
    *(void *)(v15 + 64) = v16;
    *(void *)(v15 + 72) = v13;
    *(void *)(v15 + 80) = v9;
    swift_bridgeObjectRetain();
    sub_100021790();
    swift_bridgeObjectRelease();
    uint64_t v17 = sub_10000B198((void *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    uint64_t v19 = *a3;
    uint64_t v18 = a3[1];
    sub_10000B3D4();
    swift_allocError();
    uint64_t v20 = *v17;
    swift_errorRetain();
    sub_1000219D0();
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_100023950;
    swift_errorRetain();
    sub_100009DF0((uint64_t *)&unk_100032C10);
    uint64_t v22 = sub_100021900();
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 64) = v16;
    *(void *)(v21 + 32) = v22;
    *(void *)(v21 + 40) = v23;
    sub_100021790();
    id result = (id)swift_bridgeObjectRelease();
    v26[0] = v19;
    v26[1] = v18;
    long long v27 = xmmword_100023990;
    char v28 = 1;
    uint64_t v24 = *(void **)(v20 + OBJC_IVAR___AudioBoxController_bluetoothManager);
    if (v24)
    {
      swift_bridgeObjectRetain();
      id v25 = v24;
      sub_100003354((uint64_t)v26);
      swift_bridgeObjectRelease();

      swift_errorRelease();
      return (id)swift_errorRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_100004DE8(uint64_t a1)
{
  uint64_t v2 = sub_100021840();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B7C4(&qword_100032188, (void (*)(uint64_t))&type metadata accessor for SHA256Digest);
  uint64_t v6 = sub_100021940();
  uint64_t v37 = &_swiftEmptyArrayStorage;
  sub_1000092BC(0, v6 & ~(v6 >> 63), 0);
  uint64_t v7 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t result = sub_100021930();
  if ((v6 & 0x8000000000000000) == 0)
  {
    unint64_t v9 = v36;
    if (v6)
    {
      uint64_t v10 = *(void *)(v35 + 16);
      uint64_t v33 = v35;
      *(void *)&long long v34 = v10;
      uint64_t v32 = v35 + 32;
      long long v31 = xmmword_100023950;
      unint64_t v11 = v36;
      while ((void)v34 != v11)
      {
        if ((v9 & 0x8000000000000000) != 0) {
          goto LABEL_21;
        }
        if (v11 >= *(void *)(v33 + 16)) {
          goto LABEL_22;
        }
        char v12 = *(unsigned char *)(v32 + v11);
        sub_100009DF0(&qword_1000320B0);
        uint64_t v13 = swift_allocObject();
        *(_OWORD *)(v13 + 16) = v31;
        *(void *)(v13 + 56) = &type metadata for UInt8;
        *(void *)(v13 + 64) = &protocol witness table for UInt8;
        *(unsigned char *)(v13 + 32) = v12;
        uint64_t result = sub_1000218D0();
        uint64_t v14 = result;
        uint64_t v16 = v15;
        uint64_t v37 = v7;
        unint64_t v18 = v7[2];
        unint64_t v17 = v7[3];
        if (v18 >= v17 >> 1)
        {
          uint64_t result = (uint64_t)sub_1000092BC((char *)(v17 > 1), v18 + 1, 1);
          uint64_t v7 = v37;
        }
        v7[2] = v18 + 1;
        uint64_t v19 = &v7[2 * v18];
        v19[4] = v14;
        v19[5] = v16;
        ++v11;
        if (!--v6)
        {
          unint64_t v36 = v11;
          goto LABEL_12;
        }
      }
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
    }
    else
    {
      unint64_t v11 = v36;
LABEL_12:
      uint64_t v20 = v35;
      unint64_t v21 = *(void *)(v35 + 16);
      if (v11 == v21)
      {
LABEL_13:
        swift_bridgeObjectRelease();
        return (uint64_t)v7;
      }
      long long v34 = xmmword_100023950;
      while (v11 < v21)
      {
        char v22 = *(unsigned char *)(v20 + 32 + v11);
        unint64_t v36 = v11 + 1;
        sub_100009DF0(&qword_1000320B0);
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = v34;
        *(void *)(v23 + 56) = &type metadata for UInt8;
        *(void *)(v23 + 64) = &protocol witness table for UInt8;
        *(unsigned char *)(v23 + 32) = v22;
        uint64_t result = sub_1000218D0();
        uint64_t v24 = result;
        uint64_t v26 = v25;
        uint64_t v37 = v7;
        unint64_t v28 = v7[2];
        unint64_t v27 = v7[3];
        if (v28 >= v27 >> 1)
        {
          uint64_t result = (uint64_t)sub_1000092BC((char *)(v27 > 1), v28 + 1, 1);
          uint64_t v7 = v37;
        }
        v7[2] = v28 + 1;
        unint64_t v29 = &v7[2 * v28];
        v29[4] = v24;
        v29[5] = v26;
        unint64_t v11 = v36;
        unint64_t v21 = *(void *)(v20 + 16);
        if (v36 == v21) {
          goto LABEL_13;
        }
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1000051A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioBoxBluetoothManager();
  return [super dealloc];
}

uint64_t sub_10000539C()
{
  return type metadata accessor for AudioBoxBluetoothManager();
}

uint64_t type metadata accessor for AudioBoxBluetoothManager()
{
  uint64_t result = qword_100031F78;
  if (!qword_100031F78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000053F0()
{
  uint64_t result = sub_1000217A0();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

id sub_1000054D8(void *a1)
{
  switch((unint64_t)[a1 state])
  {
    case 1uLL:
      sub_1000219F0();
      if (qword_100031A78 != -1) {
        swift_once();
      }
      return (id)sub_100021790();
    case 2uLL:
      sub_1000219D0();
      if (qword_100031A78 != -1) {
        goto LABEL_27;
      }
      goto LABEL_15;
    case 3uLL:
      sub_10000B730(0, &qword_100032160);
      id v3 = [(id)swift_getObjCClassFromMetadata() authorization];
      sub_1000219D0();
      if (qword_100031A78 != -1) {
        swift_once();
      }
      sub_100009DF0(&qword_1000320B0);
      uint64_t v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_100023950;
      *(void *)(v4 + 56) = &type metadata for Int;
      *(void *)(v4 + 64) = &protocol witness table for Int;
      *(void *)(v4 + 32) = v3;
      sub_100021790();
      swift_bridgeObjectRelease();
      uint64_t v5 = (void *)*sub_10000B198((void *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
      id v6 = [v5 result];
      goto LABEL_16;
    case 4uLL:
      sub_1000219D0();
      if (qword_100031A78 == -1) {
        goto LABEL_15;
      }
      goto LABEL_27;
    case 5uLL:
      sub_1000219F0();
      if (qword_100031A78 != -1) {
        swift_once();
      }
      sub_100021790();
      *(unsigned char *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isBluetoothReady) = 1;
      uint64_t v8 = (uint64_t *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback);
      unint64_t v9 = *(void (**)(uint64_t))(v1
                                          + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback);
      if (v9)
      {
        uint64_t v10 = swift_retain();
        v9(v10);
        sub_10000B290((uint64_t)v9);
        uint64_t v11 = *v8;
      }
      else
      {
        uint64_t v11 = 0;
      }
      *uint64_t v8 = 0;
      v8[1] = 0;
      return (id)sub_10000B290(v11);
    default:
      sub_1000219D0();
      if (qword_100031A78 == -1) {
        goto LABEL_15;
      }
LABEL_27:
      swift_once();
LABEL_15:
      sub_100021790();
      uint64_t v5 = (void *)*sub_10000B198((void *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
      id v6 = [v5 result];
LABEL_16:
      Class isa = sub_1000219B0().super.super.isa;
      [v6 setStatusCode:isa];

      return [v5 setFinished:1];
  }
}

uint64_t sub_100005A68(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_100021AF0())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)sub_100021AC0();
LABEL_5:
      id v6 = v5;
      sub_10000B730(0, &qword_1000320F0);
      char v7 = sub_100021A30();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_100021A30();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      sub_100021AC0();
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_100021A30();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_100005BF0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100009DF0(&qword_100032150);
  uint64_t v2 = sub_100021B20();
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
    sub_10000B35C(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000200C8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    *char v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000B3C4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void sub_100005F4C(void *a1, uint64_t a2)
{
  sub_1000219C0();
  if (qword_100031A78 != -1) {
LABEL_25:
  }
    swift_once();
  sub_100009DF0(&qword_1000320B0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100023950;
  *(void *)(v5 + 56) = &type metadata for String;
  unint64_t v6 = sub_100009E38();
  *(void *)(v5 + 64) = v6;
  *(void *)(v5 + 32) = 0xD000000000000022;
  *(void *)(v5 + 40) = 0x8000000100022C10;
  sub_100021790();
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_errorRetain();
    sub_1000219D0();
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_100023950;
    swift_errorRetain();
    sub_100009DF0((uint64_t *)&unk_100032C10);
    uint64_t v8 = sub_100021900();
    *(void *)(v7 + 56) = &type metadata for String;
    *(void *)(v7 + 64) = v6;
    *(void *)(v7 + 32) = v8;
    *(void *)(v7 + 40) = v9;
    sub_100021790();
    swift_bridgeObjectRelease();
    char v10 = (void *)*sub_10000B198((void *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    id v11 = [v10 result];
    Class isa = sub_1000219B0().super.super.isa;
    [v11 setStatusCode:isa];

    [v10 setFinished:1];
    swift_errorRelease();
    return;
  }
  id v13 = [a1 services];
  if (!v13) {
    goto LABEL_28;
  }
  uint64_t v14 = v13;
  sub_10000B730(0, &qword_1000320E0);
  unint64_t v15 = sub_100021980();

  uint64_t v37 = v2;
  id v38 = a1;
  unint64_t v36 = v6;
  if (!(v15 >> 62))
  {
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v16) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_100021AF0();
  if (!v16)
  {
LABEL_27:
    swift_bridgeObjectRelease_n();
    uint64_t v2 = v37;
    a1 = v38;
    unint64_t v6 = v36;
LABEL_28:
    sub_1000219D0();
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_100023950;
    id v29 = [a1 services];
    if (v29)
    {
      uint64_t v30 = v29;
      sub_10000B730(0, &qword_1000320E0);
      sub_100021980();
    }
    sub_100009DF0(&qword_100032120);
    uint64_t v31 = sub_100021900();
    *(void *)(v28 + 56) = &type metadata for String;
    *(void *)(v28 + 64) = v6;
    *(void *)(v28 + 32) = v31;
    *(void *)(v28 + 40) = v32;
    sub_100021790();
    swift_bridgeObjectRelease();
    uint64_t v33 = (void *)*sub_10000B198((void *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    id v34 = [v33 result];
    Class v35 = sub_1000219B0().super.super.isa;
    [v34 setStatusCode:v35];

    [v33 setFinished:1];
    return;
  }
LABEL_7:
  uint64_t v2 = sub_10000B730(0, &qword_1000320E8);
  a1 = (void *)(v15 & 0xC000000000000001);
  uint64_t v17 = 4;
  while (1)
  {
    if (a1) {
      id v18 = (id)sub_100021AC0();
    }
    else {
      id v18 = *(id *)(v15 + 8 * v17);
    }
    uint64_t v19 = v18;
    uint64_t v20 = v17 - 3;
    if (__OFADD__(v17 - 4, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    id v21 = [v18 UUID];
    if (qword_100031A60 != -1) {
      swift_once();
    }
    a2 = sub_100021A30();

    if (a2) {
      break;
    }

    ++v17;
    if (v20 == v16) {
      goto LABEL_27;
    }
  }
  swift_bridgeObjectRelease_n();
  sub_100009DF0(&qword_100032128);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_1000239A0;
  if (qword_100031A68 != -1) {
    swift_once();
  }
  uint64_t v23 = (void *)qword_1000393B8;
  *(void *)(v22 + 32) = qword_1000393B8;
  uint64_t v24 = qword_100031A70;
  id v25 = v23;
  if (v24 != -1) {
    swift_once();
  }
  uint64_t v26 = (void *)qword_1000393C0;
  *(void *)(v22 + 40) = qword_1000393C0;
  sub_1000219A0();
  sub_10000B730(0, &qword_1000320F0);
  id v27 = v26;
  v39.super.Class isa = sub_100021970().super.isa;
  swift_bridgeObjectRelease();
  [v38 discoverCharacteristics:v39.super.isa forService:v19];
}

void sub_1000065FC(void *a1, id a2, unint64_t a3)
{
  sub_1000219C0();
  if (qword_100031A78 == -1) {
    goto LABEL_2;
  }
  while (1)
  {
    swift_once();
LABEL_2:
    sub_100009DF0(&qword_1000320B0);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_100023960;
    *(void *)(v5 + 56) = &type metadata for String;
    unint64_t v6 = sub_100009E38();
    *(void *)(v5 + 64) = v6;
    *(void *)(v5 + 32) = 0xD000000000000032;
    *(void *)(v5 + 40) = 0x8000000100022B20;
    a2 = a2;
    id v7 = [a2 description];
    uint64_t v8 = sub_1000218A0();
    uint64_t v10 = v9;

    *(void *)(v5 + 96) = &type metadata for String;
    *(void *)(v5 + 104) = v6;
    unint64_t v71 = v6;
    *(void *)(v5 + 72) = v8;
    *(void *)(v5 + 80) = v10;
    sub_100021790();
    swift_bridgeObjectRelease();
    sub_10000B730(0, &qword_1000320E8);
    id v11 = [a2 UUID];
    if (qword_100031A60 != -1) {
      swift_once();
    }
    char v12 = sub_100021A30();

    if ((v12 & 1) == 0) {
      break;
    }
    if (a3)
    {
      swift_errorRetain();
      sub_1000219D0();
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_100023950;
      swift_errorRetain();
      sub_100009DF0((uint64_t *)&unk_100032C10);
      uint64_t v14 = sub_100021900();
      *(void *)(v13 + 56) = &type metadata for String;
      *(void *)(v13 + 64) = v6;
      *(void *)(v13 + 32) = v14;
      *(void *)(v13 + 40) = v15;
      sub_100021790();
      swift_bridgeObjectRelease();
      uint64_t v16 = (void *)*sub_10000B198((void *)(v72 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v72 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
      id v17 = [v16 result];
      Class isa = sub_1000219B0().super.super.isa;
      [v17 setStatusCode:isa];

      [v16 setFinished:1];
      swift_errorRelease();
      return;
    }
    id v19 = [a2 characteristics];
    if (!v19) {
      goto LABEL_53;
    }
    uint64_t v20 = v19;
    sub_10000B730(0, &qword_100032118);
    a3 = sub_100021980();

    if (!(a3 >> 62))
    {
      uint64_t v21 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v21) {
        goto LABEL_10;
      }
LABEL_52:
      swift_bridgeObjectRelease_n();
LABEL_53:
      sub_1000219D0();
      uint64_t v59 = swift_allocObject();
      *(_OWORD *)(v59 + 16) = xmmword_100023950;
      id v60 = [a2 characteristics];
      if (v60)
      {
        uint64_t v61 = v60;
        sub_10000B730(0, &qword_100032118);
        sub_100021980();
      }
      sub_100009DF0(&qword_100032110);
      uint64_t v62 = sub_100021900();
      *(void *)(v59 + 56) = &type metadata for String;
      *(void *)(v59 + 64) = v71;
      *(void *)(v59 + 32) = v62;
      *(void *)(v59 + 40) = v63;
      sub_100021790();
      swift_bridgeObjectRelease();
      uint64_t v64 = (void *)*sub_10000B198((void *)(v72 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v72 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
      id v65 = [v64 result];
      Class v66 = sub_1000219B0().super.super.isa;
      [v65 setStatusCode:v66];

      [v64 setFinished:1];
      return;
    }
LABEL_51:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_100021AF0();
    if (!v21) {
      goto LABEL_52;
    }
LABEL_10:
    unint64_t v73 = a3 & 0xC000000000000001;
    uint64_t v22 = 4;
    while (1)
    {
      id v23 = v73 ? (id)sub_100021AC0() : *(id *)(a3 + 8 * v22);
      uint64_t v24 = v23;
      uint64_t v25 = v22 - 3;
      if (__OFADD__(v22 - 4, 1)) {
        break;
      }
      id v26 = [v23 UUID];
      if (qword_100031A68 != -1) {
        swift_once();
      }
      char v27 = sub_100021A30();

      if (v27)
      {
        uint64_t v28 = 4;
        while (1)
        {
          id v29 = v73 ? (id)sub_100021AC0() : *(id *)(a3 + 8 * v28);
          uint64_t v30 = v29;
          uint64_t v31 = v28 - 3;
          if (__OFADD__(v28 - 4, 1)) {
            break;
          }
          id v32 = [v29 UUID];
          if (qword_100031A70 != -1) {
            swift_once();
          }
          char v33 = sub_100021A30();

          if (v33)
          {
            swift_bridgeObjectRelease();
            sub_10000B730(0, &qword_1000320F0);
            if (v21 < 1)
            {
              __break(1u);
              return;
            }
            uint64_t v34 = 0;
            uint64_t v68 = OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capPSMCharacteristic;
            uint64_t v69 = OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagingCharacteristic;
            long long v67 = xmmword_100023950;
            uint64_t v35 = v72;
            unint64_t v36 = a1;
            while (1)
            {
              if (v73) {
                id v39 = (id)sub_100021AC0();
              }
              else {
                id v39 = *(id *)(a3 + 8 * v34 + 32);
              }
              BOOL v40 = v39;
              id v41 = [v39 UUID:v67];
              uint64_t v42 = (void *)qword_1000393B8;
              id v43 = v41;
              id v44 = v42;
              char v45 = sub_100021A30();

              if (v45)
              {

                uint64_t v37 = *(void **)(v35 + v69);
                *(void *)(v35 + v69) = v40;
                id v38 = v40;
              }
              else
              {
                id v46 = (id)qword_1000393C0;
                char v47 = sub_100021A30();

                if ((v47 & 1) == 0)
                {
                  sub_1000219D0();
                  uint64_t v49 = swift_allocObject();
                  *(_OWORD *)(v49 + 16) = v67;
                  id v50 = [v40 UUID];
                  id v51 = [v50 UUIDString];

                  uint64_t v52 = sub_1000218A0();
                  uint64_t v54 = v53;

                  uint64_t v35 = v72;
                  *(void *)(v49 + 56) = &type metadata for String;
                  *(void *)(v49 + 64) = v71;
                  *(void *)(v49 + 32) = v52;
                  *(void *)(v49 + 40) = v54;
                  unint64_t v36 = a1;
                  sub_100021790();
                  swift_bridgeObjectRelease();
                  goto LABEL_34;
                }
                uint64_t v48 = *(void **)(v35 + v68);
                *(void *)(v35 + v68) = v40;
                id v38 = v40;

                [v36 readValueForCharacteristic:v38];
              }
              [v36 setNotifyValue:1 forCharacteristic:v38];
LABEL_34:
              ++v34;

              if (v21 == v34)
              {
                swift_bridgeObjectRelease();
                uint64_t v55 = (uint64_t *)(v35
                                + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxConnectionCompletion);
                uint64_t v56 = (void (*)(uint64_t))*v55;
                if (*v55)
                {
                  uint64_t v57 = swift_retain();
                  v56(v57);
                  sub_10000B290((uint64_t)v56);
                  uint64_t v58 = *v55;
                }
                else
                {
                  uint64_t v58 = 0;
                }
                *uint64_t v55 = 0;
                v55[1] = 0;
                sub_10000B290(v58);
                return;
              }
            }
          }
          ++v28;
          if (v31 == v21) {
            goto LABEL_52;
          }
        }
        __break(1u);
        goto LABEL_51;
      }
      ++v22;
      if (v25 == v21) {
        goto LABEL_52;
      }
    }
    __break(1u);
  }
}

id sub_100006F3C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = sub_1000218F0();
  __chkstk_darwin(v5 - 8);
  sub_1000219C0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100009DF0(&qword_1000320B0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100023950;
  *(void *)(v6 + 56) = &type metadata for String;
  unint64_t v7 = sub_100009E38();
  *(void *)(v6 + 64) = v7;
  *(void *)(v6 + 32) = 0xD000000000000026;
  *(void *)(v6 + 40) = 0x8000000100022980;
  sub_100021790();
  swift_bridgeObjectRelease();
  if (a3)
  {
    swift_errorRetain();
    sub_1000219D0();
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_100023950;
    swift_errorRetain();
    sub_100009DF0((uint64_t *)&unk_100032C10);
    uint64_t v9 = sub_100021900();
    *(void *)(v8 + 56) = &type metadata for String;
    *(void *)(v8 + 64) = v7;
    *(void *)(v8 + 32) = v9;
    *(void *)(v8 + 40) = v10;
    sub_100021790();
    swift_bridgeObjectRelease();
    id v11 = (void *)*sub_10000B198((void *)(v50 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v50 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    id v12 = [v11 result];
    Class isa = sub_1000219B0().super.super.isa;
    [v12 setStatusCode:isa];

    [v11 setFinished:1];
    return (id)swift_errorRelease();
  }
  id v15 = [a2 value];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = sub_100021740();
    unint64_t v48 = v18;

    id v19 = [a2 UUID];
    uint64_t v20 = qword_100031A68;
    id v21 = v19;
    if (v20 != -1) {
      swift_once();
    }
    uint64_t v22 = qword_1000393B8;
    sub_10000B730(0, &qword_1000320F0);
    id v23 = (id)v22;
    LOBYTE(v22) = sub_100021A30();

    if (v22)
    {

      sub_1000218E0();
      uint64_t v24 = v17;
      unint64_t v25 = v48;
      uint64_t v26 = sub_1000218C0();
      if (v27)
      {
        if (v26 == 0x3E4D4F453CLL && v27 == 0xE500000000000000)
        {
          swift_bridgeObjectRelease();
LABEL_24:
          sub_1000219C0();
          sub_100021790();
          sub_1000036A8();
LABEL_38:
          uint64_t v37 = v24;
          return (id)sub_100008C84(v37, v25);
        }
        char v34 = sub_100021C40();
        swift_bridgeObjectRelease();
        if (v34) {
          goto LABEL_24;
        }
      }
      sub_1000219C0();
      uint64_t v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = xmmword_100023950;
      uint64_t v36 = 0;
      switch(v48 >> 62)
      {
        case 1uLL:
          LODWORD(v36) = HIDWORD(v24) - v24;
          if (__OFSUB__(HIDWORD(v24), v24))
          {
            __break(1u);
LABEL_42:
            __break(1u);
            JUMPOUT(0x100007840);
          }
          uint64_t v36 = (int)v36;
LABEL_33:
          *(void *)(v35 + 56) = &type metadata for Int;
          *(void *)(v35 + 64) = &protocol witness table for Int;
          *(void *)(v35 + 32) = v36;
          sub_100021790();
          swift_bridgeObjectRelease();
          uint64_t v41 = OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagePacketsReceived;
          uint64_t v42 = *(char **)(v50 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagePacketsReceived);
          sub_100008C2C(v24, v48);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(void *)(v50 + v41) = v42;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            uint64_t v42 = sub_100008FA8(0, *((void *)v42 + 2) + 1, 1, v42);
            *(void *)(v50 + v41) = v42;
          }
          unint64_t v45 = *((void *)v42 + 2);
          unint64_t v44 = *((void *)v42 + 3);
          if (v45 >= v44 >> 1)
          {
            uint64_t v42 = sub_100008FA8((char *)(v44 > 1), v45 + 1, 1, v42);
            *(void *)(v50 + v41) = v42;
          }
          *((void *)v42 + 2) = v45 + 1;
          id v46 = &v42[16 * v45];
          *((void *)v46 + 4) = v24;
          *((void *)v46 + 5) = v48;
          break;
        case 2uLL:
          uint64_t v39 = *(void *)(v24 + 16);
          uint64_t v38 = *(void *)(v24 + 24);
          BOOL v40 = __OFSUB__(v38, v39);
          uint64_t v36 = v38 - v39;
          if (!v40) {
            goto LABEL_33;
          }
          goto LABEL_42;
        case 3uLL:
          goto LABEL_33;
        default:
          uint64_t v36 = BYTE6(v48);
          goto LABEL_33;
      }
      goto LABEL_38;
    }
    if (qword_100031A70 != -1) {
      swift_once();
    }
    id v31 = (id)qword_1000393C0;
    char v32 = sub_100021A30();

    if (v32)
    {
      sub_100021600();
      swift_allocObject();
      sub_1000215F0();
      sub_100009DF0(&qword_1000320F8);
      sub_10000B1DC();
      uint64_t v33 = v17;
      unint64_t v25 = v48;
      sub_1000215E0();
      swift_release();
      sub_1000219F0();
      if (v52)
      {
        sub_100021790();
        sub_100007850();
      }
      else
      {
        uint64_t v47 = swift_allocObject();
        *(_OWORD *)(v47 + 16) = xmmword_100023950;
        *(void *)(v47 + 56) = &type metadata for UInt16;
        *(void *)(v47 + 64) = &protocol witness table for UInt16;
        *(_WORD *)(v47 + 32) = v51;
        sub_100021790();
        swift_bridgeObjectRelease();
        [a1 openL2CAPChannel:v51];
      }
      uint64_t v37 = v33;
      return (id)sub_100008C84(v37, v25);
    }
    return (id)sub_100008C84(v17, v48);
  }
  else
  {
    sub_1000219D0();
    sub_100021790();
    uint64_t v28 = (void *)*sub_10000B198((void *)(v50 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v50 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    id v29 = [v28 result];
    Class v30 = sub_1000219B0().super.super.isa;
    [v29 setStatusCode:v30];

    return [v28 setFinished:1];
  }
}

void sub_100007850()
{
  uint64_t v1 = OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel);
  if (!v2) {
    return;
  }
  id v3 = v2;
  sub_1000219F0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100009DF0(&qword_1000320B0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100023950;
  unsigned __int16 v5 = (unsigned __int16)[v3 PSM];
  *(void *)(v4 + 56) = &type metadata for UInt16;
  *(void *)(v4 + 64) = &protocol witness table for UInt16;
  *(_WORD *)(v4 + 32) = v5;
  sub_100021790();
  swift_bridgeObjectRelease();
  id v6 = [v3 outputStream];
  if (!v6)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v7 = v6;
  [v6 close];

  id v8 = [v3 inputStream];
  if (!v8)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v9 = v8;
  [v8 close];

  id v10 = [v3 inputStream];
  if (!v10)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v11 = v10;
  id v12 = self;
  id v13 = [v12 mainRunLoop];
  [v11 removeFromRunLoop:v13 forMode:NSDefaultRunLoopMode];

  id v14 = [v3 outputStream];
  if (!v14)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v15 = v14;
  id v16 = [v12 mainRunLoop];
  [v15 removeFromRunLoop:v16 forMode:NSDefaultRunLoopMode];

  id v17 = [v3 inputStream];
  if (!v17)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  unint64_t v18 = v17;
  [v17 setDelegate:0];

  id v19 = [v3 outputStream];
  if (!v19)
  {
LABEL_19:
    __break(1u);
    return;
  }
  uint64_t v20 = v19;
  [v19 setDelegate:0];

  id v21 = *(id *)(v0 + v1);
  *(void *)(v0 + v1) = 0;
}

void sub_100007B5C(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void (*a6)(id, id, void *))
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  id v13 = a5;
  a6(v10, v11, a5);
}

void sub_100007D0C(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel;
  if (*(void *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel)) {
    sub_100007850();
  }
  sub_1000219F0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100009DF0(&qword_1000320B0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100023950;
  unsigned __int16 v5 = (unsigned __int16)[a1 PSM];
  *(void *)(v4 + 56) = &type metadata for UInt16;
  *(void *)(v4 + 64) = &protocol witness table for UInt16;
  *(_WORD *)(v4 + 32) = v5;
  sub_100021790();
  swift_bridgeObjectRelease();
  id v6 = [a1 inputStream];
  if (!v6)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v7 = v6;
  [v6 setDelegate:v1];

  id v8 = [a1 outputStream];
  if (!v8)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v9 = v8;
  [v8 setDelegate:v1];

  id v10 = [a1 inputStream];
  if (!v10)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v11 = v10;
  id v12 = self;
  id v13 = [v12 mainRunLoop];
  [v11 scheduleInRunLoop:v13 forMode:NSDefaultRunLoopMode];

  id v14 = [a1 outputStream];
  if (!v14)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v15 = v14;
  id v16 = [v12 mainRunLoop];
  [v15 scheduleInRunLoop:v16 forMode:NSDefaultRunLoopMode];

  id v17 = [a1 inputStream];
  if (!v17)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  unint64_t v18 = v17;
  [v17 open];

  id v19 = [a1 outputStream];
  if (!v19)
  {
LABEL_19:
    __break(1u);
    return;
  }
  uint64_t v20 = v19;
  [v19 open];

  id v22 = *(id *)(v1 + v3);
  *(void *)(v1 + v3) = a1;
  id v21 = a1;
}

void sub_100008070(void *a1, uint64_t a2)
{
  switch(a2)
  {
    case 1:
      sub_1000219F0();
      if (qword_100031A78 != -1) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 2:
      sub_10000854C();
      return;
    case 4:
      sub_100003F54();
      return;
    case 8:
      sub_1000219D0();
      if (qword_100031A78 != -1) {
        swift_once();
      }
      sub_100009DF0(&qword_1000320B0);
      uint64_t v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_100023960;
      id v4 = a1;
      id v5 = [v4 description];
      uint64_t v6 = sub_1000218A0();
      uint64_t v8 = v7;

      *(void *)(v3 + 56) = &type metadata for String;
      unint64_t v9 = sub_100009E38();
      *(void *)(v3 + 64) = v9;
      *(void *)(v3 + 32) = v6;
      *(void *)(v3 + 40) = v8;
      [v4 streamError];
      sub_100009DF0((uint64_t *)&unk_1000320C0);
      uint64_t v10 = sub_100021900();
      *(void *)(v3 + 96) = &type metadata for String;
      *(void *)(v3 + 104) = v9;
      *(void *)(v3 + 72) = v10;
      *(void *)(v3 + 80) = v11;
      sub_100021790();
      swift_bridgeObjectRelease();
      return;
    case 16:
      sub_1000219F0();
      if (qword_100031A78 == -1) {
        goto LABEL_16;
      }
      goto LABEL_19;
    default:
      sub_1000219D0();
      if (qword_100031A78 == -1) {
        goto LABEL_16;
      }
LABEL_19:
      swift_once();
LABEL_16:
      sub_100009DF0(&qword_1000320B0);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_100023950;
      id v13 = a1;
      id v14 = [v13 description];
      uint64_t v15 = sub_1000218A0();
      uint64_t v17 = v16;

      *(void *)(v12 + 56) = &type metadata for String;
      *(void *)(v12 + 64) = sub_100009E38();
      *(void *)(v12 + 32) = v15;
      *(void *)(v12 + 40) = v17;
      sub_100021790();
      swift_bridgeObjectRelease();
      return;
  }
}

void sub_10000854C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel);
  if (v1)
  {
    uint64_t v2 = v0;
    id v3 = [v1 inputStream];
    if (v3)
    {
      id v4 = v3;
      id v5 = [v3 read:swift_slowAlloc() maxLength:1024];
      uint64_t v6 = (uint64_t *)[v4 streamError];
      if (v6)
      {
        uint64_t v7 = v6;
        sub_1000219D0();
        if (qword_100031A78 == -1)
        {
LABEL_5:
          sub_100009DF0(&qword_1000320B0);
          uint64_t v8 = swift_allocObject();
          *(_OWORD *)(v8 + 16) = xmmword_100023950;
          unint64_t v9 = v7;
          sub_100009DF0((uint64_t *)&unk_100032C10);
          uint64_t v10 = sub_100021900();
          uint64_t v12 = v11;
          *(void *)(v8 + 56) = &type metadata for String;
          *(void *)(v8 + 64) = sub_100009E38();
          *(void *)(v8 + 32) = v10;
          *(void *)(v8 + 40) = v12;
          sub_100021790();

          swift_bridgeObjectRelease();
LABEL_29:
          swift_slowDealloc();

          return;
        }
      }
      else
      {
        uint64_t v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataReceived);
        swift_beginAccess();
        if (v5) {
          sub_100021720();
        }
        swift_endAccess();
        uint64_t v13 = *(void *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedFiles);
        int64_t v14 = *(void *)(v13 + 16);
        if (v14)
        {
          char v32 = v7;
          swift_bridgeObjectRetain();
          sub_1000092DC(0, v14, 0);
          unint64_t v15 = _swiftEmptyArrayStorage[2];
          uint64_t v16 = 48;
          do
          {
            uint64_t v17 = *(void *)(v13 + v16);
            unint64_t v18 = _swiftEmptyArrayStorage[3];
            if (v15 >= v18 >> 1) {
              sub_1000092DC((char *)(v18 > 1), v15 + 1, 1);
            }
            _swiftEmptyArrayStorage[2] = v15 + 1;
            _swiftEmptyArrayStorage[v15 + 4] = v17;
            v16 += 40;
            ++v15;
            --v14;
          }
          while (v14);
          swift_bridgeObjectRelease();
          uint64_t v7 = v32;
        }
        uint64_t v19 = _swiftEmptyArrayStorage[2];
        if (!v19)
        {
          uint64_t v20 = 0;
LABEL_20:
          swift_bridgeObjectRelease();
          sub_1000219F0();
          if (qword_100031A78 != -1) {
            swift_once();
          }
          sub_100009DF0(&qword_1000320B0);
          uint64_t v24 = swift_allocObject();
          *(_OWORD *)(v24 + 16) = xmmword_100023960;
          uint64_t v25 = *v7;
          unint64_t v26 = v7[1];
          uint64_t v27 = 0;
          switch(v26 >> 62)
          {
            case 1uLL:
              LODWORD(v27) = HIDWORD(v25) - v25;
              if (__OFSUB__(HIDWORD(v25), v25))
              {
                __break(1u);
LABEL_34:
                __break(1u);
                JUMPOUT(0x10000896CLL);
              }
              uint64_t v27 = (int)v27;
LABEL_27:
              *(void *)(v24 + 56) = &type metadata for Int;
              *(void *)(v24 + 64) = &protocol witness table for Int;
              *(void *)(v24 + 32) = v27;
              *(void *)(v24 + 96) = &type metadata for UInt;
              *(void *)(v24 + 104) = &protocol witness table for UInt;
              *(void *)(v24 + 72) = v20;
              sub_100021790();
              swift_bridgeObjectRelease();
              sub_100004900();
              if ([v4 hasBytesAvailable]) {
                sub_10000854C();
              }
              break;
            case 2uLL:
              uint64_t v30 = v25 + 16;
              uint64_t v29 = *(void *)(v25 + 16);
              uint64_t v28 = *(void *)(v30 + 8);
              BOOL v31 = __OFSUB__(v28, v29);
              uint64_t v27 = v28 - v29;
              if (!v31) {
                goto LABEL_27;
              }
              goto LABEL_34;
            case 3uLL:
              goto LABEL_27;
            default:
              uint64_t v27 = BYTE6(v26);
              goto LABEL_27;
          }
          goto LABEL_29;
        }
        uint64_t v20 = 0;
        id v21 = &_swiftEmptyArrayStorage[4];
        while (1)
        {
          uint64_t v22 = *v21++;
          BOOL v23 = __CFADD__(v20, v22);
          v20 += v22;
          if (v23) {
            break;
          }
          if (!--v19) {
            goto LABEL_20;
          }
        }
        __break(1u);
      }
      swift_once();
      goto LABEL_5;
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AudioBoxBluetoothManager.SendingFileInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AudioBoxBluetoothManager.SendingFileInfo()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *initializeWithCopy for AudioBoxBluetoothManager.SendingFileInfo(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AudioBoxBluetoothManager.SendingFileInfo(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v4 = a2[4];
  a1[3] = a2[3];
  a1[4] = v4;
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  return a1;
}

__n128 initializeWithTake for AudioBoxBluetoothManager.SendingFileInfo(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AudioBoxBluetoothManager.SendingFileInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioBoxBluetoothManager.SendingFileInfo(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AudioBoxBluetoothManager.SendingFileInfo(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AudioBoxBluetoothManager.SendingFileInfo()
{
  return &type metadata for AudioBoxBluetoothManager.SendingFileInfo;
}

uint64_t sub_100008C2C(uint64_t a1, unint64_t a2)
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

uint64_t sub_100008C84(uint64_t a1, unint64_t a2)
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

id sub_100008CDC@<X0>(id result@<X0>, void *a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  if (result)
  {
    id v6 = result;
    uint64_t v7 = (uint64_t *)(a3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataToSend);
    swift_beginAccess();
    uint64_t v8 = *v7;
    unint64_t v9 = v7[1];
    uint64_t v10 = 0;
    switch(v9 >> 62)
    {
      case 1uLL:
        BOOL v11 = __OFSUB__(HIDWORD(v8), v8);
        int v12 = HIDWORD(v8) - v8;
        if (v11)
        {
          __break(1u);
LABEL_10:
          __break(1u);
          JUMPOUT(0x100008DBCLL);
        }
        uint64_t v10 = v12;
LABEL_7:
        uint64_t result = [a2 write:v6 maxLength:v10];
        break;
      case 2uLL:
        uint64_t v15 = v8 + 16;
        uint64_t v13 = *(void *)(v8 + 16);
        uint64_t v14 = *(void *)(v15 + 8);
        uint64_t v10 = v14 - v13;
        if (!__OFSUB__(v14, v13)) {
          goto LABEL_7;
        }
        goto LABEL_10;
      case 3uLL:
        goto LABEL_7;
      default:
        uint64_t v10 = BYTE6(v9);
        goto LABEL_7;
    }
  }
  *a4 = result;
  return result;
}

uint64_t sub_100008DCC()
{
  return 1;
}

Swift::Int sub_100008DD4()
{
  return sub_100021CE0();
}

void sub_100008E18()
{
}

Swift::Int sub_100008E40()
{
  return sub_100021CE0();
}

char *sub_100008E90(char *result, int64_t a2, char a3, char *a4)
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
    sub_100009DF0(&qword_1000320A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8]) {
      memmove(v12, v13, 40 * v8);
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

char *sub_100008FA8(char *result, int64_t a2, char a3, char *a4)
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
    sub_100009DF0(&qword_100032108);
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
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1000090AC(char *result, int64_t a2, char a3, char *a4)
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
    sub_100009DF0(&qword_1000320D8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
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

char *sub_1000091C8(uint64_t a1)
{
  return sub_1000090AC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000091DC(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100021640();
  if (!result || (uint64_t result = sub_100021660(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_100021650();
      sub_100021850();
      sub_10000B7C4(&qword_100032170, (void (*)(uint64_t))&type metadata accessor for SHA256);
      return sub_100021810();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

char *sub_1000092BC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000092FC(a1, a2, a3, *v3);
  *long long v3 = result;
  return result;
}

char *sub_1000092DC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100009400(a1, a2, a3, *v3);
  *long long v3 = result;
  return result;
}

char *sub_1000092FC(char *result, int64_t a2, char a3, char *a4)
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
    sub_100009DF0(&qword_100032190);
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_100009400(char *result, int64_t a2, char a3, char *a4)
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
    sub_100009DF0(&qword_1000320D0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
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
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_1000094FC(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v44 = a4;
  uint64_t v7 = sub_1000218F0();
  uint64_t v36 = *(void *)(v7 - 8);
  uint64_t v37 = v7;
  __chkstk_darwin();
  uint64_t v35 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v43 = a3;
  uint64_t v41 = (char *)[a3 maximumWriteValueLengthForType:0];
  unint64_t v42 = a2;
  unint64_t v9 = a2 >> 62;
  BOOL v10 = __OFSUB__(HIDWORD(a1), a1);
  BOOL v39 = v10;
  if (v9 == 3) {
    goto LABEL_5;
  }
  uint64_t v17 = 0;
  uint64_t v38 = HIDWORD(a1) - (int)a1;
  uint64_t v18 = BYTE6(v42);
  long long v40 = xmmword_100023950;
  uint64_t v19 = BYTE6(v42);
  if (!v9) {
    goto LABEL_13;
  }
LABEL_9:
  if (v9 == 1)
  {
    uint64_t v19 = v38;
    if (!v39) {
      goto LABEL_13;
    }
LABEL_32:
    __break(1u);
  }
  else
  {
    uint64_t v21 = *(void *)(a1 + 16);
    uint64_t v20 = *(void *)(a1 + 24);
    BOOL v22 = __OFSUB__(v20, v21);
    uint64_t v19 = v20 - v21;
    if (!v22)
    {
LABEL_13:
      while (v17 < v19)
      {
        uint64_t v23 = v18;
        if (v9)
        {
          if (v9 == 1)
          {
            uint64_t v23 = v38;
            if (v39) {
              goto LABEL_34;
            }
          }
          else
          {
            uint64_t v25 = *(void *)(a1 + 16);
            uint64_t v24 = *(void *)(a1 + 24);
            BOOL v22 = __OFSUB__(v24, v25);
            uint64_t v23 = v24 - v25;
            if (v22) {
              goto LABEL_35;
            }
          }
        }
        BOOL v22 = __OFSUB__(v23, v17);
        uint64_t v26 = v23 - v17;
        if (v22)
        {
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
        if (v26 >= (uint64_t)v41) {
          uint64_t v27 = v41;
        }
        else {
          uint64_t v27 = (char *)v26;
        }
        uint64_t v28 = &v27[v17];
        if (__OFADD__(v17, v27)) {
          goto LABEL_30;
        }
        if ((uint64_t)v28 < v17) {
          goto LABEL_31;
        }
        uint64_t v29 = sub_100021770();
        unint64_t v31 = v30;
        sub_1000219C0();
        if (qword_100031A78 != -1) {
          swift_once();
        }
        sub_100009DF0(&qword_1000320B0);
        uint64_t v32 = swift_allocObject();
        *(_OWORD *)(v32 + 16) = v40;
        *(void *)(v32 + 56) = &type metadata for Int;
        *(void *)(v32 + 64) = &protocol witness table for Int;
        *(void *)(v32 + 32) = v27;
        sub_100021790();
        swift_bridgeObjectRelease();
        Class isa = sub_100021730().super.isa;
        [v43 writeValue:isa forCharacteristic:v44 type:0];
        sub_100008C84(v29, v31);

        uint64_t v17 = (uint64_t)v28;
        uint64_t v19 = v18;
        if (v9) {
          goto LABEL_9;
        }
      }
LABEL_5:
      sub_1000219C0();
      if (qword_100031A78 == -1) {
        goto LABEL_6;
      }
      goto LABEL_36;
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  swift_once();
LABEL_6:
  sub_100021790();
  int64_t v11 = v35;
  sub_1000218E0();
  uint64_t v12 = sub_1000218B0();
  unint64_t v14 = v13;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v11, v37);
  if (v14 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    Class v16 = sub_100021730().super.isa;
    [v43 writeValue:v16 forCharacteristic:v44 type:0];

    return sub_10000B71C(v12, v14);
  }
  return result;
}

uint64_t sub_1000098C8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_100021850();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100021840();
  uint64_t v8 = *(void *)(v19 - 8);
  __chkstk_darwin();
  BOOL v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B7C4(&qword_100032170, (void (*)(uint64_t))&type metadata accessor for SHA256);
  sub_100021830();
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v18 = v5;
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      uint64_t v17 = 0;
      sub_100008C2C(a1, a2);
      sub_1000091DC((int)a1, a1 >> 32);
      sub_100008C84(a1, a2);
      uint64_t v5 = v18;
      goto LABEL_9;
    case 2uLL:
      uint64_t v17 = 0;
      uint64_t v18 = v5;
      uint64_t v12 = *(void *)(a1 + 16);
      uint64_t v11 = *(void *)(a1 + 24);
      sub_100008C2C(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v13 = v12;
      uint64_t v5 = v18;
      sub_1000091DC(v13, v11);
      swift_release();
      swift_release();
      goto LABEL_8;
    case 3uLL:
      memset(v20, 0, 14);
      goto LABEL_7;
    default:
      v20[0] = a1;
      LOWORD(v20[1]) = a2;
      BYTE2(v20[1]) = BYTE2(a2);
      BYTE3(v20[1]) = BYTE3(a2);
      BYTE4(v20[1]) = BYTE4(a2);
      BYTE5(v20[1]) = BYTE5(a2);
LABEL_7:
      sub_100021810();
LABEL_8:
      sub_100008C84(a1, a2);
LABEL_9:
      sub_100021820();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      uint64_t v14 = sub_100004DE8((uint64_t)v10);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v19);
      v20[0] = v14;
      sub_100009DF0(&qword_100032178);
      sub_10000B80C(&qword_100032180, &qword_100032178);
      uint64_t v15 = sub_100021880();
      swift_bridgeObjectRelease();
      return v15;
  }
}

uint64_t sub_100009CC8(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *((void *)v4 + 3) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_100008E90(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_25;
  }
  uint64_t v15 = &v4[40 * a2 + 32];
  if (v6 != a2 || &v4[40 * v6 + 32] >= &v15[40 * v14]) {
    uint64_t result = (uint64_t)memmove(&v4[40 * v6 + 32], v15, 40 * v14);
  }
  uint64_t v16 = *((void *)v4 + 2);
  BOOL v13 = __OFADD__(v16, v8);
  uint64_t v17 = v16 - v7;
  if (!v13)
  {
    *((void *)v4 + 2) = v17;
LABEL_19:
    void *v2 = v4;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_100009DF0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100009E38()
{
  unint64_t result = qword_1000320B8;
  if (!qword_1000320B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000320B8);
  }
  return result;
}

uint64_t sub_100009E8C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t result = sub_100021640();
  int64_t v11 = (char *)result;
  if (result)
  {
    uint64_t result = sub_100021660();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_100021650();
  uint64_t result = (uint64_t)sub_100008CDC(v11, a4, a5, &v12);
  if (!v5) {
    return v12;
  }
  return result;
}

uint64_t sub_100009F40(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *((void *)v4 + 3) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_1000090AC(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_25;
  }
  uint64_t v15 = &v4[48 * a2 + 32];
  if (v6 != a2 || &v4[48 * v6 + 32] >= &v15[48 * v14]) {
    uint64_t result = (uint64_t)memmove(&v4[48 * v6 + 32], v15, 48 * v14);
  }
  uint64_t v16 = *((void *)v4 + 2);
  BOOL v13 = __OFADD__(v16, v8);
  uint64_t v17 = v16 - v7;
  if (!v13)
  {
    *((void *)v4 + 2) = v17;
LABEL_19:
    void *v2 = v4;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

void sub_10000A068(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  sub_1000219C0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100009DF0(&qword_1000320B0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100023950;
  *(void *)(v8 + 56) = &type metadata for String;
  unint64_t v9 = sub_100009E38();
  *(void *)(v8 + 64) = v9;
  *(void *)(v8 + 32) = 0xD000000000000035;
  *(void *)(v8 + 40) = 0x8000000100022D30;
  sub_100021790();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_1000218A0();
  if (!*(void *)(a3 + 16) || (unint64_t v12 = sub_1000200C8(v10, v11), (v13 & 1) == 0))
  {
    long long v34 = 0u;
    long long v35 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  sub_10000B300(*(void *)(a3 + 56) + 32 * v12, (uint64_t)&v34);
  swift_bridgeObjectRelease();
  if (!*((void *)&v35 + 1))
  {
LABEL_14:
    sub_10000B2A0((uint64_t)&v34);
    return;
  }
  sub_100009DF0(&qword_100032138);
  if (swift_dynamicCast())
  {
    if (qword_100031A60 != -1) {
      swift_once();
    }
    id v14 = (id)qword_1000393B0;
    char v15 = sub_100005A68((uint64_t)v14, v32);
    swift_bridgeObjectRelease();

    if (v15)
    {
      uint64_t v16 = sub_1000218A0();
      if (*(void *)(a3 + 16) && (unint64_t v18 = sub_1000200C8(v16, v17), (v19 & 1) != 0))
      {
        sub_10000B300(*(void *)(a3 + 56) + 32 * v18, (uint64_t)&v34);
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v35 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v20 = (uint64_t *)(v4 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxSerial);
          uint64_t v21 = *(void *)(v4 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxSerial + 8);
          if (v21 && (v32 == *v20 && v21 == v33 || (sub_100021C40() & 1) != 0))
          {
            sub_1000219F0();
            uint64_t v22 = swift_allocObject();
            *(_OWORD *)(v22 + 16) = xmmword_100023950;
            *(void *)(v22 + 56) = &type metadata for String;
            *(void *)(v22 + 64) = v9;
            *(void *)(v22 + 32) = v32;
            *(void *)(v22 + 40) = v33;
            sub_100021790();
            swift_bridgeObjectRelease();
            [a1 stopScan];
            sub_100009DF0(&qword_100032140);
            uint64_t inited = swift_initStackObject();
            *(_OWORD *)(inited + 16) = xmmword_100023950;
            *(void *)(inited + 32) = sub_1000218A0();
            *(void *)(inited + 40) = v24;
            Class isa = sub_100021CF0().super.super.isa;
            *(void *)(inited + 72) = sub_10000B730(0, &qword_100032148);
            *(void *)(inited + 48) = isa;
            sub_100005BF0(inited);
            Class v26 = sub_100021860().super.isa;
            swift_bridgeObjectRelease();
            [a1 connectPeripheral:a2 options:v26];

            [a2 setDelegate:v4];
            uint64_t v27 = *(void **)(v4 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBox);
            *(void *)(v4 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBox) = a2;
            id v28 = a2;
          }
          else
          {
            sub_1000219F0();
            uint64_t v29 = swift_allocObject();
            *(_OWORD *)(v29 + 16) = xmmword_100023960;
            *(void *)(v29 + 56) = &type metadata for String;
            *(void *)(v29 + 64) = v9;
            *(void *)(v29 + 32) = v32;
            *(void *)(v29 + 40) = v33;
            uint64_t v30 = v20[1];
            if (v30)
            {
              uint64_t v31 = *v20;
              *(void *)(v29 + 96) = &type metadata for String;
              *(void *)(v29 + 104) = v9;
              *(void *)(v29 + 72) = v31;
              *(void *)(v29 + 80) = v30;
              swift_bridgeObjectRetain();
              sub_100021790();
              swift_bridgeObjectRelease();
            }
            else
            {
              __break(1u);
            }
          }
        }
        return;
      }
      goto LABEL_14;
    }
  }
}

void sub_10000A514(void *a1)
{
  sub_1000219C0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100009DF0(&qword_1000320B0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100023950;
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 64) = sub_100009E38();
  *(void *)(v2 + 32) = 0xD00000000000001DLL;
  *(void *)(v2 + 40) = 0x8000000100022D10;
  sub_100021790();
  swift_bridgeObjectRelease();
  sub_100009DF0(&qword_100032128);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100023940;
  if (qword_100031A60 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_1000393B0;
  *(void *)(v3 + 32) = qword_1000393B0;
  sub_1000219A0();
  sub_10000B730(0, &qword_1000320F0);
  id v5 = v4;
  Class isa = sub_100021970().super.isa;
  swift_bridgeObjectRelease();
  [a1 discoverServices:isa];
}

id sub_10000A6E0()
{
  sub_1000219C0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100009DF0(&qword_1000320B0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100023950;
  *(void *)(v1 + 56) = &type metadata for String;
  *(void *)(v1 + 64) = sub_100009E38();
  *(void *)(v1 + 32) = 0xD000000000000029;
  *(void *)(v1 + 40) = 0x8000000100022CE0;
  sub_100021790();
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)*sub_10000B198((void *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
  id v3 = [v2 result];
  Class isa = sub_1000219B0().super.super.isa;
  [v3 setStatusCode:isa];

  return [v2 setFinished:1];
}

id sub_10000A848()
{
  sub_1000219C0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100009DF0(&qword_1000320B0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100023950;
  *(void *)(v1 + 56) = &type metadata for String;
  *(void *)(v1 + 64) = sub_100009E38();
  *(void *)(v1 + 32) = 0xD000000000000030;
  *(void *)(v1 + 40) = 0x8000000100022CA0;
  sub_100021790();
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)*sub_10000B198((void *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
  id v3 = [v2 result];
  Class isa = sub_1000219B0().super.super.isa;
  [v3 setStatusCode:isa];

  return [v2 setFinished:1];
}

id sub_10000A9B0(unint64_t a1)
{
  sub_1000219C0();
  if (qword_100031A78 != -1) {
LABEL_18:
  }
    swift_once();
  sub_100009DF0(&qword_1000320B0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100023960;
  *(void *)(v3 + 56) = &type metadata for String;
  unint64_t v4 = sub_100009E38();
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 32) = 0xD000000000000020;
  *(void *)(v3 + 40) = 0x80000001000228F0;
  sub_10000B730(0, &qword_1000320E0);
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_100021990();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  *(void *)(v3 + 96) = &type metadata for String;
  *(void *)(v3 + 104) = v4;
  *(void *)(v3 + 72) = v5;
  *(void *)(v3 + 80) = v7;
  sub_100021790();
  swift_bridgeObjectRelease();
  if (!(a1 >> 62))
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_4;
    }
LABEL_20:
    return (id)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_100021AF0();
  if (!v8) {
    goto LABEL_20;
  }
LABEL_4:
  unint64_t v23 = v4;
  uint64_t v24 = v1;
  uint64_t v1 = sub_10000B730(0, &qword_1000320E8);
  uint64_t v9 = 4;
  while (1)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v10 = (id)sub_100021AC0();
    }
    else {
      id v10 = *(id *)(a1 + 8 * v9);
    }
    uint64_t v11 = v10;
    uint64_t v12 = v9 - 3;
    if (__OFADD__(v9 - 4, 1))
    {
      __break(1u);
      goto LABEL_18;
    }
    id v13 = [v10 UUID];
    if (qword_100031A60 != -1) {
      swift_once();
    }
    char v14 = sub_100021A30();

    if (v14) {
      break;
    }
    ++v9;
    if (v12 == v8) {
      goto LABEL_20;
    }
  }
  swift_bridgeObjectRelease();
  sub_1000219D0();
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100023950;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_100021990();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  *(void *)(v15 + 56) = &type metadata for String;
  *(void *)(v15 + 64) = v23;
  *(void *)(v15 + 32) = v16;
  *(void *)(v15 + 40) = v18;
  sub_100021790();
  swift_bridgeObjectRelease();
  char v19 = (void *)*sub_10000B198((void *)(v24 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v24 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
  id v20 = [v19 result];
  Class isa = sub_1000219B0().super.super.isa;
  [v20 setStatusCode:isa];

  return [v19 setFinished:1];
}

uint64_t sub_10000AD78(uint64_t a1)
{
  sub_1000219C0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100009DF0(&qword_1000320B0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100023950;
  *(void *)(v3 + 56) = &type metadata for String;
  unint64_t v4 = sub_100009E38();
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 32) = 0xD000000000000025;
  *(void *)(v3 + 40) = 0x8000000100022880;
  sub_100021790();
  uint64_t result = swift_bridgeObjectRelease();
  if (a1)
  {
    swift_errorRetain();
    sub_1000219D0();
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_100023950;
    swift_errorRetain();
    sub_100009DF0((uint64_t *)&unk_100032C10);
    uint64_t v7 = sub_100021900();
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 64) = v4;
    *(void *)(v6 + 32) = v7;
    *(void *)(v6 + 40) = v8;
    sub_100021790();
    swift_bridgeObjectRelease();
    uint64_t v9 = (void *)*sub_10000B198((void *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(void *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    id v10 = [v9 result];
    Class isa = sub_1000219B0().super.super.isa;
    [v10 setStatusCode:isa];

    [v9 setFinished:1];
    return swift_errorRelease();
  }
  return result;
}

void sub_10000AF9C(void *a1, uint64_t a2)
{
  sub_1000219C0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100009DF0(&qword_1000320B0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100023950;
  *(void *)(v4 + 56) = &type metadata for String;
  unint64_t v5 = sub_100009E38();
  *(void *)(v4 + 64) = v5;
  *(void *)(v4 + 32) = 0xD00000000000001CLL;
  *(void *)(v4 + 40) = 0x80000001000227E0;
  sub_100021790();
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_errorRetain();
    sub_1000219D0();
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_100023950;
    swift_errorRetain();
    sub_100009DF0((uint64_t *)&unk_100032C10);
    uint64_t v7 = sub_100021900();
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 64) = v5;
    *(void *)(v6 + 32) = v7;
    *(void *)(v6 + 40) = v8;
    sub_100021790();
    swift_bridgeObjectRelease();
    swift_errorRelease();
  }
  else if (a1)
  {
    id v9 = a1;
    sub_100007D0C(v9);
  }
}

void *sub_10000B198(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000B1DC()
{
  unint64_t result = qword_100032100;
  if (!qword_100032100)
  {
    sub_10000B248(&qword_1000320F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032100);
  }
  return result;
}

uint64_t sub_10000B248(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000B290(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000B2A0(uint64_t a1)
{
  uint64_t v2 = sub_100009DF0(&qword_100032130);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B300(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B35C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009DF0(&qword_100032158);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000B3C4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10000B3D4()
{
  unint64_t result = qword_100032168;
  if (!qword_100032168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032168);
  }
  return result;
}

unint64_t sub_10000B428()
{
  unint64_t result = qword_100032198;
  if (!qword_100032198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032198);
  }
  return result;
}

uint64_t sub_10000B47C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000B4D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  switch(a7)
  {
    case 0:
    case 3:
      swift_bridgeObjectRetain();
      goto LABEL_3;
    case 2:
    case 4:
LABEL_3:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000B580(uint64_t a1, void (*a2)(void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_10000B5C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  switch(a7)
  {
    case 0:
    case 3:
      swift_bridgeObjectRelease();
      goto LABEL_3;
    case 2:
    case 4:
LABEL_3:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000B66C(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_10000B6C8()
{
  unint64_t result = qword_1000321A0;
  if (!qword_1000321A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000321A0);
  }
  return result;
}

uint64_t sub_10000B71C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100008C84(a1, a2);
  }
  return a1;
}

uint64_t sub_10000B730(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000B76C()
{
  return _swift_deallocObject(v0, 24, 7);
}

unsigned char *sub_10000B7A4()
{
  return sub_100002F30(*(unsigned char **)(v0 + 16));
}

uint64_t sub_10000B7AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B7BC()
{
  return swift_release();
}

uint64_t sub_10000B7C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000B80C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B248(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *sub_10000B850()
{
  return sub_10000296C(*(char **)(v0 + 16));
}

uint64_t sub_10000B858(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t getEnumTagSinglePayload for AudioBoxBluetoothManager.ProtocolError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AudioBoxBluetoothManager.ProtocolError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000B99CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000B9C4()
{
  return 0;
}

ValueMetadata *type metadata accessor for AudioBoxBluetoothManager.ProtocolError()
{
  return &type metadata for AudioBoxBluetoothManager.ProtocolError;
}

unint64_t sub_10000B9E4()
{
  unint64_t result = qword_1000321D0;
  if (!qword_1000321D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000321D0);
  }
  return result;
}

uint64_t sub_10000BA50(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
LABEL_33:
    long long v29 = 0u;
    long long v30 = 0u;
    goto LABEL_34;
  }
  uint64_t v2 = v1;
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxIDKey);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxIDKey + 8);
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1000200C8(v5, v4);
  if ((v7 & 1) == 0) {
    goto LABEL_8;
  }
  sub_10000B300(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v29);
  swift_bridgeObjectRelease();
  if (!*((void *)&v30 + 1))
  {
LABEL_34:
    sub_10000B2A0((uint64_t)&v29);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  if (!*(void *)(a1 + 16))
  {
LABEL_8:
    long long v29 = 0u;
    long long v30 = 0u;
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  uint64_t v9 = *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxTokenKey);
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxTokenKey + 8);
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_1000200C8(v9, v8);
  if (v11)
  {
    sub_10000B300(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v29);
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v30 + 1)) {
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v12 = (void *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxID);
  *uint64_t v12 = v27;
  v12[1] = v28;
  swift_bridgeObjectRelease();
  id v13 = (void *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxToken);
  *id v13 = v27;
  v13[1] = v28;
  swift_bridgeObjectRelease();
  *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_parameters) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 16))
  {
    long long v29 = 0u;
    long long v30 = 0u;
LABEL_25:
    sub_10000B2A0((uint64_t)&v29);
    return 1;
  }
  uint64_t v15 = *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_downloadAudioFilesKey);
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_downloadAudioFilesKey + 8);
  swift_bridgeObjectRetain();
  unint64_t v16 = sub_1000200C8(v15, v14);
  if (v17)
  {
    sub_10000B300(*(void *)(a1 + 56) + 32 * v16, (uint64_t)&v29);
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v30 + 1)) {
    goto LABEL_25;
  }
  if (!swift_dynamicCast()) {
    return 1;
  }
  uint64_t result = 1;
  if ((v27 & 1) == 0) {
    return result;
  }
  *(unsigned char *)(v2 + OBJC_IVAR___AudioBoxInputs_downloadAudioFiles) = 1;
  if (!*(void *)(a1 + 16)) {
    goto LABEL_33;
  }
  uint64_t v20 = *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_fileDownloadTimeoutKey);
  uint64_t v19 = *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_fileDownloadTimeoutKey + 8);
  swift_bridgeObjectRetain();
  unint64_t v21 = sub_1000200C8(v20, v19);
  if (v22)
  {
    sub_10000B300(*(void *)(a1 + 56) + 32 * v21, (uint64_t)&v29);
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v30 + 1)) {
    goto LABEL_34;
  }
  if (swift_dynamicCast())
  {
    if (*(void *)(a1 + 16))
    {
      uint64_t v24 = *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_sourcesKey);
      uint64_t v23 = *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_sourcesKey + 8);
      swift_bridgeObjectRetain();
      unint64_t v25 = sub_1000200C8(v24, v23);
      if (v26)
      {
        sub_10000B300(*(void *)(a1 + 56) + 32 * v25, (uint64_t)&v29);
      }
      else
      {
        long long v29 = 0u;
        long long v30 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v30 + 1))
      {
        sub_100009DF0(&qword_100032178);
        if (swift_dynamicCast())
        {
          *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_fileDownloadTimeout) = v27;
          *(void *)(v2 + OBJC_IVAR___AudioBoxInputs_sources) = v27;
          swift_bridgeObjectRelease();
          return 1;
        }
        return 0;
      }
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  return 0;
}

uint64_t sub_10000BE78(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)(a1 + *a4) = sub_100021870();
  swift_bridgeObjectRelease();
  return 1;
}

id sub_10000BEDC()
{
  uint64_t v1 = &v0[OBJC_IVAR___AudioBoxInputs_audioBoxIDKey];
  *(void *)uint64_t v1 = 0x786F426F69647561;
  *((void *)v1 + 1) = 0xEA00000000004449;
  uint64_t v2 = &v0[OBJC_IVAR___AudioBoxInputs_audioBoxTokenKey];
  strcpy(&v0[OBJC_IVAR___AudioBoxInputs_audioBoxTokenKey], "audioBoxToken");
  *((_WORD *)v2 + 7) = -4864;
  int v3 = &v0[OBJC_IVAR___AudioBoxInputs_downloadAudioFilesKey];
  *(void *)int v3 = 0xD000000000000012;
  *((void *)v3 + 1) = 0x80000001000232A0;
  uint64_t v4 = &v0[OBJC_IVAR___AudioBoxInputs_fileDownloadTimeoutKey];
  *(void *)uint64_t v4 = 0xD000000000000013;
  *((void *)v4 + 1) = 0x80000001000232C0;
  uint64_t v5 = &v0[OBJC_IVAR___AudioBoxInputs_sourcesKey];
  *(void *)uint64_t v5 = 0x73656372756F73;
  *((void *)v5 + 1) = 0xE700000000000000;
  unint64_t v6 = &v0[OBJC_IVAR___AudioBoxInputs_audioBoxID];
  *(void *)unint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  char v7 = &v0[OBJC_IVAR___AudioBoxInputs_audioBoxToken];
  *(void *)char v7 = 0;
  *((void *)v7 + 1) = 0;
  v0[OBJC_IVAR___AudioBoxInputs_downloadAudioFiles] = 0;
  *(void *)&v0[OBJC_IVAR___AudioBoxInputs_fileDownloadTimeout] = 0;
  *(void *)&v0[OBJC_IVAR___AudioBoxInputs_sources] = _swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR___AudioBoxInputs_predicates] = &_swiftEmptyDictionarySingleton;
  *(void *)&v0[OBJC_IVAR___AudioBoxInputs_parameters] = &_swiftEmptyDictionarySingleton;
  *(void *)&v0[OBJC_IVAR___AudioBoxInputs_specifications] = &_swiftEmptyDictionarySingleton;
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for AudioBoxInputs();
  return [super init];
}

id sub_10000C064()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioBoxInputs();
  return [super dealloc];
}

uint64_t type metadata accessor for AudioBoxInputs()
{
  return self;
}

uint64_t destroy for FileInfo()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FileInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for FileInfo(void *a1, void *a2)
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
  return a1;
}

__n128 initializeWithTake for FileInfo(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FileInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FileInfo(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FileInfo(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FileInfo()
{
  return &type metadata for FileInfo;
}

uint64_t sub_10000C3B4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEA00000000006D6FLL;
  uint64_t v3 = 0x74746F427466654CLL;
  uint64_t v4 = a1;
  uint64_t v5 = 0x74746F427466654CLL;
  unint64_t v6 = 0xEA00000000006D6FLL;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v5 = 0x746E6F7246;
      break;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v5 = 1801675074;
      break;
    case 3:
      uint64_t v5 = 0x746F427468676952;
      unint64_t v6 = 0xEB000000006D6F74;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      if (v5 == 0x746E6F7246) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1801675074;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0xEB000000006D6F74;
      if (v5 == 0x746F427468676952) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_100021C40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_10000C54C()
{
  uint64_t result = 0x796669746E656469;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x73736572676F7270;
      break;
    case 2:
      uint64_t result = 0x6E617254656C6966;
      break;
    case 3:
      unsigned int v2 = 2036427888;
      goto LABEL_6;
    case 4:
      unsigned int v2 = 1886352499;
LABEL_6:
      uint64_t result = v2 | 0x6F63655200000000;
      break;
    case 5:
      uint64_t result = 0x706D6F4374736574;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000C630@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100010D10(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000C658()
{
  return 0;
}

void sub_10000C664(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_10000C670(uint64_t a1)
{
  unint64_t v2 = sub_100013A8C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C6AC(uint64_t a1)
{
  unint64_t v2 = sub_100013A8C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000C6E8(void *a1)
{
  uint64_t v2 = sub_100009DF0(&qword_1000323A0);
  uint64_t v35 = *(void *)(v2 - 8);
  uint64_t v36 = v2;
  __chkstk_darwin(v2);
  long long v34 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009DF0(&qword_1000323A8);
  uint64_t v32 = *(void *)(v4 - 8);
  uint64_t v33 = v4;
  __chkstk_darwin(v4);
  unint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100009DF0(&qword_1000323B0);
  uint64_t v31 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  objc_super v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100009DF0(&qword_1000323B8);
  uint64_t v30 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100009DF0(&qword_1000323C0);
  uint64_t v37 = *(void *)(v13 - 8);
  uint64_t v38 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B198(a1, a1[3]);
  sub_100013E7C();
  sub_100021D30();
  sub_10000B66C(v39, (uint64_t)&v43);
  switch(v46)
  {
    case 1:
      long long v26 = v43;
      char v27 = v44;
      LOBYTE(v40) = 1;
      sub_100014020();
      uint64_t v28 = v38;
      sub_100021BD0();
      long long v40 = v26;
      LOBYTE(v41) = v27;
      sub_100014074();
      sub_100021C10();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v7);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v15, v28);
      break;
    case 2:
      uint64_t v20 = v43;
      LOBYTE(v40) = 2;
      sub_100013F78();
      uint64_t v21 = v38;
      sub_100021BD0();
      *(void *)&long long v40 = v20;
      sub_100013FCC();
      uint64_t v22 = v33;
      sub_100021C10();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v22);
      goto LABEL_5;
    case 3:
      uint64_t v23 = v44;
      LOBYTE(v40) = 3;
      sub_100013ED0();
      long long v39 = v43;
      uint64_t v24 = v34;
      uint64_t v21 = v38;
      sub_100021BD0();
      long long v40 = v39;
      uint64_t v41 = v23;
      sub_100013F24();
      uint64_t v25 = v36;
      sub_100021C10();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v25);
LABEL_5:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v15, v21);
      break;
    default:
      long long v39 = v43;
      uint64_t v16 = v44;
      uint64_t v17 = v45;
      LOBYTE(v40) = 0;
      sub_1000140C8();
      uint64_t v18 = v38;
      sub_100021BD0();
      long long v40 = v39;
      uint64_t v41 = v16;
      uint64_t v42 = v17;
      sub_10001411C();
      sub_100021C10();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v10);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v15, v18);
      break;
  }
  return result;
}

unint64_t sub_10000CC80(char a1)
{
  unint64_t result = 0x6965636552646964;
  switch(a1)
  {
    case 1:
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x646E6553656C6966;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 0x6B63616279616C70;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    case 8:
      unint64_t result = 0x6E6964726F636572;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000CDC0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v66 = a2;
  uint64_t v65 = a4;
  uint64_t v62 = a3;
  uint64_t v5 = sub_100009DF0(&qword_100032898);
  uint64_t v56 = *(void *)(v5 - 8);
  uint64_t v57 = v5;
  __chkstk_darwin(v5);
  uint64_t v55 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100009DF0(&qword_1000328A0);
  uint64_t v53 = *(void *)(v7 - 8);
  uint64_t v54 = v7;
  __chkstk_darwin(v7);
  char v52 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009DF0(&qword_1000328A8);
  uint64_t v50 = *(void *)(v9 - 8);
  uint64_t v51 = v9;
  __chkstk_darwin(v9);
  uint64_t v49 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_100009DF0(&qword_1000328B0);
  uint64_t v47 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  char v46 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_100009DF0(&qword_1000328B8);
  uint64_t v44 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  long long v43 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_100009DF0(&qword_1000328C0);
  uint64_t v41 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  long long v40 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100009DF0(&qword_1000328C8);
  uint64_t v60 = *(void *)(v14 - 8);
  uint64_t v61 = v14;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100009DF0(&qword_1000328D0);
  uint64_t v59 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100009DF0(&qword_1000328D8);
  uint64_t v58 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100009DF0(&qword_1000328E0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v63 = v23;
  uint64_t v64 = v24;
  __chkstk_darwin(v23);
  long long v26 = (char *)&v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B198(a1, a1[3]);
  sub_1000194D0();
  sub_100021D30();
  switch((char)v65)
  {
    case 1:
      char v68 = 1;
      sub_100019770();
      uint64_t v29 = v63;
      sub_100021BD0();
      sub_100021BE0();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v19, v17);
      goto LABEL_15;
    case 2:
      char v69 = 2;
      sub_10001971C();
      uint64_t v29 = v63;
      sub_100021BD0();
      uint64_t v30 = v61;
      sub_100021BE0();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v16, v30);
      goto LABEL_15;
    case 3:
      switch(v66)
      {
        case 1:
          char v71 = 4;
          sub_100019674();
          uint64_t v35 = v43;
          uint64_t v29 = v63;
          sub_100021BD0();
          uint64_t v32 = *(void (**)(char *, uint64_t))(v44 + 8);
          uint64_t v33 = v35;
          long long v34 = &v77;
          goto LABEL_8;
        case 2:
          char v72 = 5;
          sub_100019620();
          uint64_t v37 = v46;
          uint64_t v29 = v63;
          sub_100021BD0();
          (*(void (**)(char *, uint64_t))(v47 + 8))(v37, v48);
          goto LABEL_15;
        case 3:
          char v73 = 6;
          sub_1000195CC();
          uint64_t v38 = v49;
          uint64_t v29 = v63;
          sub_100021BD0();
          uint64_t v39 = v50;
          uint64_t v36 = v51;
          goto LABEL_13;
        case 4:
          char v74 = 7;
          sub_100019578();
          uint64_t v38 = v52;
          uint64_t v29 = v63;
          sub_100021BD0();
          uint64_t v39 = v53;
          uint64_t v36 = v54;
          goto LABEL_13;
        case 5:
          char v75 = 8;
          sub_100019524();
          uint64_t v38 = v55;
          uint64_t v29 = v63;
          sub_100021BD0();
          uint64_t v39 = v56;
          uint64_t v36 = v57;
LABEL_13:
          uint64_t v32 = *(void (**)(char *, uint64_t))(v39 + 8);
          uint64_t v33 = v38;
          break;
        default:
          char v70 = 3;
          sub_1000196C8();
          uint64_t v31 = v40;
          uint64_t v29 = v63;
          sub_100021BD0();
          uint64_t v32 = *(void (**)(char *, uint64_t))(v41 + 8);
          uint64_t v33 = v31;
          long long v34 = &v76;
LABEL_8:
          uint64_t v36 = *(v34 - 32);
          break;
      }
      v32(v33, v36);
LABEL_15:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v26, v29);
      break;
    default:
      char v67 = 0;
      sub_1000197C4();
      uint64_t v27 = v63;
      sub_100021BD0();
      sub_100021BE0();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v22, v20);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v26, v27);
      break;
  }
  return result;
}

uint64_t sub_10000D6E4(void *a1)
{
  uint64_t v3 = sub_100009DF0(&qword_1000322E0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B198(a1, a1[3]);
  sub_1000131B4();
  sub_100021D30();
  v8[15] = 0;
  sub_100021BE0();
  if (!v1)
  {
    v8[14] = 1;
    sub_100021C00();
    v8[13] = 2;
    sub_100021BE0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10000D874()
{
  return 0x6574656D61726170;
}

void sub_10000D894(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000D8A0(uint64_t a1)
{
  unint64_t v2 = sub_100013C84();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D8DC(uint64_t a1)
{
  unint64_t v2 = sub_100013C84();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D918(uint64_t a1)
{
  unint64_t v2 = sub_100013DD4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D954(uint64_t a1)
{
  unint64_t v2 = sub_100013DD4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D990(uint64_t a1)
{
  unint64_t v2 = sub_100013BDC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D9CC(uint64_t a1)
{
  unint64_t v2 = sub_100013BDC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000DA08(uint64_t a1)
{
  unint64_t v2 = sub_100013D2C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000DA44(uint64_t a1)
{
  unint64_t v2 = sub_100013D2C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000DA80()
{
  return 0;
}

uint64_t sub_10000DA8C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_10000DABC(uint64_t a1)
{
  unint64_t v2 = sub_100013B88();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000DAF8(uint64_t a1)
{
  unint64_t v2 = sub_100013B88();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000DB34(uint64_t a1)
{
  unint64_t v2 = sub_100013AE0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000DB70(uint64_t a1)
{
  unint64_t v2 = sub_100013AE0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000DBAC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10001100C(a1, v5);
  if (!v2) {
    return sub_10000B47C((uint64_t)v5, a2);
  }
  return result;
}

uint64_t sub_10000DBF4()
{
  uint64_t result = 0x796669746E656469;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x737574617473;
      break;
    case 2:
      uint64_t result = 0x6E617254656C6966;
      break;
    case 3:
      uint64_t result = 0x7365547472617473;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000DC8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100011AC4(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000DCB4(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_10000DCC0(uint64_t a1)
{
  unint64_t v2 = sub_100013E7C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000DCFC(uint64_t a1)
{
  unint64_t v2 = sub_100013E7C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000DD38(uint64_t a1)
{
  unint64_t v2 = sub_100013F78();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000DD74(uint64_t a1)
{
  unint64_t v2 = sub_100013F78();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000DDB0(uint64_t a1)
{
  unint64_t v2 = sub_1000140C8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000DDEC(uint64_t a1)
{
  unint64_t v2 = sub_1000140C8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000DE28(uint64_t a1)
{
  unint64_t v2 = sub_100013ED0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000DE64(uint64_t a1)
{
  unint64_t v2 = sub_100013ED0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000DEA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6574656D61726170 && a2 == 0xEA00000000007372)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_100021C40();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_10000DF44(uint64_t a1)
{
  unint64_t v2 = sub_100014020();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000DF80(uint64_t a1)
{
  unint64_t v2 = sub_100014020();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000DFBC(void *a1)
{
  sub_10000B66C(v1, (uint64_t)v4);
  return sub_10000C6E8(a1);
}

unint64_t sub_10000E00C()
{
  return sub_10000CC80(*v0);
}

uint64_t sub_10000E014@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100011C9C(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000E03C(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_10000E048(uint64_t a1)
{
  unint64_t v2 = sub_1000194D0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E084(uint64_t a1)
{
  unint64_t v2 = sub_1000194D0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E0C0()
{
  return 0x656D614E656C6966;
}

uint64_t sub_10000E0DC(uint64_t a1)
{
  unint64_t v2 = sub_1000197C4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E118(uint64_t a1)
{
  unint64_t v2 = sub_1000197C4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E154(uint64_t a1)
{
  unint64_t v2 = sub_100019770();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E190(uint64_t a1)
{
  unint64_t v2 = sub_100019770();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E1CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x656D614E656C6966 && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_100021C40();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_10000E264(uint64_t a1)
{
  unint64_t v2 = sub_10001971C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E2A0(uint64_t a1)
{
  unint64_t v2 = sub_10001971C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E2DC(uint64_t a1)
{
  unint64_t v2 = sub_100019674();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E318(uint64_t a1)
{
  unint64_t v2 = sub_100019674();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E354(uint64_t a1)
{
  unint64_t v2 = sub_1000196C8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E390(uint64_t a1)
{
  unint64_t v2 = sub_1000196C8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E3CC(uint64_t a1)
{
  unint64_t v2 = sub_100019620();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E408(uint64_t a1)
{
  unint64_t v2 = sub_100019620();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E444(uint64_t a1)
{
  unint64_t v2 = sub_100019578();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E480(uint64_t a1)
{
  unint64_t v2 = sub_100019578();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E4BC(uint64_t a1)
{
  unint64_t v2 = sub_1000195CC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E4F8(uint64_t a1)
{
  unint64_t v2 = sub_1000195CC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E534(uint64_t a1)
{
  unint64_t v2 = sub_100019524();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E570(uint64_t a1)
{
  unint64_t v2 = sub_100019524();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E5AC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100012094(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10000E5DC(void *a1)
{
  return sub_10000CDC0(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_10000E5FC()
{
  uint64_t v1 = 1702521203;
  if (*v0 != 1) {
    uint64_t v1 = 0x6D75736B63656863;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_10000E648@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100012E40(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000E670(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_10000E67C(uint64_t a1)
{
  unint64_t v2 = sub_1000131B4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E6B8(uint64_t a1)
{
  unint64_t v2 = sub_1000131B4();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10000E6F4@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100012F78(a1, (uint64_t *)v6);
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

uint64_t sub_10000E73C(void *a1)
{
  return sub_10000D6E4(a1);
}

BOOL sub_10000E754(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void sub_10000E76C()
{
  sub_100021CD0(*v0);
}

uint64_t sub_10000E798()
{
  if (*v0) {
    return 0x6C656E6E616863;
  }
  else {
    return 1701080941;
  }
}

uint64_t sub_10000E7CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100014170(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000E7F4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000E800(uint64_t a1)
{
  unint64_t v2 = sub_100017AD4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E83C(uint64_t a1)
{
  unint64_t v2 = sub_100017AD4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E878@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100014254(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

BOOL sub_10000E8A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000E8B8()
{
  uint64_t v1 = 0x656D756C6F76;
  if (*v0 != 1) {
    uint64_t v1 = 0x73756C756D697473;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E656E6F706D6F63;
  }
}

uint64_t sub_10000E91C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100014440(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000E944(uint64_t a1)
{
  unint64_t v2 = sub_1000147B0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E980(uint64_t a1)
{
  unint64_t v2 = sub_1000147B0();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10000E9BC@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000145B4(a1, (uint64_t)v6);
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

uint64_t sub_10000EA04(unsigned __int8 *a1, char *a2)
{
  return sub_10000C3B4(*a1, *a2);
}

Swift::Int sub_10000EA10()
{
  return sub_100021CE0();
}

uint64_t sub_10000EAEC()
{
  sub_100021910();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000EBB0()
{
  return sub_100021CE0();
}

uint64_t sub_10000EC88@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10001628C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10000ECB8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xEA00000000006D6FLL;
  uint64_t v3 = 0x74746F427466654CLL;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      uint64_t v3 = 0x746E6F7246;
      goto LABEL_3;
    case 2:
      *a1 = 1801675074;
      a1[1] = 0xE400000000000000;
      break;
    case 3:
      *a1 = 0x746F427468676952;
      a1[1] = 0xEB000000006D6F74;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_10000ED54()
{
  return sub_100021960();
}

uint64_t sub_10000EDB4()
{
  return 0x6E656E6F706D6F63;
}

uint64_t sub_10000EDD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6E656E6F706D6F63 && a2 == 0xE900000000000074)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_100021C40();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_10000EE74(uint64_t a1)
{
  unint64_t v2 = sub_1000190D4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000EEB0(uint64_t a1)
{
  unint64_t v2 = sub_1000190D4();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10000EEEC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000162D8(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_10000EF18(void *a1, uint64_t a2, uint64_t a3)
{
  v10[1] = a3;
  uint64_t v5 = sub_100009DF0(&qword_100032938);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B198(a1, a1[3]);
  sub_100019818();
  sub_100021D30();
  char v13 = 0;
  sub_100021BF0();
  if (!v3)
  {
    char v12 = 1;
    sub_100021BF0();
    char v11 = 2;
    sub_100021BF0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10000F0B0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100009DF0(&qword_100032630);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B198(a1, a1[3]);
  sub_100017660();
  sub_100021D30();
  v9[1] = a2;
  sub_100009DF0(&qword_1000325C8);
  sub_1000178C4(&qword_100032638, &qword_1000325C8, (void (*)(void))sub_100017930);
  sub_100021C10();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10000F238()
{
  return qword_1000267D8[*v0];
}

uint64_t sub_10000F258@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100016444(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000F280(uint64_t a1)
{
  unint64_t v2 = sub_100019818();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000F2BC(uint64_t a1)
{
  unint64_t v2 = sub_100019818();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000F2F8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1000165D4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_10000F328(void *a1)
{
  return sub_10000EF18(a1, *v1, v1[1]);
}

uint64_t sub_10000F348()
{
  return 0x73656C6966;
}

uint64_t sub_10000F35C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x73656C6966 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_100021C40();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_10000F3EC(uint64_t a1)
{
  unint64_t v2 = sub_100017660();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000F428(uint64_t a1)
{
  unint64_t v2 = sub_100017660();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10000F464@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1000167A0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10000F490(void *a1)
{
  return sub_10000F0B0(a1, *v1);
}

uint64_t sub_10000F4AC()
{
  uint64_t v1 = 0x6C6F636F746F7270;
  if (*v0 != 1) {
    uint64_t v1 = 0x656C69666F7270;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E656B6F74;
  }
}

uint64_t sub_10000F510@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100016950(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000F538(uint64_t a1)
{
  unint64_t v2 = sub_1000177B0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000F574(uint64_t a1)
{
  unint64_t v2 = sub_1000177B0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000F5B0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100016AC4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_10000F5E0()
{
  return 0x73736572676F7270;
}

uint64_t sub_10000F5F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x73736572676F7270 && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_100021C40();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_10000F690(uint64_t a1)
{
  unint64_t v2 = sub_100017708();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000F6CC(uint64_t a1)
{
  unint64_t v2 = sub_100017708();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000F708@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100016D18(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10000F734()
{
  if (*v0) {
    return 0x737475706E69;
  }
  else {
    return 0x74757074756FLL;
  }
}

uint64_t sub_10000F760@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100016EB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000F788(uint64_t a1)
{
  unint64_t v2 = sub_100017564();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000F7C4(uint64_t a1)
{
  unint64_t v2 = sub_100017564();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10000F800@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_100016F9C(a1, v6);
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

uint64_t sub_10000F844()
{
  if (*v0) {
    return 0x73746C75736572;
  }
  else {
    return 0x6F43737574617473;
  }
}

uint64_t sub_10000F884@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100017224(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000F8AC(uint64_t a1)
{
  unint64_t v2 = sub_100017510();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000F8E8(uint64_t a1)
{
  unint64_t v2 = sub_100017510();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000F924@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100017324(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_10000F950(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v14 = a4;
  uint64_t v15 = a5;
  uint64_t v8 = sub_100009DF0(&qword_100032660);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B198(a1, a1[3]);
  sub_100017A2C();
  sub_100021D30();
  LOBYTE(v16) = 0;
  sub_100021BF0();
  if (!v5)
  {
    uint64_t v16 = a3;
    uint64_t v17 = v14;
    uint64_t v18 = v15;
    char v19 = 1;
    sub_100017A80();
    sub_100021C10();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10000FAE0(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = sub_100009DF0(&qword_100032648);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B198(a1, a1[3]);
  sub_100017984();
  sub_100021D30();
  v13[1] = a2;
  v13[2] = a3;
  char v14 = a4;
  sub_1000179D8();
  sub_100021C10();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10000FC38(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a3;
  uint64_t v8 = sub_100009DF0(&qword_100032618);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B198(a1, a1[3]);
  sub_100017870();
  sub_100021D30();
  uint64_t v15 = a2;
  char v14 = 0;
  sub_100009DF0(&qword_100032578);
  sub_10000B80C(&qword_100032628, &qword_100032578);
  sub_100021C10();
  if (!v4)
  {
    uint64_t v15 = v13;
    char v14 = 1;
    sub_100021C10();
    uint64_t v15 = a4;
    char v14 = 2;
    sub_100021C10();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

Swift::Int sub_10000FE34()
{
  Swift::UInt v1 = *v0;
  sub_100021CC0();
  sub_100021CD0(v1);
  return sub_100021CE0();
}

Swift::Int sub_10000FE7C()
{
  Swift::UInt v1 = *v0;
  sub_100021CC0();
  sub_100021CD0(v1);
  return sub_100021CE0();
}

uint64_t sub_10000FEC0()
{
  if (*v0) {
    return 0x6F6973726556736FLL;
  }
  else {
    return 0x6C6F636F746F7270;
  }
}

uint64_t sub_10000FF0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001917C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000FF34(uint64_t a1)
{
  unint64_t v2 = sub_100017A2C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000FF70(uint64_t a1)
{
  unint64_t v2 = sub_100017A2C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000FFAC(void *a1)
{
  return sub_10000F950(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_10000FFCC()
{
  return 0x737574617473;
}

uint64_t sub_10000FFE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x737574617473 && a2 == 0xE600000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_100021C40();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_100010070(uint64_t a1)
{
  unint64_t v2 = sub_100017984();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000100AC(uint64_t a1)
{
  unint64_t v2 = sub_100017984();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000100E8(void *a1)
{
  return sub_10000FAE0(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
}

uint64_t sub_100010108()
{
  uint64_t v1 = 0x6574656D61726170;
  if (*v0 != 1) {
    uint64_t v1 = 0x6369666963657073;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x7461636964657270;
  }
}

uint64_t sub_100010174@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000192A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001019C(uint64_t a1)
{
  unint64_t v2 = sub_100017870();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000101D8(uint64_t a1)
{
  unint64_t v2 = sub_100017870();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100010214(void *a1)
{
  return sub_10000FC38(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_100010234@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v43 = a5;
  uint64_t v48 = sub_100021A60();
  uint64_t v42 = *(void *)(v48 - 8);
  uint64_t v10 = __chkstk_darwin(v48);
  uint64_t v47 = (char *)&v35 - v11;
  uint64_t v44 = *(void *)(a2 - 8);
  __chkstk_darwin(v10);
  uint64_t v41 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v46 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v49 = a4;
  uint64_t v50 = (char *)&v35 - v16;
  uint64_t v45 = a3;
  uint64_t v17 = type metadata accessor for RawValueDecodable();
  uint64_t v40 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  char v19 = (char *)&v35 - v18;
  sub_10000B198(a1, a1[3]);
  sub_100021D00();
  if (!v5)
  {
    uint64_t v37 = v17;
    uint64_t v38 = a2;
    uint64_t v36 = v19;
    uint64_t v39 = a1;
    uint64_t v20 = v47;
    uint64_t v21 = v48;
    uint64_t v22 = v46;
    sub_10000B198(v51, v51[3]);
    sub_100021C50();
    uint64_t v23 = v22;
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
    v35(v15, v50, AssociatedTypeWitness);
    uint64_t v24 = v20;
    uint64_t v25 = v38;
    sub_100021950();
    uint64_t v26 = v44;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v20, 1, v25) != 1)
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v50, AssociatedTypeWitness);
      uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
      uint64_t v33 = v41;
      v32(v41, v24, v25);
      long long v34 = v36;
      v32(v36, v33, v25);
      sub_10000B858((uint64_t)v51);
      (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v43, v34, v37);
      uint64_t v30 = (uint64_t)v39;
      return sub_10000B858(v30);
    }
    (*(void (**)(char *, uint64_t))(v42 + 8))(v20, v21);
    type metadata accessor for RawValueDecodable.DecodingError();
    swift_getWitnessTable();
    swift_allocError();
    uint64_t v27 = v50;
    uint64_t v28 = AssociatedTypeWitness;
    v35(v29, v50, AssociatedTypeWitness);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v27, v28);
    sub_10000B858((uint64_t)v51);
    a1 = v39;
  }
  uint64_t v30 = (uint64_t)a1;
  return sub_10000B858(v30);
}

uint64_t sub_1000106EC@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100010234(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_100010710@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v40 = a3;
  uint64_t v5 = sub_100021A60();
  uint64_t v38 = *(void *)(v5 - 8);
  uint64_t v39 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v33 - v7;
  uint64_t v41 = *(void *)(a2 - 8);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SerializedCodable();
  uint64_t v37 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v33 - v12;
  sub_10000B198(a1, a1[3]);
  uint64_t v14 = v42;
  sub_100021D00();
  if (v14) {
    goto LABEL_10;
  }
  uint64_t v33 = v13;
  long long v34 = v10;
  uint64_t v35 = v11;
  uint64_t v36 = v8;
  uint64_t v42 = a1;
  sub_10000B198(v44, v44[3]);
  sub_100019068();
  sub_100021C50();
  id v16 = v43[0];
  id v15 = v43[1];
  uint64_t v17 = self;
  Class isa = sub_100021730().super.isa;
  v43[0] = 0;
  id v19 = [v17 JSONObjectWithData:isa options:0 error:v43];

  uint64_t v20 = (uint64_t)v42;
  if (!v19)
  {
    id v31 = v43[0];
    sub_100021670();

    goto LABEL_8;
  }
  id v21 = v43[0];
  sub_100021A70();
  swift_unknownObjectRelease();
  uint64_t v22 = v36;
  uint64_t v23 = a2;
  char v24 = swift_dynamicCast();
  uint64_t v25 = v41;
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56);
  if ((v24 & 1) == 0)
  {
    v26(v22, 1, 1, a2);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v22, v39);
    type metadata accessor for SerializedCodable.DecodingError();
    swift_getWitnessTable();
    swift_allocError();
LABEL_8:
    swift_willThrow();
    sub_100008C84((uint64_t)v16, (unint64_t)v15);
    sub_10000B858((uint64_t)v44);
    a1 = v42;
LABEL_10:
    uint64_t v30 = (uint64_t)a1;
    return sub_10000B858(v30);
  }
  v26(v22, 0, 1, a2);
  sub_100008C84((uint64_t)v16, (unint64_t)v15);
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
  uint64_t v28 = v34;
  v27(v34, v22, v23);
  uint64_t v29 = v33;
  v27(v33, v28, v23);
  sub_10000B858((uint64_t)v44);
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v40, v29, v35);
  uint64_t v30 = v20;
  return sub_10000B858(v30);
}

uint64_t sub_100010B68(void *a1)
{
  sub_10000B198(a1, a1[3]);
  sub_100021D20();
  uint64_t v1 = self;
  v9[0] = 0;
  id v2 = [v1 dataWithJSONObject:sub_100021C30() options:0 error:v9];
  swift_unknownObjectRelease();
  id v3 = v9[0];
  if (v2)
  {
    uint64_t v4 = (void *)sub_100021740();
    uint64_t v6 = v5;

    v9[0] = v4;
    v9[1] = v6;
    sub_10001942C((uint64_t)v10, v11);
    sub_10001947C();
    sub_100021C60();
    sub_100008C84((uint64_t)v4, (unint64_t)v6);
  }
  else
  {
    uint64_t v7 = v3;
    sub_100021670();

    swift_willThrow();
  }
  return sub_10000B858((uint64_t)v10);
}

uint64_t sub_100010CDC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100010710(a1, *(void *)(a2 + 16), a3);
}

uint64_t sub_100010CF8(void *a1)
{
  return sub_100010B68(a1);
}

uint64_t sub_100010D10(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x796669746E656469 && a2 == 0xE800000000000000;
  if (v2 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73736572676F7270 && a2 == 0xE800000000000000 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E617254656C6966 && a2 == 0xEC00000072656673 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F63655279616C70 && a2 == 0xEF6F696475416472 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6F636552706F7473 && a2 == 0xED0000676E696472 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x706D6F4374736574 && a2 == 0xEC0000006574656CLL)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_100021C40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_10001100C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v62 = a2;
  uint64_t v53 = sub_100009DF0(&qword_100032300);
  uint64_t v60 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v65 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009DF0(&qword_100032308);
  uint64_t v56 = *(void *)(v4 - 8);
  uint64_t v57 = v4;
  __chkstk_darwin(v4);
  uint64_t v64 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100009DF0(&qword_100032310);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v58 = v6;
  uint64_t v59 = v7;
  __chkstk_darwin(v6);
  uint64_t v61 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009DF0(&qword_100032318);
  uint64_t v54 = *(void *)(v9 - 8);
  uint64_t v55 = v9;
  __chkstk_darwin(v9);
  uint64_t v63 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100009DF0(&qword_100032320);
  uint64_t v51 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100009DF0(&qword_100032328);
  uint64_t v50 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100009DF0(&qword_100032330);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  id v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = a1[3];
  uint64_t v66 = a1;
  sub_10000B198(a1, v20);
  sub_100013A8C();
  uint64_t v21 = v73;
  sub_100021D10();
  uint64_t v22 = v21;
  if (v21) {
    return sub_10000B858((uint64_t)v66);
  }
  uint64_t v49 = v15;
  uint64_t v48 = v13;
  char v24 = v63;
  uint64_t v23 = v64;
  uint64_t v25 = v65;
  uint64_t v73 = v17;
  uint64_t v26 = sub_100021BC0();
  if (*(void *)(v26 + 16) != 1)
  {
    uint64_t v35 = sub_100021AE0();
    swift_allocError();
    uint64_t v37 = v36;
    sub_100009DF0(&qword_100032340);
    void *v37 = &type metadata for IncomingMessage;
    sub_100021B50();
    sub_100021AD0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v35 - 8) + 104))(v37, enum case for DecodingError.typeMismatch(_:), v35);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v19, v16);
    return sub_10000B858((uint64_t)v66);
  }
  switch(*(unsigned char *)(v26 + 32))
  {
    case 1:
      LOBYTE(v67) = 1;
      sub_100013D2C();
      sub_100021B40();
      sub_100013D80();
      uint64_t v39 = v52;
      sub_100021BB0();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v12, v39);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v19, v16);
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      uint64_t v32 = v67;
      char v31 = 1;
      break;
    case 2:
      LOBYTE(v67) = 2;
      sub_100013C84();
      sub_100021B40();
      sub_100013CD8();
      uint64_t v40 = v55;
      sub_100021BB0();
      uint64_t v41 = v73;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v24, v40);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v19, v16);
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      uint64_t v32 = v67;
      char v31 = 2;
      break;
    case 3:
      LOBYTE(v67) = 3;
      sub_100013BDC();
      uint64_t v42 = v61;
      sub_100021B40();
      sub_100013C30();
      uint64_t v43 = v58;
      sub_100021BB0();
      uint64_t v44 = v73;
      (*(void (**)(char *, uint64_t))(v59 + 8))(v42, v43);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v16);
      uint64_t v32 = v67;
      uint64_t v33 = v68;
      uint64_t v22 = v69;
      uint64_t v34 = v70;
      char v31 = 3;
      uint64_t v29 = v71;
      uint64_t v30 = v72;
      break;
    case 4:
      LOBYTE(v67) = 4;
      sub_100013B88();
      sub_100021B40();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v23, v57);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v19, v16);
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      char v31 = 5;
      break;
    case 5:
      LOBYTE(v67) = 5;
      sub_100013AE0();
      sub_100021B40();
      sub_100013B34();
      uint64_t v45 = v53;
      sub_100021BB0();
      uint64_t v46 = v73;
      (*(void (**)(char *, uint64_t))(v60 + 8))(v25, v45);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v19, v16);
      uint64_t v34 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      uint64_t v32 = v67;
      uint64_t v33 = v68;
      char v31 = 4;
      break;
    default:
      LOBYTE(v67) = 0;
      sub_100013DD4();
      uint64_t v27 = v49;
      sub_100021B40();
      sub_100013E28();
      uint64_t v28 = v48;
      sub_100021BB0();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v27, v28);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v19, v16);
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      char v31 = 0;
      uint64_t v32 = v67;
      uint64_t v33 = v68;
      uint64_t v22 = v69;
      uint64_t v34 = v70;
      break;
  }
  uint64_t result = sub_10000B858((uint64_t)v66);
  uint64_t v47 = v62;
  *uint64_t v62 = v32;
  v47[1] = v33;
  v47[2] = v22;
  v47[3] = v34;
  v47[4] = v29;
  v47[5] = v30;
  *((unsigned char *)v47 + 48) = v31;
  return result;
}

uint64_t sub_100011AC4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x796669746E656469 && a2 == 0xE800000000000000;
  if (v2 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x737574617473 && a2 == 0xE600000000000000 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E617254656C6966 && a2 == 0xEC00000072656673 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7365547472617473 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_100021C40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_100011C9C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6965636552646964 && a2 == 0xEE00656C69466576;
  if (v2 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000100023340 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x646E6553656C6966 && a2 == 0xED0000726F727245 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000100023360 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100023380 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6B63616279616C70 && a2 == 0xED0000726F727245 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001000233A0 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001000233C0 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6E6964726F636572 && a2 == 0xEE00726F72724567)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v6 = sub_100021C40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

uint64_t sub_100012094(void *a1)
{
  uint64_t v85 = sub_100009DF0(&qword_100032948);
  uint64_t v77 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  char v80 = (char *)&v58 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100009DF0(&qword_100032950);
  uint64_t v75 = *(void *)(v3 - 8);
  uint64_t v76 = v3;
  __chkstk_darwin(v3);
  v84 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_100009DF0(&qword_100032958);
  uint64_t v74 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  v83 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100009DF0(&qword_100032960);
  uint64_t v72 = *(void *)(v6 - 8);
  uint64_t v73 = v6;
  __chkstk_darwin(v6);
  char v82 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009DF0(&qword_100032968);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v69 = v8;
  uint64_t v70 = v9;
  __chkstk_darwin(v8);
  char v79 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100009DF0(&qword_100032970);
  uint64_t v66 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  char v81 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100009DF0(&qword_100032978);
  uint64_t v67 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  __int16 v78 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_100009DF0(&qword_100032980);
  uint64_t v63 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100009DF0(&qword_100032988);
  uint64_t v62 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100009DF0(&qword_100032990);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = a1[3];
  v86 = a1;
  sub_10000B198(a1, v22);
  sub_1000194D0();
  uint64_t v23 = v87;
  sub_100021D10();
  if (!v23)
  {
    uint64_t v59 = v17;
    uint64_t v58 = v15;
    uint64_t v60 = v14;
    char v24 = v81;
    uint64_t v25 = v82;
    uint64_t v26 = v83;
    uint64_t v61 = 0;
    uint64_t v28 = v84;
    uint64_t v27 = v85;
    uint64_t v87 = v19;
    uint64_t v29 = v21;
    uint64_t v30 = sub_100021BC0();
    uint64_t v19 = v30;
    if (*(void *)(v30 + 16) == 1)
    {
      uint64_t v31 = v18;
      switch(*(unsigned char *)(v30 + 32))
      {
        case 1:
          char v89 = 1;
          sub_100019770();
          uint64_t v40 = v60;
          uint64_t v33 = v18;
          uint64_t v41 = v61;
          sub_100021B40();
          if (v41) {
            goto LABEL_23;
          }
          uint64_t v42 = v64;
          uint64_t v43 = sub_100021B70();
          uint64_t v44 = v87;
          uint64_t v19 = v43;
          (*(void (**)(char *, uint64_t))(v63 + 8))(v40, v42);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v44 + 8))(v29, v33);
          break;
        case 2:
          char v90 = 2;
          sub_10001971C();
          uint64_t v45 = v78;
          uint64_t v33 = v18;
          uint64_t v46 = v61;
          sub_100021B40();
          if (v46) {
            goto LABEL_23;
          }
          uint64_t v47 = v65;
          uint64_t v19 = sub_100021B70();
          (*(void (**)(char *, uint64_t))(v67 + 8))(v45, v47);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v87 + 8))(v29, v18);
          break;
        case 3:
          char v91 = 3;
          sub_1000196C8();
          uint64_t v48 = v61;
          sub_100021B40();
          if (v48) {
            goto LABEL_20;
          }
          (*(void (**)(char *, uint64_t))(v66 + 8))(v24, v68);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v87 + 8))(v29, v18);
          uint64_t v19 = 0;
          break;
        case 4:
          char v92 = 4;
          sub_100019674();
          uint64_t v49 = v79;
          uint64_t v50 = v61;
          sub_100021B40();
          if (v50) {
            goto LABEL_20;
          }
          (*(void (**)(char *, uint64_t))(v70 + 8))(v49, v69);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v87 + 8))(v29, v18);
          uint64_t v19 = 1;
          break;
        case 5:
          char v93 = 5;
          sub_100019620();
          uint64_t v51 = v61;
          sub_100021B40();
          if (v51) {
            goto LABEL_20;
          }
          (*(void (**)(char *, uint64_t))(v72 + 8))(v25, v73);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v87 + 8))(v29, v18);
          uint64_t v19 = 2;
          break;
        case 6:
          char v94 = 6;
          sub_1000195CC();
          uint64_t v52 = v61;
          sub_100021B40();
          if (v52) {
            goto LABEL_20;
          }
          (*(void (**)(char *, uint64_t))(v74 + 8))(v26, v71);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v87 + 8))(v29, v18);
          uint64_t v19 = 3;
          break;
        case 7:
          char v95 = 7;
          sub_100019578();
          uint64_t v53 = v61;
          sub_100021B40();
          if (v53) {
            goto LABEL_20;
          }
          (*(void (**)(char *, uint64_t))(v75 + 8))(v28, v76);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v87 + 8))(v29, v18);
          uint64_t v19 = 4;
          break;
        case 8:
          uint64_t v55 = v27;
          char v96 = 8;
          sub_100019524();
          uint64_t v56 = v80;
          uint64_t v33 = v31;
          uint64_t v57 = v61;
          sub_100021B40();
          if (v57) {
            goto LABEL_23;
          }
          (*(void (**)(char *, uint64_t))(v77 + 8))(v56, v55);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v87 + 8))(v29, v31);
          uint64_t v19 = 5;
          break;
        default:
          char v88 = 0;
          sub_1000197C4();
          uint64_t v32 = v59;
          uint64_t v33 = v18;
          uint64_t v34 = v61;
          sub_100021B40();
          if (v34)
          {
LABEL_23:
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v87 + 8))(v29, v33);
          }
          else
          {
            uint64_t v35 = v58;
            uint64_t v36 = sub_100021B70();
            uint64_t v37 = v87;
            uint64_t v19 = v36;
            (*(void (**)(char *, uint64_t))(v62 + 8))(v32, v35);
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v37 + 8))(v29, v33);
          }
          break;
      }
    }
    else
    {
      uint64_t v38 = sub_100021AE0();
      swift_allocError();
      uint64_t v19 = v39;
      sub_100009DF0(&qword_100032340);
      *(void *)uint64_t v19 = &type metadata for Status;
      sub_100021B50();
      sub_100021AD0();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v38 - 8) + 104))(v19, enum case for DecodingError.typeMismatch(_:), v38);
      swift_willThrow();
LABEL_20:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v29, v18);
    }
  }
  sub_10000B858((uint64_t)v86);
  return v19;
}

uint64_t sub_100012E40(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702521203 && a2 == 0xE400000000000000 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D75736B63656863 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_100021C40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_100012F78@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100009DF0(&qword_1000322D0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B198(a1, a1[3]);
  sub_1000131B4();
  sub_100021D10();
  if (v2) {
    return sub_10000B858((uint64_t)a1);
  }
  char v22 = 0;
  uint64_t v9 = sub_100021B70();
  uint64_t v11 = v10;
  char v21 = 1;
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_100021BA0();
  char v20 = 2;
  uint64_t v12 = sub_100021B70();
  uint64_t v14 = v13;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v18 = v12;
  v15(v8, v5);
  swift_bridgeObjectRetain();
  sub_10000B858((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v9;
  a2[1] = v11;
  uint64_t v17 = v18;
  a2[2] = v19;
  a2[3] = v17;
  a2[4] = v14;
  return result;
}

unint64_t sub_1000131B4()
{
  unint64_t result = qword_1000322D8;
  if (!qword_1000322D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000322D8);
  }
  return result;
}

uint64_t sub_100013208(uint64_t result, uint64_t a2, unsigned __int8 a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 3:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 2:
      break;
    case 1:
      return sub_100013298(result, a2, a3);
    default:
      return result;
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100013298(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for OutgoingMessage(uint64_t a1)
{
  return sub_1000132C4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t sub_1000132C4(uint64_t result, uint64_t a2, unsigned __int8 a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 3:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 2:
      break;
    case 1:
      return sub_100013354(result, a2, a3);
    default:
      return result;
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_100013354(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for OutgoingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_100013208(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for OutgoingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_100013208(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_1000132C4(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for OutgoingMessage(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for OutgoingMessage(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_1000132C4(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for OutgoingMessage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OutgoingMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100013534(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_10001353C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for OutgoingMessage()
{
  return &type metadata for OutgoingMessage;
}

uint64_t destroy for IncomingMessage(uint64_t a1)
{
  return sub_10000B5C4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
}

uint64_t initializeWithCopy for IncomingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_10000B4D8(*(void *)a2, v4, v5, v6, v7, v8, v9);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for IncomingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_10000B4D8(*(void *)a2, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  char v16 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v9;
  sub_10000B5C4(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 initializeWithTake for IncomingMessage(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for IncomingMessage(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  char v11 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v3;
  sub_10000B5C4(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for IncomingMessage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 <= 5) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for IncomingMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 48) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100013788(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 48) <= 4u) {
    return *(unsigned __int8 *)(a1 + 48);
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t sub_1000137A0(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(void *)__n128 result = a2 - 5;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)(result + 40) = 0;
    LOBYTE(a2) = 5;
  }
  *(unsigned char *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for IncomingMessage()
{
  return &type metadata for IncomingMessage;
}

uint64_t destroy for AudioOutput()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AudioOutput(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AudioOutput(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AudioOutput(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioOutput(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioOutput(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioOutput()
{
  return &type metadata for AudioOutput;
}

unsigned char *initializeBufferWithCopyOfBuffer for AudioInput.Component(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for FileInfo.CodingKeys()
{
  return &type metadata for FileInfo.CodingKeys;
}

unint64_t sub_100013988()
{
  unint64_t result = qword_1000322E8;
  if (!qword_1000322E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000322E8);
  }
  return result;
}

unint64_t sub_1000139E0()
{
  unint64_t result = qword_1000322F0;
  if (!qword_1000322F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000322F0);
  }
  return result;
}

unint64_t sub_100013A38()
{
  unint64_t result = qword_1000322F8;
  if (!qword_1000322F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000322F8);
  }
  return result;
}

unint64_t sub_100013A8C()
{
  unint64_t result = qword_100032338;
  if (!qword_100032338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032338);
  }
  return result;
}

unint64_t sub_100013AE0()
{
  unint64_t result = qword_100032348;
  if (!qword_100032348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032348);
  }
  return result;
}

unint64_t sub_100013B34()
{
  unint64_t result = qword_100032350;
  if (!qword_100032350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032350);
  }
  return result;
}

unint64_t sub_100013B88()
{
  unint64_t result = qword_100032358;
  if (!qword_100032358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032358);
  }
  return result;
}

unint64_t sub_100013BDC()
{
  unint64_t result = qword_100032360;
  if (!qword_100032360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032360);
  }
  return result;
}

unint64_t sub_100013C30()
{
  unint64_t result = qword_100032368;
  if (!qword_100032368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032368);
  }
  return result;
}

unint64_t sub_100013C84()
{
  unint64_t result = qword_100032370;
  if (!qword_100032370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032370);
  }
  return result;
}

unint64_t sub_100013CD8()
{
  unint64_t result = qword_100032378;
  if (!qword_100032378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032378);
  }
  return result;
}

unint64_t sub_100013D2C()
{
  unint64_t result = qword_100032380;
  if (!qword_100032380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032380);
  }
  return result;
}

unint64_t sub_100013D80()
{
  unint64_t result = qword_100032388;
  if (!qword_100032388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032388);
  }
  return result;
}

unint64_t sub_100013DD4()
{
  unint64_t result = qword_100032390;
  if (!qword_100032390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032390);
  }
  return result;
}

unint64_t sub_100013E28()
{
  unint64_t result = qword_100032398;
  if (!qword_100032398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032398);
  }
  return result;
}

unint64_t sub_100013E7C()
{
  unint64_t result = qword_1000323C8;
  if (!qword_1000323C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000323C8);
  }
  return result;
}

unint64_t sub_100013ED0()
{
  unint64_t result = qword_1000323D0;
  if (!qword_1000323D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000323D0);
  }
  return result;
}

unint64_t sub_100013F24()
{
  unint64_t result = qword_1000323D8;
  if (!qword_1000323D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000323D8);
  }
  return result;
}

unint64_t sub_100013F78()
{
  unint64_t result = qword_1000323E0;
  if (!qword_1000323E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000323E0);
  }
  return result;
}

unint64_t sub_100013FCC()
{
  unint64_t result = qword_1000323E8;
  if (!qword_1000323E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000323E8);
  }
  return result;
}

unint64_t sub_100014020()
{
  unint64_t result = qword_1000323F0;
  if (!qword_1000323F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000323F0);
  }
  return result;
}

unint64_t sub_100014074()
{
  unint64_t result = qword_1000323F8;
  if (!qword_1000323F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000323F8);
  }
  return result;
}

unint64_t sub_1000140C8()
{
  unint64_t result = qword_100032400;
  if (!qword_100032400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032400);
  }
  return result;
}

unint64_t sub_10001411C()
{
  unint64_t result = qword_100032408;
  if (!qword_100032408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032408);
  }
  return result;
}

uint64_t sub_100014170(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701080941 && a2 == 0xE400000000000000;
  if (v2 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C656E6E616863 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100021C40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100014254(void *a1)
{
  uint64_t v2 = sub_100009DF0(&qword_100032678);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B198(a1, a1[3]);
  sub_100017AD4();
  sub_100021D10();
  sub_100009DF0(&qword_100032688);
  v8[7] = 0;
  sub_10000B80C(qword_100032690, &qword_100032688);
  sub_100021BB0();
  uint64_t v6 = v9;
  v8[6] = 1;
  sub_100021B90();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  sub_10000B858((uint64_t)a1);
  return v6;
}

uint64_t sub_100014440(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E656E6F706D6F63 && a2 == 0xE900000000000074;
  if (v2 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D756C6F76 && a2 == 0xE600000000000000 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x73756C756D697473 && a2 == 0xEC000000656C6946)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_100021C40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1000145B4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100009DF0(&qword_100032410);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B198(a1, a1[3]);
  sub_1000147B0();
  sub_100021D10();
  if (v2) {
    return sub_10000B858((uint64_t)a1);
  }
  v18[15] = 0;
  sub_100014804();
  sub_100021BB0();
  uint64_t v10 = v19;
  uint64_t v9 = v20;
  LOBYTE(v19) = 1;
  sub_100021B80();
  int v12 = v11;
  LOBYTE(v19) = 2;
  uint64_t v13 = sub_100021B70();
  uint64_t v14 = v8;
  uint64_t v16 = v15;
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v14, v5);
  uint64_t result = sub_10000B858((uint64_t)a1);
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v9;
  *(_DWORD *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = v16;
  return result;
}

unint64_t sub_1000147B0()
{
  unint64_t result = qword_100032418;
  if (!qword_100032418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032418);
  }
  return result;
}

unint64_t sub_100014804()
{
  unint64_t result = qword_100032420;
  if (!qword_100032420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032420);
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioOutput.CodingKeys()
{
  return &type metadata for AudioOutput.CodingKeys;
}

ValueMetadata *type metadata accessor for OutgoingMessage.CodingKeys()
{
  return &type metadata for OutgoingMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for OutgoingMessage.IdentifyCodingKeys()
{
  return &type metadata for OutgoingMessage.IdentifyCodingKeys;
}

ValueMetadata *type metadata accessor for OutgoingMessage.StatusCodingKeys()
{
  return &type metadata for OutgoingMessage.StatusCodingKeys;
}

ValueMetadata *type metadata accessor for OutgoingMessage.FileTransferCodingKeys()
{
  return &type metadata for OutgoingMessage.FileTransferCodingKeys;
}

ValueMetadata *type metadata accessor for OutgoingMessage.StartTestCodingKeys()
{
  return &type metadata for OutgoingMessage.StartTestCodingKeys;
}

uint64_t getEnumTagSinglePayload for IncomingMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for IncomingMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x100014A24);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IncomingMessage.CodingKeys()
{
  return &type metadata for IncomingMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for IncomingMessage.IdentifyCodingKeys()
{
  return &type metadata for IncomingMessage.IdentifyCodingKeys;
}

ValueMetadata *type metadata accessor for IncomingMessage.ProgressCodingKeys()
{
  return &type metadata for IncomingMessage.ProgressCodingKeys;
}

ValueMetadata *type metadata accessor for IncomingMessage.FileTransferCodingKeys()
{
  return &type metadata for IncomingMessage.FileTransferCodingKeys;
}

ValueMetadata *type metadata accessor for IncomingMessage.PlayRecordAudioCodingKeys()
{
  return &type metadata for IncomingMessage.PlayRecordAudioCodingKeys;
}

ValueMetadata *type metadata accessor for IncomingMessage.StopRecordingCodingKeys()
{
  return &type metadata for IncomingMessage.StopRecordingCodingKeys;
}

ValueMetadata *type metadata accessor for IncomingMessage.TestCompleteCodingKeys()
{
  return &type metadata for IncomingMessage.TestCompleteCodingKeys;
}

uint64_t destroy for StartTestParameters()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s15Diagnostic_838919StartTestParametersVwCP_0(void *a1, void *a2)
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

void *assignWithCopy for StartTestParameters(void *a1, void *a2)
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

__n128 initializeBufferWithCopyOfBuffer for OSVersion(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for StartTestParameters(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StartTestParameters(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for StartTestParameters(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for StartTestParameters()
{
  return &type metadata for StartTestParameters;
}

uint64_t destroy for StatusParameters(uint64_t a1)
{
  return sub_100013354(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

__n128 initializeWithTake for Status(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for StatusParameters()
{
  return &type metadata for StatusParameters;
}

__n128 initializeWithCopy for OutgoingIdentifyParameters(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for OutgoingIdentifyParameters(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for OutgoingIdentifyParameters(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for OutgoingIdentifyParameters()
{
  return &type metadata for OutgoingIdentifyParameters;
}

void *initializeBufferWithCopyOfBuffer for TestCompleteParameters(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for TestCompleteParameters()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for TestCompleteParameters(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeBufferWithCopyOfBuffer for AudioOutput.Component(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for TestCompleteParameters(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TestCompleteParameters(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TestCompleteParameters(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TestCompleteParameters()
{
  return &type metadata for TestCompleteParameters;
}

uint64_t destroy for PlayRecordAudioParameters()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PlayRecordAudioParameters(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PlayRecordAudioParameters(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PlayRecordAudioParameters(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PlayRecordAudioParameters(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PlayRecordAudioParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
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
      *(void *)(result + 32) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlayRecordAudioParameters()
{
  return &type metadata for PlayRecordAudioParameters;
}

ValueMetadata *type metadata accessor for FileTransferParameters()
{
  return &type metadata for FileTransferParameters;
}

ValueMetadata *type metadata accessor for ProgressParameters()
{
  return &type metadata for ProgressParameters;
}

uint64_t destroy for IncomingIdentifyParameters()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for IncomingIdentifyParameters(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for IncomingIdentifyParameters(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for IncomingIdentifyParameters(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IncomingIdentifyParameters(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IncomingIdentifyParameters(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IncomingIdentifyParameters()
{
  return &type metadata for IncomingIdentifyParameters;
}

uint64_t getEnumTagSinglePayload for AudioOutput.Component(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AudioOutput.Component(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AudioOutput.Component()
{
  return &type metadata for AudioOutput.Component;
}

unint64_t sub_10001533C(uint64_t a1)
{
  unint64_t result = sub_100013E28();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100015364(uint64_t a1)
{
  unint64_t result = sub_100013D80();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10001538C(uint64_t a1)
{
  unint64_t result = sub_100013FCC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000153B4(uint64_t a1)
{
  unint64_t result = sub_100013CD8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000153DC(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_10001540C();
  unint64_t result = sub_100015460();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_10001540C()
{
  unint64_t result = qword_100032428;
  if (!qword_100032428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032428);
  }
  return result;
}

unint64_t sub_100015460()
{
  unint64_t result = qword_100032430;
  if (!qword_100032430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032430);
  }
  return result;
}

unint64_t sub_1000154B4(uint64_t a1)
{
  unint64_t result = sub_100013C30();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000154DC(uint64_t a1)
{
  unint64_t result = sub_100013B34();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100015504(uint64_t a1)
{
  unint64_t result = sub_10001411C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10001552C(uint64_t a1)
{
  unint64_t result = sub_100014074();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100015554(uint64_t a1)
{
  unint64_t result = sub_100013F24();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100015580()
{
  unint64_t result = qword_100032438;
  if (!qword_100032438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032438);
  }
  return result;
}

unint64_t sub_1000155D8()
{
  unint64_t result = qword_100032440;
  if (!qword_100032440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032440);
  }
  return result;
}

unint64_t sub_100015630()
{
  unint64_t result = qword_100032448;
  if (!qword_100032448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032448);
  }
  return result;
}

unint64_t sub_100015688()
{
  unint64_t result = qword_100032450;
  if (!qword_100032450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032450);
  }
  return result;
}

unint64_t sub_1000156E0()
{
  unint64_t result = qword_100032458;
  if (!qword_100032458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032458);
  }
  return result;
}

unint64_t sub_100015738()
{
  unint64_t result = qword_100032460;
  if (!qword_100032460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032460);
  }
  return result;
}

unint64_t sub_100015790()
{
  unint64_t result = qword_100032468;
  if (!qword_100032468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032468);
  }
  return result;
}

unint64_t sub_1000157E8()
{
  unint64_t result = qword_100032470;
  if (!qword_100032470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032470);
  }
  return result;
}

unint64_t sub_100015840()
{
  unint64_t result = qword_100032478;
  if (!qword_100032478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032478);
  }
  return result;
}

unint64_t sub_100015898()
{
  unint64_t result = qword_100032480;
  if (!qword_100032480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032480);
  }
  return result;
}

unint64_t sub_1000158F0()
{
  unint64_t result = qword_100032488;
  if (!qword_100032488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032488);
  }
  return result;
}

unint64_t sub_100015948()
{
  unint64_t result = qword_100032490;
  if (!qword_100032490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032490);
  }
  return result;
}

unint64_t sub_1000159A0()
{
  unint64_t result = qword_100032498;
  if (!qword_100032498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032498);
  }
  return result;
}

unint64_t sub_1000159F8()
{
  unint64_t result = qword_1000324A0;
  if (!qword_1000324A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000324A0);
  }
  return result;
}

unint64_t sub_100015A50()
{
  unint64_t result = qword_1000324A8;
  if (!qword_1000324A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000324A8);
  }
  return result;
}

unint64_t sub_100015AA8()
{
  unint64_t result = qword_1000324B0;
  if (!qword_1000324B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000324B0);
  }
  return result;
}

unint64_t sub_100015B00()
{
  unint64_t result = qword_1000324B8;
  if (!qword_1000324B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000324B8);
  }
  return result;
}

unint64_t sub_100015B58()
{
  unint64_t result = qword_1000324C0;
  if (!qword_1000324C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000324C0);
  }
  return result;
}

unint64_t sub_100015BB0()
{
  unint64_t result = qword_1000324C8;
  if (!qword_1000324C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000324C8);
  }
  return result;
}

unint64_t sub_100015C08()
{
  unint64_t result = qword_1000324D0;
  if (!qword_1000324D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000324D0);
  }
  return result;
}

unint64_t sub_100015C60()
{
  unint64_t result = qword_1000324D8;
  if (!qword_1000324D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000324D8);
  }
  return result;
}

unint64_t sub_100015CB8()
{
  unint64_t result = qword_1000324E0;
  if (!qword_1000324E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000324E0);
  }
  return result;
}

unint64_t sub_100015D10()
{
  unint64_t result = qword_1000324E8;
  if (!qword_1000324E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000324E8);
  }
  return result;
}

unint64_t sub_100015D68()
{
  unint64_t result = qword_1000324F0;
  if (!qword_1000324F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000324F0);
  }
  return result;
}

unint64_t sub_100015DC0()
{
  unint64_t result = qword_1000324F8;
  if (!qword_1000324F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000324F8);
  }
  return result;
}

unint64_t sub_100015E18()
{
  unint64_t result = qword_100032500;
  if (!qword_100032500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032500);
  }
  return result;
}

unint64_t sub_100015E70()
{
  unint64_t result = qword_100032508;
  if (!qword_100032508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032508);
  }
  return result;
}

unint64_t sub_100015EC8()
{
  unint64_t result = qword_100032510;
  if (!qword_100032510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032510);
  }
  return result;
}

unint64_t sub_100015F20()
{
  unint64_t result = qword_100032518;
  if (!qword_100032518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032518);
  }
  return result;
}

unint64_t sub_100015F78()
{
  unint64_t result = qword_100032520;
  if (!qword_100032520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032520);
  }
  return result;
}

unint64_t sub_100015FD0()
{
  unint64_t result = qword_100032528;
  if (!qword_100032528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032528);
  }
  return result;
}

unint64_t sub_100016028()
{
  unint64_t result = qword_100032530;
  if (!qword_100032530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032530);
  }
  return result;
}

unint64_t sub_100016080()
{
  unint64_t result = qword_100032538;
  if (!qword_100032538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032538);
  }
  return result;
}

unint64_t sub_1000160D8()
{
  unint64_t result = qword_100032540;
  if (!qword_100032540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032540);
  }
  return result;
}

unint64_t sub_100016130()
{
  unint64_t result = qword_100032548;
  if (!qword_100032548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032548);
  }
  return result;
}

unint64_t sub_100016188()
{
  unint64_t result = qword_100032550;
  if (!qword_100032550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032550);
  }
  return result;
}

unint64_t sub_1000161E0()
{
  unint64_t result = qword_100032558;
  if (!qword_100032558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032558);
  }
  return result;
}

unint64_t sub_100016238()
{
  unint64_t result = qword_100032560;
  if (!qword_100032560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032560);
  }
  return result;
}

uint64_t sub_10001628C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10002CAD8;
  v6._object = a2;
  unint64_t v4 = sub_100021B30(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

void *sub_1000162D8(void *a1)
{
  uint64_t v3 = sub_100009DF0(&qword_100032878);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  Swift::String v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  BOOL v7 = sub_10000B198(a1, a1[3]);
  sub_1000190D4();
  sub_100021D10();
  if (v1)
  {
    sub_10000B858((uint64_t)a1);
  }
  else
  {
    sub_100019128();
    sub_100021BB0();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    BOOL v7 = (void *)v9[15];
    sub_10000B858((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_100016444(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x726556726F6A616DLL && a2 == 0xEC0000006E6F6973;
  if (v2 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726556726F6E696DLL && a2 == 0xEC0000006E6F6973 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7265566863746170 && a2 == 0xEC0000006E6F6973)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_100021C40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1000165D4(void *a1)
{
  uint64_t v2 = sub_100009DF0(qword_100032998);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000B198(a1, a1[3]);
  sub_100019818();
  sub_100021D10();
  v8[15] = 0;
  uint64_t v6 = sub_100021B90();
  v8[14] = 1;
  sub_100021B90();
  v8[13] = 2;
  sub_100021B90();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  sub_10000B858((uint64_t)a1);
  return v6;
}

void *sub_1000167A0(void *a1)
{
  uint64_t v3 = sub_100009DF0(&qword_1000325B8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v7 = sub_10000B198(a1, a1[3]);
  sub_100017660();
  sub_100021D10();
  if (v1)
  {
    sub_10000B858((uint64_t)a1);
  }
  else
  {
    sub_100009DF0(&qword_1000325C8);
    sub_1000178C4(&qword_1000325D0, &qword_1000325C8, (void (*)(void))sub_1000176B4);
    sub_100021BB0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    BOOL v7 = (void *)v9[1];
    sub_10000B858((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_100016950(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E656B6F74 && a2 == 0xE500000000000000;
  if (v2 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6F636F746F7270 && a2 == 0xEF6E6F6973726556 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C69666F7270 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_100021C40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_100016AC4(void *a1)
{
  uint64_t v3 = sub_100009DF0(&qword_1000325F8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  sub_10000B198(a1, a1[3]);
  sub_1000177B0();
  sub_100021D10();
  if (v1)
  {
    sub_10000B858((uint64_t)a1);
  }
  else
  {
    v9[31] = 0;
    uint64_t v7 = sub_100021B70();
    v9[30] = 1;
    swift_bridgeObjectRetain();
    sub_100021B90();
    sub_100009DF0(&qword_100032608);
    v9[29] = 2;
    sub_100017804();
    sub_100021BB0();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    sub_10000B858((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_100016D18(void *a1)
{
  uint64_t v3 = sub_100009DF0(&qword_1000325E0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t)sub_10000B198(a1, a1[3]);
  sub_100017708();
  sub_100021D10();
  if (!v1)
  {
    uint64_t v7 = sub_100021B90();
    if ((unint64_t)(v7 - 101) >= 0xFFFFFFFFFFFFFF9ALL)
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      sub_10000B858((uint64_t)a1);
      return v7;
    }
    sub_10001775C();
    swift_allocError();
    *int v8 = v7;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_10000B858((uint64_t)a1);
  return v7;
}

uint64_t sub_100016EB8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74757074756FLL && a2 == 0xE600000000000000;
  if (v2 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x737475706E69 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100021C40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100016F9C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_100009DF0(&qword_100032588);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B198(a1, a1[3]);
  sub_100017564();
  sub_100021D10();
  if (v2) {
    return sub_10000B858((uint64_t)a1);
  }
  char v24 = 0;
  sub_1000175B8();
  sub_100021B60();
  uint64_t v17 = v20;
  uint64_t v18 = v19;
  uint64_t v9 = v23;
  uint64_t v15 = v22;
  uint64_t v16 = v21;
  sub_100009DF0(&qword_1000325A0);
  char v24 = 1;
  sub_1000178C4(&qword_1000325A8, &qword_1000325A0, (void (*)(void))sub_10001760C);
  swift_bridgeObjectRetain();
  sub_100021B60();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = v19;
  swift_bridgeObjectRetain();
  sub_10000B858((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v12 = v17;
  *a2 = v18;
  a2[1] = v12;
  uint64_t v13 = v15;
  a2[2] = v16;
  a2[3] = v13;
  a2[4] = v9;
  a2[5] = v10;
  return result;
}

uint64_t sub_100017224(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6F43737574617473 && a2 == 0xEA00000000006564;
  if (v2 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73746C75736572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100021C40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100017324(void *a1)
{
  uint64_t v3 = sub_100009DF0(&qword_100032568);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  sub_10000B198(a1, v7);
  sub_100017510();
  sub_100021D10();
  if (!v1)
  {
    v9[31] = 0;
    uint64_t v7 = sub_100021B90();
    sub_100009DF0(&qword_100032578);
    v9[15] = 1;
    sub_10000B80C(&qword_100032580, &qword_100032578);
    sub_100021BB0();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_10000B858((uint64_t)a1);
  return v7;
}

unint64_t sub_100017510()
{
  unint64_t result = qword_100032570;
  if (!qword_100032570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032570);
  }
  return result;
}

unint64_t sub_100017564()
{
  unint64_t result = qword_100032590;
  if (!qword_100032590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032590);
  }
  return result;
}

unint64_t sub_1000175B8()
{
  unint64_t result = qword_100032598;
  if (!qword_100032598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032598);
  }
  return result;
}

unint64_t sub_10001760C()
{
  unint64_t result = qword_1000325B0;
  if (!qword_1000325B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000325B0);
  }
  return result;
}

unint64_t sub_100017660()
{
  unint64_t result = qword_1000325C0;
  if (!qword_1000325C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000325C0);
  }
  return result;
}

unint64_t sub_1000176B4()
{
  unint64_t result = qword_1000325D8;
  if (!qword_1000325D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000325D8);
  }
  return result;
}

unint64_t sub_100017708()
{
  unint64_t result = qword_1000325E8;
  if (!qword_1000325E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000325E8);
  }
  return result;
}

unint64_t sub_10001775C()
{
  unint64_t result = qword_1000325F0;
  if (!qword_1000325F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000325F0);
  }
  return result;
}

unint64_t sub_1000177B0()
{
  unint64_t result = qword_100032600;
  if (!qword_100032600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032600);
  }
  return result;
}

unint64_t sub_100017804()
{
  unint64_t result = qword_100032610;
  if (!qword_100032610)
  {
    sub_10000B248(&qword_100032608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032610);
  }
  return result;
}

unint64_t sub_100017870()
{
  unint64_t result = qword_100032620;
  if (!qword_100032620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032620);
  }
  return result;
}

uint64_t sub_1000178C4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B248(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100017930()
{
  unint64_t result = qword_100032640;
  if (!qword_100032640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032640);
  }
  return result;
}

unint64_t sub_100017984()
{
  unint64_t result = qword_100032650;
  if (!qword_100032650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032650);
  }
  return result;
}

unint64_t sub_1000179D8()
{
  unint64_t result = qword_100032658;
  if (!qword_100032658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032658);
  }
  return result;
}

unint64_t sub_100017A2C()
{
  unint64_t result = qword_100032668;
  if (!qword_100032668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032668);
  }
  return result;
}

unint64_t sub_100017A80()
{
  unint64_t result = qword_100032670;
  if (!qword_100032670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032670);
  }
  return result;
}

unint64_t sub_100017AD4()
{
  unint64_t result = qword_100032680;
  if (!qword_100032680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032680);
  }
  return result;
}

uint64_t sub_100017B30(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100017B38(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AudioOutput.Component.CodingKeys()
{
  return &type metadata for AudioOutput.Component.CodingKeys;
}

ValueMetadata *type metadata accessor for OutgoingIdentifyParameters.CodingKeys()
{
  return &type metadata for OutgoingIdentifyParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for StatusParameters.CodingKeys()
{
  return &type metadata for StatusParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for StartTestParameters.CodingKeys()
{
  return &type metadata for StartTestParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for IncomingIdentifyParameters.CodingKeys()
{
  return &type metadata for IncomingIdentifyParameters.CodingKeys;
}

void *initializeBufferWithCopyOfBuffer for ProgressParameters.DecodingError(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ProgressParameters.DecodingError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ProgressParameters.DecodingError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ProgressParameters.DecodingError()
{
  return &type metadata for ProgressParameters.DecodingError;
}

ValueMetadata *type metadata accessor for ProgressParameters.CodingKeys()
{
  return &type metadata for ProgressParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for FileTransferParameters.CodingKeys()
{
  return &type metadata for FileTransferParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for PlayRecordAudioParameters.CodingKeys()
{
  return &type metadata for PlayRecordAudioParameters.CodingKeys;
}

uint64_t _s15Diagnostic_838911AudioOutputV9ComponentV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s15Diagnostic_838911AudioOutputV9ComponentV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100017D84);
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

ValueMetadata *type metadata accessor for TestCompleteParameters.CodingKeys()
{
  return &type metadata for TestCompleteParameters.CodingKeys;
}

uint64_t _s15Diagnostic_83896StatusOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100013298(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s15Diagnostic_83896StatusOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100013298(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_100013354(v6, v7, v8);
  return a1;
}

uint64_t _s15Diagnostic_83896StatusOwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_100013354(v4, v5, v6);
  return a1;
}

uint64_t _s15Diagnostic_83896StatusOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s15Diagnostic_83896StatusOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100017F34(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_100017F4C(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)unint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Status()
{
  return &type metadata for Status;
}

uint64_t getEnumTagSinglePayload for OSVersion(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for OSVersion(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for OSVersion()
{
  return &type metadata for OSVersion;
}

uint64_t sub_100017FD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t sub_100017FD8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for SerializedCodable()
{
  return sub_100019884();
}

ValueMetadata *type metadata accessor for AudioInput()
{
  return &type metadata for AudioInput;
}

uint64_t sub_1000180B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_1000180B8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_100018148(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *char v3 = *a2;
    char v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_100018200(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_10001822C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_10001827C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1000182CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_10001831C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_10001836C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_1000184C8(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x1000186E0);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for RawValueDecodable()
{
  return sub_100019884();
}

unint64_t sub_100018724()
{
  unint64_t result = qword_100032798;
  if (!qword_100032798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032798);
  }
  return result;
}

unint64_t sub_10001877C()
{
  unint64_t result = qword_1000327A0;
  if (!qword_1000327A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000327A0);
  }
  return result;
}

unint64_t sub_1000187D4()
{
  unint64_t result = qword_1000327A8;
  if (!qword_1000327A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000327A8);
  }
  return result;
}

unint64_t sub_10001882C()
{
  unint64_t result = qword_1000327B0;
  if (!qword_1000327B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000327B0);
  }
  return result;
}

unint64_t sub_100018884()
{
  unint64_t result = qword_1000327B8;
  if (!qword_1000327B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000327B8);
  }
  return result;
}

unint64_t sub_1000188DC()
{
  unint64_t result = qword_1000327C0;
  if (!qword_1000327C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000327C0);
  }
  return result;
}

unint64_t sub_100018934()
{
  unint64_t result = qword_1000327C8;
  if (!qword_1000327C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000327C8);
  }
  return result;
}

unint64_t sub_10001898C()
{
  unint64_t result = qword_1000327D0;
  if (!qword_1000327D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000327D0);
  }
  return result;
}

unint64_t sub_1000189E4()
{
  unint64_t result = qword_1000327D8;
  if (!qword_1000327D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000327D8);
  }
  return result;
}

unint64_t sub_100018A3C()
{
  unint64_t result = qword_1000327E0;
  if (!qword_1000327E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000327E0);
  }
  return result;
}

unint64_t sub_100018A94()
{
  unint64_t result = qword_1000327E8;
  if (!qword_1000327E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000327E8);
  }
  return result;
}

unint64_t sub_100018AEC()
{
  unint64_t result = qword_1000327F0;
  if (!qword_1000327F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000327F0);
  }
  return result;
}

unint64_t sub_100018B44()
{
  unint64_t result = qword_1000327F8;
  if (!qword_1000327F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000327F8);
  }
  return result;
}

unint64_t sub_100018B9C()
{
  unint64_t result = qword_100032800;
  if (!qword_100032800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032800);
  }
  return result;
}

unint64_t sub_100018BF4()
{
  unint64_t result = qword_100032808;
  if (!qword_100032808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032808);
  }
  return result;
}

unint64_t sub_100018C4C()
{
  unint64_t result = qword_100032810;
  if (!qword_100032810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032810);
  }
  return result;
}

unint64_t sub_100018CA4()
{
  unint64_t result = qword_100032818;
  if (!qword_100032818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032818);
  }
  return result;
}

unint64_t sub_100018CFC()
{
  unint64_t result = qword_100032820;
  if (!qword_100032820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032820);
  }
  return result;
}

unint64_t sub_100018D54()
{
  unint64_t result = qword_100032828;
  if (!qword_100032828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032828);
  }
  return result;
}

unint64_t sub_100018DAC()
{
  unint64_t result = qword_100032830;
  if (!qword_100032830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032830);
  }
  return result;
}

unint64_t sub_100018E04()
{
  unint64_t result = qword_100032838;
  if (!qword_100032838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032838);
  }
  return result;
}

unint64_t sub_100018E5C()
{
  unint64_t result = qword_100032840;
  if (!qword_100032840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032840);
  }
  return result;
}

unint64_t sub_100018EB4()
{
  unint64_t result = qword_100032848;
  if (!qword_100032848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032848);
  }
  return result;
}

unint64_t sub_100018F0C()
{
  unint64_t result = qword_100032850;
  if (!qword_100032850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032850);
  }
  return result;
}

unint64_t sub_100018F64()
{
  unint64_t result = qword_100032858;
  if (!qword_100032858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032858);
  }
  return result;
}

unint64_t sub_100018FBC()
{
  unint64_t result = qword_100032860;
  if (!qword_100032860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032860);
  }
  return result;
}

unint64_t sub_100019014()
{
  unint64_t result = qword_100032868;
  if (!qword_100032868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032868);
  }
  return result;
}

unint64_t sub_100019068()
{
  unint64_t result = qword_100032870;
  if (!qword_100032870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032870);
  }
  return result;
}

uint64_t type metadata accessor for SerializedCodable.DecodingError()
{
  return sub_100019884();
}

unint64_t sub_1000190D4()
{
  unint64_t result = qword_100032880;
  if (!qword_100032880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032880);
  }
  return result;
}

unint64_t sub_100019128()
{
  unint64_t result = qword_100032888;
  if (!qword_100032888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032888);
  }
  return result;
}

uint64_t sub_10001917C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C6F636F746F7270 && a2 == 0xEF6E6F6973726556;
  if (v2 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F6973726556736FLL && a2 == 0xE90000000000006ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100021C40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1000192A0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7461636964657270 && a2 == 0xEA00000000007365;
  if (v2 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574656D61726170 && a2 == 0xEA00000000007372 || (sub_100021C40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6369666963657073 && a2 == 0xEE00736E6F697461)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_100021C40();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_10001942C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_10001947C()
{
  unint64_t result = qword_100032890;
  if (!qword_100032890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032890);
  }
  return result;
}

unint64_t sub_1000194D0()
{
  unint64_t result = qword_1000328E8;
  if (!qword_1000328E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000328E8);
  }
  return result;
}

unint64_t sub_100019524()
{
  unint64_t result = qword_1000328F0;
  if (!qword_1000328F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000328F0);
  }
  return result;
}

unint64_t sub_100019578()
{
  unint64_t result = qword_1000328F8;
  if (!qword_1000328F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000328F8);
  }
  return result;
}

unint64_t sub_1000195CC()
{
  unint64_t result = qword_100032900;
  if (!qword_100032900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032900);
  }
  return result;
}

unint64_t sub_100019620()
{
  unint64_t result = qword_100032908;
  if (!qword_100032908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032908);
  }
  return result;
}

unint64_t sub_100019674()
{
  unint64_t result = qword_100032910;
  if (!qword_100032910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032910);
  }
  return result;
}

unint64_t sub_1000196C8()
{
  unint64_t result = qword_100032918;
  if (!qword_100032918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032918);
  }
  return result;
}

unint64_t sub_10001971C()
{
  unint64_t result = qword_100032920;
  if (!qword_100032920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032920);
  }
  return result;
}

unint64_t sub_100019770()
{
  unint64_t result = qword_100032928;
  if (!qword_100032928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032928);
  }
  return result;
}

unint64_t sub_1000197C4()
{
  unint64_t result = qword_100032930;
  if (!qword_100032930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032930);
  }
  return result;
}

unint64_t sub_100019818()
{
  unint64_t result = qword_100032940;
  if (!qword_100032940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032940);
  }
  return result;
}

uint64_t type metadata accessor for RawValueDecodable.DecodingError()
{
  return sub_100019884();
}

uint64_t sub_100019884()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1000198B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_1000198BC(uint64_t a1)
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t *sub_100019974(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 <= 7
    && *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    uint64_t v10 = AssociatedTypeWitness;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(uint64_t *, void, void, uint64_t))(v5 + 56))(a1, 0, 0, v10);
  }
  else
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return a1;
}

uint64_t sub_100019A80(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);

  return v3(a1, AssociatedTypeWitness);
}

uint64_t sub_100019AFC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  (*(void (**)(uint64_t, void, void, uint64_t))(v5 + 56))(a1, 0, 0, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_100019BB8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 24))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_100019C30(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  (*(void (**)(uint64_t, void, void, uint64_t))(v5 + 56))(a1, 0, 0, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_100019CEC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_100019D64(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 48);

  return v5(a1, a2, AssociatedTypeWitness);
}

uint64_t sub_100019DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unsigned int v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56);

  return v7(a1, a2, a3, AssociatedTypeWitness);
}

uint64_t _s15Diagnostic_83898FileInfoV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s15Diagnostic_83898FileInfoV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100019FD0);
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

ValueMetadata *type metadata accessor for OSVersion.CodingKeys()
{
  return &type metadata for OSVersion.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Status.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Status.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001A164);
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

ValueMetadata *type metadata accessor for Status.CodingKeys()
{
  return &type metadata for Status.CodingKeys;
}

ValueMetadata *type metadata accessor for Status.DidReceiveFileCodingKeys()
{
  return &type metadata for Status.DidReceiveFileCodingKeys;
}

ValueMetadata *type metadata accessor for Status.FileReceiveErrorCodingKeys()
{
  return &type metadata for Status.FileReceiveErrorCodingKeys;
}

ValueMetadata *type metadata accessor for Status.FileSendErrorCodingKeys()
{
  return &type metadata for Status.FileSendErrorCodingKeys;
}

ValueMetadata *type metadata accessor for Status.PlaybackDidStartCodingKeys()
{
  return &type metadata for Status.PlaybackDidStartCodingKeys;
}

ValueMetadata *type metadata accessor for Status.PlaybackDidFinishCodingKeys()
{
  return &type metadata for Status.PlaybackDidFinishCodingKeys;
}

ValueMetadata *type metadata accessor for Status.PlaybackErrorCodingKeys()
{
  return &type metadata for Status.PlaybackErrorCodingKeys;
}

ValueMetadata *type metadata accessor for Status.RecordingDidStartCodingKeys()
{
  return &type metadata for Status.RecordingDidStartCodingKeys;
}

ValueMetadata *type metadata accessor for Status.RecordingDidFinishCodingKeys()
{
  return &type metadata for Status.RecordingDidFinishCodingKeys;
}

ValueMetadata *type metadata accessor for Status.RecordingErrorCodingKeys()
{
  return &type metadata for Status.RecordingErrorCodingKeys;
}

ValueMetadata *type metadata accessor for AudioInput.CodingKeys()
{
  return &type metadata for AudioInput.CodingKeys;
}

uint64_t sub_10001A23C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 8);
}

unsigned char *_s15Diagnostic_838915OutgoingMessageO18IdentifyCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10001A2E0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _s15Diagnostic_838910AudioInputV9ComponentOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s15Diagnostic_838910AudioInputV9ComponentOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001A464);
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

unsigned char *sub_10001A48C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AudioInput.Component()
{
  return &type metadata for AudioInput.Component;
}

unint64_t sub_10001A4A8()
{
  unint64_t result = qword_100032AA0;
  if (!qword_100032AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AA0);
  }
  return result;
}

uint64_t sub_10001A4FC()
{
  return swift_getWitnessTable();
}

unint64_t sub_10001A51C()
{
  unint64_t result = qword_100032AA8;
  if (!qword_100032AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AA8);
  }
  return result;
}

unint64_t sub_10001A574()
{
  unint64_t result = qword_100032AB0;
  if (!qword_100032AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AB0);
  }
  return result;
}

unint64_t sub_10001A5CC()
{
  unint64_t result = qword_100032AB8;
  if (!qword_100032AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AB8);
  }
  return result;
}

unint64_t sub_10001A624()
{
  unint64_t result = qword_100032AC0;
  if (!qword_100032AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AC0);
  }
  return result;
}

unint64_t sub_10001A67C()
{
  unint64_t result = qword_100032AC8;
  if (!qword_100032AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AC8);
  }
  return result;
}

unint64_t sub_10001A6D4()
{
  unint64_t result = qword_100032AD0;
  if (!qword_100032AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AD0);
  }
  return result;
}

unint64_t sub_10001A72C()
{
  unint64_t result = qword_100032AD8;
  if (!qword_100032AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AD8);
  }
  return result;
}

unint64_t sub_10001A784()
{
  unint64_t result = qword_100032AE0;
  if (!qword_100032AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AE0);
  }
  return result;
}

unint64_t sub_10001A7DC()
{
  unint64_t result = qword_100032AE8;
  if (!qword_100032AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AE8);
  }
  return result;
}

unint64_t sub_10001A834()
{
  unint64_t result = qword_100032AF0;
  if (!qword_100032AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AF0);
  }
  return result;
}

unint64_t sub_10001A88C()
{
  unint64_t result = qword_100032AF8;
  if (!qword_100032AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AF8);
  }
  return result;
}

unint64_t sub_10001A8E4()
{
  unint64_t result = qword_100032B00;
  if (!qword_100032B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B00);
  }
  return result;
}

unint64_t sub_10001A93C()
{
  unint64_t result = qword_100032B08;
  if (!qword_100032B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B08);
  }
  return result;
}

unint64_t sub_10001A994()
{
  unint64_t result = qword_100032B10;
  if (!qword_100032B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B10);
  }
  return result;
}

unint64_t sub_10001A9EC()
{
  unint64_t result = qword_100032B18;
  if (!qword_100032B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B18);
  }
  return result;
}

unint64_t sub_10001AA44()
{
  unint64_t result = qword_100032B20;
  if (!qword_100032B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B20);
  }
  return result;
}

unint64_t sub_10001AA9C()
{
  unint64_t result = qword_100032B28;
  if (!qword_100032B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B28);
  }
  return result;
}

unint64_t sub_10001AAF4()
{
  unint64_t result = qword_100032B30;
  if (!qword_100032B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B30);
  }
  return result;
}

unint64_t sub_10001AB4C()
{
  unint64_t result = qword_100032B38;
  if (!qword_100032B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B38);
  }
  return result;
}

unint64_t sub_10001ABA4()
{
  unint64_t result = qword_100032B40;
  if (!qword_100032B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B40);
  }
  return result;
}

unint64_t sub_10001ABFC()
{
  unint64_t result = qword_100032B48;
  if (!qword_100032B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B48);
  }
  return result;
}

unint64_t sub_10001AC54()
{
  unint64_t result = qword_100032B50;
  if (!qword_100032B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B50);
  }
  return result;
}

unint64_t sub_10001ACAC()
{
  unint64_t result = qword_100032B58;
  if (!qword_100032B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B58);
  }
  return result;
}

unint64_t sub_10001AD04()
{
  unint64_t result = qword_100032B60;
  if (!qword_100032B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B60);
  }
  return result;
}

unint64_t sub_10001AD5C()
{
  unint64_t result = qword_100032B68;
  if (!qword_100032B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B68);
  }
  return result;
}

unint64_t sub_10001ADB4()
{
  unint64_t result = qword_100032B70;
  if (!qword_100032B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B70);
  }
  return result;
}

unint64_t sub_10001AE0C()
{
  unint64_t result = qword_100032B78;
  if (!qword_100032B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B78);
  }
  return result;
}

unint64_t sub_10001AE64()
{
  unint64_t result = qword_100032B80;
  if (!qword_100032B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B80);
  }
  return result;
}

unint64_t sub_10001AEBC()
{
  unint64_t result = qword_100032B88;
  if (!qword_100032B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B88);
  }
  return result;
}

unint64_t sub_10001AF14()
{
  unint64_t result = qword_100032B90;
  if (!qword_100032B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B90);
  }
  return result;
}

unint64_t sub_10001AF68()
{
  unint64_t result = qword_100032B98;
  if (!qword_100032B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032B98);
  }
  return result;
}

uint64_t sub_10001AFE8(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  unint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  unint64_t result = (uint64_t)sub_100008E90((char *)result, v10, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    unint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10001B0D8()
{
  sub_1000202E4();
  uint64_t result = sub_100021A50();
  qword_1000393C8 = result;
  return result;
}

uint64_t sub_10001B13C()
{
  uint64_t v1 = sub_1000216F0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  int64_t v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[0] = 0;
  v7[1] = 0xE000000000000000;
  sub_100021AB0(16);
  swift_bridgeObjectRelease();
  strcpy((char *)v7, "UUT-Recording-");
  HIBYTE(v7[1]) = -18;
  v6[1] = *(void *)(v0 + OBJC_IVAR___AudioBoxController_recordingNumber);
  v8._countAndFlagsBits = sub_100021C20();
  sub_100021920(v8);
  swift_bridgeObjectRelease();
  sub_1000216C0();
  swift_bridgeObjectRelease();
  sub_1000216D0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

id sub_10001B2CC(uint64_t a1, void *a2)
{
  if (a1 && (type metadata accessor for AudioBoxInputs(), (uint64_t v4 = swift_dynamicCastClass()) != 0))
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void **)&v2[OBJC_IVAR___AudioBoxController_inputs];
    *(void *)&v2[OBJC_IVAR___AudioBoxController_inputs] = v4;
    swift_unknownObjectRetain_n();

    *(void *)&v2[OBJC_IVAR___AudioBoxController_responder] = a2;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    uint64_t v21 = type metadata accessor for AudioBoxController();
    uint64_t v22 = &off_10002E8D0;
    v20[0] = v2;
    uint64_t v7 = objc_allocWithZone((Class)type metadata accessor for AudioBoxBluetoothManager());
    uint64_t v8 = sub_10001942C((uint64_t)v20, v21);
    __chkstk_darwin(v8);
    int64_t v10 = (void *)((char *)&v20[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v11 + 16))(v10);
    uint64_t v12 = *v10;
    int v13 = v2;
    unsigned int v14 = sub_100021310(v12, v7);
    sub_10000B858((uint64_t)v20);
    int v15 = *(void **)&v13[OBJC_IVAR___AudioBoxController_bluetoothManager];
    *(void *)&v13[OBJC_IVAR___AudioBoxController_bluetoothManager] = v14;

    [a2 enableVolumeHUD:0];
    sub_10001BC30();
    if (*(unsigned char *)(v5 + OBJC_IVAR___AudioBoxInputs_downloadAudioFiles) == 1) {
      sub_10001C218();
    }
    return (id)swift_unknownObjectRelease();
  }
  else
  {
    id v17 = [v2 result];
    Class isa = sub_1000219B0().super.super.isa;
    [v17 setStatusCode:isa];

    return [v2 setFinished:1];
  }
}

void sub_10001B5B4()
{
  id v1 = [v0 progress];
  [v1 setCompletedUnitCount:-1];

  id v2 = [v0 progress];
  [v2 setTotalUnitCount:100];

  uint64_t v3 = *(char **)&v0[OBJC_IVAR___AudioBoxController_bluetoothManager];
  if (!v3)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v0;
  if (v3[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isBluetoothReady] == 1)
  {
    uint64_t v5 = *(void *)&v0[OBJC_IVAR___AudioBoxController_inputs];
    if (v5)
    {
      uint64_t v6 = (uint64_t *)(v5 + OBJC_IVAR___AudioBoxInputs_audioBoxID);
      uint64_t v7 = v6[1];
      if (v7)
      {
        uint64_t v8 = *v6;
        uint64_t v9 = swift_allocObject();
        *(void *)(v9 + 16) = v0;
        int64_t v10 = v0;
        uint64_t v11 = v3;
        swift_bridgeObjectRetain();
        sub_100002328(v8, v7, (void (*)(char *, uint64_t))sub_100021300, v9);

        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        return;
      }
LABEL_13:
      __break(1u);
      return;
    }
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v12 = (uint64_t (**)())&v3[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback];
  uint64_t v13 = *(void *)&v3[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback];
  *uint64_t v12 = sub_1000212F8;
  v12[1] = (uint64_t (*)())v4;
  unsigned int v14 = v0;

  sub_10000B290(v13);
}

uint64_t sub_10001B7A8(uint64_t result)
{
  id v1 = *(void **)(result + OBJC_IVAR___AudioBoxController_bluetoothManager);
  if (!v1)
  {
    __break(1u);
    goto LABEL_8;
  }
  id v2 = (void *)result;
  uint64_t v3 = *(void *)(result + OBJC_IVAR___AudioBoxController_inputs);
  if (!v3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = (uint64_t *)(v3 + OBJC_IVAR___AudioBoxInputs_audioBoxID);
  uint64_t v5 = v4[1];
  if (!v5)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v6 = *v4;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v2;
  id v8 = v1;
  swift_bridgeObjectRetain();
  id v9 = v2;
  sub_100002328(v6, v5, (void (*)(char *, uint64_t))sub_1000215DC, v7);

  swift_bridgeObjectRelease();

  return swift_release();
}

void sub_10001B898(char *a1)
{
  id v2 = [self processInfo];
  [v2 operatingSystemVersion];
  uint64_t v3 = *(void *)&v16[16];
  long long v15 = *(_OWORD *)v16;

  *(void *)uint64_t v16 = 1;
  *(_OWORD *)&v16[8] = v15;
  uint64_t v17 = v3;
  char v18 = 0;
  uint64_t v4 = OBJC_IVAR___AudioBoxController_bluetoothManager;
  uint64_t v5 = *(void **)&a1[OBJC_IVAR___AudioBoxController_bluetoothManager];
  if (!v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v6 = v5;
  sub_100003354((uint64_t)v16);

  uint64_t v7 = *(void **)&a1[v4];
  if (!v7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v8 = *(void *)&a1[OBJC_IVAR___AudioBoxController_inputs];
  if (!v8)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v9 = (uint64_t *)(v8 + OBJC_IVAR___AudioBoxInputs_audioBoxToken);
  uint64_t v10 = v9[1];
  if (!v10)
  {
LABEL_11:
    __break(1u);
    return;
  }
  uint64_t v11 = *v9;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  id v13 = v7;
  swift_bridgeObjectRetain();
  unsigned int v14 = a1;
  sub_100002AFC(v11, v10, (uint64_t)sub_100021308, v12);

  swift_bridgeObjectRelease();

  swift_release();
}

void sub_10001BA0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + OBJC_IVAR___AudioBoxController_inputs);
  if (!v1)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___AudioBoxInputs_parameters);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___AudioBoxInputs_specifications);
  v6[0] = *(void *)(v1 + OBJC_IVAR___AudioBoxInputs_predicates);
  v6[1] = v2;
  void v6[2] = v3;
  v6[3] = 0;
  char v7 = 3;
  uint64_t v4 = *(void **)(a1 + OBJC_IVAR___AudioBoxController_bluetoothManager);
  if (!v4)
  {
LABEL_7:
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v4;
  sub_100003354((uint64_t)v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

id sub_10001BB44()
{
  id result = [*(id *)(v0 + OBJC_IVAR___AudioBoxController_audioTest) cancel];
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___AudioBoxController_bluetoothManager);
  if (!v2)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBox))
  {
    id result = *(id *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager);
    if (!result)
    {
LABEL_11:
      __break(1u);
      return result;
    }
    [result cancelPeripheralConnection:];
  }
  sub_10001BF30();
  id result = *(id *)(v0 + OBJC_IVAR___AudioBoxController_responder);
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  return [result enableVolumeHUD:1];
}

uint64_t sub_10001BC30()
{
  uint64_t v1 = v0;
  sub_10001BF30();
  id v2 = [self defaultManager];
  sub_1000216A0((NSURL *)OBJC_IVAR___AudioBoxController_audioFileFolderURL);
  uint64_t v4 = v3;
  id v20 = 0;
  unsigned int v5 = [v2 createDirectoryAtURL:v3 withIntermediateDirectories:0 attributes:0 error:&v20];

  if (v5)
  {
    id v6 = v20;
    sub_1000219F0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_100023950;
    uint64_t v8 = sub_1000216E0();
    uint64_t v10 = v9;
    *(void *)(v7 + 56) = &type metadata for String;
    *(void *)(v7 + 64) = sub_100009E38();
    *(void *)(v7 + 32) = v8;
    *(void *)(v7 + 40) = v10;
    sub_100021790();
    return swift_bridgeObjectRelease();
  }
  else
  {
    id v12 = v20;
    id v13 = (void *)sub_100021670();

    swift_willThrow();
    sub_1000219D0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_100023950;
    id v20 = v13;
    swift_errorRetain();
    sub_100009DF0((uint64_t *)&unk_100032C10);
    uint64_t v15 = sub_100021900();
    uint64_t v17 = v16;
    *(void *)(v14 + 56) = &type metadata for String;
    *(void *)(v14 + 64) = sub_100009E38();
    *(void *)(v14 + 32) = v15;
    *(void *)(v14 + 40) = v17;
    sub_100021790();
    swift_bridgeObjectRelease();
    id v18 = [v1 result];
    Class isa = sub_1000219B0().super.super.isa;
    [v18 setStatusCode:isa];

    [v1 setFinished:1];
    return swift_errorRelease();
  }
}

void sub_10001BF30()
{
  uint64_t v0 = self;
  id v1 = [v0 defaultManager];
  sub_1000216E0();
  NSString v2 = sub_100021890();
  swift_bridgeObjectRelease();
  unsigned int v3 = [v1 fileExistsAtPath:v2];

  if (v3)
  {
    id v4 = [v0 defaultManager];
    sub_1000216A0(v5);
    uint64_t v7 = v6;
    id v20 = 0;
    unsigned int v8 = [v4 removeItemAtURL:v6 error:&v20];

    if (v8)
    {
      id v9 = v20;
      sub_1000219F0();
      if (qword_100031A78 != -1) {
        swift_once();
      }
      sub_100009DF0(&qword_1000320B0);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_100023950;
      uint64_t v11 = sub_1000216E0();
      uint64_t v13 = v12;
      *(void *)(v10 + 56) = &type metadata for String;
      *(void *)(v10 + 64) = sub_100009E38();
      *(void *)(v10 + 32) = v11;
      *(void *)(v10 + 40) = v13;
      sub_100021790();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v14 = v20;
      uint64_t v15 = (void *)sub_100021670();

      swift_willThrow();
      sub_1000219D0();
      if (qword_100031A78 != -1) {
        swift_once();
      }
      sub_100009DF0(&qword_1000320B0);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_100023950;
      id v20 = v15;
      swift_errorRetain();
      sub_100009DF0((uint64_t *)&unk_100032C10);
      uint64_t v17 = sub_100021900();
      uint64_t v19 = v18;
      *(void *)(v16 + 56) = &type metadata for String;
      *(void *)(v16 + 64) = sub_100009E38();
      *(void *)(v16 + 32) = v17;
      *(void *)(v16 + 40) = v19;
      sub_100021790();
      swift_bridgeObjectRelease();
      swift_errorRelease();
    }
  }
}

void sub_10001C218()
{
  id v1 = v0;
  uint64_t v2 = sub_1000217A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unsigned int v5 = (uint64_t *)((char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_1000217F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v55 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v54 = (char *)&v46 - v10;
  uint64_t v68 = sub_1000216F0();
  uint64_t v65 = *(void *)(v68 - 8);
  uint64_t v11 = __chkstk_darwin(v68);
  uint64_t v62 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = v12;
  __chkstk_darwin(v11);
  uint64_t v64 = (char *)&v46 - v13;
  dispatch_group_t v14 = dispatch_group_create();
  uint64_t v15 = OBJC_IVAR___AudioBoxController_inputs;
  uint64_t v16 = *(void *)&v1[OBJC_IVAR___AudioBoxController_inputs];
  if (!v16)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v17 = v14;
  uint64_t v18 = *(void *)(*(void *)(v16 + OBJC_IVAR___AudioBoxInputs_sources) + 16);
  if (v18)
  {
    uint64_t v48 = v5;
    uint64_t v49 = OBJC_IVAR___AudioBoxController_inputs;
    uint64_t v50 = v7;
    uint64_t v51 = v3;
    uint64_t v52 = v6;
    uint64_t v53 = v2;
    uint64_t v61 = &v1[OBJC_IVAR___AudioBoxController_audioFileFolderURL];
    uint64_t v59 = v65 + 16;
    uint64_t v60 = OBJC_IVAR___AudioBoxController_responder;
    uint64_t v57 = v70;
    uint64_t v58 = v65 + 32;
    uint64_t v56 = v65 + 8;
    uint64_t v47 = swift_bridgeObjectRetain();
    uint64_t v19 = (uint64_t *)(v47 + 40);
    id v20 = v64;
    while (1)
    {
      uint64_t v21 = *(v19 - 1);
      uint64_t v22 = *v19;
      swift_bridgeObjectRetain();
      if ([v1 isFinished])
      {
        swift_bridgeObjectRelease();
LABEL_9:
        swift_bridgeObjectRelease();
        uint64_t v2 = v53;
        uint64_t v6 = v52;
        uint64_t v3 = v51;
        uint64_t v7 = v50;
        uint64_t v15 = v49;
        unsigned int v5 = v48;
        goto LABEL_10;
      }
      uint64_t v67 = v18;
      sub_1000216C0();
      dispatch_group_enter(v17);
      uint64_t v23 = *(void **)&v1[v60];
      if (!v23) {
        break;
      }
      char v24 = v17;
      v19 += 2;
      swift_unknownObjectRetain();
      NSString v66 = sub_100021890();
      uint64_t v25 = v65;
      uint64_t v26 = v62;
      (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v62, v20, v68);
      unint64_t v27 = (*(unsigned __int8 *)(v25 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
      uint64_t v28 = (char *)swift_allocObject();
      *((void *)v28 + 2) = v24;
      *((void *)v28 + 3) = v21;
      *((void *)v28 + 4) = v22;
      *((void *)v28 + 5) = v1;
      uint64_t v29 = v68;
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(&v28[v27], v26, v68);
      v70[2] = sub_100021270;
      v70[3] = v28;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      v70[0] = sub_10001CFDC;
      v70[1] = &unk_10002EA58;
      uint64_t v30 = _Block_copy(aBlock);
      uint64_t v31 = v24;
      uint64_t v32 = v1;
      swift_release();
      uint64_t v33 = v66;
      [v23 getAsset:v66 completion:v30];
      uint64_t v34 = v30;
      id v20 = v64;
      _Block_release(v34);
      swift_unknownObjectRelease();

      (*(void (**)(char *, uint64_t))(v25 + 8))(v20, v29);
      uint64_t v18 = v67 - 1;
      uint64_t v17 = v24;
      if (v67 == 1) {
        goto LABEL_9;
      }
    }
    __break(1u);
    goto LABEL_20;
  }
LABEL_10:
  sub_1000217E0();
  uint64_t v35 = *(void *)&v1[v15];
  if (!v35)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v36 = *(void *)(v35 + OBJC_IVAR___AudioBoxInputs_fileDownloadTimeout);
  if (v36 < 0)
  {
    __break(1u);
LABEL_18:
    swift_once();
    goto LABEL_14;
  }
  *unsigned int v5 = v36;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchTimeInterval.seconds(_:), v2);
  uint64_t v37 = v54;
  uint64_t v38 = v55;
  sub_100021800();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v39 = *(void (**)(char *, uint64_t))(v7 + 8);
  v39(v38, v6);
  char v40 = sub_100021A00();
  v39(v37, v6);
  if ((v40 & 1) == 0)
  {
LABEL_16:

    return;
  }
  sub_1000219D0();
  if (qword_100031A78 != -1) {
    goto LABEL_18;
  }
LABEL_14:
  sub_100009DF0(&qword_1000320B0);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_100023950;
  uint64_t v42 = *(void *)&v1[v15];
  if (v42)
  {
    uint64_t v43 = *(void *)(v42 + OBJC_IVAR___AudioBoxInputs_fileDownloadTimeout);
    *(void *)(v41 + 56) = &type metadata for UInt;
    *(void *)(v41 + 64) = &protocol witness table for UInt;
    *(void *)(v41 + 32) = v43;
    sub_100021790();
    swift_bridgeObjectRelease();
    id v44 = [v1 result];
    Class isa = sub_1000219B0().super.super.isa;
    [v44 setStatusCode:isa];

    [v1 setFinished:1];
    goto LABEL_16;
  }
LABEL_22:
  __break(1u);
}

void sub_10001C8E4(uint64_t a1, unint64_t a2, NSObject *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  uint64_t v14 = sub_100009DF0(&qword_100032C08);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 60 == 15)
  {
    sub_1000219D0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_100023950;
    *(void *)(v17 + 56) = &type metadata for String;
    *(void *)(v17 + 64) = sub_100009E38();
    *(void *)(v17 + 32) = a4;
    *(void *)(v17 + 40) = a5;
    swift_bridgeObjectRetain();
    sub_100021790();
    swift_bridgeObjectRelease();
    id v18 = [a6 result];
    Class isa = sub_1000219B0().super.super.isa;
    [v18 setStatusCode:isa];

    [a6 setFinished:1];
    dispatch_group_leave(a3);
  }
  else
  {
    sub_100008C2C(a1, a2);
    sub_100021750();
    dispatch_group_t v27 = a3;
    uint64_t v20 = sub_1000216F0();
    uint64_t v21 = *(void *)(v20 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v16, a7, v20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v16, 0, 1, v20);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_10001CE10((uint64_t)v16, a4, a5);
    swift_endAccess();
    v26[1] = sub_1000219F0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_100023960;
    *(void *)(v22 + 56) = &type metadata for String;
    unint64_t v23 = sub_100009E38();
    *(void *)(v22 + 64) = v23;
    *(void *)(v22 + 32) = a4;
    *(void *)(v22 + 40) = a5;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_1000216E0();
    *(void *)(v22 + 96) = &type metadata for String;
    *(void *)(v22 + 104) = v23;
    *(void *)(v22 + 72) = v24;
    *(void *)(v22 + 80) = v25;
    sub_100021790();
    sub_10000B71C(a1, a2);
    swift_bridgeObjectRelease();
    dispatch_group_leave(v27);
  }
}

uint64_t sub_10001CE10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  sub_100009DF0(&qword_100032C08);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000216F0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1, 1, v10) == 1)
  {
    sub_10002016C(a1);
    sub_100020324(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_10002016C((uint64_t)v9);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v13, a1, v10);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_100020AC4((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v17;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10001CFDC(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(void (**)(void *, unint64_t))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v4 = v2;
    uint64_t v2 = (void *)sub_100021740();
    unint64_t v6 = v5;
  }
  else
  {
    swift_retain();
    unint64_t v6 = 0xF000000000000000;
  }
  v3(v2, v6);
  sub_10000B71C((uint64_t)v2, v6);

  return swift_release();
}

void sub_10001D074(uint64_t a1)
{
  sub_10000B47C(a1, (uint64_t)v24);
  sub_10000B47C(a1, (uint64_t)v25);
  switch(v28)
  {
    case 1:
      uint64_t v14 = *(void *)&v25[0];
      id v15 = [v1 progress];
      [v15 setCompletedUnitCount:v14];

      return;
    case 2:
      unint64_t v6 = *(void **)&v1[OBJC_IVAR___AudioBoxController_bluetoothManager];
      if (!v6) {
        goto LABEL_14;
      }
      uint64_t v7 = *(void *)&v25[0];
      id v8 = v6;
      sub_100020FF8(a1, (void (*)(void, void, void, void, void, void, void))sub_10000B4D8);
      sub_10001AFE8(v7);
      sub_100004900();

      break;
    case 3:
      long long v20 = v25[0];
      long long v21 = v25[1];
      uint64_t v22 = v26;
      sub_10001E3CC((uint64_t)&v20, v27);
      return;
    case 4:
      uint64_t v9 = *((void *)&v25[0] + 1);
      id v10 = [v1 result];
      swift_bridgeObjectRetain();
      sub_10001D404(v9);
      sub_100020FF8(a1, (void (*)(void, void, void, void, void, void, void))sub_10000B5C4);
      Class isa = sub_100021860().super.isa;
      swift_bridgeObjectRelease();
      [v10 setData:isa];

      id v12 = [v1 result];
      Class v13 = sub_1000219B0().super.super.isa;
      [v12 setStatusCode:v13];

      [v1 setFinished:1];
      return;
    case 5:
      sub_1000219F0();
      if (qword_100031A78 != -1) {
        swift_once();
      }
      sub_100021790();
      uint64_t v16 = *(void **)&v1[OBJC_IVAR___AudioBoxController_audioTest];
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = v1;
      uint64_t v22 = sub_100020FF0;
      uint64_t v23 = v17;
      *(void *)&long long v20 = _NSConcreteStackBlock;
      *((void *)&v20 + 1) = 1107296256;
      *(void *)&long long v21 = sub_10001F394;
      *((void *)&v21 + 1) = &unk_10002E9E0;
      id v18 = _Block_copy(&v20);
      uint64_t v19 = v1;
      swift_release();
      [v16 stopRecording:v18];
      _Block_release(v18);
      return;
    default:
      uint64_t v3 = *(void **)&v1[OBJC_IVAR___AudioBoxController_bluetoothManager];
      if (!v3)
      {
        __break(1u);
LABEL_14:
        __break(1u);
        JUMPOUT(0x10001D3ECLL);
      }
      long long v4 = v25[0];
      id v5 = v3;
      sub_10000305C(v4, *((uint64_t *)&v4 + 1));

      break;
  }
}

uint64_t sub_10001D404(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100009DF0(&qword_100032C28);
    uint64_t v2 = (void *)sub_100021B20();
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
  unint64_t v6 = (char *)(v2 + 8);
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
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_10000B300(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10000B3C4(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_10000B3C4(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_10000B3C4(v36, v37);
    sub_10000B3C4(v37, &v33);
    uint64_t result = sub_100021AA0(v2[5]);
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
    uint64_t result = (uint64_t)sub_10000B3C4(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_10002118C();
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

uint64_t sub_10001D7CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  p_type = &stru_100030FF0.type;
  uint64_t v7 = "AudioBox is already authenticated";
  if (a1)
  {
    swift_errorRetain();
    sub_1000219D0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100023950;
    swift_errorRetain();
    sub_100009DF0((uint64_t *)&unk_100032C10);
    uint64_t v10 = sub_100021900();
    uint64_t v12 = v11;
    *(void *)(v9 + 56) = &type metadata for String;
    *(void *)(v9 + 64) = sub_100009E38();
    *(void *)(v9 + 32) = v10;
    *(void *)(v9 + 40) = v12;
    sub_100021790();
    uint64_t result = swift_bridgeObjectRelease();
    v34[0] = a3;
    v34[1] = a4;
    long long v35 = xmmword_1000267F0;
    char v36 = 1;
    unint64_t v14 = *(void **)(a2 + OBJC_IVAR___AudioBoxController_bluetoothManager);
    if (!v14)
    {
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    id v15 = v14;
    sub_100003354((uint64_t)v34);
    swift_bridgeObjectRelease();

    swift_errorRelease();
    uint64_t v7 = "AudioBox is already authenticated";
    p_type = (char **)(&stru_100030FF0 + 16);
  }
  else
  {
    sub_1000219F0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_100023950;
    *(void *)(v16 + 56) = &type metadata for String;
    *(void *)(v16 + 64) = sub_100009E38();
    *(void *)(v16 + 32) = a3;
    *(void *)(v16 + 40) = a4;
    swift_bridgeObjectRetain();
    sub_100021790();
    swift_bridgeObjectRelease();
  }
  id v17 = [self defaultManager];
  sub_1000216A0(v18);
  uint64_t v20 = v19;
  id v33 = 0;
  unsigned int v21 = [v17 removeItemAtURL:v19 error:&v33];

  if (v21)
  {
    id v22 = v33;
    sub_1000219F0();
    if (p_type[335] != (char *)-1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = *((_OWORD *)v7 + 149);
    uint64_t v24 = sub_1000216E0();
    uint64_t v26 = v25;
    *(void *)(v23 + 56) = &type metadata for String;
    *(void *)(v23 + 64) = sub_100009E38();
    *(void *)(v23 + 32) = v24;
    *(void *)(v23 + 40) = v26;
    sub_100021790();
    return swift_bridgeObjectRelease();
  }
  else
  {
    id v27 = v33;
    uint64_t v28 = (void *)sub_100021670();

    swift_willThrow();
    sub_1000219D0();
    if (p_type[335] != (char *)-1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_100023960;
    *(void *)(v29 + 56) = &type metadata for String;
    unint64_t v30 = sub_100009E38();
    *(void *)(v29 + 64) = v30;
    *(void *)(v29 + 32) = a3;
    *(void *)(v29 + 40) = a4;
    id v33 = v28;
    swift_bridgeObjectRetain();
    swift_errorRetain();
    sub_100009DF0((uint64_t *)&unk_100032C10);
    uint64_t v31 = sub_100021900();
    *(void *)(v29 + 96) = &type metadata for String;
    *(void *)(v29 + 104) = v30;
    *(void *)(v29 + 72) = v31;
    *(void *)(v29 + 80) = v32;
    sub_100021790();
    swift_bridgeObjectRelease();
    return swift_errorRelease();
  }
}

id sub_10001DC64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t v6 = v5;
  sub_100009DF0(&qword_100032C08);
  __chkstk_darwin();
  int64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000216F0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin();
  id v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    swift_errorRetain();
    sub_1000219D0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_100023950;
    uint64_t v45 = a5;
    swift_errorRetain();
    sub_100009DF0((uint64_t *)&unk_100032C10);
    uint64_t v19 = sub_100021900();
    uint64_t v21 = v20;
    *(void *)(v18 + 56) = &type metadata for String;
    *(void *)(v18 + 64) = sub_100009E38();
    *(void *)(v18 + 32) = v19;
    *(void *)(v18 + 40) = v21;
    sub_100021790();
    swift_bridgeObjectRelease();
    uint64_t v45 = a1;
    uint64_t v46 = a2;
    long long v47 = xmmword_100023990;
    char v48 = 1;
    id v22 = *(void **)&v6[OBJC_IVAR___AudioBoxController_bluetoothManager];
    if (v22)
    {
      swift_bridgeObjectRetain();
      id v23 = v22;
      sub_100003354((uint64_t)&v45);
      swift_bridgeObjectRelease();

      return (id)swift_errorRelease();
    }
    goto LABEL_23;
  }
  if (a4 >> 60 == 15)
  {
    sub_1000219E0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100021790();
    id v25 = [v6 result];
    Class isa = sub_1000219B0().super.super.isa;
    [v25 setStatusCode:isa];

    return [v6 setFinished:1];
  }
  else
  {
    uint64_t v44 = a3;
    sub_100008C2C(a3, a4);
    LODWORD(v43) = sub_1000219F0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    uint64_t v41 = qword_1000393C8;
    uint64_t v42 = sub_100009DF0(&qword_1000320B0);
    uint64_t v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_100023960;
    *(void *)(v27 + 56) = &type metadata for String;
    unint64_t v28 = sub_100009E38();
    *(void *)(v27 + 64) = v28;
    *(void *)(v27 + 32) = a1;
    *(void *)(v27 + 40) = a2;
    uint64_t v29 = 0;
    switch(a4 >> 62)
    {
      case 1uLL:
        LODWORD(v29) = HIDWORD(v44) - v44;
        if (__OFSUB__(HIDWORD(v44), v44))
        {
          __break(1u);
LABEL_22:
          __break(1u);
LABEL_23:
          __break(1u);
          __break(1u);
          goto LABEL_24;
        }
        uint64_t v29 = (int)v29;
LABEL_19:
        unint64_t v40 = v28;
        *(void *)(v27 + 96) = &type metadata for Int;
        *(void *)(v27 + 104) = &protocol witness table for Int;
        *(void *)(v27 + 72) = v29;
        swift_bridgeObjectRetain();
        sub_100021790();
        swift_bridgeObjectRelease();
        sub_1000216C0();
        sub_100021750();
        LODWORD(v41) = sub_1000219F0();
        uint64_t v43 = qword_1000393C8;
        uint64_t v33 = swift_allocObject();
        *(_OWORD *)(v33 + 16) = xmmword_100023950;
        uint64_t v34 = sub_1000216E0();
        unint64_t v35 = v40;
        *(void *)(v33 + 56) = &type metadata for String;
        *(void *)(v33 + 64) = v35;
        *(void *)(v33 + 32) = v34;
        *(void *)(v33 + 40) = v36;
        sub_100021790();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v13, v17, v14);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        sub_10001CE10((uint64_t)v13, a1, a2);
        swift_endAccess();
        uint64_t v45 = a1;
        uint64_t v46 = a2;
        long long v47 = 0uLL;
        char v48 = 1;
        uint64_t v37 = *(void **)&v6[OBJC_IVAR___AudioBoxController_bluetoothManager];
        if (!v37)
        {
LABEL_24:
          __break(1u);
          JUMPOUT(0x10001E3BCLL);
        }
        swift_bridgeObjectRetain();
        id v38 = v37;
        sub_100003354((uint64_t)&v45);
        swift_bridgeObjectRelease();

        sub_10000B71C(v44, a4);
        id result = (id)(*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
        break;
      case 2uLL:
        uint64_t v31 = *(void *)(v44 + 16);
        uint64_t v30 = *(void *)(v44 + 24);
        BOOL v32 = __OFSUB__(v30, v31);
        uint64_t v29 = v30 - v31;
        if (!v32) {
          goto LABEL_19;
        }
        goto LABEL_22;
      case 3uLL:
        goto LABEL_19;
      default:
        uint64_t v29 = BYTE6(a4);
        goto LABEL_19;
    }
  }
  return result;
}

void sub_10001E3CC(uint64_t a1, uint64_t a2)
{
  sub_10001FFB8(a1, (uint64_t)v77);
  uint64_t v4 = v77[0];
  uint64_t v5 = v77[1];
  uint64_t v67 = v77[2];
  uint64_t v6 = v77[4];
  uint64_t v70 = v77[3];
  uint64_t v7 = sub_100009DF0(&qword_100032C08);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000216F0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v66 - v15;
  uint64_t v69 = v5;
  uint64_t v68 = v4;
  if (a2) {
    BOOL v17 = *(void *)(a2 + 16) != 0;
  }
  else {
    BOOL v17 = 0;
  }
  NSString v18 = [objc_allocWithZone((Class)AVAudioDeviceTestSequence) init];
  [v18 setOutputMode:0];
  [v18 setPriority:0];
  sub_10001FFB8(a1, (uint64_t)v80);
  BOOL v71 = v17;
  if (v81)
  {
    uint64_t v19 = &v72[OBJC_IVAR___AudioBoxController_fileNameToURLMap];
    swift_beginAccess();
    uint64_t v20 = *(void *)v19;
    if (*(void *)(v20 + 16))
    {
      sub_100020140(a1);
      swift_bridgeObjectRetain();
      unint64_t v21 = sub_1000200C8(v70, v6);
      if (v22)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v9, *(void *)(v20 + 56) + *(void *)(v11 + 72) * v21, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
      swift_bridgeObjectRetain();
    }
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      sub_10002016C((uint64_t)v9);
      sub_1000219D0();
      if (qword_100031A78 == -1) {
        goto LABEL_13;
      }
      goto LABEL_42;
    }
    int v26 = v67;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
    sub_1000216A0(v27);
    uint64_t v29 = v28;
    [v18 setStimulusURL:v28];

    [v18 setOutputMode:v68];
    [v18 setOutputID:v69];
    LODWORD(v30) = v26;
    [v18 setVolume:v30];
    sub_1000201CC(a1);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    BOOL v17 = v71;
  }
  char v31 = !v17;
  if (!a2) {
    char v31 = 1;
  }
  BOOL v32 = v72;
  if (v31)
  {
LABEL_24:
    sub_10001FFB8(a1, (uint64_t)v78);
    if (v79)
    {
      if (v17)
      {
        sub_10001B13C();
        sub_1000216E0();
        uint64_t v39 = v38;
        (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      }
      else
      {
        uint64_t v39 = 0;
      }
      sub_1000219F0();
      if (qword_100031A78 != -1) {
        swift_once();
      }
      sub_100009DF0(&qword_1000320B0);
      uint64_t v54 = swift_allocObject();
      *(_OWORD *)(v54 + 16) = xmmword_100023950;
      id v55 = v18;
      id v56 = [v55 description];
      uint64_t v57 = sub_1000218A0();
      uint64_t v59 = v58;

      *(void *)(v54 + 56) = &type metadata for String;
      *(void *)(v54 + 64) = sub_100009E38();
      *(void *)(v54 + 32) = v57;
      *(void *)(v54 + 40) = v59;
      sub_100021790();
      swift_bridgeObjectRelease();
      v82[0] = 0;
      v82[1] = 0;
      long long v83 = xmmword_100026800;
      char v84 = 1;
      uint64_t v60 = *(void **)&v32[OBJC_IVAR___AudioBoxController_bluetoothManager];
      if (!v60)
      {
        __break(1u);
        goto LABEL_44;
      }
      id v61 = v60;
      sub_100003354((uint64_t)v82);

      uint64_t v62 = *(void **)&v32[OBJC_IVAR___AudioBoxController_audioTest];
      if (v39)
      {
        NSString v18 = sub_100021890();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v18 = 0;
      }
      uint64_t v63 = swift_allocObject();
      *(void *)(v63 + 16) = v32;
      *(unsigned char *)(v63 + 24) = v71;
      uint64_t v75 = sub_1000200BC;
      uint64_t v76 = (void *)v63;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v74 = sub_10001F394;
      *((void *)&v74 + 1) = &unk_10002E968;
      uint64_t v64 = _Block_copy(&aBlock);
      uint64_t v65 = v32;
      swift_release();
      [v62 playback:v55 filePath:v18 completion:v64];

      uint64_t v53 = v64;
    }
    else
    {
      if (!v17) {
        goto LABEL_40;
      }
      sub_10001B13C();
      uint64_t v40 = sub_1000216E0();
      uint64_t v42 = v41;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      sub_1000219F0();
      if (qword_100031A78 != -1) {
        swift_once();
      }
      sub_100009DF0(&qword_1000320B0);
      uint64_t v43 = swift_allocObject();
      *(_OWORD *)(v43 + 16) = xmmword_100023950;
      id v44 = v18;
      id v45 = [v44 description];
      uint64_t v46 = sub_1000218A0();
      uint64_t v48 = v47;

      *(void *)(v43 + 56) = &type metadata for String;
      *(void *)(v43 + 64) = sub_100009E38();
      *(void *)(v43 + 32) = v46;
      *(void *)(v43 + 40) = v48;
      sub_100021790();
      swift_bridgeObjectRelease();
      uint64_t v49 = *(void **)&v32[OBJC_IVAR___AudioBoxController_audioTest];
      NSString v18 = sub_100021890();
      uint64_t v50 = (void *)swift_allocObject();
      v50[2] = v32;
      v50[3] = v40;
      v50[4] = v42;
      uint64_t v75 = sub_100020060;
      uint64_t v76 = v50;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v74 = sub_10001F394;
      *((void *)&v74 + 1) = &unk_10002E918;
      uint64_t v51 = _Block_copy(&aBlock);
      uint64_t v52 = v32;
      swift_release();
      [v49 startRecording:v44 filePath:v18 completion:v51];

      uint64_t v53 = v51;
    }
    _Block_release(v53);
    goto LABEL_40;
  }
  if (*(void *)(a2 + 16) == 1)
  {
    BOOL v33 = v17;
    NSString v34 = sub_100021890();
    swift_bridgeObjectRelease();
  }
  else
  {
    BOOL v33 = v17;
    NSString v34 = sub_100021890();
  }
  [v18 setMicrophone:v34];

  uint64_t v35 = *(void *)&v32[OBJC_IVAR___AudioBoxController_recordingNumber];
  BOOL v36 = __OFADD__(v35, 1);
  uint64_t v37 = v35 + 1;
  if (!v36)
  {
    *(void *)&v32[OBJC_IVAR___AudioBoxController_recordingNumber] = v37;
    BOOL v17 = v33;
    goto LABEL_24;
  }
  __break(1u);
LABEL_42:
  swift_once();
LABEL_13:
  sub_100009DF0(&qword_1000320B0);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_100023950;
  *(void *)(v23 + 56) = &type metadata for String;
  *(void *)(v23 + 64) = sub_100009E38();
  *(void *)(v23 + 32) = v70;
  *(void *)(v23 + 40) = v6;
  sub_100021790();
  swift_bridgeObjectRelease();
  long long aBlock = xmmword_1000267F0;
  long long v74 = xmmword_100026800;
  LOBYTE(v75) = 1;
  uint64_t v24 = *(void **)&v72[OBJC_IVAR___AudioBoxController_bluetoothManager];
  if (!v24)
  {
LABEL_44:
    __break(1u);
    JUMPOUT(0x10001EE64);
  }
  id v25 = v24;
  sub_100003354((uint64_t)&aBlock);

  NSString v18 = v25;
LABEL_40:
}

void sub_10001EE74(uint64_t a1, char *a2, char a3)
{
  uint64_t v6 = sub_1000216F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v37 - v11;
  if (a1)
  {
    swift_errorRetain();
    sub_1000219D0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_100023950;
    *(void *)&long long v43 = a1;
    swift_errorRetain();
    sub_100009DF0((uint64_t *)&unk_100032C10);
    uint64_t v14 = sub_100021900();
    uint64_t v16 = v15;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 64) = sub_100009E38();
    *(void *)(v13 + 32) = v14;
    *(void *)(v13 + 40) = v16;
    sub_100021790();
    swift_bridgeObjectRelease();
    long long v43 = xmmword_1000267F0;
    long long v44 = xmmword_100026800;
    char v45 = 1;
    BOOL v17 = *(void **)&a2[OBJC_IVAR___AudioBoxController_bluetoothManager];
    if (v17)
    {
      id v18 = v17;
      sub_100003354((uint64_t)&v43);

      swift_errorRelease();
      return;
    }
    __break(1u);
    goto LABEL_14;
  }
  sub_1000219F0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100021790();
  long long v43 = xmmword_100023990;
  long long v44 = xmmword_100026800;
  char v45 = 1;
  uint64_t v19 = OBJC_IVAR___AudioBoxController_bluetoothManager;
  uint64_t v20 = *(void **)&a2[OBJC_IVAR___AudioBoxController_bluetoothManager];
  if (!v20)
  {
LABEL_14:
    __break(1u);
    __break(1u);
    goto LABEL_15;
  }
  id v21 = v20;
  sub_100003354((uint64_t)&v43);

  if (a3)
  {
    uint64_t v41 = v7;
    uint64_t v42 = v19;
    sub_10001B13C();
    uint64_t v22 = sub_100021690();
    uint64_t v24 = v23;
    uint64_t v25 = sub_100021700();
    unint64_t v38 = v26;
    uint64_t v39 = v25;
    uint64_t v40 = v22;
    uint64_t v27 = *(void **)&a2[v42];
    if (!v27)
    {
LABEL_15:
      __break(1u);
      return;
    }
    uint64_t v28 = v41;
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v10, v12, v6);
    unint64_t v29 = (*(unsigned __int8 *)(v28 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    double v30 = (char *)swift_allocObject();
    uint64_t v31 = v40;
    *((void *)v30 + 2) = a2;
    *((void *)v30 + 3) = v31;
    *((void *)v30 + 4) = v24;
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(&v30[v29], v10, v6);
    id v32 = v27;
    BOOL v33 = a2;
    swift_bridgeObjectRetain();
    uint64_t v34 = v31;
    unint64_t v36 = v38;
    uint64_t v35 = v39;
    sub_100003B84(v34, v24, v39, v38, (uint64_t)sub_1000202E0, (unint64_t)v30);

    sub_100008C84(v35, v36);
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v6);
  }
}

void sub_10001F394(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10001F400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    swift_errorRetain();
    sub_1000219D0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_100023950;
    swift_errorRetain();
    sub_100009DF0((uint64_t *)&unk_100032C10);
    uint64_t v6 = sub_100021900();
    uint64_t v8 = v7;
    *(void *)(v5 + 56) = &type metadata for String;
    *(void *)(v5 + 64) = sub_100009E38();
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = v8;
    sub_100021790();
    swift_bridgeObjectRelease();
    long long v16 = xmmword_100026810;
    long long v17 = xmmword_100026800;
    char v18 = 1;
    uint64_t v9 = *(void **)(a2 + OBJC_IVAR___AudioBoxController_bluetoothManager);
    if (v9)
    {
      id v10 = v9;
      sub_100003354((uint64_t)&v16);

      swift_errorRelease();
      return;
    }
    __break(1u);
    goto LABEL_13;
  }
  sub_1000219F0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  sub_100009DF0(&qword_1000320B0);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100023950;
  *(void *)(v13 + 56) = &type metadata for String;
  *(void *)(v13 + 64) = sub_100009E38();
  *(void *)(v13 + 32) = a3;
  *(void *)(v13 + 40) = a4;
  swift_bridgeObjectRetain();
  sub_100021790();
  swift_bridgeObjectRelease();
  long long v16 = xmmword_100026800;
  long long v17 = xmmword_100026800;
  char v18 = 1;
  uint64_t v14 = *(void **)(a2 + OBJC_IVAR___AudioBoxController_bluetoothManager);
  if (!v14)
  {
LABEL_13:
    __break(1u);
    return;
  }
  id v15 = v14;
  sub_100003354((uint64_t)&v16);
}

uint64_t sub_10001F6A4(uint64_t a1, char *a2)
{
  uint64_t v4 = sub_1000216F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v10 = (char *)&v33 - v9;
  if (a1)
  {
    swift_errorRetain();
    sub_1000219D0();
    if (qword_100031A78 != -1) {
      swift_once();
    }
    sub_100009DF0(&qword_1000320B0);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_100023950;
    *(void *)&long long v37 = a1;
    swift_errorRetain();
    sub_100009DF0((uint64_t *)&unk_100032C10);
    uint64_t v12 = sub_100021900();
    uint64_t v14 = v13;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_100009E38();
    *(void *)(v11 + 32) = v12;
    *(void *)(v11 + 40) = v14;
    sub_100021790();
    uint64_t result = swift_bridgeObjectRelease();
    long long v37 = xmmword_100026810;
    long long v38 = xmmword_100026800;
    char v39 = 1;
    long long v16 = *(void **)&a2[OBJC_IVAR___AudioBoxController_bluetoothManager];
    if (v16)
    {
      id v17 = v16;
      sub_100003354((uint64_t)&v37);

      return swift_errorRelease();
    }
    __break(1u);
    goto LABEL_12;
  }
  sub_1000219F0();
  if (qword_100031A78 != -1) {
    swift_once();
  }
  uint64_t v36 = v5;
  uint64_t result = sub_100021790();
  long long v37 = xmmword_100026820;
  long long v38 = xmmword_100026800;
  char v39 = 1;
  uint64_t v18 = OBJC_IVAR___AudioBoxController_bluetoothManager;
  uint64_t v19 = *(void **)&a2[OBJC_IVAR___AudioBoxController_bluetoothManager];
  if (!v19)
  {
LABEL_12:
    __break(1u);
    __break(1u);
    goto LABEL_13;
  }
  id v20 = v19;
  sub_100003354((uint64_t)&v37);

  sub_10001B13C();
  uint64_t v21 = sub_100021690();
  uint64_t v23 = v22;
  uint64_t result = sub_100021700();
  uint64_t v34 = result;
  uint64_t v35 = v21;
  id v33 = *(id *)&a2[v18];
  if (v33)
  {
    unint64_t v25 = v24;
    uint64_t v26 = v36;
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v8, v10, v4);
    unint64_t v27 = (*(unsigned __int8 *)(v26 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    uint64_t v28 = (char *)swift_allocObject();
    uint64_t v29 = v35;
    *((void *)v28 + 2) = a2;
    *((void *)v28 + 3) = v29;
    *((void *)v28 + 4) = v23;
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(&v28[v27], v8, v4);
    id v30 = v33;
    uint64_t v31 = a2;
    swift_bridgeObjectRetain();
    uint64_t v32 = v34;
    sub_100003B84(v29, v23, v34, v25, (uint64_t)sub_1000202E0, (unint64_t)v28);

    sub_100008C84(v32, v25);
    swift_release();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v10, v4);
  }
LABEL_13:
  __break(1u);
  return result;
}

id sub_10001FBC8()
{
  uint64_t v1 = sub_1000216F0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR___AudioBoxController_audioTest;
  id v6 = objc_allocWithZone((Class)AVAudioDeviceTest);
  uint64_t v7 = v0;
  *(void *)&v0[v5] = [v6 init];
  *(void *)&v7[OBJC_IVAR___AudioBoxController_bluetoothManager] = 0;
  *(void *)&v7[OBJC_IVAR___AudioBoxController_inputs] = 0;
  *(void *)&v7[OBJC_IVAR___AudioBoxController_responder] = 0;
  *(void *)&v7[OBJC_IVAR___AudioBoxController_fileNameToURLMap] = &_swiftEmptyDictionarySingleton;
  sub_100021680();
  sub_1000216B0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  *(void *)&v7[OBJC_IVAR___AudioBoxController_recordingNumber] = 0;

  uint64_t v8 = (objc_class *)type metadata accessor for AudioBoxController();
  v10.receiver = v7;
  v10.super_class = v8;
  return [super init];
}

id sub_10001FDA4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioBoxController();
  return [super dealloc];
}

uint64_t sub_10001FE9C()
{
  return type metadata accessor for AudioBoxController();
}

uint64_t type metadata accessor for AudioBoxController()
{
  uint64_t result = qword_100032BF0;
  if (!qword_100032BF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001FEF0()
{
  uint64_t result = sub_1000216F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001FFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009DF0(&qword_100032C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100020020()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100020060(uint64_t a1)
{
  sub_10001F400(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10002006C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002007C()
{
  return swift_release();
}

uint64_t sub_100020084()
{
  return _swift_deallocObject(v0, 25, 7);
}

void sub_1000200BC(uint64_t a1)
{
  sub_10001EE74(a1, *(char **)(v1 + 16), *(unsigned char *)(v1 + 24));
}

unint64_t sub_1000200C8(uint64_t a1, uint64_t a2)
{
  sub_100021CC0();
  sub_100021910();
  Swift::Int v4 = sub_100021CE0();

  return sub_1000201F8(a1, a2, v4);
}

uint64_t sub_100020140(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002016C(uint64_t a1)
{
  uint64_t v2 = sub_100009DF0(&qword_100032C08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000201CC(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000201F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    objc_super v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100021C40() & 1) == 0)
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
      while (!v14 && (sub_100021C40() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000202E4()
{
  unint64_t result = qword_1000321A8;
  if (!qword_1000321A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000321A8);
  }
  return result;
}

uint64_t sub_100020324@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1000200C8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100020CF4();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_1000216F0();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_1000208B4(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_1000216F0();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_1000204CC(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_1000216F0();
  uint64_t v5 = *(void *)(v49 - 8);
  __chkstk_darwin();
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_100009DF0(&qword_100032C20);
  int v47 = a2;
  uint64_t v8 = sub_100021B10();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  long long v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  char v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  BOOL v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    uint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_100021CC0();
    sub_100021910();
    uint64_t result = sub_100021CE0();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *uint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

unint64_t sub_1000208B4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_100021A90();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_100021CC0();
        swift_bridgeObjectRetain();
        sub_100021910();
        Swift::Int v9 = sub_100021CE0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_1000216F0() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_100020AC4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1000200C8(a2, a3);
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
      sub_100020CF4();
      goto LABEL_7;
    }
    sub_1000204CC(v15, a4 & 1);
    unint64_t v26 = sub_1000200C8(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_100021C70();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_1000216F0();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_100020C44(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100020C44(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_1000216F0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_100020CF4()
{
  uint64_t v35 = sub_1000216F0();
  uint64_t v1 = *(void *)(v35 - 8);
  __chkstk_darwin();
  int64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009DF0(&qword_100032C20);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_100021B00();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    uint64_t *v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    uint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    void *v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    char v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_100020FB8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100020FF0(uint64_t a1)
{
  return sub_10001F6A4(a1, *(char **)(v1 + 16));
}

uint64_t sub_100020FF8(uint64_t a1, void (*a2)(void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_100021040()
{
  uint64_t v1 = sub_1000216F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100021114(uint64_t a1)
{
  sub_1000216F0();
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];

  return sub_10001D7CC(a1, v3, v4, v5);
}

uint64_t sub_10002118C()
{
  return swift_release();
}

uint64_t sub_100021194()
{
  uint64_t v1 = sub_1000216F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100021270(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = *(void *)(sub_1000216F0() - 8);
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  unint64_t v9 = (void *)v2[5];
  uint64_t v10 = (uint64_t)v2 + ((*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  sub_10001C8E4(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_1000212F8()
{
  return sub_10001B7A8(*(void *)(v0 + 16));
}

void sub_100021300()
{
  sub_10001B898(*(char **)(v0 + 16));
}

void sub_100021308()
{
  sub_10001BA0C(*(void *)(v0 + 16));
}

char *sub_100021310(uint64_t a1, unsigned char *a2)
{
  v18[3] = type metadata accessor for AudioBoxController();
  v18[4] = &off_10002E8D0;
  v18[0] = a1;
  uint64_t v4 = &a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_peripheralScanTimeout];
  *(void *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_peripheralScanTimeout] = 30;
  uint64_t v5 = enum case for DispatchTimeInterval.seconds(_:);
  uint64_t v6 = sub_1000217A0();
  uint64_t v7 = *(void (**)(void))(*(void *)(v6 - 8) + 104);
  ((void (*)(char *, uint64_t, uint64_t))v7)(v4, v5, v6);
  *(void *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_authenticationTimeout] = 15;
  v7();
  *(void *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager] = 0;
  *(void *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagingCharacteristic] = 0;
  *(void *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capPSMCharacteristic] = 0;
  *(void *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel] = 0;
  *(void *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBox] = 0;
  uint64_t v8 = &a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxSerial];
  *uint64_t v8 = 0;
  v8[1] = 0;
  unint64_t v9 = &a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedAudioBoxToken];
  *unint64_t v9 = 0;
  v9[1] = 0;
  *(void *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagePacketsReceived] = _swiftEmptyArrayStorage;
  *(_OWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataReceived] = xmmword_100023970;
  *(_OWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataToSend] = xmmword_100023970;
  *(void *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedFiles] = _swiftEmptyArrayStorage;
  *(void *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_filesToSend] = _swiftEmptyArrayStorage;
  a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isBluetoothReady] = 0;
  a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isAudioBoxAuthenticated] = 0;
  uint64_t v10 = &a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback];
  void *v10 = 0;
  v10[1] = 0;
  uint64_t v11 = &a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxConnectionCompletion];
  *uint64_t v11 = 0;
  v11[1] = 0;
  uint64_t v12 = &a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion];
  *uint64_t v12 = 0;
  v12[1] = 0;
  sub_100021550((uint64_t)v18, (uint64_t)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate]);
  v17.receiver = a2;
  v17.super_class = (Class)type metadata accessor for AudioBoxBluetoothManager();
  unint64_t v13 = [(char *)[super init]];
  id v14 = [objc_allocWithZone((Class)CBCentralManager) initWithDelegate:v13 queue:0];
  sub_10000B858((uint64_t)v18);
  unint64_t v15 = *(void **)&v13[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager];
  *(void *)&v13[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager] = v14;

  return v13;
}

uint64_t sub_100021550(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000215E0()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_1000215F0()
{
  return JSONDecoder.init()();
}

uint64_t sub_100021600()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_100021610()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_100021620()
{
  return JSONEncoder.init()();
}

uint64_t sub_100021630()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_100021640()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_100021650()
{
  return __DataStorage._length.getter();
}

uint64_t sub_100021660()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_100021670()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100021680()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t sub_100021690()
{
  return URL.lastPathComponent.getter();
}

void sub_1000216A0(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000216B0()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_1000216C0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_1000216D0()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t sub_1000216E0()
{
  return URL.path.getter();
}

uint64_t sub_1000216F0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100021700()
{
  return Data.init(contentsOf:options:)();
}

uint64_t sub_100021710()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t sub_100021720()
{
  return Data._Representation.append(contentsOf:)();
}

NSData sub_100021730()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100021740()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021750()
{
  return Data.write(to:options:)();
}

uint64_t sub_100021760()
{
  return Data.append(_:)();
}

uint64_t sub_100021770()
{
  return Data.subdata(in:)();
}

uint64_t sub_100021780()
{
  return Data.advanced(by:)();
}

uint64_t sub_100021790()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_1000217A0()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_1000217B0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000217C0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000217D0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_1000217E0()
{
  return static DispatchTime.now()();
}

uint64_t sub_1000217F0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_100021800()
{
  return + infix(_:_:)();
}

uint64_t sub_100021810()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t sub_100021820()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t sub_100021830()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t sub_100021840()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t sub_100021850()
{
  return type metadata accessor for SHA256();
}

NSDictionary sub_100021860()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100021870()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021880()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_100021890()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000218A0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000218B0()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_1000218C0()
{
  return String.init(data:encoding:)();
}

uint64_t sub_1000218D0()
{
  return String.init(format:_:)();
}

uint64_t sub_1000218E0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_1000218F0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_100021900()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100021910()
{
  return String.hash(into:)();
}

void sub_100021920(Swift::String a1)
{
}

uint64_t sub_100021930()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_100021940()
{
  return dispatch thunk of Sequence.underestimatedCount.getter();
}

uint64_t sub_100021950()
{
  return dispatch thunk of RawRepresentable.init(rawValue:)();
}

uint64_t sub_100021960()
{
  return RawRepresentable<>.init(from:)();
}

NSArray sub_100021970()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100021980()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021990()
{
  return Array.description.getter();
}

uint64_t sub_1000219A0()
{
  return specialized Array._endMutation()();
}

NSNumber sub_1000219B0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_1000219C0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000219D0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000219E0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000219F0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100021A00()
{
  return OS_dispatch_group.wait(timeout:)();
}

uint64_t sub_100021A10()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_100021A20()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100021A30()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100021A40()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_100021A50()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100021A60()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100021A70()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100021A80()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100021A90()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_100021AA0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

void sub_100021AB0(Swift::Int a1)
{
}

uint64_t sub_100021AC0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100021AD0()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_100021AE0()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_100021AF0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100021B00()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100021B10()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100021B20()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100021B30(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100021B40()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_100021B50()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_100021B60()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100021B70()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100021B80()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100021B90()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100021BA0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100021BB0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_100021BC0()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_100021BD0()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_100021BE0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100021BF0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100021C00()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100021C10()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_100021C20()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100021C30()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100021C40()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100021C50()
{
  return dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
}

uint64_t sub_100021C60()
{
  return dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
}

uint64_t sub_100021C70()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100021C80()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100021C90()
{
  return Error._code.getter();
}

uint64_t sub_100021CA0()
{
  return Error._domain.getter();
}

uint64_t sub_100021CB0()
{
  return Error._userInfo.getter();
}

uint64_t sub_100021CC0()
{
  return Hasher.init(_seed:)();
}

void sub_100021CD0(Swift::UInt a1)
{
}

Swift::Int sub_100021CE0()
{
  return Hasher._finalize()();
}

NSNumber sub_100021CF0()
{
  return UInt32._bridgeToObjectiveC()();
}

uint64_t sub_100021D00()
{
  return dispatch thunk of Decoder.singleValueContainer()();
}

uint64_t sub_100021D10()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100021D20()
{
  return dispatch thunk of Encoder.singleValueContainer()();
}

uint64_t sub_100021D30()
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
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