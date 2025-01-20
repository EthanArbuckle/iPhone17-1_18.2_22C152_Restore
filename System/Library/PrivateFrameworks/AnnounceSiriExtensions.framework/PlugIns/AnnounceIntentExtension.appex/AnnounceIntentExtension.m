uint64_t sub_100004DF8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  BOOL v22;
  uint8_t *v23;
  id v24;
  uint64_t v25;
  id v26;
  char *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  char *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v56;
  void (**v57)(char *, uint64_t, uint64_t, uint64_t);
  Class isa;
  NSUUID v59;
  void (**v60)(char *, uint64_t, uint64_t, uint64_t);
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  char *v65;
  void (**v66)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  id aBlock;
  uint64_t v77;
  void (*v78)(uint64_t, void *);
  void *v79;
  void (*v80)(uint64_t);
  uint64_t v81;

  v70 = a2;
  v71 = a3;
  sub_100005EF8((uint64_t *)&unk_1000256A0);
  v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v67 = (uint64_t)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v9 = (void (**)(char *, uint64_t, uint64_t, uint64_t))((char *)&v64 - v8);
  __chkstk_darwin(v7);
  v11 = (char *)&v64 - v10;
  v12 = sub_10001B0B0();
  v13 = *(void *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v68 = v15;
  v69 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v64 - v16;
  if (qword_1000252F8 != -1) {
    swift_once();
  }
  v72 = v3;
  v18 = (id)qword_100025EB8;
  sub_10001B0C0();
  v19 = a1;
  v74 = v17;
  v20 = sub_10001B0A0();
  v21 = sub_10001B200();
  v22 = os_log_type_enabled(v20, v21);
  v73 = v13;
  if (v22)
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v65 = (char *)swift_slowAlloc();
    *(_DWORD *)v23 = 138412290;
    v66 = v9;
    aBlock = (uint64_t)v19;
    v24 = v19;
    v9 = v66;
    sub_10001B250();
    *(void *)v65 = v19;

    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Received Stop Announcement Intent: %@", v23, 0xCu);
    sub_100005EF8((uint64_t *)&unk_1000256C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  v25 = sub_10001B080();
  v66 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v25 - 8);
  v66[7](v11, 1, 1, v25);
  v26 = [v19 _metadata];
  v27 = v74;
  if (v26)
  {
    v28 = v26;
    v29 = [v26 endpointId];

    if (v29)
    {
      sub_10001B0F0();

      sub_10001B050();
      swift_bridgeObjectRelease();
      sub_10000609C((uint64_t)v11);
      sub_100006164((uint64_t)v9, (uint64_t)v11);
    }
  }
  v30 = v19;
  v31 = sub_10001B0A0();
  v32 = sub_10001B200();
  if (os_log_type_enabled(v31, v32))
  {
    v65 = v11;
    v33 = (uint8_t *)swift_slowAlloc();
    v75 = swift_slowAlloc();
    *(_DWORD *)v33 = 136315138;
    v34 = [v30 _metadata];
    v35 = v34;
    if (v34)
    {
      v36 = [v34 endpointId];

      if (v36)
      {
        v35 = (id)sub_10001B0F0();
        v38 = v37;

LABEL_16:
        aBlock = (uint64_t)v35;
        v77 = v38;
        sub_100005EF8((uint64_t *)&unk_100025430);
        v39 = sub_10001B100();
        aBlock = sub_100019E14(v39, v40, &v75);
        sub_10001B250();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "EndpointID = %s", v33, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v11 = v65;
        v27 = v74;
        goto LABEL_17;
      }
      v35 = 0;
    }
    v38 = 0;
    goto LABEL_16;
  }

LABEL_17:
  v41 = OBJC_IVAR____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler_localPlaybackSession;
  v42 = v72;
  v43 = v73;
  v44 = *(void **)(v72 + OBJC_IVAR____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler_localPlaybackSession);
  if (v44) {
    goto LABEL_18;
  }
  v56 = v67;
  sub_1000060FC((uint64_t)v11, v67);
  v57 = v66;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v66[6])(v56, 1, v25) == 1)
  {
    isa = 0;
  }
  else
  {
    v59.super.isa = sub_10001B060().super.isa;
    v60 = v57;
    isa = v59.super.isa;
    ((void (*)(uint64_t, uint64_t))v60[1])(v56, v25);
  }
  v61 = [objc_allocWithZone((Class)ANLocalPlaybackSession) initWithEndpointIdentifier:isa];

  v62 = *(void **)(v42 + v41);
  *(void *)(v42 + v41) = v61;

  v63 = *(void **)(v42 + v41);
  if (v63)
  {
    [v63 setDelegate:v42];
    v44 = *(void **)(v42 + v41);
    if (v44)
    {
LABEL_18:
      v45 = self;
      v46 = v44;
      v47 = [v45 stopCommand];
      v48 = v69;
      (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v69, v27, v12);
      v49 = (*(unsigned __int8 *)(v43 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
      v50 = (v68 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
      v51 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v43 + 32))(v51 + v49, v48, v12);
      v52 = (void *)(v51 + v50);
      v53 = v71;
      *v52 = v70;
      v52[1] = v53;
      v80 = sub_100005FE4;
      v81 = v51;
      aBlock = (uint64_t)_NSConcreteStackBlock;
      v77 = 1107296256;
      v78 = sub_10000E3B4;
      v79 = &unk_1000209D8;
      v54 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      [v46 sendPlaybackCommand:v47 completionHandler:v54];
      _Block_release(v54);
    }
  }
  sub_10000609C((uint64_t)v11);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v27, v12);
}

void sub_1000055C0(uint64_t a1, uint64_t a2, void (*a3)(id))
{
  if (a1)
  {
    swift_errorRetain();
    swift_errorRetain();
    swift_errorRetain();
    v4 = sub_10001B0A0();
    os_log_type_t v5 = sub_10001B1F0();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)v6 = 136315138;
      swift_getErrorValue();
      uint64_t v7 = sub_10001B450();
      sub_100019E14(v7, v8, &v19);
      sub_10001B250();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Stop Announcement failed with error: %s", v6, 0xCu);
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
  }
  else
  {
    v9 = sub_10001B0A0();
    os_log_type_t v10 = sub_10001B200();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Stop Announcement completed successfully", v11, 2u);
      swift_slowDealloc();
    }
  }
  v12 = sub_10001B0A0();
  os_log_type_t v13 = sub_10001B200();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v14 = 134217984;
    if (qword_100025308 != -1) {
      swift_once();
    }
    unint64_t v15 = *(void *)(qword_100025EC8 + 16);
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_10001B3A0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v19 = v16;
    sub_10001B250();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Records in Stop Response: %ld", v14, 0xCu);
    swift_slowDealloc();
  }

  id v17 = [objc_allocWithZone((Class)INStopAnnouncementIntentResponse) initWithCode:3 userActivity:0];
  if (qword_100025308 != -1) {
    swift_once();
  }
  sub_1000061CC();
  swift_bridgeObjectRetain();
  Class isa = sub_10001B160().super.isa;
  swift_bridgeObjectRelease();
  [v17 setStoppedAnnouncementRecords:isa];

  a3(v17);
}

id sub_100005A98()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StopAnnouncementIntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for StopAnnouncementIntentHandler()
{
  return self;
}

void type metadata accessor for ANPlaybackOptions(uint64_t a1)
{
}

void *sub_100005BA4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100005BB4(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_100005BC0(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100005BC8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100005BDC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100005BF0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100005C04(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100005C34@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100005C60@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100005C84(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100005C98(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100005CAC(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100005CC0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100005CD4(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100005CE8(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100005CFC(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100005D10()
{
  return *v0 == 0;
}

uint64_t sub_100005D20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100005D38(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_100005D4C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL sub_100005D58(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100005D6C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100005EC0(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_100005DAC()
{
  return sub_100005E14(&qword_100025408);
}

uint64_t sub_100005DE0()
{
  return sub_100005E14(&qword_100025410);
}

uint64_t sub_100005E14(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ANPlaybackOptions(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005E58()
{
  return sub_100005E14(&qword_100025418);
}

uint64_t sub_100005E8C()
{
  return sub_100005E14((unint64_t *)&unk_100025420);
}

uint64_t sub_100005EC0(uint64_t a1)
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

uint64_t sub_100005EF8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005F3C()
{
  uint64_t v1 = sub_10001B0B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return _swift_deallocObject(v0, v6, v5);
}

void sub_100005FE4(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_10001B0B0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void (**)(id))(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_1000055C0(a1, v1 + v4, v5);
}

uint64_t sub_100006084(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006094()
{
  return swift_release();
}

uint64_t sub_10000609C(uint64_t a1)
{
  uint64_t v2 = sub_100005EF8((uint64_t *)&unk_1000256A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000060FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EF8((uint64_t *)&unk_1000256A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006164(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EF8((uint64_t *)&unk_1000256A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000061CC()
{
  unint64_t result = qword_100025440;
  if (!qword_100025440)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100025440);
  }
  return result;
}

uint64_t sub_10000620C()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006244()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void type metadata accessor for INDeviceIdiom(uint64_t a1)
{
}

__n128 sub_10000626C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_100006284(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000062A4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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

void type metadata accessor for CMTime(uint64_t a1)
{
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
}

void sub_1000062F8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000634C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  __chkstk_darwin(a1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  if (sub_10001B400())
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  else
  {
    swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v6, v4, a1);
  }
  uint64_t v7 = (void *)sub_10001B010();
  swift_errorRelease();
  id v8 = [v7 code];

  return sub_1000064B0((uint64_t)v8);
}

uint64_t sub_1000064B0(uint64_t a1)
{
  uint64_t v1 = a1 - 1009;
  uint64_t result = 8;
  switch(v1)
  {
    case 0:
    case 6:
      uint64_t result = 6;
      break;
    case 8:
      return result;
    case 22:
      uint64_t result = 7;
      break;
    case 23:
      uint64_t result = 12;
      break;
    case 24:
      uint64_t result = 10;
      break;
    case 25:
    case 40:
      uint64_t result = 9;
      break;
    case 26:
      uint64_t result = 11;
      break;
    case 34:
      uint64_t result = 13;
      break;
    case 38:
      uint64_t result = 14;
      break;
    default:
      uint64_t result = 4;
      break;
  }
  return result;
}

uint64_t sub_1000065CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  __chkstk_darwin(a1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  if (sub_10001B400())
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  else
  {
    swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v6, v4, a1);
  }
  uint64_t v7 = (void *)sub_10001B010();
  swift_errorRelease();
  id v8 = [v7 code];

  if (v8 == (id)1027) {
    return 3;
  }
  else {
    return 4;
  }
}

uint64_t sub_100006734()
{
  uint64_t v0 = sub_10001B0B0();
  sub_10000686C(v0, qword_100025EA0);
  sub_1000068D0(v0, (uint64_t)qword_100025EA0);
  if (qword_100025300 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100025EC0;
  return sub_10001B0C0();
}

uint64_t sub_1000067C0()
{
  sub_10000682C();
  uint64_t result = sub_10001B230();
  qword_100025EB8 = result;
  return result;
}

unint64_t sub_10000682C()
{
  unint64_t result = qword_100025520;
  if (!qword_100025520)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100025520);
  }
  return result;
}

uint64_t *sub_10000686C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000068D0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100006908()
{
  sub_10000682C();
  uint64_t result = sub_10001B230();
  qword_100025EC0 = result;
  return result;
}

uint64_t sub_100006968()
{
  type metadata accessor for ReadAnnouncementHistory();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = &_swiftEmptyArrayStorage;
  qword_100025EC8 = result;
  return result;
}

uint64_t sub_1000069A0()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for ReadAnnouncementHistory()
{
  return self;
}

id sub_1000069FC()
{
  id v1 = [v0 homeName];
  sub_10001B0F0();

  id v2 = objc_allocWithZone((Class)INSpeakableString);
  swift_bridgeObjectRetain();
  NSString v3 = sub_10001B0E0();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithSpokenPhrase:v3];

  LOWORD(v13) = 0;
  id v5 = objc_msgSend(objc_allocWithZone((Class)INHomeFilter), "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", 0, 0, 1, 37, 0, 37, v4, 0, 0, 0, v13);
  swift_bridgeObjectRelease();

  id v6 = v5;
  id v7 = [v0 announcementID];
  sub_10001B0F0();

  id v8 = [v0 audioFileDuration];
  id v9 = objc_allocWithZone((Class)INAnnouncementRecord);
  NSString v10 = sub_10001B0E0();
  swift_bridgeObjectRelease();
  id v11 = [v9 initWithOriginator:v6 identifier:v10 duration:v8];

  return v11;
}

id sub_100006BA0(void *a1)
{
  uint64_t v3 = sub_100005EF8((uint64_t *)&unk_1000256A0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  id v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  id v9 = (char *)&v34 - v8;
  __chkstk_darwin(v7);
  id v11 = (char *)&v34 - v10;
  id v12 = [a1 recipients];
  if (!v12) {
    return 0;
  }
  uint64_t v13 = v12;
  sub_100006F08();
  unint64_t v14 = sub_10001B170();

  unint64_t v15 = (void *)sub_10000E420(v14);
  swift_bridgeObjectRelease();
  id v16 = [v15 roomNames];
  uint64_t v17 = sub_10001B170();

  uint64_t v18 = *(void *)(v17 + 16);
  swift_bridgeObjectRelease();
  if (v18 != 1)
  {

    return 0;
  }
  id v19 = [v15 roomNames];
  uint64_t v20 = sub_10001B170();

  if (!*(void *)(v20 + 16))
  {

    swift_bridgeObjectRelease();
    return 0;
  }
  v35 = v1;
  uint64_t v21 = *(void *)(v20 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_10001B080();
  uint64_t v23 = *(void *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v11, 1, 1, v22);
  id v24 = [a1 _metadata];
  uint64_t v25 = (uint64_t)v11;
  if (v24)
  {
    v26 = v24;
    id v27 = [v24 endpointId];

    if (v27)
    {
      sub_10001B0F0();
      uint64_t v34 = v21;

      sub_10001B050();
      swift_bridgeObjectRelease();
      sub_10000609C(v25);
      sub_100006164((uint64_t)v9, v25);
    }
  }
  sub_1000060FC(v25, (uint64_t)v6);
  uint64_t v28 = v25;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v6, 1, v22) == 1)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_10001B060().super.isa;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v22);
  }
  v32 = v35;
  NSString v33 = sub_10001B0E0();
  swift_bridgeObjectRelease();
  id v30 = [v32 isEndpointWithUUID:isa inRoomWithName:v33];

  sub_10000609C(v28);
  return v30;
}

unint64_t sub_100006F08()
{
  unint64_t result = qword_100025A00;
  if (!qword_100025A00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100025A00);
  }
  return result;
}

uint64_t sub_100006F48(uint64_t a1)
{
  *(void *)(v1 + 64) = a1;
  return _swift_task_switch(sub_100006F68, 0, 0);
}

uint64_t sub_100006F68()
{
  id v1 = objc_allocWithZone((Class)AVURLAsset);
  sub_10001B020(v2);
  uint64_t v4 = v3;
  v0[9] = [v1 initWithURL:v3 options:0];

  sub_100005EF8(&qword_1000255E8);
  uint64_t v5 = sub_10001B090();
  v0[10] = v5;
  id v6 = (void *)swift_task_alloc();
  v0[11] = v6;
  void *v6 = v0;
  v6[1] = sub_100007074;
  return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 2, v5);
}

uint64_t sub_100007074()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_10000721C;
  }
  else
  {
    swift_release();
    id v2 = sub_100007190;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100007190()
{
  uint64_t v1 = *(void **)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 24);
  *(void *)(v0 + 40) = *(void *)(v0 + 16);
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v2;
  Float64 Seconds = CMTimeGetSeconds((CMTime *)(v0 + 40));

  uint64_t v5 = *(uint64_t (**)(__n128))(v0 + 8);
  v6.n128_f64[0] = Seconds;
  return v5(v6);
}

uint64_t sub_10000721C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_100007288(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005EF8(&qword_1000256B0);
  uint64_t v2 = (void *)sub_10001B3D0();
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
    id v8 = v7;
    unint64_t result = sub_10001825C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
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

uint64_t sub_1000073A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100005EF8((uint64_t *)&unk_100025A60);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  id v8 = &v14[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler____lazy_storage___logger;
  swift_beginAccess();
  sub_100008EE8(v9, (uint64_t)v8, (uint64_t *)&unk_100025A60);
  uint64_t v10 = sub_10001B0B0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(a1, v8, v10);
  }
  sub_100008F4C((uint64_t)v8);
  if (qword_1000252F8 != -1) {
    swift_once();
  }
  id v12 = (id)qword_100025EB8;
  sub_10001B0C0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_100008FAC((uint64_t)v6, v9);
  return swift_endAccess();
}

uint64_t sub_1000075AC@<X0>(void *a1@<X0>, char **a2@<X8>)
{
  uint64_t v3 = v2;
  v105 = a2;
  uint64_t v5 = sub_10001B0B0();
  uint64_t v6 = *(void (**)(void, void))(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v98 = (uint64_t)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v103 = (uint64_t)&v97 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  BOOL v13 = (char *)&v97 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  id v16 = (char *)&v97 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v101 = (uint64_t)&v97 - v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v97 - v19;
  sub_1000073A4((uint64_t)&v97 - v19);
  id v21 = a1;
  uint64_t v22 = sub_10001B0A0();
  os_log_type_t v23 = sub_10001B200();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v106 = v5;
  id v107 = v21;
  v104 = v3;
  v102 = v13;
  v99 = v16;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc();
    v26 = (void *)swift_slowAlloc();
    v110[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 138412546;
    v109[0] = (uint64_t)v107;
    id v27 = v107;
    v100 = v6;
    id v28 = v27;
    sub_10001B250();
    void *v26 = v107;

    *(_WORD *)(v25 + 12) = 2080;
    v109[0] = (uint64_t)[v28 _idiom];
    type metadata accessor for INDeviceIdiom(0);
    uint64_t v29 = sub_10001B100();
    v109[0] = sub_100019E14(v29, v30, v110);
    uint64_t v31 = v106;
    sub_10001B250();

    uint64_t v6 = v100;
    id v21 = v107;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Resolving %@ for idiom %s", (uint8_t *)v25, 0x16u);
    sub_100005EF8((uint64_t *)&qword_1000256C0);
    swift_arrayDestroy();
    uint64_t v5 = v31;
    swift_slowDealloc();
    swift_arrayDestroy();
    uint64_t v3 = v104;
    swift_slowDealloc();
    BOOL v13 = v102;
    swift_slowDealloc();
  }
  else
  {
  }
  v32 = (void (*)(void, void))*((void *)v6 + 1);
  v32(v20, v5);
  if (![v21 _idiom])
  {
    sub_1000073A4(v101);
    NSString v33 = sub_10001B0A0();
    os_log_type_t v34 = sub_10001B1F0();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "idiom is unknown", v35, 2u);
      swift_slowDealloc();
    }

    v32(v101, v5);
  }
  id v36 = [v21 identifier];
  if (v36)
  {
    v37 = v36;
    uint64_t v38 = sub_10001B0F0();
    unint64_t v40 = v39;

    v41 = &v3[OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler_recentIntentHandlers];
    swift_beginAccess();
    uint64_t v42 = *(void *)v41;
    if (*(void *)(*(void *)v41 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v43 = sub_10001825C(v38, v40);
      if (v44)
      {
        v45 = (char *)*(id *)(*(void *)(v42 + 56) + 8 * v43);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v46 = (uint64_t)v99;
        sub_1000073A4((uint64_t)v99);
        swift_bridgeObjectRetain();
        v47 = sub_10001B0A0();
        os_log_type_t v48 = sub_10001B200();
        if (os_log_type_enabled(v47, v48))
        {
          uint64_t v49 = swift_slowAlloc();
          v102 = v45;
          v50 = (uint8_t *)v49;
          v110[0] = swift_slowAlloc();
          *(_DWORD *)v50 = 136315138;
          swift_bridgeObjectRetain();
          v109[0] = sub_100019E14(v38, v40, v110);
          uint64_t v5 = v106;
          sub_10001B250();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v47, v48, "Found recent intent handler for identifier: %s", v50, 0xCu);
          swift_arrayDestroy();
          uint64_t v3 = v104;
          swift_slowDealloc();
          swift_slowDealloc();

          v32(v99, v5);
          v111 = v102;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v32(v46, v5);
          v111 = v45;
        }
        goto LABEL_32;
      }
      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRelease();
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    AnnouncementIntentHandler = (objc_class *)type metadata accessor for ReadAnnouncementIntentHandler();
LABEL_25:
    v111 = (char *)[objc_allocWithZone(AnnouncementIntentHandler) init];
    goto LABEL_26;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    AnnouncementIntentHandler = (objc_class *)type metadata accessor for SendAnnouncementIntentHandler();
    goto LABEL_25;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    AnnouncementIntentHandler = (objc_class *)type metadata accessor for StopAnnouncementIntentHandler();
    goto LABEL_25;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    AnnouncementIntentHandler = (objc_class *)type metadata accessor for PlayAnnouncementSoundIntentHandler();
    goto LABEL_25;
  }
  v111 = v3;
  v96 = v3;
LABEL_26:
  sub_1000073A4((uint64_t)v13);
  id v52 = v21;
  v53 = v13;
  v54 = sub_10001B0A0();
  os_log_type_t v55 = sub_10001B200();
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v56 = v5;
    v57 = (uint8_t *)swift_slowAlloc();
    v110[0] = swift_slowAlloc();
    *(_DWORD *)v57 = 136315138;
    id v58 = [v52 identifier];
    v100 = v32;
    if (v58)
    {
      v59 = v58;
      uint64_t v60 = sub_10001B0F0();
      unint64_t v62 = v61;
    }
    else
    {
      unint64_t v62 = 0xE300000000000000;
      uint64_t v60 = 7104878;
    }
    uint64_t v5 = v56;
    v109[0] = sub_100019E14(v60, v62, v110);
    sub_10001B250();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v54, v55, "Created new intent handler for identifier: %s", v57, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v32 = v100;
    v100(v102, v56);
    uint64_t v3 = v104;
  }
  else
  {

    v32(v53, v5);
  }
LABEL_32:
  v63 = (uint64_t *)&v3[OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler_recentIntentHandlers];
  swift_beginAccess();
  uint64_t v64 = swift_bridgeObjectRetain();
  uint64_t v65 = sub_100008320(v64, (void **)&v111);
  unint64_t v67 = v66;
  v69 = v68;
  swift_bridgeObjectRelease();
  if (v67)
  {
    v70 = v111;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v71 = v70;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v108 = *v63;
    uint64_t *v63 = 0x8000000000000000;
    sub_1000093B8((uint64_t)v71, v65, v67, isUniquelyReferenced_nonNull_native);
    uint64_t *v63 = v108;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v73 = v103;
    sub_1000073A4(v103);
    swift_bridgeObjectRetain_n();
    id v74 = v69;
    v75 = sub_10001B0A0();
    os_log_type_t v76 = sub_10001B200();
    if (os_log_type_enabled(v75, v76))
    {
      v100 = v32;
      v77 = (uint8_t *)swift_slowAlloc();
      v109[0] = swift_slowAlloc();
      *(_DWORD *)v77 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v108 = sub_100019E14(v65, v67, v109);
      sub_10001B250();

      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v75, v76, "Updated recent intent handler for identifier: %s", v77, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_bridgeObjectRelease();
      uint64_t v78 = v103;
LABEL_38:
      v100(v78, v106);
      goto LABEL_42;
    }

    swift_bridgeObjectRelease_n();
    uint64_t v91 = v73;
    uint64_t v92 = v5;
    goto LABEL_41;
  }
  id v79 = [v107 identifier];
  if (v79)
  {
    v80 = v79;
    uint64_t v81 = sub_10001B0F0();
    unint64_t v83 = v82;

    v84 = v111;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v85 = v84;
    char v86 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v108 = *v63;
    uint64_t *v63 = 0x8000000000000000;
    sub_1000093B8((uint64_t)v85, v81, v83, v86);
    uint64_t *v63 = v108;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v87 = v98;
    sub_1000073A4(v98);
    swift_bridgeObjectRetain();
    v88 = sub_10001B0A0();
    os_log_type_t v89 = sub_10001B200();
    if (os_log_type_enabled(v88, v89))
    {
      v100 = v32;
      v90 = (uint8_t *)swift_slowAlloc();
      v109[0] = swift_slowAlloc();
      *(_DWORD *)v90 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v108 = sub_100019E14(v81, v83, v109);
      sub_10001B250();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v88, v89, "Added new intent handler to recents for identifier: %s", v90, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v78 = v87;
      goto LABEL_38;
    }

    swift_bridgeObjectRelease_n();
    uint64_t v91 = v87;
    uint64_t v92 = v106;
LABEL_41:
    v32(v91, v92);
  }
LABEL_42:
  v93 = v111;
  uint64_t result = sub_1000096DC(0, (unint64_t *)&qword_1000256B8);
  v95 = v105;
  v105[3] = (char *)result;
  *v95 = v93;
  return result;
}

uint64_t sub_100008320(uint64_t a1, void **a2)
{
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v20 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t j = 0;
  if (!v5) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (unint64_t i = v8 | (j << 6); ; unint64_t i = __clz(__rbit64(v11)) + (j << 6))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v14 = *(void **)(*(void *)(a1 + 56) + 8 * i);
    sub_1000096DC(0, &qword_1000256C8);
    uint64_t v15 = *a2;
    swift_bridgeObjectRetain();
    id v16 = v14;
    id v17 = v15;
    char v18 = sub_10001B220();

    if (v18)
    {
      swift_release();
      return v13;
    }

    uint64_t result = swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v10 = j + 1;
    if (__OFADD__(j, 1)) {
      break;
    }
    if (v10 >= v20) {
      goto LABEL_24;
    }
    unint64_t v11 = *(void *)(v19 + 8 * v10);
    ++j;
    if (v11) {
      goto LABEL_19;
    }
    int64_t j = v10 + 1;
    if (v10 + 1 >= v20) {
      goto LABEL_24;
    }
    unint64_t v11 = *(void *)(v19 + 8 * j);
    if (v11) {
      goto LABEL_19;
    }
    int64_t j = v10 + 2;
    if (v10 + 2 >= v20) {
      goto LABEL_24;
    }
    unint64_t v11 = *(void *)(v19 + 8 * j);
    if (v11) {
      goto LABEL_19;
    }
    int64_t j = v10 + 3;
    if (v10 + 3 >= v20) {
      goto LABEL_24;
    }
    unint64_t v11 = *(void *)(v19 + 8 * j);
    if (v11) {
      goto LABEL_19;
    }
    int64_t v12 = v10 + 4;
    if (v12 >= v20)
    {
LABEL_24:
      swift_release();
      return 0;
    }
    unint64_t v11 = *(void *)(v19 + 8 * v12);
    for (int64_t j = v12; !v11; ++v12)
    {
      int64_t j = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_27;
      }
      if (j >= v20) {
        goto LABEL_24;
      }
      unint64_t v11 = *(void *)(v19 + 8 * j);
    }
LABEL_19:
    unint64_t v5 = (v11 - 1) & v11;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

id sub_10000868C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100008710()
{
  return type metadata accessor for IntentHandler();
}

uint64_t type metadata accessor for IntentHandler()
{
  uint64_t result = qword_100025628;
  if (!qword_100025628) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100008764()
{
  sub_100008804();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100008804()
{
  if (!qword_100025820)
  {
    sub_10001B0B0();
    unint64_t v0 = sub_10001B240();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100025820);
    }
  }
}

void sub_10000885C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005EF8((uint64_t *)&unk_1000256A0);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10001B0B0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v49 = (uint64_t)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v50 = (char *)&v46 - v14;
  __chkstk_darwin(v13);
  id v16 = (char *)&v46 - v15;
  sub_1000073A4((uint64_t)&v46 - v15);
  swift_bridgeObjectRetain_n();
  id v17 = sub_10001B0A0();
  os_log_type_t v18 = sub_10001B200();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v51 = a1;
  if (v19)
  {
    uint64_t v46 = v3;
    uint64_t v20 = swift_slowAlloc();
    os_log_type_t v48 = v8;
    id v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v47 = v10;
    v53[0] = v22;
    *(_DWORD *)id v21 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_100019E14(a1, a2, v53);
    uint64_t v3 = v46;
    sub_10001B250();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Transaction Did Complete for Intent Identifier: %s", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v10 = v47;
    swift_slowDealloc();
    unint64_t v8 = v48;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  os_log_type_t v23 = *(void (**)(char *, uint64_t))(v10 + 8);
  v23(v16, v9);
  id v24 = [self sharedInstance];
  unsigned __int8 v25 = [v24 BOOLForDefault:ANDefaultPlaybackStatusReturnsImmediately];

  v26 = (uint64_t *)(v3 + OBJC_IVAR____TtC23AnnounceIntentExtension13IntentHandler_recentIntentHandlers);
  swift_beginAccess();
  uint64_t v27 = *v26;
  if (*(void *)(*v26 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v28 = sub_10001825C(v51, a2);
    if (v29)
    {
      id v30 = *(id *)(*(void *)(v27 + 56) + 8 * v28);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for ReadAnnouncementIntentHandler();
      uint64_t v31 = swift_dynamicCastClass();
      if (v31 && (v25 & 1) == 0)
      {
        uint64_t v32 = v31;
        sub_1000073A4((uint64_t)v50);
        NSString v33 = sub_10001B0A0();
        os_log_type_t v34 = sub_10001B200();
        if (os_log_type_enabled(v33, v34))
        {
          v35 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v35 = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, v34, "Intent Handler is Read Announcement Intent Handler", v35, 2u);
          swift_slowDealloc();
        }

        v23(v50, v9);
        uint64_t v36 = v49;
        sub_1000073A4(v49);
        v37 = sub_10001B0A0();
        os_log_type_t v38 = sub_10001B200();
        if (os_log_type_enabled(v37, v38))
        {
          unint64_t v39 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v39 = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, v38, "Requesting announced to stop playing announcements.", v39, 2u);
          swift_slowDealloc();
        }

        v23((char *)v36, v9);
        uint64_t v40 = v32 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_endpointIdentifier;
        swift_beginAccess();
        sub_100008EE8(v40, (uint64_t)v8, (uint64_t *)&unk_1000256A0);
        uint64_t v41 = sub_10001B080();
        uint64_t v42 = *(void *)(v41 - 8);
        Class isa = 0;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v8, 1, v41) != 1)
        {
          Class isa = sub_10001B060().super.isa;
          (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v41);
        }
        id v44 = [objc_allocWithZone((Class)ANLocalPlaybackSession) initWithEndpointIdentifier:isa];

        id v45 = [self stopCommand];
        [v44 sendPlaybackCommand:v45 completionHandler:0];
      }
      else
      {
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_100008EE8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005EF8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100008F4C(uint64_t a1)
{
  uint64_t v2 = sub_100005EF8((uint64_t *)&unk_100025A60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EF8((uint64_t *)&unk_100025A60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void *sub_100009014(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100009058(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000090A8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005EF8(&qword_1000256B0);
  char v38 = a2;
  uint64_t v6 = sub_10001B3C0();
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
  v35 = v2;
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
    uint64_t v22 = (void *)(v5 + 64);
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
          uint64_t v3 = v35;
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
    char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_10001B460();
    sub_10001B110();
    uint64_t result = sub_10001B470();
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
    os_log_type_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *os_log_type_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_1000093B8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10001825C(a2, a3);
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
    sub_100009528();
LABEL_7:
    os_log_type_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1000090A8(v15, a4 & 1);
  unint64_t v20 = sub_10001825C(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_10001B440();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  os_log_type_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
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

id sub_100009528()
{
  uint64_t v1 = v0;
  sub_100005EF8(&qword_1000256B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001B3B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    *char v21 = *v17;
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

uint64_t sub_1000096DC(uint64_t a1, unint64_t *a2)
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

void *sub_100009718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  if (a2)
  {
    id v8 = objc_allocWithZone((Class)INSpeakableString);
    swift_bridgeObjectRetain();
    NSString v9 = sub_10001B0E0();
    swift_bridgeObjectRelease();
    id v10 = [v8 initWithSpokenPhrase:v9];
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v11 = *(void *)(a3 + 16);
  if (v11)
  {
    uint64_t v49 = &_swiftEmptyArrayStorage;
    sub_10001B350();
    uint64_t v12 = a3 + 40;
    do
    {
      id v13 = objc_allocWithZone((Class)v7[212]);
      swift_bridgeObjectRetain();
      id v14 = v10;
      NSString v15 = sub_10001B0E0();
      id v16 = [v13 initWithSpokenPhrase:v15];

      LOWORD(v47) = 0;
      objc_msgSend(objc_allocWithZone((Class)INHomeFilter), "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", 0, 0, 1, 37, 0, 37, v14, 0, 0, v16, v47);
      swift_bridgeObjectRelease();

      unint64_t v7 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      sub_10001B330();
      sub_10001B360();
      sub_10001B370();
      sub_10001B340();
      v12 += 16;
      --v11;
    }
    while (v11);
    goto LABEL_10;
  }
  if (*(void *)(a4 + 16))
  {
    uint64_t v49 = &_swiftEmptyArrayStorage;
LABEL_10:
    sub_100009E5C((unint64_t)&_swiftEmptyArrayStorage);
    uint64_t v17 = *(void *)(a4 + 16);
    if (v17)
    {
      sub_10001B350();
      uint64_t v18 = a4 + 40;
      do
      {
        id v19 = objc_allocWithZone((Class)v7[212]);
        id v20 = v10;
        swift_bridgeObjectRetain();
        NSString v21 = sub_10001B0E0();
        id v22 = [v19 initWithSpokenPhrase:v21];

        LOWORD(v47) = 0;
        objc_msgSend(objc_allocWithZone((Class)INHomeFilter), "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", 0, 0, 1, 37, 0, 37, v20, v22, 0, 0, v47);
        swift_bridgeObjectRelease();

        unint64_t v7 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
        sub_10001B330();
        sub_10001B360();
        sub_10001B370();
        sub_10001B340();
        v18 += 16;
        --v17;
      }
      while (v17);
    }
    sub_100009E5C((unint64_t)&_swiftEmptyArrayStorage);

    return v49;
  }
  if (qword_1000252F0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_10001B0B0();
  sub_1000068D0(v25, (uint64_t)qword_100025EA0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v26 = sub_10001B0A0();
  os_log_type_t v27 = sub_10001B200();
  if (!os_log_type_enabled(v26, v27))
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    if (a2) {
      goto LABEL_19;
    }
LABEL_23:

    return &_swiftEmptyArrayStorage;
  }
  os_log_type_t type = v27;
  uint64_t v28 = swift_slowAlloc();
  uint64_t v49 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v28 = 136446722;
  uint64_t v29 = sub_10001B480();
  sub_100019E14(v29, v30, (uint64_t *)&v49);
  sub_10001B250();
  swift_bridgeObjectRelease();
  *(_WORD *)(v28 + 12) = 2080;
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_10001B180();
  unint64_t v33 = v32;
  swift_bridgeObjectRelease();
  sub_100019E14(v31, v33, (uint64_t *)&v49);
  sub_10001B250();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v28 + 22) = 2080;
  swift_bridgeObjectRetain();
  uint64_t v34 = sub_10001B180();
  unint64_t v36 = v35;
  swift_bridgeObjectRelease();
  sub_100019E14(v34, v36, (uint64_t *)&v49);
  sub_10001B250();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  _os_log_impl((void *)&_mh_execute_header, v26, type, "(%{public}s) Rooms and Zones empty: %s, %s", (uint8_t *)v28, 0x20u);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  if (!a2) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v37 = sub_10001B0A0();
  os_log_type_t v38 = sub_10001B200();
  if (os_log_type_enabled(v37, v38))
  {
    unint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v39 = 136446210;
    uint64_t v40 = sub_10001B480();
    sub_100019E14(v40, v41, (uint64_t *)&v49);
    sub_10001B250();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "(%{public}s) Creating filter with Home only", v39, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100005EF8(&qword_100025730);
  uint64_t v42 = (_OWORD *)swift_allocObject();
  v42[1] = xmmword_10001BF80;
  id v43 = objc_allocWithZone((Class)INSpeakableString);
  swift_bridgeObjectRetain();
  NSString v44 = sub_10001B0E0();
  swift_bridgeObjectRelease();
  id v45 = [v43 initWithSpokenPhrase:v44];

  LOWORD(v47) = 0;
  id v46 = objc_msgSend(objc_allocWithZone((Class)INHomeFilter), "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", 0, 0, 1, 37, 0, 37, v45, 0, 0, 0, v47);

  *((void *)v42 + 4) = v46;
  uint64_t v49 = v42;
  sub_10001B190();
  unint64_t v23 = v49;

  return v23;
}

uint64_t sub_100009E5C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10001B3A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_10001B3A0();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10001B310();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_10000A028(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_10001B3A0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_10001B190();
}

uint64_t sub_10000A028(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_10001B3A0();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
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
    uint64_t v10 = sub_10001B3A0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000A22C();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100005EF8(&qword_100025738);
          uint64_t v12 = sub_1000185AC(v16, i, a3);
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100006F08();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_10001B3E0();
  __break(1u);
  return result;
}

unint64_t sub_10000A22C()
{
  unint64_t result = qword_100025740;
  if (!qword_100025740)
  {
    sub_10000A288(&qword_100025738);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025740);
  }
  return result;
}

uint64_t sub_10000A288(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000A2D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100005EF8((uint64_t *)&unk_100025A60);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v14[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler____lazy_storage___logger;
  swift_beginAccess();
  sub_100008EE8(v9, (uint64_t)v8, (uint64_t *)&unk_100025A60);
  uint64_t v10 = sub_10001B0B0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(a1, v8, v10);
  }
  sub_10000E34C((uint64_t)v8, (uint64_t *)&unk_100025A60);
  if (qword_1000252F8 != -1) {
    swift_once();
  }
  id v12 = (id)qword_100025EB8;
  sub_10001B0C0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_10000DF54((uint64_t)v6, v9, (uint64_t *)&unk_100025A60);
  return swift_endAccess();
}

id sub_10000A4E8()
{
  sub_10000A524();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReadAnnouncementIntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_10000A524()
{
  uint64_t v1 = OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce;
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce);
  if (v2)
  {
    [v2 setDelegate:0];
    uint64_t v3 = *(void **)(v0 + v1);
  }
  else
  {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + v1) = 0;

  uint64_t v4 = OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession;
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession);
  if (v5)
  {
    [v5 setDelegate:0];
    uint64_t v5 = *(void **)(v0 + v4);
  }
  *(void *)(v0 + v4) = 0;
}

uint64_t sub_10000A66C()
{
  return type metadata accessor for ReadAnnouncementIntentHandler();
}

uint64_t type metadata accessor for ReadAnnouncementIntentHandler()
{
  uint64_t result = qword_1000257F8;
  if (!qword_1000257F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000A6C0(uint64_t a1)
{
  v2[18] = a1;
  v2[19] = v1;
  sub_100005EF8((uint64_t *)&unk_1000256A0);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  uint64_t v3 = sub_10001B0B0();
  v2[22] = v3;
  v2[23] = *(void *)(v3 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  return _swift_task_switch(sub_10000A7E8, 0, 0);
}

uint64_t sub_10000A7E8()
{
  v84 = v0;
  uint64_t v1 = v0[19];
  uint64_t v2 = OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce);
  uint64_t v81 = v1;
  if (v3) {
    goto LABEL_2;
  }
  uint64_t v82 = OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce;
  uint64_t v7 = (id *)(v0 + 18);
  unint64_t v6 = (void *)v0[18];
  sub_10000A2D0(v0[27]);
  id v8 = v6;
  uint64_t v9 = sub_10001B0A0();
  os_log_type_t v10 = sub_10001B200();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = *v7;
    id v12 = (uint8_t *)swift_slowAlloc();
    unint64_t v83 = (void *)swift_slowAlloc();
    *(_DWORD *)id v12 = 136315138;
    id v13 = [v11 _metadata];
    id v14 = v13;
    if (v13)
    {
      id v15 = [v13 endpointId];

      if (v15)
      {
        uint64_t v16 = sub_10001B0F0();
        id v14 = v17;
      }
      else
      {
        uint64_t v16 = 0;
        id v14 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v22 = v0[23];
    uint64_t v79 = v0[22];
    uint64_t v80 = v0[27];
    unint64_t v23 = (void *)v0[18];
    v0[11] = v16;
    v0[12] = v14;
    sub_100005EF8((uint64_t *)&unk_100025430);
    uint64_t v24 = sub_10001B100();
    v0[17] = sub_100019E14(v24, v25, (uint64_t *)&v83);
    sub_10001B250();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "EndpointID = %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v80, v79);
    uint64_t v1 = v81;
  }
  else
  {
    uint64_t v18 = v0[27];
    uint64_t v20 = v0[22];
    uint64_t v19 = v0[23];
    NSString v21 = (void *)v0[18];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  id v26 = [*v7 _metadata];
  if (v26
    && (os_log_type_t v27 = v26, v28 = [v26 endpointId], v27, v28))
  {
    sub_10001B0F0();

    sub_10001B050();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v29 = v0[21];
    uint64_t v30 = sub_10001B080();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 1, 1, v30);
  }
  uint64_t v2 = v82;
  uint64_t v32 = v0[20];
  uint64_t v31 = v0[21];
  uint64_t v33 = v0[19] + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_endpointIdentifier;
  swift_beginAccess();
  sub_10000DF54(v31, v33, (uint64_t *)&unk_1000256A0);
  swift_endAccess();
  sub_100008EE8(v33, v32, (uint64_t *)&unk_1000256A0);
  uint64_t v34 = sub_10001B080();
  uint64_t v35 = *(void *)(v34 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v32, 1, v34) != 1)
  {
    uint64_t v37 = v0[20];
    Class isa = sub_10001B060().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v37, v34);
  }
  id v38 = [objc_allocWithZone((Class)ANAnnounce) initWithEndpointIdentifier:isa];

  unint64_t v39 = *(void **)(v1 + v82);
  *(void *)(v1 + v82) = v38;

  uint64_t v40 = *(void **)(v1 + v82);
  if (!v40) {
    goto LABEL_19;
  }
  [v40 setDelegate:v0[19]];
  uint64_t v3 = *(void **)(v1 + v82);
  if (v3)
  {
LABEL_2:
    id v4 = [v3 unplayedAnnouncements];
    sub_1000096DC(0, (unint64_t *)&unk_1000258E0);
    uint64_t v5 = (void *)sub_10001B170();
  }
  else
  {
LABEL_19:
    uint64_t v5 = &_swiftEmptyArrayStorage;
  }
  unint64_t v41 = v0 + 13;
  uint64_t v45 = v0[26];
  uint64_t v42 = v0[19];
  v0[13] = v5;
  uint64_t v43 = OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_playbackOptions;
  *(void *)(v42 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_playbackOptions) = 128;
  sub_10000A2D0(v45);
  NSString v44 = sub_10001B0A0();
  LOBYTE(v45) = sub_10001B200();
  if (!os_log_type_enabled(v44, (os_log_type_t)v45)) {
    goto LABEL_24;
  }
  uint64_t v82 = v2;
  id v46 = v0 + 14;
  uint64_t v47 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)uint64_t v47 = 134217984;
  swift_beginAccess();
  if ((unint64_t)*v41 >> 62) {
    goto LABEL_60;
  }
  uint64_t v48 = *(void *)((*v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    *id v46 = v48;
    sub_10001B250();
    _os_log_impl((void *)&_mh_execute_header, v44, (os_log_type_t)v45, "Unheard Announcements (%ld)", v47, 0xCu);
    swift_slowDealloc();
    uint64_t v2 = v82;
LABEL_24:
    uint64_t v49 = v0[26];
    uint64_t v50 = v0[22];
    uint64_t v51 = v0[23];

    v53 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
    id v46 = (uint64_t *)(v51 + 8);
    uint64_t v52 = v53;
    v53(v49, v50);
    swift_beginAccess();
    unint64_t v54 = v0[13];
    if (v54 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v69 = sub_10001B3A0();
      swift_bridgeObjectRelease();
      uint64_t v47 = (uint8_t *)(v0 + 16);
      if (v69) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v47 = (uint8_t *)(v0 + 16);
      if (*(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_36;
      }
    }
    os_log_type_t v55 = *(void **)(v81 + v2);
    if (v55)
    {
      id v56 = [v55 receivedAnnouncements];
      sub_1000096DC(0, (unint64_t *)&unk_1000258E0);
      v57 = (void *)sub_10001B170();
    }
    else
    {
      v57 = &_swiftEmptyArrayStorage;
    }
    uint64_t *v41 = (uint64_t)v57;
    swift_bridgeObjectRelease();
    uint64_t v58 = *(void *)(v42 + v43);
    if ((v58 & 0x40) == 0) {
      *(void *)(v42 + v43) = v58 | 0x40;
    }
    sub_10000A2D0(v0[25]);
    v59 = sub_10001B0A0();
    os_log_type_t v60 = sub_10001B200();
    if (os_log_type_enabled(v59, v60))
    {
      unint64_t v61 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v61 = 134217984;
      uint64_t v42 = *v41;
      if ((unint64_t)*v41 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v62 = sub_10001B3A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v62 = *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      v0[15] = v62;
      sub_10001B250();
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "All Announcements (%ld)", v61, 0xCu);
      swift_slowDealloc();
    }
    uint64_t v63 = v0[25];
    uint64_t v64 = v0[22];

    v52(v63, v64);
LABEL_36:
    uint64_t v43 = *v41;
    if ((unint64_t)*v41 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_10001B3A0();
      if (!v45)
      {
LABEL_48:
        swift_bridgeObjectRelease();
        unint64_t v68 = (unint64_t)&_swiftEmptyArrayStorage;
        goto LABEL_49;
      }
    }
    else
    {
      uint64_t v45 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v45) {
        goto LABEL_48;
      }
    }
    unint64_t v83 = &_swiftEmptyArrayStorage;
    NSString v44 = &v83;
    sub_10001B350();
    if ((v45 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_60:
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_10001B3A0();
    swift_bridgeObjectRelease();
  }
  uint64_t v65 = 0;
  do
  {
    if ((v43 & 0xC000000000000001) != 0) {
      id v66 = (id)sub_10001B300();
    }
    else {
      id v66 = *(id *)(v43 + 8 * v65 + 32);
    }
    unint64_t v67 = v66;
    ++v65;
    sub_1000069FC();

    sub_10001B330();
    sub_10001B360();
    sub_10001B370();
    sub_10001B340();
  }
  while (v45 != v65);
  unint64_t v68 = (unint64_t)v83;
  swift_bridgeObjectRelease();
LABEL_49:
  if (qword_100025308 != -1) {
    swift_once();
  }
  uint64_t v70 = v0[24];
  *(void *)(qword_100025EC8 + 16) = v68;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v71 = [objc_allocWithZone((Class)INReadAnnouncementIntentResponse) initWithCode:1 userActivity:0];
  sub_1000096DC(0, (unint64_t *)&qword_100025440);
  Class v72 = sub_10001B160().super.isa;
  [v71 setAnnouncementRecords:v72];

  sub_10000A2D0(v70);
  swift_bridgeObjectRetain();
  uint64_t v73 = sub_10001B0A0();
  os_log_type_t v74 = sub_10001B200();
  if (os_log_type_enabled(v73, v74))
  {
    v75 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v75 = 134217984;
    if (v68 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_10001B3A0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v76 = *(void *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)uint64_t v47 = v76;
    sub_10001B250();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v73, v74, "Confirmed Read Announcement Intent with announcement count: %ld", v75, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v52(v0[24], v0[22]);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v77 = (uint64_t (*)(id))v0[1];
  return v77(v71);
}

uint64_t sub_10000B49C(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000E3A8;
  return sub_10000A6C0((uint64_t)v6);
}

uint64_t sub_10000B560(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  sub_100005EF8((uint64_t *)&unk_100025888);
  v2[14] = swift_task_alloc();
  sub_100005EF8((uint64_t *)&unk_1000256A0);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  uint64_t v3 = sub_10001B0B0();
  v2[17] = v3;
  v2[18] = *(void *)(v3 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  return _swift_task_switch(sub_10000B6D0, 0, 0);
}

uint64_t sub_10000B6D0()
{
  v116 = v0;
  uint64_t v2 = (id *)(v0 + 12);
  uint64_t v1 = (void *)v0[12];
  sub_10000A2D0(v0[24]);
  id v3 = v1;
  id v4 = sub_10001B0A0();
  os_log_type_t v5 = sub_10001B200();
  v112 = (id *)(v0 + 12);
  v114 = v0;
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (void *)v0[12];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    id v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    v0[11] = v6;
    id v9 = v6;
    sub_10001B250();
    *id v8 = v6;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Received Read Announcement Intent: %@", v7, 0xCu);
    sub_100005EF8(&qword_1000256C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    id v10 = *v2;
  }
  v111 = *(void (**)(void, void))(v0[18] + 8);
  v111(v0[24], v0[17]);
  if (qword_100025308 != -1) {
    swift_once();
  }
  unint64_t v11 = *(void *)(qword_100025EC8 + 16);
  v0[25] = v11;
  unint64_t v12 = v11 >> 62;
  if (!(v11 >> 62))
  {
    uint64_t v13 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_8;
    }
LABEL_64:
    uint64_t v22 = v0;
    sub_10000A2D0(v0[19]);
    swift_bridgeObjectRetain_n();
    uint64_t v101 = sub_10001B0A0();
    os_log_type_t v102 = sub_10001B200();
    if (os_log_type_enabled(v101, v102))
    {
      uint64_t v103 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v103 = 134217984;
      if (v12)
      {
        swift_bridgeObjectRetain();
        uint64_t v104 = sub_10001B3A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v104 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v0[10] = v104;
      sub_10001B250();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v101, v102, "No announcements to play back. (%ld)", v103, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v111(v0[19], v0[17]);
    id v105 = [objc_allocWithZone((Class)INReadAnnouncementIntentResponse) initWithCode:3 userActivity:0];
    sub_1000096DC(0, (unint64_t *)&qword_100025440);
    Class isa = sub_10001B160().super.isa;
    swift_bridgeObjectRelease();
    id v113 = v105;
    [v105 setAnnouncementRecords:isa];
LABEL_71:

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v106 = (uint64_t (*)(id))v22[1];
    return v106(v113);
  }
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_10001B3A0();
  swift_bridgeObjectRelease();
  if (!v13) {
    goto LABEL_64;
  }
LABEL_8:
  id v14 = (void *)v0[12];
  id v15 = [self sharedInstance];
  unsigned int v110 = [v15 BOOLForDefault:ANDefaultPlaybackStatusReturnsImmediately];

  if ([v14 _idiom] == (id)5)
  {
    sub_10000A2D0(v0[23]);
    swift_bridgeObjectRetain_n();
    uint64_t v16 = sub_10001B0A0();
    os_log_type_t v17 = sub_10001B200();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 134217984;
      if (v12)
      {
        swift_bridgeObjectRetain();
        uint64_t v19 = sub_10001B3A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v19 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v0[9] = v19;
      sub_10001B250();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Requesting playback (CarPlay) for announcements (%ld)", v18, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t result = ((uint64_t (*)(void, void))v111)(v0[23], v0[17]);
    if (v13 < 1)
    {
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v26 = 0;
    os_log_type_t v27 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      if ((v11 & 0xC000000000000001) != 0) {
        id v28 = (id)sub_10001B300();
      }
      else {
        id v28 = *(id *)(v11 + 8 * v26 + 32);
      }
      uint64_t v29 = v28;
      id v30 = [v28 identifier];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = sub_10001B0F0();
        uint64_t v34 = v33;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          os_log_type_t v27 = sub_10000DB30(0, *((void *)v27 + 2) + 1, 1, v27);
        }
        unint64_t v36 = *((void *)v27 + 2);
        unint64_t v35 = *((void *)v27 + 3);
        if (v36 >= v35 >> 1) {
          os_log_type_t v27 = sub_10000DB30((char *)(v35 > 1), v36 + 1, 1, v27);
        }
        *((void *)v27 + 2) = v36 + 1;
        uint64_t v37 = &v27[16 * v36];
        *((void *)v37 + 4) = v32;
        *((void *)v37 + 5) = v34;
      }
      else
      {
      }
      ++v26;
    }
    while (v13 != v26);
    swift_bridgeObjectRelease();
    uint64_t v22 = v0;
  }
  else
  {
    sub_10000A2D0(v0[22]);
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_10001B0A0();
    os_log_type_t v21 = sub_10001B200();
    uint64_t v22 = v0;
    if (os_log_type_enabled(v20, v21))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v23 = 134217984;
      if (v12)
      {
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_10001B3A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v24 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v0[8] = v24;
      sub_10001B250();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Requesting playback for announcements (%ld)", v23, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v38 = v0[13];
    v111(v0[22], v0[17]);
    uint64_t v39 = *(void *)(v38 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_playbackOptions);
    if ((v39 & 0x20) == 0) {
      *(void *)(v38 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_playbackOptions) = v39 | 0x20;
    }
    id v40 = [*v112 startAnnouncementIdentifier];
    if (v40)
    {
      unint64_t v41 = v40;
      uint64_t v42 = sub_10001B0F0();
      uint64_t v44 = v43;

      sub_100005EF8((uint64_t *)&unk_1000258C0);
      uint64_t v45 = swift_allocObject();
      *(_OWORD *)(v45 + 16) = xmmword_10001BFA0;
      *(void *)(v45 + 32) = v42;
      *(void *)(v45 + 40) = v44;
    }
  }
  uint64_t v46 = v22[13];
  uint64_t v47 = OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession;
  if (!*(void *)(v46 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession))
  {
    uint64_t v48 = (void *)v22[12];
    sub_10000A2D0(v22[21]);
    id v49 = v48;
    uint64_t v50 = sub_10001B0A0();
    os_log_type_t v51 = sub_10001B200();
    if (!os_log_type_enabled(v50, v51))
    {
      uint64_t v59 = v22[21];
      uint64_t v60 = v22[17];
      unint64_t v61 = (void *)v22[12];

      uint64_t v62 = v59;
      uint64_t v63 = v60;
      goto LABEL_48;
    }
    os_log_type_t v109 = v51;
    id v52 = *v112;
    v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v115 = swift_slowAlloc();
    *(_DWORD *)v53 = 136315138;
    id v54 = [v52 _metadata];
    os_log_type_t v55 = v54;
    if (v54)
    {
      id v56 = [v54 endpointId];

      if (v56)
      {
        os_log_type_t v55 = (void *)sub_10001B0F0();
        uint64_t v58 = v57;

LABEL_47:
        uint64_t v107 = v114[17];
        uint64_t v108 = v114[21];
        uint64_t v64 = (void *)v114[12];
        v114[5] = v55;
        v114[6] = v58;
        uint64_t v22 = v114;
        sub_100005EF8((uint64_t *)&unk_100025430);
        uint64_t v65 = sub_10001B100();
        v114[7] = sub_100019E14(v65, v66, &v115);
        sub_10001B250();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v50, v109, "EndpointID = %s", v53, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v63 = v107;
        uint64_t v62 = v108;
LABEL_48:
        v111(v62, v63);
        id v67 = [*v112 _metadata];
        if (v67
          && (unint64_t v68 = v67,
              id v69 = [v67 endpointId],
              v68,
              v69))
        {
          sub_10001B0F0();

          sub_10001B050();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v70 = v22[16];
          uint64_t v71 = sub_10001B080();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v70, 1, 1, v71);
        }
        uint64_t v73 = v22[15];
        uint64_t v72 = v22[16];
        uint64_t v74 = v22[13] + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_endpointIdentifier;
        swift_beginAccess();
        sub_10000DF54(v72, v74, (uint64_t *)&unk_1000256A0);
        swift_endAccess();
        sub_100008EE8(v74, v73, (uint64_t *)&unk_1000256A0);
        uint64_t v75 = sub_10001B080();
        uint64_t v76 = *(void *)(v75 - 8);
        Class v77 = 0;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v73, 1, v75) != 1)
        {
          uint64_t v78 = v22[15];
          Class v77 = sub_10001B060().super.isa;
          (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v78, v75);
        }
        id v79 = [objc_allocWithZone((Class)ANLocalPlaybackSession) initWithEndpointIdentifier:v77];

        uint64_t v80 = *(void **)(v46 + v47);
        *(void *)(v46 + v47) = v79;

        uint64_t v81 = *(void **)(v46 + v47);
        uint64_t v46 = v22[13];
        if (v81)
        {
          [v81 setDelegate:v22[13]];
          uint64_t v46 = v22[13];
        }
        goto LABEL_56;
      }
      os_log_type_t v55 = 0;
    }
    uint64_t v58 = 0;
    goto LABEL_47;
  }
LABEL_56:
  uint64_t v82 = self;
  uint64_t v83 = *(void *)(v46 + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_playbackOptions);
  Class v84 = sub_10001B160().super.isa;
  swift_bridgeObjectRelease();
  id v85 = [v82 playCommandWithOptions:v83 announcementIdentifiers:v84];
  v22[26] = v85;

  if (v110)
  {
    sub_10000A2D0(v22[20]);
    char v86 = sub_10001B0A0();
    os_log_type_t v87 = sub_10001B200();
    if (os_log_type_enabled(v86, v87))
    {
      v88 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v88 = 0;
      _os_log_impl((void *)&_mh_execute_header, v86, v87, "Not waiting for playback to complete. Returning success early.", v88, 2u);
      swift_slowDealloc();
    }
    uint64_t v89 = v22[20];
    uint64_t v90 = v22[17];
    uint64_t v91 = (void *)v22[13];
    uint64_t v92 = v22[14];

    v111(v89, v90);
    uint64_t v93 = sub_10001B1E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v93 - 8) + 56))(v92, 1, 1, v93);
    v94 = (void *)swift_allocObject();
    v94[2] = 0;
    v94[3] = 0;
    v94[4] = v91;
    v94[5] = v85;
    id v95 = v91;
    id v96 = v85;
    sub_10000D154(v92, (uint64_t)&unk_1000258B0, (uint64_t)v94);
    swift_release();
    id v97 = [objc_allocWithZone((Class)INReadAnnouncementIntentResponse) initWithCode:3 userActivity:0];
    sub_1000096DC(0, (unint64_t *)&qword_100025440);
    Class v98 = sub_10001B160().super.isa;
    swift_bridgeObjectRelease();
    id v113 = v97;
    [v97 setAnnouncementRecords:v98];

    Class isa = (Class)v22[26];
    goto LABEL_71;
  }
  v100 = (void *)swift_task_alloc();
  v22[27] = v100;
  void *v100 = v22;
  v100[1] = sub_10000C604;
  return sub_10000C9EC((uint64_t)v85);
}

uint64_t sub_10000C604(uint64_t a1)
{
  *(void *)(*(void *)v1 + 224) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000C704, 0, 0);
}

uint64_t sub_10000C704()
{
  id v4 = [objc_allocWithZone((Class)INReadAnnouncementIntentResponse) initWithCode:*(void *)(v0 + 224) userActivity:0];
  sub_1000096DC(0, (unint64_t *)&qword_100025440);
  Class isa = sub_10001B160().super.isa;
  swift_bridgeObjectRelease();
  [v4 setAnnouncementRecords:isa];

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v4);
}

uint64_t sub_10000C85C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_10000C8F8;
  return sub_10000C9EC(a5);
}

uint64_t sub_10000C8F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000C9EC(uint64_t a1)
{
  v2[24] = a1;
  v2[25] = v1;
  uint64_t v3 = sub_10001B0B0();
  v2[26] = v3;
  v2[27] = *(void *)(v3 - 8);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  return _swift_task_switch(sub_10000CABC, 0, 0);
}

uint64_t sub_10000CABC()
{
  uint64_t v1 = *(void **)(v0[25] + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession);
  v0[30] = v1;
  if (v1)
  {
    uint64_t v2 = v0[24];
    v0[2] = v0;
    v0[3] = sub_10000CCB0;
    uint64_t v3 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_10001955C;
    v0[13] = &unk_100020B48;
    v0[14] = v3;
    [v1 sendPlaybackCommand:v2 completionHandler:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    sub_10000A2D0(v0[29]);
    uint64_t v4 = sub_10001B0A0();
    os_log_type_t v5 = sub_10001B200();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Playback Completed", v6, 2u);
      swift_slowDealloc();
    }
    uint64_t v7 = v0[29];
    uint64_t v8 = v0[26];
    uint64_t v9 = v0[27];

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    id v10 = (uint64_t (*)(uint64_t))v0[1];
    return v10(3);
  }
}

uint64_t sub_10000CCB0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 248) = v1;
  if (v1) {
    uint64_t v2 = sub_10000CEDC;
  }
  else {
    uint64_t v2 = sub_10000CDC0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000CDC0()
{
  sub_10000A2D0(*(void *)(v0 + 232));
  uint64_t v1 = sub_10001B0A0();
  os_log_type_t v2 = sub_10001B200();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Playback Completed", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = *(void *)(v0 + 232);
  uint64_t v5 = *(void *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 216);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v7(3);
}

uint64_t sub_10000CEDC()
{
  uint64_t v18 = v0;
  uint64_t v1 = (void *)v0[30];
  uint64_t v2 = v0[28];
  swift_willThrow();

  sub_10000A2D0(v2);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = sub_10001B0A0();
  os_log_type_t v4 = sub_10001B1F0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v14 = v0[27];
    uint64_t v15 = v0[26];
    uint64_t v16 = v0[28];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    swift_getErrorValue();
    uint64_t v6 = sub_10001B450();
    v0[23] = sub_100019E14(v6, v7, &v17);
    sub_10001B250();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Playback Error: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v15);
  }
  else
  {
    uint64_t v9 = v0[27];
    uint64_t v8 = v0[28];
    uint64_t v10 = v0[26];
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  swift_getErrorValue();
  uint64_t v11 = sub_1000065CC(v0[16]);
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(uint64_t))v0[1];
  return v12(v11);
}

uint64_t sub_10000D154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001B1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10001B1D0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000E34C(a1, (uint64_t *)&unk_100025888);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10001B1C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000D47C(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000D540;
  return sub_10000B560((uint64_t)v6);
}

uint64_t sub_10000D540(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 32);
  os_log_type_t v4 = *(void **)(*v1 + 24);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v8 = *v1;
  swift_task_dealloc();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  id v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

void sub_10000D7A4()
{
  sub_10000D8C0(319, &qword_100025818, (void (*)(uint64_t))&type metadata accessor for UUID);
  if (v0 <= 0x3F)
  {
    sub_10000D8C0(319, (unint64_t *)&qword_100025820, (void (*)(uint64_t))&type metadata accessor for Logger);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10000D8C0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10001B240();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10000D95C(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10000DA38;
  return v6(a1);
}

uint64_t sub_10000DA38()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_10000DB30(char *result, int64_t a2, char a3, char *a4)
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
      sub_100005EF8((uint64_t *)&unk_1000258C0);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
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
    sub_10000DD6C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000DC40()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000DC88()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000C8F8;
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  void *v4 = v3;
  v4[1] = sub_10000C8F8;
  return sub_10000C9EC(v2);
}

uint64_t sub_10000DD6C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_10001B3E0();
  __break(1u);
  return result;
}

uint64_t sub_10000DE64()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000DE9C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_10000C8F8;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000258D0 + dword_1000258D0);
  return v6(a1, v4);
}

uint64_t sub_10000DF54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005EF8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000DFBC()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000E3B0;
  unint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_1000258F0 + dword_1000258F0);
  return v6(v2, v3, v4);
}

uint64_t sub_10000E074()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000E3B0;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100025B60 + dword_100025B60);
  return v6(v2, v3, v4);
}

uint64_t sub_10000E138(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000E3B0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100025B70 + dword_100025B70);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000E208()
{
  _Block_release(*(const void **)(v0 + 24));
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000E250()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000E3B0;
  unint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_100025910 + dword_100025910);
  return v6(v2, v3, v4);
}

uint64_t sub_10000E30C()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000E34C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005EF8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_10000E3B4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_10000E420(unint64_t a1)
{
  unint64_t v35 = &_swiftEmptySetSingleton;
  unint64_t v36 = &_swiftEmptySetSingleton;
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    os_log_type_t v27 = &_swiftEmptySetSingleton;
    id v28 = &_swiftEmptySetSingleton;
LABEL_23:
    id v29 = [objc_allocWithZone((Class)ANHomeContext) init];
    NSString v30 = sub_10001B0E0();
    swift_bridgeObjectRelease();
    [v29 setHomeName:v30];

    sub_1000184C4((uint64_t)v28);
    swift_bridgeObjectRelease();
    Class isa = sub_10001B160().super.isa;
    swift_release();
    [v29 setZoneNames:isa];

    sub_1000184C4((uint64_t)v27);
    swift_bridgeObjectRelease();
    Class v32 = sub_10001B160().super.isa;
    swift_release();
    [v29 setRoomNames:v32];

    return (uint64_t)v29;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_10001B3A0();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_22;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v33 = 0;
    uint64_t v4 = 0;
    unint64_t v5 = 0xE000000000000000;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v6 = (id)sub_10001B300();
      }
      else {
        id v6 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v7 = v6;
      id v8 = [v6 zone];
      if (v8)
      {
        uint64_t v9 = v8;
        id v10 = [v8 spokenPhrase];

        Swift::Int v11 = sub_10001B0F0();
        Swift::Int v13 = v12;

        sub_100017640(&v34, v11, v13);
        swift_bridgeObjectRelease();
      }
      id v14 = [v7 room];
      if (v14)
      {
        uint64_t v15 = v14;
        id v16 = [v14 spokenPhrase];

        Swift::Int v17 = sub_10001B0F0();
        Swift::Int v19 = v18;

        sub_100017640(&v34, v17, v19);
        swift_bridgeObjectRelease();
      }
      id v20 = [v7 home];
      if (v20)
      {
        os_log_type_t v21 = v20;
        id v22 = [v20 spokenPhrase];

        uint64_t v23 = sub_10001B0F0();
        unint64_t v25 = v24;

        uint64_t v26 = HIBYTE(v5) & 0xF;
        if ((v5 & 0x2000000000000000) == 0) {
          uint64_t v26 = v33 & 0xFFFFFFFFFFFFLL;
        }
        if (v26)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v33 = v23;
          unint64_t v5 = v25;
        }
      }
      else
      {
      }
      ++v4;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    os_log_type_t v27 = v35;
    id v28 = v36;
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E778@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100005EF8((uint64_t *)&unk_100025A60);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  id v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  id v8 = &v14[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler____lazy_storage___logger;
  swift_beginAccess();
  sub_100008EE8(v9, (uint64_t)v8, (uint64_t *)&unk_100025A60);
  uint64_t v10 = sub_10001B0B0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(a1, v8, v10);
  }
  sub_10000E34C((uint64_t)v8, (uint64_t *)&unk_100025A60);
  if (qword_1000252F8 != -1) {
    swift_once();
  }
  id v12 = (id)qword_100025EB8;
  sub_10001B0C0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_100008FAC((uint64_t)v6, v9);
  return swift_endAccess();
}

id sub_10000EA24()
{
  uint64_t v1 = OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce];
  if (v2)
  {
    [v2 setDelegate:0];
    uint64_t v3 = *(void **)&v0[v1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  *(void *)&v0[v1] = 0;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for SendAnnouncementIntentHandler();
  return objc_msgSendSuper2(&v5, "dealloc");
}

uint64_t sub_10000EB6C()
{
  return type metadata accessor for SendAnnouncementIntentHandler();
}

uint64_t type metadata accessor for SendAnnouncementIntentHandler()
{
  uint64_t result = qword_1000259C8;
  if (!qword_1000259C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000EBC0(uint64_t a1)
{
  v2[31] = a1;
  v2[32] = v1;
  sub_100005EF8((uint64_t *)&unk_1000259F0);
  v2[33] = swift_task_alloc();
  uint64_t v3 = sub_10001B040();
  v2[34] = v3;
  v2[35] = *(void *)(v3 - 8);
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  uint64_t v4 = sub_10001B0B0();
  v2[38] = v4;
  v2[39] = *(void *)(v4 - 8);
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  return _swift_task_switch(sub_10000ED80, 0, 0);
}

uint64_t sub_10000ED80()
{
  uint64_t v88 = v0;
  uint64_t v1 = *(void **)(v0 + 248);
  uint64_t v2 = (const void *)(v0 + 80);
  id v85 = (id *)(v0 + 248);
  sub_10000E778(*(void *)(v0 + 384));
  id v3 = v1;
  uint64_t v4 = sub_10001B0A0();
  os_log_type_t v5 = sub_10001B200();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v0 + 312);
    uint64_t v80 = *(void *)(v0 + 304);
    uint64_t v82 = *(void *)(v0 + 384);
    uint64_t v7 = *(void **)(v0 + 248);
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v87 = swift_slowAlloc();
    *(_DWORD *)id v8 = 136315138;
    uint64_t v9 = sub_1000105A4();
    *(void *)(v0 + 208) = sub_100019E14(v9, v10, &v87);
    sub_10001B250();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Resolving Announcement: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = (const void *)(v0 + 80);
    swift_slowDealloc();

    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v11(v82, v80);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 384);
    uint64_t v14 = *(void *)(v0 + 304);
    uint64_t v13 = *(void *)(v0 + 312);
    uint64_t v15 = *(void **)(v0 + 248);

    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v11(v12, v14);
  }
  *(void *)(v0 + 392) = v11;
  id v16 = *(void **)(v0 + 248);
  sub_10000E778(*(void *)(v0 + 376));
  id v17 = v16;
  Swift::Int v18 = sub_10001B0A0();
  os_log_type_t v19 = sub_10001B200();
  if (os_log_type_enabled(v18, v19))
  {
    id v20 = *v85;
    os_log_type_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v87 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v21 = 136315138;
    id v22 = [v20 _metadata];
    uint64_t v83 = v11;
    if (v22
      && (uint64_t v23 = v22, v24 = [v22 endpointId], v23, v24))
    {
      uint64_t v25 = sub_10001B0F0();
      unint64_t v27 = v26;
    }
    else
    {
      uint64_t v25 = 0;
      unint64_t v27 = 0xE000000000000000;
    }
    uint64_t v78 = *(void *)(v0 + 312);
    uint64_t v79 = *(void *)(v0 + 304);
    uint64_t v81 = *(void *)(v0 + 376);
    uint64_t v31 = *(void **)(v0 + 248);
    *(void *)(v0 + 240) = sub_100019E14(v25, v27, &v87);
    sub_10001B250();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Endpoint %s", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v11 = v83;
    v83(v81, v79);
    uint64_t v2 = (const void *)(v0 + 80);
  }
  else
  {
    uint64_t v28 = *(void *)(v0 + 376);
    uint64_t v29 = *(void *)(v0 + 304);
    NSString v30 = *(void **)(v0 + 248);

    v11(v28, v29);
  }
  Class v32 = *(void **)(v0 + 248);
  uint64_t v33 = (void *)sub_1000188E4(v32);
  uint64_t v34 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)(v0 + 112) = sub_1000191CC;
  *(void *)(v0 + 120) = v34;
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 1107296256;
  *(void *)(v0 + 96) = sub_10000E3B4;
  *(void *)(v0 + 104) = &unk_100020CD0;
  unint64_t v35 = _Block_copy(v2);
  id v36 = v33;
  swift_release();
  [v36 prewarmWithHandler:v35];
  _Block_release(v35);

  id v37 = [v32 announcement];
  *(void *)(v0 + 400) = v37;
  if (!v37)
  {
    sub_10000E778(*(void *)(v0 + 320));
    uint64_t v58 = sub_10001B0A0();
    os_log_type_t v59 = sub_10001B200();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v60 = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "Announcement is empty. Needs value.", v60, 2u);
      swift_slowDealloc();
    }
    uint64_t v61 = *(void *)(v0 + 320);
    uint64_t v62 = *(void *)(v0 + 304);

    v11(v61, v62);
    sub_1000096DC(0, &qword_100025A58);
    id v84 = [(id)swift_getObjCClassFromMetadata() needsValue];
    goto LABEL_37;
  }
  uint64_t v38 = v37;
  id v39 = [*v85 isReply];
  if (v39)
  {
    id v40 = v39;
    unsigned int v41 = [v39 BOOLValue];

    if (v41)
    {
      id v42 = [v38 identifier];
      *(void *)(v0 + 408) = v42;
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = sub_10001B0F0();
        *(void *)(v0 + 416) = v44;
        *(void *)(v0 + 424) = v45;
        uint64_t v46 = HIBYTE(v45) & 0xF;
        if ((v45 & 0x2000000000000000) == 0) {
          uint64_t v46 = v44 & 0xFFFFFFFFFFFFLL;
        }
        if (v46)
        {
          uint64_t v47 = (void *)sub_1000188E4(*(void **)(v0 + 248));
          *(void *)(v0 + 432) = v47;
          *(void *)(v0 + 16) = v0;
          *(void *)(v0 + 56) = v0 + 192;
          *(void *)(v0 + 24) = sub_10000F824;
          uint64_t v48 = swift_continuation_init();
          *(void *)(v0 + 128) = _NSConcreteStackBlock;
          *(void *)(v0 + 136) = 0x40000000;
          *(void *)(v0 + 144) = sub_100010BEC;
          *(void *)(v0 + 152) = &unk_100020CF8;
          *(void *)(v0 + 160) = v48;
          [v47 announcementForID:v43 reply:v0 + 128];
          return _swift_continuation_await(v0 + 16);
        }
        swift_bridgeObjectRelease();
      }
      sub_10000E778(*(void *)(v0 + 360));
      uint64_t v71 = sub_10001B0A0();
      os_log_type_t v72 = sub_10001B1F0();
      if (os_log_type_enabled(v71, v72))
      {
        uint64_t v73 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v73 = 0;
        _os_log_impl((void *)&_mh_execute_header, v71, v72, "Announcement Identifier is empty for reply", v73, 2u);
        swift_slowDealloc();
      }
      uint64_t v74 = *(void *)(v0 + 360);
      uint64_t v75 = *(void *)(v0 + 304);

      v11(v74, v75);
      id v84 = [self unsupportedForReason:1];

      goto LABEL_37;
    }
  }
  id v49 = objc_msgSend(*(id *)(v0 + 400), "speechDataURL", v78, v79);
  if (!v49)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 280) + 56))(*(void *)(v0 + 264), 1, 1, *(void *)(v0 + 272));
    goto LABEL_30;
  }
  uint64_t v50 = v49;
  uint64_t v52 = *(void *)(v0 + 280);
  uint64_t v51 = *(void *)(v0 + 288);
  uint64_t v54 = *(void *)(v0 + 264);
  uint64_t v53 = *(void *)(v0 + 272);
  sub_10001B030();

  os_log_type_t v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 32);
  v55(v54, v51, v53);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v52 + 56))(v54, 0, 1, v53);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v54, 1, v53) == 1)
  {
LABEL_30:
    uint64_t v63 = *(void *)(v0 + 328);
    sub_10000E34C(*(void *)(v0 + 264), (uint64_t *)&unk_1000259F0);
    sub_10000E778(v63);
    uint64_t v64 = sub_10001B0A0();
    os_log_type_t v65 = sub_10001B1F0();
    if (os_log_type_enabled(v64, v65))
    {
      unint64_t v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v66 = 0;
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "Resolving Announcement failed for no Speech Data URL.", v66, 2u);
      swift_slowDealloc();
    }
    unint64_t v68 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    id v67 = *(void **)(v0 + 400);
    uint64_t v69 = *(void *)(v0 + 328);
    uint64_t v70 = *(void *)(v0 + 304);

    v68(v69, v70);
    sub_1000096DC(0, &qword_100025A58);
    id v84 = [(id)swift_getObjCClassFromMetadata() needsValue];

LABEL_37:
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
    uint64_t v76 = *(uint64_t (**)(id))(v0 + 8);
    return v76(v84);
  }
  v55(*(void *)(v0 + 296), *(void *)(v0 + 264), *(void *)(v0 + 272));
  char v86 = (uint64_t (*)(uint64_t))((char *)&dword_1000255E0 + dword_1000255E0);
  id v56 = (void *)swift_task_alloc();
  *(void *)(v0 + 440) = v56;
  *id v56 = v0;
  v56[1] = sub_10000FE14;
  uint64_t v57 = *(void *)(v0 + 296);
  return v86(v57);
}

uint64_t sub_10000F824()
{
  return _swift_task_switch(sub_10000F904, 0, 0);
}

uint64_t sub_10000F904()
{
  uint64_t v38 = v0;
  uint64_t v1 = *(void **)(v0 + 408);
  uint64_t v2 = *(void **)(v0 + 192);

  if (v2)
  {
    swift_bridgeObjectRelease();
    id v3 = [*(id *)(v0 + 400) speechDataURL];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v6 = *(void *)(v0 + 280);
      uint64_t v5 = *(void *)(v0 + 288);
      uint64_t v8 = *(void *)(v0 + 264);
      uint64_t v7 = *(void *)(v0 + 272);
      sub_10001B030();

      uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
      v9(v8, v5, v7);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v8, 0, 1, v7);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v8, 1, v7) != 1)
      {
        v9(*(void *)(v0 + 296), *(void *)(v0 + 264), *(void *)(v0 + 272));
        uint64_t v34 = (uint64_t (*)(uint64_t))((char *)&dword_1000255E0 + dword_1000255E0);
        unint64_t v10 = (void *)swift_task_alloc();
        *(void *)(v0 + 440) = v10;
        *unint64_t v10 = v0;
        v10[1] = sub_10000FE14;
        uint64_t v11 = *(void *)(v0 + 296);
        return v34(v11);
      }
    }
    else
    {
      (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 280) + 56))(*(void *)(v0 + 264), 1, 1, *(void *)(v0 + 272));
    }
    uint64_t v19 = *(void *)(v0 + 328);
    sub_10000E34C(*(void *)(v0 + 264), (uint64_t *)&unk_1000259F0);
    sub_10000E778(v19);
    id v20 = sub_10001B0A0();
    os_log_type_t v21 = sub_10001B1F0();
    if (os_log_type_enabled(v20, v21))
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Resolving Announcement failed for no Speech Data URL.", v22, 2u);
      swift_slowDealloc();
    }
    id v24 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    uint64_t v23 = *(void **)(v0 + 400);
    uint64_t v25 = *(void *)(v0 + 328);
    uint64_t v26 = *(void *)(v0 + 304);

    v24(v25, v26);
    sub_1000096DC(0, &qword_100025A58);
    id v27 = [(id)swift_getObjCClassFromMetadata() needsValue];
  }
  else
  {
    sub_10000E778(*(void *)(v0 + 368));
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_10001B0A0();
    os_log_type_t v14 = sub_10001B1F0();
    BOOL v15 = os_log_type_enabled(v13, v14);
    unint64_t v16 = *(void *)(v0 + 424);
    if (v15)
    {
      uint64_t v17 = *(void *)(v0 + 416);
      uint64_t v33 = *(void *)(v0 + 368);
      unint64_t v35 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
      uint64_t v32 = *(void *)(v0 + 304);
      Swift::Int v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      *(_DWORD *)Swift::Int v18 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 232) = sub_100019E14(v17, v16, &v37);
      sub_10001B250();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Could not find reply-to announcement: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v35(v33, v32);
    }
    else
    {
      uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
      uint64_t v29 = *(void *)(v0 + 368);
      uint64_t v30 = *(void *)(v0 + 304);
      swift_bridgeObjectRelease_n();

      v28(v29, v30);
    }
    uint64_t v23 = *(void **)(v0 + 400);
    id v27 = [self unsupportedForReason:1];
  }
  id v36 = v27;

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
  uint64_t v31 = *(uint64_t (**)(id))(v0 + 8);
  return v31(v36);
}

uint64_t sub_10000FE14(double a1)
{
  uint64_t v3 = *v2;
  *(double *)(v3 + 448) = a1;
  *(void *)(v3 + 456) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_100010288;
  }
  else {
    uint64_t v4 = sub_10000FF2C;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000FF2C()
{
  sub_10000E778(*(void *)(v0 + 352));
  uint64_t v1 = sub_10001B0A0();
  os_log_type_t v2 = sub_10001B200();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = *(void *)(v0 + 448);
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134349056;
    *(void *)(v0 + 200) = v3;
    sub_10001B250();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Speech Data Length: %{public}f", v4, 0xCu);
    swift_slowDealloc();
  }
  double v5 = *(double *)(v0 + 448);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
  uint64_t v7 = *(void *)(v0 + 352);
  uint64_t v8 = *(void *)(v0 + 304);

  v6(v7, v8);
  if (v5 >= 60.0)
  {
    sub_10000E778(*(void *)(v0 + 336));
    uint64_t v13 = sub_10001B0A0();
    os_log_type_t v14 = sub_10001B200();
    if (os_log_type_enabled(v13, v14))
    {
      BOOL v15 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)BOOL v15 = 67240192;
      *(_DWORD *)(v0 + 464) = 60;
      sub_10001B250();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Speech Data Length Exceeds Maximum (%{public}d seconds). Requires Confirmation.", v15, 8u);
      swift_slowDealloc();
    }
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
    unint64_t v16 = *(void **)(v0 + 400);
    uint64_t v18 = *(void *)(v0 + 336);
    uint64_t v20 = *(void *)(v0 + 296);
    uint64_t v19 = *(void *)(v0 + 304);
    uint64_t v21 = *(void *)(v0 + 272);
    uint64_t v22 = *(void *)(v0 + 280);

    v17(v18, v19);
    id v25 = [self confirmationRequiredWithAnnouncementToConfirm:v16 forReason:1];

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
  }
  else
  {
    uint64_t v9 = *(void **)(v0 + 400);
    uint64_t v10 = *(void *)(v0 + 296);
    uint64_t v12 = *(void *)(v0 + 272);
    uint64_t v11 = *(void *)(v0 + 280);
    sub_1000096DC(0, &qword_100025A58);
    id v25 = [(id)swift_getObjCClassFromMetadata() successWithResolvedAnnouncement:v9];

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
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
  uint64_t v23 = *(uint64_t (**)(id))(v0 + 8);
  return v23(v25);
}

uint64_t sub_100010288()
{
  uint64_t v20 = v0;
  sub_10000E778(v0[43]);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_10001B0A0();
  os_log_type_t v2 = sub_10001B1F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v16 = v0[43];
    uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[49];
    uint64_t v15 = v0[38];
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136446210;
    swift_getErrorValue();
    uint64_t v4 = sub_10001B450();
    v0[27] = sub_100019E14(v4, v5, &v19);
    sub_10001B250();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to retrieve duration %{public}s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v17(v16, v15);
  }
  else
  {
    uint64_t v6 = (void (*)(uint64_t, uint64_t))v0[49];
    uint64_t v7 = v0[43];
    uint64_t v8 = v0[38];
    swift_errorRelease();
    swift_errorRelease();

    v6(v7, v8);
  }
  uint64_t v9 = (void *)v0[50];
  uint64_t v10 = v0[37];
  uint64_t v11 = v0[34];
  uint64_t v12 = v0[35];
  sub_1000096DC(0, &qword_100025A58);
  id v18 = [(id)swift_getObjCClassFromMetadata() unsupported];

  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
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
  uint64_t v13 = (uint64_t (*)(id))v0[1];
  return v13(v18);
}

uint64_t sub_1000105A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = 7104878;
  uint64_t v3 = sub_100005EF8((uint64_t *)&unk_1000259F0);
  __chkstk_darwin(v3);
  unint64_t v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = 0;
  unint64_t v45 = 0xE000000000000000;
  sub_10001B2E0(143);
  uint64_t v47 = v44;
  unint64_t v48 = v45;
  v49._countAndFlagsBits = 0xD000000000000013;
  v49._object = (void *)0x800000010001D540;
  sub_10001B130(v49);
  id v6 = [v0 identifier];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_10001B0F0();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = (void *)0xE300000000000000;
    uint64_t v8 = 7104878;
  }
  v50._countAndFlagsBits = v8;
  v50._object = v10;
  sub_10001B130(v50);
  swift_bridgeObjectRelease();
  v51._countAndFlagsBits = 0x656970696365520ALL;
  v51._object = (void *)0xED0000203A73746ELL;
  sub_10001B130(v51);
  id v11 = [v1 recipients];
  if (v11)
  {
    uint64_t v12 = v11;
    sub_1000096DC(0, (unint64_t *)&qword_100025A00);
    sub_10001B170();
  }
  sub_1000096DC(0, (unint64_t *)&qword_100025A00);
  v52._countAndFlagsBits = sub_10001B180();
  sub_10001B130(v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v53._countAndFlagsBits = 0xD00000000000001ALL;
  v53._object = (void *)0x800000010001D560;
  sub_10001B130(v53);
  id v13 = [v1 announcement];
  if (v13
    && (v14 = v13, id v15 = [v13 identifier], v14, v15))
  {
    uint64_t v16 = sub_10001B0F0();
    id v18 = v17;
  }
  else
  {
    id v18 = (void *)0xE300000000000000;
    uint64_t v16 = 7104878;
  }
  uint64_t v19 = 0x65736C6166;
  v54._countAndFlagsBits = v16;
  v54._object = v18;
  sub_10001B130(v54);
  swift_bridgeObjectRelease();
  v55._countAndFlagsBits = 0x6C7065522073490ALL;
  v55._object = (void *)0xEB00000000203A79;
  sub_10001B130(v55);
  id v20 = [v1 isReply];
  if (v20 && (uint64_t v21 = v20, v22 = [v20 BOOLValue], v21, (v22 & 1) != 0))
  {
    uint64_t v23 = (void *)0xE400000000000000;
    v24._countAndFlagsBits = 1702195828;
  }
  else
  {
    uint64_t v23 = (void *)0xE500000000000000;
    v24._countAndFlagsBits = 0x65736C6166;
  }
  v24._object = v23;
  sub_10001B130(v24);
  swift_bridgeObjectRelease();
  v56._countAndFlagsBits = 0xD000000000000012;
  v56._object = (void *)0x800000010001D580;
  sub_10001B130(v56);
  uint64_t v46 = v3;
  id v25 = sub_1000190CC(&v44);
  id v26 = [v1 announcement];
  if (v26)
  {
    id v27 = v26;
    id v28 = [v26 speechDataURL];

    if (v28)
    {
      sub_10001B030();

      uint64_t v29 = sub_10001B040();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v5, 0, 1, v29);
    }
    else
    {
      uint64_t v31 = sub_10001B040();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v5, 1, 1, v31);
    }
    sub_100019254((uint64_t)v5, (uint64_t)v25, (uint64_t *)&unk_1000259F0);
  }
  else
  {
    uint64_t v30 = sub_10001B040();
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v25, 1, 1, v30);
  }
  sub_10001B380();
  sub_100009058((uint64_t)&v44);
  v57._object = (void *)0x800000010001D5A0;
  v57._countAndFlagsBits = 0xD000000000000010;
  sub_10001B130(v57);
  id v32 = [v1 announcement];
  if (v32
    && (uint64_t v33 = v32,
        id v34 = [v32 speechDataTranscription],
        v33,
        v34))
  {

    unint64_t v35 = (void *)0xE400000000000000;
    uint64_t v19 = 1702195828;
  }
  else
  {
    unint64_t v35 = (void *)0xE500000000000000;
  }
  v58._countAndFlagsBits = v19;
  v58._object = v35;
  sub_10001B130(v58);
  swift_bridgeObjectRelease();
  v59._countAndFlagsBits = 0x6874676E654C202CLL;
  v59._object = (void *)0xEA00000000002820;
  sub_10001B130(v59);
  id v36 = [v1 announcement];
  uint64_t v37 = v36;
  if (v36)
  {
    id v38 = [v36 speechDataTranscription];

    if (v38)
    {
      sub_10001B0F0();

      uint64_t v37 = (void *)sub_10001B120();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v37 = 0;
    }
  }
  uint64_t v44 = (uint64_t)v37;
  v60._countAndFlagsBits = sub_10001B3F0();
  sub_10001B130(v60);
  swift_bridgeObjectRelease();
  v61._countAndFlagsBits = 0x696F70646E450A29;
  v61._object = (void *)0xEE00203A4449746ELL;
  sub_10001B130(v61);
  id v39 = [v1 _endpointId];
  if (v39)
  {
    id v40 = v39;
    uint64_t v2 = sub_10001B0F0();
    id v42 = v41;
  }
  else
  {
    id v42 = (void *)0xE300000000000000;
  }
  v62._countAndFlagsBits = v2;
  v62._object = v42;
  sub_10001B130(v62);
  swift_bridgeObjectRelease();
  return v47;
}

uint64_t sub_100010BEC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40);
  id v4 = a2;
  sub_100019254((uint64_t)&v6, v3, &qword_100025A50);
  return swift_continuation_resume();
}

uint64_t sub_100010DCC(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000D540;
  return sub_10000EBC0((uint64_t)v6);
}

uint64_t sub_100010E90(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  uint64_t v3 = sub_10001B0B0();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return _swift_task_switch(sub_100010F60, 0, 0);
}

uint64_t sub_100010F60()
{
  uint64_t v41 = v0;
  uint64_t v1 = *(void **)(v0 + 72);
  uint64_t v2 = (const void *)(v0 + 16);
  sub_10000E778(*(void *)(v0 + 112));
  id v3 = v1;
  id v4 = sub_10001B0A0();
  os_log_type_t v5 = sub_10001B200();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v37 = *(void *)(v0 + 96);
    uint64_t v38 = *(void *)(v0 + 88);
    uint64_t v39 = *(void *)(v0 + 112);
    id v6 = *(void **)(v0 + 72);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v8 = sub_1000105A4();
    *(void *)(v0 + 64) = sub_100019E14(v8, v9, &v40);
    sub_10001B250();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Resolving Recipients: %s", v7, 0xCu);
    swift_arrayDestroy();
    uint64_t v2 = (const void *)(v0 + 16);
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    v10(v39, v38);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 112);
    uint64_t v12 = *(void *)(v0 + 88);
    uint64_t v13 = *(void *)(v0 + 96);
    os_log_type_t v14 = *(void **)(v0 + 72);

    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v10(v11, v12);
  }
  id v15 = *(void **)(v0 + 72);
  uint64_t v16 = (void *)sub_1000188E4(v15);
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)(v0 + 48) = sub_1000191CC;
  *(void *)(v0 + 56) = v17;
  *(void *)(v0 + 16) = _NSConcreteStackBlock;
  *(void *)(v0 + 24) = 1107296256;
  *(void *)(v0 + 32) = sub_10000E3B4;
  *(void *)(v0 + 40) = &unk_100020C90;
  id v18 = _Block_copy(v2);
  id v19 = v16;
  swift_release();
  [v19 prewarmWithHandler:v18];
  _Block_release(v18);

  id v20 = (id)sub_1000188E4(v15);
  LOBYTE(v19) = sub_100006BA0(v15);

  if (v19)
  {
    sub_10000E778(*(void *)(v0 + 104));
    uint64_t v21 = sub_10001B0A0();
    os_log_type_t v22 = sub_10001B1F0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Attempting to announce to the same room containing self", v23, 2u);
      swift_slowDealloc();
    }
    uint64_t v24 = *(void *)(v0 + 104);
    uint64_t v25 = *(void *)(v0 + 88);

    v10(v24, v25);
    sub_100005EF8(&qword_100025730);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_10001BF80;
    *(void *)(v26 + 32) = [self unsupportedForReason:2];
    uint64_t v40 = v26;
    sub_10001B190();
    uint64_t v27 = v40;
    swift_task_dealloc();
    swift_task_dealloc();
    id v28 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v28(v27);
  }
  else
  {
    id v30 = [*(id *)(v0 + 72) isReply];
    if (v30 && (uint64_t v31 = v30, v32 = [v30 BOOLValue], v31, v32))
    {
      uint64_t v33 = (void *)swift_task_alloc();
      *(void *)(v0 + 120) = v33;
      *uint64_t v33 = v0;
      v33[1] = sub_100011494;
      uint64_t v34 = *(void *)(v0 + 72);
      return sub_100011A3C(v34);
    }
    else
    {
      unint64_t v35 = (void *)swift_task_alloc();
      *(void *)(v0 + 128) = v35;
      void *v35 = v0;
      v35[1] = sub_1000115D0;
      uint64_t v36 = *(void *)(v0 + 72);
      return sub_1000127F4(v36);
    }
  }
}

uint64_t sub_100011494(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000115D0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_10001170C(uint64_t a1)
{
  uint64_t v2 = sub_10001B0B0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v20 - v7;
  if (a1)
  {
    swift_beginAccess();
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      uint64_t v10 = (void *)result;
      swift_errorRetain();
      sub_10000E778((uint64_t)v8);

      swift_errorRetain();
      swift_errorRetain();
      uint64_t v11 = sub_10001B0A0();
      os_log_type_t v12 = sub_10001B1F0();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 136446210;
        v20[0] = v13 + 4;
        swift_getErrorValue();
        uint64_t v14 = sub_10001B450();
        v20[1] = sub_100019E14(v14, v15, &v21);
        sub_10001B250();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Prewarm Completed with Error %{public}s", v13, 0xCu);
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
      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      uint64_t v16 = (void *)result;
      sub_10000E778((uint64_t)v6);

      uint64_t v17 = sub_10001B0A0();
      os_log_type_t v18 = sub_10001B200();
      if (os_log_type_enabled(v17, v18))
      {
        id v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Prewarm Completed", v19, 2u);
        swift_slowDealloc();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return result;
}

uint64_t sub_100011A3C(uint64_t a1)
{
  v2[29] = a1;
  v2[30] = v1;
  uint64_t v3 = sub_10001B0B0();
  v2[31] = v3;
  v2[32] = *(void *)(v3 - 8);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  return _swift_task_switch(sub_100011B18, 0, 0);
}

uint64_t sub_100011B18()
{
  id v1 = [*(id *)(v0 + 232) recipients];
  if (!v1)
  {
    sub_10000E778(*(void *)(v0 + 264));
    id v19 = sub_10001B0A0();
    os_log_type_t v20 = sub_10001B200();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Skipping Resolve Recipients for Reply without recipients", v21, 2u);
      swift_slowDealloc();
    }
    uint64_t v23 = *(void *)(v0 + 256);
    uint64_t v22 = *(void *)(v0 + 264);
    uint64_t v24 = *(void *)(v0 + 248);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    sub_100005EF8(&qword_100025730);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_10001BF80;
    sub_1000096DC(0, &qword_100025A40);
    id v18 = [(id)swift_getObjCClassFromMetadata() notRequired];
    goto LABEL_31;
  }
  uint64_t v2 = v1;
  sub_1000096DC(0, (unint64_t *)&qword_100025A00);
  *(void *)(v0 + 288) = sub_10001B170();

  unint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_10000E420(v3);
  swift_bridgeObjectRelease();
  id v5 = [v4 homeName];

  uint64_t v6 = sub_10001B0F0();
  unint64_t v8 = v7;

  swift_bridgeObjectRelease();
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  if (v9)
  {
    uint64_t v10 = *(void *)(v0 + 272);
    swift_bridgeObjectRelease();
    sub_10000E778(v10);
    uint64_t v11 = sub_10001B0A0();
    os_log_type_t v12 = sub_10001B200();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Recipients contain home name. No additional resolution required.", v13, 2u);
      swift_slowDealloc();
    }
    uint64_t v14 = *(void *)(v0 + 272);
    uint64_t v15 = *(void *)(v0 + 248);
    uint64_t v16 = *(void *)(v0 + 256);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
    sub_100005EF8(&qword_100025730);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_10001BF80;
    sub_1000096DC(0, &qword_100025A40);
    id v18 = [(id)swift_getObjCClassFromMetadata() notRequired];
LABEL_31:
    *(void *)(v17 + 32) = v18;
    sub_10001B190();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    Swift::String v49 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v49(v17);
  }
  id v25 = [*(id *)(v0 + 232) announcement];
  if (!v25
    || (v26 = v25, id v27 = [v25 identifier], v26, !v27))
  {
    id v31 = [objc_allocWithZone((Class)ANLocalPlaybackSession) init];
    id v32 = [v31 lastPlayedAnnouncementInfo];

    uint64_t v33 = sub_10001B0D0();
    *(void *)(v0 + 208) = sub_10001B0F0();
    *(void *)(v0 + 216) = v34;
    sub_10001B2B0();
    if (*(void *)(v33 + 16) && (unint64_t v35 = sub_1000182D4(v0 + 120), (v36 & 1) != 0))
    {
      sub_100019138(*(void *)(v33 + 56) + 32 * v35, v0 + 160);
    }
    else
    {
      *(_OWORD *)(v0 + 160) = 0u;
      *(_OWORD *)(v0 + 176) = 0u;
    }
    uint64_t v37 = (void *)(v0 + 192);
    swift_bridgeObjectRelease();
    sub_100019200(v0 + 120);
    if (*(void *)(v0 + 184))
    {
      if (swift_dynamicCast())
      {
        if (!*(void *)(v0 + 200)) {
          goto LABEL_28;
        }
        goto LABEL_25;
      }
      void *v37 = 0;
      *(void *)(v0 + 200) = 0;
    }
    else
    {
      sub_10000E34C(v0 + 160, &qword_100025A48);
      void *v37 = 0;
      *(void *)(v0 + 200) = 0;
    }
LABEL_28:
    uint64_t v42 = *(void *)(v0 + 280);
    swift_bridgeObjectRelease();
    sub_10000E778(v42);
    uint64_t v43 = sub_10001B0A0();
    os_log_type_t v44 = sub_10001B1F0();
    if (os_log_type_enabled(v43, v44))
    {
      unint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Contains Recipients with no announcement identifier. Unable to determine context for home.", v45, 2u);
      swift_slowDealloc();
    }
    uint64_t v46 = *(void *)(v0 + 280);
    uint64_t v47 = *(void *)(v0 + 248);
    uint64_t v48 = *(void *)(v0 + 256);

    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v46, v47);
    sub_100005EF8(&qword_100025730);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_10001BF80;
    sub_1000096DC(0, &qword_100025A40);
    id v18 = [(id)swift_getObjCClassFromMetadata() unsupported];
    goto LABEL_31;
  }
  uint64_t v28 = sub_10001B0F0();
  uint64_t v30 = v29;

  *(void *)(v0 + 192) = v28;
  *(void *)(v0 + 200) = v30;
  if (!v30) {
    goto LABEL_28;
  }
LABEL_25:
  uint64_t v38 = (void *)sub_1000188E4(*(void **)(v0 + 232));
  *(void *)(v0 + 296) = v38;
  id v39 = v38;
  NSString v40 = sub_10001B0E0();
  *(void *)(v0 + 304) = v40;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 224;
  *(void *)(v0 + 24) = sub_100012218;
  uint64_t v41 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_100010BEC;
  *(void *)(v0 + 104) = &unk_100020CB8;
  *(void *)(v0 + 112) = v41;
  [v39 announcementForID:v40 reply:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_100012218()
{
  return _swift_task_switch(sub_1000122F8, 0, 0);
}

uint64_t sub_1000122F8()
{
  uint64_t v1 = *(void **)(v0 + 224);
  uint64_t v2 = *(void **)(v0 + 304);

  if (v1)
  {
    id v3 = [(id)sub_1000188E4(*(void **)(v0 + 232)) contextFromAnnouncement:v1];
    unint64_t v4 = *(void *)(v0 + 288);
    if (v3)
    {
      uint64_t v26 = v0;
      id v25 = v3;
      id v5 = [v3 homeName];
      sub_10001B0F0();

      id v6 = objc_allocWithZone((Class)INSpeakableString);
      swift_bridgeObjectRetain();
      NSString v7 = sub_10001B0E0();
      swift_bridgeObjectRelease();
      id v8 = [v6 initWithSpokenPhrase:v7];

      LOWORD(v24) = 0;
      id v9 = objc_msgSend(objc_allocWithZone((Class)INHomeFilter), "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", 0, 0, 1, 37, 0, 37, v8, 0, 0, 0, v24);

      swift_bridgeObjectRelease();
      unint64_t v27 = v4;
      id v10 = v9;
      sub_10001B150();
      if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10001B1A0();
      }
      sub_10001B1B0();
      sub_10001B190();
      if (v4 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_10001B3A0();
      }
      else
      {
        uint64_t v11 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
      }
      if (v11)
      {
        uint64_t result = sub_10001B350();
        if (v11 < 0)
        {
          __break(1u);
          goto LABEL_35;
        }
        uint64_t v13 = self;
        uint64_t v14 = 0;
        do
        {
          if ((v27 & 0xC000000000000001) != 0) {
            id v15 = (id)sub_10001B300();
          }
          else {
            id v15 = *(id *)(v27 + 8 * v14 + 32);
          }
          uint64_t v16 = v15;
          ++v14;
          id v17 = [v13 successWithResolvedHomeFilter:v15];

          sub_10001B330();
          sub_10001B360();
          sub_10001B370();
          sub_10001B340();
        }
        while (v11 != v14);
        swift_bridgeObjectRelease();
        if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
        {
LABEL_16:
          uint64_t v18 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v18) {
            goto LABEL_17;
          }
          goto LABEL_28;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        if (!((unint64_t)_swiftEmptyArrayStorage >> 62)) {
          goto LABEL_16;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_10001B3A0();
      swift_bridgeObjectRelease();
      if (v18)
      {
LABEL_17:
        uint64_t result = sub_10001B350();
        if ((v18 & 0x8000000000000000) == 0)
        {
          uint64_t v19 = 0;
          do
          {
            if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0) {
              id v20 = (id)sub_10001B300();
            }
            else {
              id v20 = _swiftEmptyArrayStorage[v19 + 4];
            }
            uint64_t v21 = v20;
            ++v19;
            [objc_allocWithZone((Class)INSendAnnouncementRecipientResolutionResult) initWithHomeFilterResolutionResult:v20];

            sub_10001B330();
            sub_10001B360();
            sub_10001B370();
            sub_10001B340();
          }
          while (v18 != v19);
          uint64_t v22 = _swiftEmptyArrayStorage;

          swift_bridgeObjectRelease();
          goto LABEL_29;
        }
LABEL_35:
        __break(1u);
        return result;
      }
LABEL_28:

      swift_bridgeObjectRelease();
      uint64_t v22 = _swiftEmptyArrayStorage;
LABEL_29:
      swift_bridgeObjectRelease();
      uint64_t v0 = v26;
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_100005EF8(&qword_100025730);
  uint64_t v22 = (id *)swift_allocObject();
  *((_OWORD *)v22 + 1) = xmmword_10001BF80;
  sub_1000096DC(0, &qword_100025A40);
  v22[4] = [(id)swift_getObjCClassFromMetadata() unsupported];
  sub_10001B190();
LABEL_30:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = *(uint64_t (**)(id *))(v0 + 8);
  return v23(v22);
}

uint64_t sub_1000127F4(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = sub_10001B0B0();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return _swift_task_switch(sub_1000128F4, 0, 0);
}

uint64_t sub_1000128F4()
{
  uint64_t v98 = v0;
  uint64_t v91 = (uint64_t *)(v0 + 32);
  id v1 = [*(id *)(v0 + 40) recipients];
  if (v1)
  {
    uint64_t v2 = v1;
    sub_1000096DC(0, (unint64_t *)&qword_100025A00);
    unint64_t v3 = sub_10001B170();

    id v4 = (id)sub_10000E420(v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)ANHomeContext) init];
  }
  uint64_t v90 = (uint64_t *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 112);
  v94 = v4;
  id v6 = [(id)sub_1000188E4(*(void **)(v0 + 40)) homeNamesForContext:v4];
  uint64_t v7 = sub_10001B170();

  sub_10000E778(v5);
  swift_bridgeObjectRetain_n();
  id v8 = sub_10001B0A0();
  os_log_type_t v9 = sub_10001B200();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void *)(v0 + 112);
  uint64_t v12 = *(void *)(v0 + 56);
  uint64_t v13 = *(void *)(v0 + 64);
  uint64_t v93 = v0;
  uint64_t v95 = v0 + 40;
  if (v10)
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    id v97 = (id *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_10001B180();
    uint64_t v16 = v7;
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    *uint64_t v91 = sub_100019E14(v15, v18, (uint64_t *)&v97);
    sub_10001B250();
    uint64_t v7 = v16;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Found Homes: %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v0 = v93;
    swift_slowDealloc();

    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v19(v11, v12);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v19(v11, v12);
  }
  uint64_t v20 = *(void *)(v7 + 16);
  if (v20 != 1)
  {
    if (v20)
    {
      sub_10000E778(*(void *)(v0 + 80));
      uint64_t v38 = sub_10001B0A0();
      os_log_type_t v39 = sub_10001B200();
      if (os_log_type_enabled(v38, v39))
      {
        NSString v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)NSString v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "Found Multiple Homes. Need to disambiguate", v40, 2u);
        swift_slowDealloc();
      }
      uint64_t v41 = *(void *)(v0 + 80);
      uint64_t v42 = *(void *)(v0 + 56);

      uint64_t v92 = v19;
      v19(v41, v42);
      id v97 = _swiftEmptyArrayStorage;
      uint64_t v43 = *(void *)(v7 + 16);
      if (v43)
      {
        sub_1000096DC(0, (unint64_t *)&qword_100025A00);
        swift_bridgeObjectRetain();
        os_log_type_t v44 = (uint64_t *)(v7 + 40);
        do
        {
          uint64_t v45 = *(v44 - 1);
          uint64_t v46 = *v44;
          swift_bridgeObjectRetain();
          id v47 = [v94 roomNames];
          uint64_t v48 = sub_10001B170();

          id v49 = [v94 zoneNames];
          uint64_t v50 = sub_10001B170();

          uint64_t v51 = sub_100009718(v45, v46, v48, v50);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_100009E5C((unint64_t)v51);
          v44 += 2;
          --v43;
        }
        while (v43);
        swift_bridgeObjectRelease_n();
        uint64_t v0 = v93;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v74 = *(void *)(v0 + 72);
      uint64_t v75 = self;
      sub_1000096DC(0, (unint64_t *)&qword_100025A00);
      Class isa = sub_10001B160().super.isa;
      swift_bridgeObjectRelease();
      id v77 = [v75 disambiguationWithHomeFiltersToDisambiguate:isa];

      id v78 = [objc_allocWithZone((Class)INSendAnnouncementRecipientResolutionResult) initWithHomeFilterResolutionResult:v77];
      sub_10000E778(v74);
      uint64_t v79 = v78;
      uint64_t v80 = sub_10001B0A0();
      os_log_type_t v81 = sub_10001B200();
      if (os_log_type_enabled(v80, v81))
      {
        uint64_t v82 = (uint8_t *)swift_slowAlloc();
        uint64_t v83 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v82 = 138412290;
        *(void *)(v95 - 24) = v79;
        id v84 = v79;
        sub_10001B250();
        *uint64_t v83 = v79;

        _os_log_impl((void *)&_mh_execute_header, v80, v81, "Disambiguation Result: %@", v82, 0xCu);
        sub_100005EF8(&qword_1000256C0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v80 = v79;
      }
      uint64_t v0 = v93;
      uint64_t v85 = *(void *)(v93 + 72);
      uint64_t v86 = *(void *)(v93 + 56);

      v92(v85, v86);
      sub_100005EF8(&qword_100025730);
      uint64_t v87 = (id *)swift_allocObject();
      *((_OWORD *)v87 + 1) = xmmword_10001BF80;
      v87[4] = v79;
      id v97 = v87;
      sub_10001B190();
      uint64_t v28 = v97;
    }
    else
    {
      uint64_t v21 = *(void *)(v0 + 104);
      swift_bridgeObjectRelease();
      sub_10000E778(v21);
      uint64_t v22 = sub_10001B0A0();
      os_log_type_t v23 = sub_10001B1F0();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Did not find any Homes", v24, 2u);
        swift_slowDealloc();
      }
      uint64_t v25 = *(void *)(v0 + 104);
      uint64_t v26 = *(void *)(v0 + 56);

      v19(v25, v26);
      sub_100005EF8(&qword_100025730);
      unint64_t v27 = (id *)swift_allocObject();
      *((_OWORD *)v27 + 1) = xmmword_10001BF80;
      v27[4] = [self unsupportedForReason:1];
      id v97 = v27;
      sub_10001B190();
      uint64_t v28 = v97;
    }
    goto LABEL_42;
  }
  sub_10000E778(*(void *)(v0 + 96));
  uint64_t v29 = sub_10001B0A0();
  os_log_type_t v30 = sub_10001B200();
  if (os_log_type_enabled(v29, v30))
  {
    id v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Found Single Home", v31, 2u);
    swift_slowDealloc();
  }
  uint64_t v32 = *(void *)(v0 + 96);
  uint64_t v33 = *(void *)(v0 + 56);
  uint64_t v34 = *(void **)(v0 + 40);

  v19(v32, v33);
  id v35 = [v34 recipients];
  if (v35)
  {
    char v36 = v35;
    sub_1000096DC(0, (unint64_t *)&qword_100025A00);
    uint64_t v37 = (id *)sub_10001B170();
  }
  else
  {
    id v97 = _swiftEmptyArrayStorage;
    sub_10001B350();
    id v52 = objc_allocWithZone((Class)INSpeakableString);
    swift_bridgeObjectRetain();
    NSString v53 = sub_10001B0E0();
    id v54 = [v52 initWithSpokenPhrase:v53];

    LOWORD(v89) = 0;
    objc_msgSend(objc_allocWithZone((Class)INHomeFilter), "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", 0, 0, 1, 37, 0, 37, v54, 0, 0, 0, v89);

    swift_bridgeObjectRelease();
    sub_10001B330();
    sub_10001B360();
    sub_10001B370();
    sub_10001B340();
    uint64_t v37 = v97;
  }
  swift_bridgeObjectRelease();
  sub_10000E778(*(void *)(v0 + 88));
  swift_bridgeObjectRetain_n();
  Swift::String v55 = sub_10001B0A0();
  os_log_type_t v56 = sub_10001B200();
  BOOL v57 = os_log_type_enabled(v55, v56);
  uint64_t v58 = *(void *)(v0 + 88);
  uint64_t v59 = *(void *)(v0 + 56);
  Swift::String v60 = v37;
  id v96 = v37;
  if (v57)
  {
    Swift::String v61 = (uint8_t *)swift_slowAlloc();
    id v97 = (id *)swift_slowAlloc();
    *(_DWORD *)Swift::String v61 = 136315138;
    sub_1000096DC(0, (unint64_t *)&qword_100025A00);
    Swift::String v62 = v19;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_10001B180();
    unint64_t v65 = v64;
    swift_bridgeObjectRelease();
    uint64_t *v90 = sub_100019E14(v63, v65, (uint64_t *)&v97);
    sub_10001B250();
    Swift::String v60 = v37;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v55, v56, "Resolved Recipients: %s", v61, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v62(v58, v59);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    v19(v58, v59);
  }
  if ((unint64_t)v60 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_10001B3A0();
    swift_bridgeObjectRelease();
    if (v66) {
      goto LABEL_28;
    }
LABEL_41:

    swift_bridgeObjectRelease();
    uint64_t v28 = _swiftEmptyArrayStorage;
    goto LABEL_42;
  }
  uint64_t v66 = *(void *)(((unint64_t)v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v66) {
    goto LABEL_41;
  }
LABEL_28:
  id v97 = _swiftEmptyArrayStorage;
  uint64_t result = sub_10001B350();
  if (v66 < 0)
  {
    __break(1u);
    return result;
  }
  unint64_t v68 = self;
  uint64_t v69 = 0;
  unint64_t v70 = (unint64_t)v60 & 0xC000000000000001;
  do
  {
    if (v70) {
      id v71 = (id)sub_10001B300();
    }
    else {
      id v71 = v60[v69 + 4];
    }
    os_log_type_t v72 = v71;
    ++v69;
    id v73 = [v68 successWithResolvedHomeFilter:v71];
    [objc_allocWithZone((Class)INSendAnnouncementRecipientResolutionResult) initWithHomeFilterResolutionResult:v73];

    sub_10001B330();
    sub_10001B360();
    sub_10001B370();
    sub_10001B340();
    Swift::String v60 = v96;
  }
  while (v66 != v69);
  uint64_t v28 = v97;

  swift_bridgeObjectRelease();
  uint64_t v0 = v93;
LABEL_42:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v88 = *(uint64_t (**)(id *))(v0 + 8);
  return v88(v28);
}

uint64_t sub_100013774(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100013838;
  return sub_100010E90((uint64_t)v6);
}

uint64_t sub_100013838()
{
  id v1 = *(void (***)(void, void))(*v0 + 32);
  uint64_t v2 = *(void **)(*v0 + 24);
  unint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v7 = *v0;
  swift_task_dealloc();

  sub_1000096DC(0, &qword_100025A40);
  Class isa = sub_10001B160().super.isa;
  swift_bridgeObjectRelease();
  ((void (**)(void, Class))v1)[2](v1, isa);

  _Block_release(v1);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_1000139CC(uint64_t a1)
{
  v2[47] = a1;
  v2[48] = v1;
  uint64_t v3 = sub_10001B080();
  v2[49] = v3;
  v2[50] = *(void *)(v3 - 8);
  v2[51] = swift_task_alloc();
  v2[52] = swift_task_alloc();
  sub_100005EF8((uint64_t *)&unk_1000256A0);
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  v2[56] = sub_100005EF8((uint64_t *)&unk_1000259F0);
  v2[57] = swift_task_alloc();
  v2[58] = swift_task_alloc();
  v2[59] = swift_task_alloc();
  v2[60] = swift_task_alloc();
  uint64_t v4 = sub_10001B040();
  v2[61] = v4;
  v2[62] = *(void *)(v4 - 8);
  v2[63] = swift_task_alloc();
  uint64_t v5 = sub_10001B0B0();
  v2[64] = v5;
  v2[65] = *(void *)(v5 - 8);
  v2[66] = swift_task_alloc();
  v2[67] = swift_task_alloc();
  v2[68] = swift_task_alloc();
  v2[69] = swift_task_alloc();
  v2[70] = swift_task_alloc();
  v2[71] = swift_task_alloc();
  v2[72] = swift_task_alloc();
  v2[73] = swift_task_alloc();
  v2[74] = swift_task_alloc();
  v2[75] = swift_task_alloc();
  v2[76] = swift_task_alloc();
  v2[77] = swift_task_alloc();
  v2[78] = swift_task_alloc();
  v2[79] = swift_task_alloc();
  return _swift_task_switch(sub_100013C9C, 0, 0);
}

uint64_t sub_100013C9C()
{
  uint64_t v40 = v0;
  uint64_t v1 = *(void **)(v0 + 376);
  sub_10000E778(*(void *)(v0 + 632));
  id v2 = v1;
  uint64_t v3 = sub_10001B0A0();
  os_log_type_t v4 = sub_10001B200();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void *)(v0 + 520);
    uint64_t v35 = *(void *)(v0 + 512);
    uint64_t v36 = *(void *)(v0 + 632);
    id v6 = *(void **)(v0 + 376);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v8 = sub_1000105A4();
    *(void *)(v0 + 352) = sub_100019E14(v8, v9, &v39);
    sub_10001B250();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Received Send Announcement Intent: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    BOOL v10 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v10(v36, v35);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 632);
    uint64_t v12 = *(void *)(v0 + 520);
    uint64_t v13 = *(void *)(v0 + 512);
    uint64_t v14 = *(void **)(v0 + 376);

    BOOL v10 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v10(v11, v13);
  }
  *(void *)(v0 + 640) = v10;
  id v15 = [*(id *)(v0 + 376) announcement];
  if (!v15)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 496) + 56))(*(void *)(v0 + 480), 1, 1, *(void *)(v0 + 488));
LABEL_10:
    uint64_t v25 = *(void *)(v0 + 536);
    sub_10000E34C(*(void *)(v0 + 480), (uint64_t *)&unk_1000259F0);
    sub_10000E778(v25);
    uint64_t v26 = sub_10001B0A0();
    os_log_type_t v27 = sub_10001B1F0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "No speech data URL", v28, 2u);
      swift_slowDealloc();
    }
    uint64_t v29 = *(void *)(v0 + 536);
    uint64_t v30 = *(void *)(v0 + 512);

    v10(v29, v30);
    id v37 = [objc_allocWithZone((Class)INSendAnnouncementIntentResponse) initWithCode:4 userActivity:0];
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
    id v31 = *(uint64_t (**)(id))(v0 + 8);
    return v31(v37);
  }
  uint64_t v16 = v15;
  id v17 = [v15 speechDataURL];

  uint64_t v18 = *(void *)(v0 + 488);
  uint64_t v19 = *(void *)(v0 + 496);
  uint64_t v20 = *(void *)(v0 + 472);
  if (v17)
  {
    sub_10001B030();

    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
    v21(v20, 0, 1, v18);
  }
  else
  {
    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
    v21(*(void *)(v0 + 472), 1, 1, v18);
  }
  *(void *)(v0 + 648) = v21;
  uint64_t v22 = *(void *)(v0 + 488);
  uint64_t v23 = *(void *)(v0 + 496);
  uint64_t v24 = *(void *)(v0 + 480);
  sub_100019254(*(void *)(v0 + 472), v24, (uint64_t *)&unk_1000259F0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v24, 1, v22) == 1) {
    goto LABEL_10;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 496) + 32))(*(void *)(v0 + 504), *(void *)(v0 + 480), *(void *)(v0 + 488));
  uint64_t v38 = (uint64_t (*)(uint64_t))((char *)&dword_1000255E0 + dword_1000255E0);
  uint64_t v33 = (void *)swift_task_alloc();
  *(void *)(v0 + 656) = v33;
  *uint64_t v33 = v0;
  v33[1] = sub_10001423C;
  uint64_t v34 = *(void *)(v0 + 504);
  return v38(v34);
}

uint64_t sub_10001423C(double a1)
{
  uint64_t v3 = *v2;
  *(double *)(v3 + 664) = a1;
  *(void *)(v3 + 672) = v1;
  swift_task_dealloc();
  if (v1) {
    os_log_type_t v4 = sub_100015F8C;
  }
  else {
    os_log_type_t v4 = sub_100014354;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100014354()
{
  uint64_t v235 = v0;
  uint64_t v1 = *(void **)(v0 + 376);
  sub_10000E778(*(void *)(v0 + 624));
  id v2 = v1;
  uint64_t v3 = sub_10001B0A0();
  os_log_type_t v4 = sub_10001B200();
  v228 = (id *)(v0 + 376);
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void **)(v0 + 376);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v234 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    id v7 = [v5 announcement];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = [v7 speechDataURL];

      if (v9)
      {
        sub_10001B030();

        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v10 = 1;
      }
      uint64_t v16 = *(void *)(v0 + 456);
      uint64_t v15 = *(void *)(v0 + 464);
      (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 648))(v16, v10, 1, *(void *)(v0 + 488));
      sub_100019254(v16, v15, (uint64_t *)&unk_1000259F0);
    }
    else
    {
      (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 648))(*(void *)(v0 + 464), 1, 1, *(void *)(v0 + 488));
    }
    uint64_t v223 = *(void *)(v0 + 624);
    v224 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v17 = *(void *)(v0 + 512);
    uint64_t v18 = *(void **)(v0 + 376);
    uint64_t v19 = sub_10001B100();
    *(void *)(v0 + 368) = sub_100019E14(v19, v20, &v234);
    sub_10001B250();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Speech Data URL: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v224(v223, v17);
  }
  else
  {
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v12 = *(void *)(v0 + 624);
    uint64_t v13 = *(void *)(v0 + 512);
    uint64_t v14 = *(void **)(v0 + 376);

    v11(v12, v13);
  }
  sub_10000E778(*(void *)(v0 + 608));
  uint64_t v21 = sub_10001B0A0();
  os_log_type_t v22 = sub_10001B200();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = *(void *)(v0 + 664);
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 134217984;
    *(void *)(v0 + 360) = v23;
    sub_10001B250();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Speech Data Length: %f", v24, 0xCu);
    swift_slowDealloc();
  }
  uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
  uint64_t v26 = *(void *)(v0 + 608);
  uint64_t v27 = *(void *)(v0 + 600);
  uint64_t v28 = *(void *)(v0 + 520);
  uint64_t v29 = *(void *)(v0 + 512);
  uint64_t v30 = *(void **)(v0 + 376);

  *(void *)(v0 + 680) = (v28 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v25(v26, v29);
  sub_10000E778(v27);
  id v31 = v30;
  uint64_t v32 = sub_10001B0A0();
  os_log_type_t v33 = sub_10001B200();
  BOOL v34 = os_log_type_enabled(v32, v33);
  uint64_t v35 = *(void **)(v0 + 376);
  if (!v34)
  {

    uint64_t v38 = (id *)(v0 + 376);
    id v43 = *v228;
    uint64_t v32 = *v228;
    goto LABEL_21;
  }
  uint64_t v36 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)uint64_t v36 = 67109120;
  id v37 = [v35 announcement];
  uint64_t v38 = (id *)(v0 + 376);
  id v39 = *v228;
  if (v37)
  {
    uint64_t v40 = v37;
    id v41 = [v37 speechDataTranscription];

    if (!v41)
    {
      int v42 = 0;
      uint64_t v38 = (id *)(v0 + 376);
      goto LABEL_20;
    }
    int v42 = 1;
    id v39 = v41;
    uint64_t v38 = (id *)(v0 + 376);
  }
  else
  {
    int v42 = 0;
  }

LABEL_20:
  os_log_type_t v44 = *(void **)(v0 + 376);
  *(_DWORD *)(v0 + 728) = v42;
  sub_10001B250();

  _os_log_impl((void *)&_mh_execute_header, v32, v33, "Transcription: %{BOOL}d", v36, 8u);
  swift_slowDealloc();
  id v43 = *(id *)(v0 + 376);
LABEL_21:
  uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
  uint64_t v46 = *(void *)(v0 + 600);
  uint64_t v47 = *(void *)(v0 + 512);

  v45(v46, v47);
  sub_10001B020(v48);
  uint64_t v50 = v49;
  id v51 = [self contentWithAudioFileURL:v49];
  *(void *)(v0 + 688) = v51;

  id v52 = [v43 announcement];
  NSString v53 = v52;
  if (v52)
  {
    id v54 = [v52 speechDataTranscription];

    if (v54)
    {
      sub_10001B0F0();

      NSString v53 = sub_10001B0E0();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v53 = 0;
    }
  }
  id v55 = *v38;
  [v51 setTranscription:v53];

  id v56 = [v55 _metadata];
  if (v56)
  {
    BOOL v57 = v56;
    id v58 = [v56 endpointId];

    if (v58)
    {
      uint64_t v59 = *(void *)(v0 + 440);
      uint64_t v60 = *(void *)(v0 + 392);
      uint64_t v61 = *(void *)(v0 + 400);
      sub_10001B0F0();

      sub_10001B050();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v59, 1, v60) == 1)
      {
        Class isa = 0;
      }
      else
      {
        uint64_t v63 = *(void *)(v0 + 440);
        uint64_t v64 = *(void *)(v0 + 392);
        uint64_t v65 = *(void *)(v0 + 400);
        Class isa = sub_10001B060().super.isa;
        (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v63, v64);
      }
      [v51 setEndpointIdentifier:isa];
    }
  }
  id v66 = [*v38 sharedUserID];
  if (v66)
  {
    id v67 = v66;
    sub_10001B0F0();
  }
  id v68 = [v51 endpointIdentifier];
  uint64_t v69 = *(void *)(v0 + 424);
  uint64_t v70 = *(void *)(v0 + 392);
  uint64_t v71 = *(void *)(v0 + 400);
  if (v68)
  {
    os_log_type_t v72 = v68;
    sub_10001B070();

    id v73 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 56);
    v73(v69, 0, 1, v70);
  }
  else
  {
    id v73 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 56);
    v73(*(void *)(v0 + 424), 1, 1, v70);
  }
  if (qword_1000252F0 != -1) {
    swift_once();
  }
  sub_1000068D0(*(void *)(v0 + 512), (uint64_t)qword_100025EA0);
  uint64_t v74 = sub_10001B0A0();
  os_log_type_t v75 = sub_10001B200();
  if (os_log_type_enabled(v74, v75))
  {
    uint64_t v76 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v76 = 0;
    _os_log_impl((void *)&_mh_execute_header, v74, v75, "Skipping MU Check", v76, 2u);
    swift_slowDealloc();
  }
  uint64_t v78 = *(void *)(v0 + 424);
  uint64_t v77 = *(void *)(v0 + 432);
  uint64_t v79 = *(void *)(v0 + 392);
  uint64_t v80 = *(void *)(v0 + 400);

  v73(v77, 1, 1, v79);
  swift_bridgeObjectRelease();
  sub_10000E34C(v78, (uint64_t *)&unk_1000256A0);
  id v226 = v51;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v80 + 48))(v77, 1, v79) == 1)
  {
    sub_10000E34C(*(void *)(v0 + 432), (uint64_t *)&unk_1000256A0);
  }
  else
  {
    uint64_t v81 = *(void *)(v0 + 592);
    uint64_t v83 = *(void *)(v0 + 408);
    uint64_t v82 = *(void *)(v0 + 416);
    uint64_t v84 = *(void *)(v0 + 392);
    uint64_t v85 = *(void *)(v0 + 400);
    (*(void (**)(uint64_t, void, uint64_t))(v85 + 32))(v82, *(void *)(v0 + 432), v84);
    sub_10000E778(v81);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v85 + 16))(v83, v82, v84);
    uint64_t v86 = sub_10001B0A0();
    os_log_type_t v87 = sub_10001B200();
    BOOL v88 = os_log_type_enabled(v86, v87);
    uint64_t v89 = *(void (**)(void, uint64_t))(v0 + 640);
    uint64_t v218 = *(void *)(v0 + 512);
    *(void *)os_log_type_t type = *(void *)(v0 + 592);
    uint64_t v91 = *(void *)(v0 + 400);
    uint64_t v90 = *(void *)(v0 + 408);
    uint64_t v92 = *(void *)(v0 + 392);
    if (v88)
    {
      uint64_t v93 = (uint8_t *)swift_slowAlloc();
      uint64_t v234 = swift_slowAlloc();
      *(_DWORD *)uint64_t v93 = 136315138;
      sub_100019074();
      uint64_t v94 = sub_10001B3F0();
      *(void *)(v0 + 344) = sub_100019E14(v94, v95, &v234);
      sub_10001B250();
      swift_bridgeObjectRelease();
      id v96 = *(void (**)(uint64_t, uint64_t))(v91 + 8);
      v96(v90, v92);
      _os_log_impl((void *)&_mh_execute_header, v86, v87, "MU HMUser ID: %s", v93, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      id v96 = *(void (**)(uint64_t, uint64_t))(v91 + 8);
      v96(*(void *)(v0 + 408), *(void *)(v0 + 392));
    }

    v89(*(void *)type, v218);
    uint64_t v97 = *(void *)(v0 + 416);
    uint64_t v98 = *(void *)(v0 + 392);
    Class v99 = sub_10001B060().super.isa;
    id v51 = v226;
    [v226 setHomeKitUserIdentifier:v99];

    v96(v97, v98);
  }
  id v100 = [*v228 isReply];
  if (v100)
  {
    uint64_t v101 = v100;
    unsigned int v102 = [v100 BOOLValue];

    if (v102)
    {
      id v103 = [*v228 recipients];
      if (v103)
      {
        uint64_t v104 = v103;
        sub_1000096DC(0, (unint64_t *)&qword_100025A00);
        unint64_t v105 = sub_10001B170();

        uint64_t v106 = (void *)sub_10000E420(v105);
        swift_bridgeObjectRelease();
        id v107 = [v106 homeName];
        sub_10001B0F0();

        id v108 = [v106 zoneNames];
        sub_10001B170();

        id v109 = [v106 roomNames];
        sub_10001B170();

        NSString v110 = sub_10001B0E0();
        swift_bridgeObjectRelease();
        Class v111 = sub_10001B160().super.isa;
        swift_bridgeObjectRelease();
        Class v112 = sub_10001B160().super.isa;
        id v51 = v226;
        swift_bridgeObjectRelease();
        id v113 = [self destinationWithHomeName:v110 zoneNames:v111 roomNames:v112];

        goto LABEL_80;
      }
      id v142 = [*v228 announcement];
      NSString v143 = v142;
      if (v142)
      {
        id v144 = [v142 identifier];

        if (v144)
        {
          sub_10001B0F0();

          NSString v143 = sub_10001B0E0();
          swift_bridgeObjectRelease();
        }
        else
        {
          NSString v143 = 0;
        }
      }
      id v152 = *v228;
      id v113 = [self destinationWithReplyToAnnouncementIdentifier:v143];

      id v153 = [v152 announcement];
      if (v153)
      {
        v154 = v153;
        id v155 = [v153 identifier];

        if (v155)
        {
          uint64_t v156 = sub_10001B0F0();
          unint64_t v158 = v157;

          uint64_t v159 = HIBYTE(v158) & 0xF;
          if ((v158 & 0x2000000000000000) == 0) {
            uint64_t v159 = v156 & 0xFFFFFFFFFFFFLL;
          }
          if (v159)
          {
            sub_10000E778(*(void *)(v0 + 584));
            swift_bridgeObjectRetain();
            v160 = sub_10001B0A0();
            os_log_type_t v161 = sub_10001B200();
            BOOL v162 = os_log_type_enabled(v160, v161);
            v163 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
            uint64_t v164 = *(void *)(v0 + 584);
            uint64_t v165 = *(void *)(v0 + 512);
            if (v162)
            {
              uint64_t v231 = *(void *)(v0 + 512);
              v166 = (uint8_t *)swift_slowAlloc();
              uint64_t v234 = swift_slowAlloc();
              *(_DWORD *)v166 = 136315138;
              swift_bridgeObjectRetain();
              *(void *)(v0 + 336) = sub_100019E14(v156, v158, &v234);
              sub_10001B250();
              swift_bridgeObjectRelease_n();
              _os_log_impl((void *)&_mh_execute_header, v160, v161, "Sending Reply to Announcement: %s", v166, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              v163(v164, v231);
            }
            else
            {
              swift_bridgeObjectRelease_n();

              v163(v164, v165);
            }
LABEL_67:
            id v51 = v226;
            goto LABEL_80;
          }
          swift_bridgeObjectRelease();
          id v51 = v226;
        }
      }
      sub_10000E778(*(void *)(v0 + 576));
      v167 = sub_10001B0A0();
      os_log_type_t v168 = sub_10001B200();
      if (os_log_type_enabled(v167, v168))
      {
        v169 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v169 = 0;
        _os_log_impl((void *)&_mh_execute_header, v167, v168, "Sending Reply to latest Announcement", v169, 2u);
        swift_slowDealloc();
      }
      v170 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
      uint64_t v171 = *(void *)(v0 + 576);
      uint64_t v172 = *(void *)(v0 + 512);

      v170(v171, v172);
LABEL_80:
      *(void *)(v0 + 696) = v113;
      id v173 = [self requestWithContent:v51 destination:v113];
      *(void *)(v0 + 704) = v173;
      if ([v113 type])
      {
LABEL_88:
        v206 = (void *)sub_1000188E4(*(void **)(v0 + 376));
        *(void *)(v0 + 712) = v206;
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 56) = v0 + 224;
        *(void *)(v0 + 24) = sub_100016358;
        uint64_t v207 = swift_continuation_init();
        *(void *)(v0 + 80) = _NSConcreteStackBlock;
        *(void *)(v0 + 88) = 0x40000000;
        *(void *)(v0 + 96) = sub_100016CF8;
        *(void *)(v0 + 104) = &unk_100020C50;
        *(void *)(v0 + 112) = v207;
        [v206 sendRequest:v173 completion:v0 + 80];
        return _swift_continuation_await(v0 + 16);
      }
      id v174 = [v113 roomObjects];
      uint64_t v175 = sub_10001B170();

      uint64_t v176 = *(void *)(v175 + 16);
      swift_bridgeObjectRelease();
      if (v176
        || (id v177 = [v113 zoneObjects],
            uint64_t v178 = sub_10001B170(),
            v177,
            uint64_t v179 = *(void *)(v178 + 16),
            swift_bridgeObjectRelease(),
            v179))
      {
        sub_10000E778(*(void *)(v0 + 560));
        id v180 = v113;
        v181 = sub_10001B0A0();
        os_log_type_t v182 = sub_10001B200();
        BOOL v183 = os_log_type_enabled(v181, v182);
        v184 = *(void (**)(uint64_t, id))(v0 + 640);
        uint64_t v185 = *(void *)(v0 + 560);
        v186 = *(void **)(v0 + 512);
        if (v183)
        {
          os_log_type_t typeb = v182;
          uint64_t v187 = swift_slowAlloc();
          uint64_t v219 = swift_slowAlloc();
          *(_DWORD *)uint64_t v187 = 134349826;
          uint64_t v232 = v185;
          uint64_t v234 = v219;
          v225 = v184;
          id v227 = v186;
          id v188 = [v180 roomObjects];
          log = v181;
          uint64_t v189 = sub_10001B170();

          uint64_t v190 = *(void *)(v189 + 16);
          swift_bridgeObjectRelease();

          *(void *)(v0 + 288) = v190;
          sub_10001B250();

          *(_WORD *)(v187 + 12) = 2080;
          id v191 = [v180 roomObjects];
          sub_10001B170();

          uint64_t v192 = sub_10001B180();
          unint64_t v194 = v193;
          swift_bridgeObjectRelease();
          *(void *)(v0 + 296) = sub_100019E14(v192, v194, &v234);
          sub_10001B250();
          swift_bridgeObjectRelease();

          *(_WORD *)(v187 + 22) = 2050;
          id v195 = [v180 zoneObjects];
          uint64_t v196 = sub_10001B170();

          uint64_t v197 = *(void *)(v196 + 16);
          swift_bridgeObjectRelease();

          *(void *)(v0 + 304) = v197;
          sub_10001B250();

          *(_WORD *)(v187 + 32) = 2080;
          id v198 = [v180 zoneObjects];
          sub_10001B170();

          uint64_t v199 = sub_10001B180();
          unint64_t v201 = v200;
          swift_bridgeObjectRelease();
          *(void *)(v0 + 312) = sub_100019E14(v199, v201, &v234);
          sub_10001B250();
          swift_bridgeObjectRelease();

          _os_log_impl((void *)&_mh_execute_header, log, typeb, "Sending Announcement to Rooms (%{public}ld) = %s, Zones (%{public}ld) = %s ", (uint8_t *)v187, 0x2Au);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v202 = v232;
          id v203 = v227;
LABEL_85:
          v225(v202, v203);
          goto LABEL_88;
        }

        uint64_t v204 = v185;
        v205 = v186;
      }
      else
      {
        sub_10000E778(*(void *)(v0 + 552));
        id v208 = v113;
        v209 = sub_10001B0A0();
        os_log_type_t v210 = sub_10001B200();
        BOOL v211 = os_log_type_enabled(v209, v210);
        v184 = *(void (**)(uint64_t, id))(v0 + 640);
        uint64_t v212 = *(void *)(v0 + 552);
        v233 = *(void **)(v0 + 512);
        if (v211)
        {
          v225 = *(void (**)(uint64_t, id))(v0 + 640);
          v213 = (uint8_t *)swift_slowAlloc();
          uint64_t v234 = swift_slowAlloc();
          *(_DWORD *)v213 = 136315138;
          id v214 = [v208 homeObject];
          sub_10001B270();
          swift_unknownObjectRelease();
          uint64_t v215 = sub_10001B100();
          *(void *)(v0 + 328) = sub_100019E14(v215, v216, &v234);
          sub_10001B250();
          swift_bridgeObjectRelease();

          _os_log_impl((void *)&_mh_execute_header, v209, v210, "[No Room or Zone Names] Sending Announcement to %s", v213, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v202 = v212;
          id v203 = v233;
          goto LABEL_85;
        }

        uint64_t v204 = v212;
        v205 = v233;
      }
      v184(v204, v205);
      goto LABEL_88;
    }
  }
  v114 = *(void **)(v0 + 376);
  id v115 = (id)sub_1000188E4(v114);
  id v116 = [v114 recipients];
  if (v116)
  {
    uint64_t v117 = v116;
    sub_1000096DC(0, (unint64_t *)&qword_100025A00);
    unint64_t v118 = sub_10001B170();

    id v119 = (id)sub_10000E420(v118);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v119 = [objc_allocWithZone((Class)ANHomeContext) init];
  }
  id v120 = [v115 homeNamesForContext:v119];

  uint64_t v121 = sub_10001B170();
  if (*(void *)(v121 + 16) == 1)
  {
    id v122 = *v228;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v123 = [v122 recipients];
    if (v123)
    {
      v124 = v123;
      sub_1000096DC(0, (unint64_t *)&qword_100025A00);
      unint64_t v125 = sub_10001B170();

      id v126 = (id)sub_10000E420(v125);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v126 = [objc_allocWithZone((Class)ANHomeContext) init];
    }
    NSString v145 = sub_10001B0E0();
    swift_bridgeObjectRelease();
    [v126 setHomeName:v145];

    id v146 = [v126 homeName];
    sub_10001B0F0();

    id v147 = [v126 zoneNames];
    sub_10001B170();

    id v148 = [v126 roomNames];
    sub_10001B170();

    NSString v149 = sub_10001B0E0();
    swift_bridgeObjectRelease();
    Class v150 = sub_10001B160().super.isa;
    swift_bridgeObjectRelease();
    Class v151 = sub_10001B160().super.isa;
    swift_bridgeObjectRelease();
    id v113 = [self destinationWithHomeName:v149 zoneNames:v150 roomNames:v151];

    goto LABEL_67;
  }
  sub_10000E778(*(void *)(v0 + 568));
  swift_bridgeObjectRetain();
  v127 = sub_10001B0A0();
  os_log_type_t v128 = sub_10001B1F0();
  BOOL v129 = os_log_type_enabled(v127, v128);
  v130 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
  uint64_t v131 = *(void *)(v0 + 568);
  uint64_t v132 = *(void *)(v0 + 512);
  if (v129)
  {
    uint64_t v229 = *(void *)(v0 + 568);
    v133 = (uint8_t *)swift_slowAlloc();
    uint64_t v234 = swift_slowAlloc();
    *(_DWORD *)v133 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v134 = sub_10001B180();
    *(void *)typea = v132;
    unint64_t v136 = v135;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 240) = sub_100019E14(v134, v136, &v234);
    sub_10001B250();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v127, v128, "Did not find exactly one home for recipients: %s", v133, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v130(v229, *(void *)typea);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    v130(v131, v132);
  }
  uint64_t v138 = *(void *)(v0 + 496);
  uint64_t v137 = *(void *)(v0 + 504);
  uint64_t v139 = *(void *)(v0 + 488);
  id v230 = [objc_allocWithZone((Class)INSendAnnouncementIntentResponse) initWithCode:4 userActivity:0];

  (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v137, v139);
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
  v140 = *(uint64_t (**)(id))(v0 + 8);
  return v140(v230);
}

uint64_t sub_100015F8C()
{
  uint64_t v19 = v0;
  sub_10000E778(v0[77]);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_10001B0A0();
  os_log_type_t v2 = sub_10001B1F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v15 = v0[77];
    uint64_t v16 = (void (*)(uint64_t, uint64_t))v0[80];
    uint64_t v14 = v0[64];
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136446210;
    swift_getErrorValue();
    uint64_t v4 = sub_10001B450();
    v0[32] = sub_100019E14(v4, v5, &v18);
    sub_10001B250();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to retrieve duration %{public}s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v16(v15, v14);
  }
  else
  {
    uint64_t v6 = (void (*)(uint64_t, uint64_t))v0[80];
    uint64_t v7 = v0[77];
    uint64_t v8 = v0[64];
    swift_errorRelease();
    swift_errorRelease();

    v6(v7, v8);
  }
  uint64_t v10 = v0[62];
  uint64_t v9 = v0[63];
  uint64_t v11 = v0[61];
  id v17 = [objc_allocWithZone((Class)INSendAnnouncementIntentResponse) initWithCode:4 userActivity:0];
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
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
  uint64_t v12 = (uint64_t (*)(id))v0[1];
  return v12(v17);
}

uint64_t sub_100016358()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 720) = v1;
  if (v1) {
    os_log_type_t v2 = sub_1000168D0;
  }
  else {
    os_log_type_t v2 = sub_100016468;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100016468()
{
  uint64_t v34 = v0;
  uint64_t v1 = *(void *)(v0 + 544);
  os_log_type_t v2 = *(void **)(v0 + 224);

  sub_10000E778(v1);
  id v3 = v2;
  uint64_t v4 = sub_10001B0A0();
  os_log_type_t v5 = sub_10001B200();
  uint64_t v32 = v3;
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v27 = *(void *)(v0 + 544);
    uint64_t v25 = *(void *)(v0 + 512);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    id v7 = v3;
    id v8 = [v7 description];
    uint64_t v9 = sub_10001B0F0();
    unint64_t v11 = v10;

    *(void *)(v0 + 280) = sub_100019E14(v9, v11, &v33);
    sub_10001B250();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Announcement sent successfully! Result = %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v29(v27, v25);
  }
  else
  {
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 640);
    uint64_t v13 = *(void *)(v0 + 544);
    uint64_t v14 = *(void *)(v0 + 512);

    v12(v13, v14);
  }
  uint64_t v15 = *(void **)(v0 + 704);
  uint64_t v16 = *(void **)(v0 + 688);
  uint64_t v17 = *(void *)(v0 + 496);
  uint64_t v30 = *(void *)(v0 + 504);
  uint64_t v26 = *(void **)(v0 + 696);
  uint64_t v28 = *(void *)(v0 + 488);
  uint64_t v18 = *(void **)(v0 + 384);
  id v31 = [objc_allocWithZone((Class)INSendAnnouncementIntentResponse) initWithCode:3 userActivity:0];
  id v19 = [v32 destination];
  unint64_t v20 = sub_100016DB8();

  id v21 = v18;
  sub_100018DC4(v20);

  sub_1000096DC(0, (unint64_t *)&qword_100025440);
  Class isa = sub_10001B160().super.isa;
  swift_bridgeObjectRelease();
  [v31 setSentAnnouncements:isa];

  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v30, v28);
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
  uint64_t v23 = *(uint64_t (**)(id))(v0 + 8);
  return v23(v31);
}

uint64_t sub_1000168D0()
{
  uint64_t v25 = v0;
  uint64_t v1 = (void *)v0[89];
  uint64_t v2 = v0[66];
  swift_willThrow();

  swift_getErrorValue();
  uint64_t v3 = sub_10000634C(v0[26]);
  sub_10000E778(v2);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = sub_10001B0A0();
  os_log_type_t v5 = sub_10001B1F0();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v22 = (void (*)(uint64_t, uint64_t))v0[80];
    uint64_t v21 = v0[66];
    uint64_t v20 = v0[64];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446466;
    swift_getErrorValue();
    uint64_t v7 = sub_10001B450();
    v0[33] = sub_100019E14(v7, v8, &v24);
    sub_10001B250();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    *(_WORD *)(v6 + 12) = 2050;
    v0[34] = v3;
    sub_10001B250();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Send Announcement failed with error: %{public}s, Intent Response Code: %{public}ld", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v22(v21, v20);
  }
  else
  {
    uint64_t v9 = (void (*)(uint64_t, uint64_t))v0[80];
    uint64_t v10 = v0[66];
    uint64_t v11 = v0[64];
    swift_errorRelease();
    swift_errorRelease();

    v9(v10, v11);
  }
  uint64_t v12 = (void *)v0[88];
  uint64_t v13 = (void *)v0[87];
  uint64_t v14 = (void *)v0[86];
  uint64_t v16 = v0[62];
  uint64_t v15 = v0[63];
  uint64_t v17 = v0[61];
  id v23 = [objc_allocWithZone((Class)INSendAnnouncementIntentResponse) initWithCode:v3 userActivity:0];

  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
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
  uint64_t v18 = (uint64_t (*)(id))v0[1];
  return v18(v23);
}

uint64_t sub_100016CF8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100005EF8((uint64_t *)&unk_100025A20);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
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

uint64_t sub_100016DB8()
{
  uint64_t v1 = &_swiftEmptyArrayStorage;
  if ([v0 type]) {
    return (uint64_t)v1;
  }
  id v2 = [v0 homeObject];
  sub_10001B270();
  swift_unknownObjectRelease();
  if ((swift_dynamicCast() & 1) == 0) {
    return (uint64_t)v1;
  }
  id v3 = [v0 roomObjects];
  uint64_t v4 = sub_10001B170();

  uint64_t v5 = sub_100017468(v4);
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_18;
  }
  id v6 = [v0 zoneObjects];
  uint64_t v7 = sub_10001B170();

  id v8 = sub_100017468(v7);
  swift_bridgeObjectRelease();
  if (!v8)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  if (!v5[2] && !v8[2])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v15 = objc_allocWithZone((Class)INSpeakableString);
    swift_bridgeObjectRetain();
    NSString v16 = sub_10001B0E0();
    swift_bridgeObjectRelease();
    id v17 = [v15 initWithSpokenPhrase:v16];

    LOWORD(v19) = 0;
    id v18 = objc_msgSend(objc_allocWithZone((Class)INHomeFilter), "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", 0, 0, 1, 37, 0, 37, v17, 0, 0, 0, v19);
    swift_bridgeObjectRelease();

    sub_100005EF8(&qword_100025730);
    uint64_t v1 = (_OWORD *)swift_allocObject();
    v1[1] = xmmword_10001BF80;
    *((void *)v1 + 4) = [objc_allocWithZone((Class)INAnnouncementRecord) initWithOriginator:v18 identifier:0 duration:0];
    sub_10001B190();

    return (uint64_t)v1;
  }
  swift_bridgeObjectRelease();
  sub_1000096DC(0, (unint64_t *)&qword_100025A00);
  unint64_t v9 = (unint64_t)sub_100009718(0, 0, (uint64_t)v5, (uint64_t)v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!(v9 >> 62))
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10) {
      goto LABEL_9;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    return (uint64_t)v1;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_10001B3A0();
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t result = sub_10001B350();
  if ((v10 & 0x8000000000000000) == 0)
  {
    uint64_t v12 = 0;
    do
    {
      if ((v9 & 0xC000000000000001) != 0) {
        id v13 = (id)sub_10001B300();
      }
      else {
        id v13 = *(id *)(v9 + 8 * v12 + 32);
      }
      uint64_t v14 = v13;
      ++v12;
      [objc_allocWithZone((Class)INAnnouncementRecord) initWithOriginator:v13 identifier:0 duration:0];

      sub_10001B330();
      sub_10001B360();
      sub_10001B370();
      sub_10001B340();
    }
    while (v10 != v12);
    uint64_t v1 = &_swiftEmptyArrayStorage;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void sub_100017308()
{
  sub_100008804();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1000173A4(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000E3A8;
  return sub_1000139CC((uint64_t)v6);
}

void *sub_100017468(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = &_swiftEmptyArrayStorage;
  sub_1000180D0(0, v2, 0);
  id v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_100019138(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1000180D0(0, v3[2] + 1, 1);
        id v3 = v12;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_1000180D0(v5 > 1, v6 + 1, 1);
        id v3 = v12;
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

uint64_t sub_100017640(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_10001B460();
  swift_bridgeObjectRetain();
  sub_10001B110();
  Swift::Int v8 = sub_10001B470();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_10001B420() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_10001B420() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *id v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100017AD0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *id v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000177F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005EF8((uint64_t *)&unk_100025A10);
  uint64_t v3 = sub_10001B2D0();
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
                  *uint64_t v30 = -1 << v29;
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_10001B460();
      sub_10001B110();
      uint64_t result = sub_10001B470();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_100017AD0(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_1000177F0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100017C6C();
      goto LABEL_22;
    }
    sub_100017E20();
  }
  uint64_t v11 = *v4;
  sub_10001B460();
  sub_10001B110();
  uint64_t result = sub_10001B470();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_10001B420(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_10001B430();
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
          uint64_t result = sub_10001B420();
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

void *sub_100017C6C()
{
  uint64_t v1 = v0;
  sub_100005EF8((uint64_t *)&unk_100025A10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001B2C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_100017E20()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005EF8((uint64_t *)&unk_100025A10);
  uint64_t v3 = sub_10001B2D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_10001B460();
    swift_bridgeObjectRetain();
    sub_10001B110();
    uint64_t result = sub_10001B470();
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

uint64_t sub_1000180D0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000180F0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000180F0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005EF8((uint64_t *)&unk_1000258C0);
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
  uint64_t result = sub_10001B3E0();
  __break(1u);
  return result;
}

unint64_t sub_10001825C(uint64_t a1, uint64_t a2)
{
  sub_10001B460();
  sub_10001B110();
  Swift::Int v4 = sub_10001B470();
  return sub_100018318(a1, a2, v4);
}

unint64_t sub_1000182D4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10001B290(*(void *)(v2 + 40));
  return sub_1000183FC(a1, v4);
}

unint64_t sub_100018318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10001B420() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10001B420() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000183FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000192B8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10001B2A0();
      sub_100019200((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void *sub_1000184C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100005EF8((uint64_t *)&unk_1000258C0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1000186E4((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100019130();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

void (*sub_1000185AC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10001865C(v6, a2, a3);
  return sub_100018614;
}

void sub_100018614(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_10001865C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_10001B300();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1000186DC;
  }
  __break(1u);
  return result;
}

void sub_1000186DC(id *a1)
{
}

uint64_t sub_1000186E4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
  BOOL v11 = a2;
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
    void *v11 = *v20;
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

uint64_t sub_1000188E4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005EF8((uint64_t *)&unk_1000256A0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v40 - v8;
  uint64_t v10 = sub_10001B0B0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce;
  uint64_t result = *(void *)(v1 + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce);
  if (result) {
    return result;
  }
  sub_10000E778((uint64_t)v13);
  id v16 = a1;
  int64_t v17 = sub_10001B0A0();
  int v46 = sub_10001B200();
  if (!os_log_type_enabled(v17, (os_log_type_t)v46))
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    goto LABEL_10;
  }
  os_log_t v43 = v17;
  uint64_t v18 = swift_slowAlloc();
  id v45 = v16;
  int64_t v19 = (uint8_t *)v18;
  uint64_t v41 = swift_slowAlloc();
  uint64_t v49 = v41;
  int v42 = v19;
  *(_DWORD *)int64_t v19 = 136315138;
  id v20 = [v45 _metadata];
  uint64_t v21 = v20;
  os_log_type_t v44 = v9;
  if (!v20) {
    goto LABEL_8;
  }
  id v22 = [v20 endpointId];

  if (!v22)
  {
    uint64_t v21 = 0;
LABEL_8:
    uint64_t v24 = 0;
    goto LABEL_9;
  }
  uint64_t v21 = (void *)sub_10001B0F0();
  uint64_t v24 = v23;

LABEL_9:
  char v25 = v42;
  uint64_t v47 = (uint64_t)v21;
  uint64_t v48 = v24;
  sub_100005EF8((uint64_t *)&unk_100025430);
  uint64_t v26 = sub_10001B100();
  uint64_t v47 = sub_100019E14(v26, v27, &v49);
  sub_10001B250();
  id v28 = v45;

  swift_bridgeObjectRelease();
  os_log_t v29 = v43;
  _os_log_impl((void *)&_mh_execute_header, v43, (os_log_type_t)v46, "EndpointID = %s", v25, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  id v16 = v28;
  swift_slowDealloc();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  unint64_t v9 = v44;
LABEL_10:
  id v30 = [v16 _metadata];
  if (v30
    && (id v31 = v30, v32 = [v30 endpointId], v31, v32))
  {
    sub_10001B0F0();

    sub_10001B050();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v33 = sub_10001B080();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v9, 1, 1, v33);
  }
  sub_100008EE8((uint64_t)v9, (uint64_t)v7, (uint64_t *)&unk_1000256A0);
  uint64_t v34 = sub_10001B080();
  uint64_t v35 = *(void *)(v34 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v7, 1, v34) != 1)
  {
    Class isa = sub_10001B060().super.isa;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v34);
  }
  id v37 = [objc_allocWithZone((Class)ANAnnounce) initWithEndpointIdentifier:isa];

  uint64_t v38 = *(void **)(v2 + v14);
  *(void *)(v2 + v14) = v37;

  id v39 = *(void **)(v2 + v14);
  if (v39) {
    [v39 setDelegate:v2];
  }
  sub_10000E34C((uint64_t)v9, (uint64_t *)&unk_1000256A0);
  uint64_t result = *(void *)(v2 + v14);
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t sub_100018DC4(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10001B0B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v22 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v7; uint64_t v7 = sub_10001B3A0())
  {
    v19[1] = v2;
    unint64_t v25 = a1 & 0xC000000000000001;
    uint64_t v23 = (void (**)(uint64_t, uint64_t))(v5 + 8);
    uint64_t v9 = 4;
    *(void *)&long long v8 = 138412290;
    long long v20 = v8;
    uint64_t v5 = (uint64_t)v22;
    uint64_t v21 = v4;
    uint64_t v24 = v7;
    while (1)
    {
      uint64_t v2 = v9 - 4;
      id v11 = v25 ? (id)sub_10001B300() : *(id *)(a1 + 8 * v9);
      uint64_t v12 = v11;
      uint64_t v13 = v9 - 3;
      if (__OFADD__(v2, 1)) {
        break;
      }
      sub_10000E778(v5);
      uint64_t v14 = v12;
      uint64_t v10 = sub_10001B0A0();
      os_log_type_t v15 = sub_10001B200();
      if (os_log_type_enabled(v10, v15))
      {
        uint64_t v16 = swift_slowAlloc();
        int64_t v17 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = v20;
        *(void *)(v16 + 4) = v14;
        *int64_t v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, v15, "Intent Response Announcement Record: %@", (uint8_t *)v16, 0xCu);
        sub_100005EF8(&qword_1000256C0);
        swift_arrayDestroy();
        uint64_t v4 = v21;
        swift_slowDealloc();
        uint64_t v5 = (uint64_t)v22;
        swift_slowDealloc();
      }
      else
      {

        uint64_t v10 = v14;
      }

      (*v23)(v5, v4);
      ++v9;
      if (v13 == v24) {
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_100019074()
{
  unint64_t result = qword_100025A08;
  if (!qword_100025A08)
  {
    sub_10001B080();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025A08);
  }
  return result;
}

uint64_t *sub_1000190CC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100019130()
{
  return swift_release();
}

uint64_t sub_100019138(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100019194()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000191CC(uint64_t a1)
{
  return sub_10001170C(a1);
}

uint64_t sub_1000191E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000191F8()
{
  return swift_release();
}

uint64_t sub_100019200(uint64_t a1)
{
  return a1;
}

uint64_t sub_100019254(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005EF8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000192B8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100019318()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000E3B0;
  uint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_100025A70 + dword_100025A70);
  return v6(v2, v3, v4);
}

uint64_t sub_1000193D8()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000E3B0;
  uint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_100025A80 + dword_100025A80);
  return v6(v2, v3, v4);
}

uint64_t sub_100019498()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000C8F8;
  uint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_100025AA0 + dword_100025AA0);
  return v6(v2, v3, v4);
}

uint64_t sub_10001955C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_100005EF8((uint64_t *)&unk_100025A20);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t sub_100019770(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)&dword_100025B90 + dword_100025B90);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_10000D540;
  return v10((uint64_t)v6);
}

id sub_100019884()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlayAnnouncementSoundIntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PlayAnnouncementSoundIntentHandler()
{
  return self;
}

uint64_t sub_1000198DC()
{
  _Block_release(*(const void **)(v0 + 24));
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100019924()
{
  objc_super v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000C8F8;
  id v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_100025B50 + dword_100025B50);
  return v6(v2, v3, v4);
}

uint64_t sub_1000199D8(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10000E3B0;
  return v6();
}

uint64_t sub_100019AA8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000E3B0;
  return v7();
}

uint64_t sub_100019B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001B1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10001B1D0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000E34C(a1, (uint64_t *)&unk_100025888);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10001B1C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100019D24()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100019D5C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000C8F8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100025B80 + dword_100025B80);
  return v6(a1, v4);
}

uint64_t sub_100019E14(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100019EE8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100019138((uint64_t)v12, *a3);
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
      sub_100019138((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009058((uint64_t)v12);
  return v7;
}

uint64_t sub_100019EE8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10001B260();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001A0A4(a5, a6);
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
  uint64_t v8 = sub_10001B320();
  if (!v8)
  {
    sub_10001B390();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10001B3E0();
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

uint64_t sub_10001A0A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001A13C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001A31C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001A31C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001A13C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001A2B4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10001B2F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10001B390();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10001B140();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10001B3E0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10001B390();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001A2B4(uint64_t a1, uint64_t a2)
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
  sub_100005EF8(&qword_100025B98);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001A31C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005EF8(&qword_100025B98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_10001B3E0();
  __break(1u);
  return result;
}

uint64_t sub_10001A46C(uint64_t a1)
{
  v1[22] = a1;
  sub_100005EF8((uint64_t *)&unk_1000256A0);
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  uint64_t v2 = sub_10001B0B0();
  v1[26] = v2;
  v1[27] = *(void *)(v2 - 8);
  v1[28] = swift_task_alloc();
  return _swift_task_switch(sub_10001A578, 0, 0);
}

uint64_t sub_10001A578()
{
  if (qword_1000252F8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 176);
  id v2 = (id)qword_100025EB8;
  sub_10001B0C0();
  id v3 = v1;
  uint64_t v4 = sub_10001B0A0();
  os_log_type_t v5 = sub_10001B200();
  BOOL v6 = os_log_type_enabled(v4, v5);
  int64_t v7 = *(NSObject **)(v0 + 176);
  if (v6)
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = (void *)swift_slowAlloc();
    *(_DWORD *)int64_t v8 = 138412290;
    *(void *)(v0 + 168) = v7;
    int64_t v9 = v7;
    sub_10001B250();
    *uint64_t v38 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Received Play Announcement Sound Intent: %@", v8, 0xCu);
    sub_100005EF8(&qword_1000256C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v4 = v7;
  }

  if ([*(id *)(v0 + 176) soundType] == (id)1)
  {
    uint64_t v10 = *(void *)(v0 + 200);
    size_t v11 = *(void **)(v0 + 176);
    id v12 = [objc_allocWithZone((Class)ANTonePlayerService) init];
    *(void *)(v0 + 232) = v12;
    uint64_t v13 = sub_10001B080();
    uint64_t v14 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v10, 1, 1, v13);
    id v15 = [v11 _metadata];
    if (v15)
    {
      uint64_t v16 = v15;
      id v17 = [v15 endpointId];

      if (v17)
      {
        uint64_t v19 = *(void *)(v0 + 192);
        uint64_t v18 = *(void *)(v0 + 200);
        sub_10001B0F0();

        sub_10001B050();
        swift_bridgeObjectRelease();
        sub_10000E34C(v18, (uint64_t *)&unk_1000256A0);
        sub_100006164(v19, v18);
      }
    }
    id v20 = objc_msgSend(*(id *)(v0 + 176), "audioSessionID", v38);
    uint64_t v21 = sub_10001B0A0();
    os_log_type_t v22 = sub_10001B200();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 67109120;
      *(_DWORD *)(v0 + 256) = v20;
      sub_10001B250();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Siri Audio Session ID: %u", v23, 8u);
      swift_slowDealloc();
    }
    uint64_t v24 = *(void *)(v0 + 200);
    uint64_t v25 = *(void *)(v0 + 184);

    sub_1000060FC(v24, v25);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v25, 1, v13) == 1)
    {
      Class isa = 0;
    }
    else
    {
      uint64_t v33 = *(void *)(v0 + 184);
      Class isa = sub_10001B060().super.isa;
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v33, v13);
    }
    *(void *)(v0 + 240) = isa;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_10001AB9C;
    uint64_t v34 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_10001955C;
    *(void *)(v0 + 104) = &unk_100020F18;
    *(void *)(v0 + 112) = v34;
    [v12 playTone:0 audioSessionID:v20 endpointUUID:isa completionHandler:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
  else
  {
    id v27 = *(id *)(v0 + 176);
    id v28 = sub_10001B0A0();
    os_log_type_t v29 = sub_10001B1F0();
    BOOL v30 = os_log_type_enabled(v28, v29);
    id v31 = *(void **)(v0 + 176);
    if (v30)
    {
      id v32 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v32 = 134217984;
      *(void *)(v0 + 152) = [v31 soundType];
      sub_10001B250();

      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Unsupported Sound Type: %ld", v32, 0xCu);
      swift_slowDealloc();
    }
    else
    {
    }
    id v35 = [objc_allocWithZone((Class)INPlayAnnouncementSoundIntentResponse) initWithCode:4 userActivity:0];
    (*(void (**)(void, void))(*(void *)(v0 + 216) + 8))(*(void *)(v0 + 224), *(void *)(v0 + 208));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v36 = *(uint64_t (**)(id))(v0 + 8);
    return v36(v35);
  }
}

uint64_t sub_10001AB9C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 248) = v1;
  if (v1) {
    id v2 = sub_10001ADA0;
  }
  else {
    id v2 = sub_10001ACAC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001ACAC()
{
  uint64_t v1 = *(void **)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 200);
  id v3 = [objc_allocWithZone((Class)INPlayAnnouncementSoundIntentResponse) initWithCode:3 userActivity:0];

  sub_10000E34C(v2, (uint64_t *)&unk_1000256A0);
  (*(void (**)(void, void))(*(void *)(v0 + 216) + 8))(*(void *)(v0 + 224), *(void *)(v0 + 208));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(id))(v0 + 8);
  return v4(v3);
}

uint64_t sub_10001ADA0()
{
  uint64_t v13 = v0;
  uint64_t v1 = (void *)v0[30];
  swift_willThrow();

  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_10001B0A0();
  os_log_type_t v3 = sub_10001B1F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    swift_getErrorValue();
    uint64_t v5 = sub_10001B450();
    v0[20] = sub_100019E14(v5, v6, &v12);
    sub_10001B250();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to Play Announcement Sound: %s", v4, 0xCu);
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
  int64_t v7 = (void *)v0[29];
  uint64_t v8 = v0[25];
  id v9 = [objc_allocWithZone((Class)INPlayAnnouncementSoundIntentResponse) initWithCode:3 userActivity:0];

  sub_10000E34C(v8, (uint64_t *)&unk_1000256A0);
  (*(void (**)(void, void))(v0[27] + 8))(v0[28], v0[26]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(id))v0[1];
  return v10(v9);
}

uint64_t sub_10001B010()
{
  return _convertErrorToNSError(_:)();
}

void sub_10001B020(NSURL *retstr@<X8>)
{
}

uint64_t sub_10001B030()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001B040()
{
  return type metadata accessor for URL();
}

uint64_t sub_10001B050()
{
  return UUID.init(uuidString:)();
}

NSUUID sub_10001B060()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_10001B070()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001B080()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10001B090()
{
  return static AVPartialAsyncProperty<A>.duration.getter();
}

uint64_t sub_10001B0A0()
{
  return Logger.logObject.getter();
}

uint64_t sub_10001B0B0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10001B0C0()
{
  return Logger.init(_:)();
}

uint64_t sub_10001B0D0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_10001B0E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001B0F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001B100()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10001B110()
{
  return String.hash(into:)();
}

uint64_t sub_10001B120()
{
  return String.count.getter();
}

void sub_10001B130(Swift::String a1)
{
}

Swift::Int sub_10001B140()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10001B150()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10001B160()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10001B170()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001B180()
{
  return Array.description.getter();
}

uint64_t sub_10001B190()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10001B1A0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10001B1B0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10001B1C0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10001B1D0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10001B1E0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10001B1F0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10001B200()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10001B220()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10001B230()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_10001B240()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10001B250()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10001B260()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10001B270()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_10001B290(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10001B2A0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10001B2B0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10001B2C0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10001B2D0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_10001B2E0(Swift::Int a1)
{
}

uint64_t sub_10001B2F0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10001B300()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10001B310()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10001B320()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10001B330()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10001B340()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10001B350()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10001B360()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10001B370()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10001B380()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10001B390()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001B3A0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10001B3B0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10001B3C0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10001B3D0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10001B3E0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10001B3F0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10001B400()
{
  return _getErrorEmbeddedNSError<A>(_:)();
}

uint64_t sub_10001B410()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_10001B420()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001B430()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001B440()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001B450()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10001B460()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10001B470()
{
  return Hasher._finalize()();
}

uint64_t sub_10001B480()
{
  return _typeName(_:qualified:)();
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
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

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}