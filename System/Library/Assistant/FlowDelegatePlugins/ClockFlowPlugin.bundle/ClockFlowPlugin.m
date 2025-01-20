uint64_t sub_4180(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v4 = sub_18240();
  v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_44E0(&qword_20C68);
  __chkstk_darwin();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_4524(a1, (uint64_t)v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v10 = sub_181F0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_458C(a1);
  return v10;
}

uint64_t sub_4304(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_18240();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a2, v3);
  uint64_t v7 = sub_18200();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a2, v3);
  return v7;
}

uint64_t sub_4414()
{
  sub_18220();

  return swift_deallocClassInstance();
}

uint64_t variable initialization expression of ShowClockIntentResponse.code()
{
  return 0;
}

uint64_t type metadata accessor for ShowClockCATsSimple()
{
  uint64_t result = qword_20C18;
  if (!qword_20C18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_4498()
{
  return swift_initClassMetadata2();
}

uint64_t sub_44D8()
{
  return type metadata accessor for ShowClockCATsSimple();
}

uint64_t sub_44E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_4524(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_44E0(&qword_20C68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_458C(uint64_t a1)
{
  uint64_t v2 = sub_44E0(&qword_20C68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_45EC()
{
  uint64_t v0 = sub_18400();
  sub_6220(v0, qword_20C70);
  sub_53AC(v0, (uint64_t)qword_20C70);
  return sub_18310();
}

void ShowClockIntentHandler.confirm(intent:completion:)(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3 = (char *)[objc_allocWithZone((Class)type metadata accessor for ShowClockIntentResponse()) init];
  uint64_t v4 = &v3[OBJC_IVAR___ShowClockIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v4 = 1;
  [v3 setUserActivity:0];
  a2(v3);
}

uint64_t ShowClockIntentHandler.handle(intent:completion:)(void *a1, void (*a2)(char *), uint64_t a3)
{
  v68 = a2;
  uint64_t v69 = a3;
  uint64_t v4 = sub_44E0(&qword_20C88);
  __chkstk_darwin(v4 - 8);
  v66 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_44E0(&qword_20C90);
  __chkstk_darwin(v6 - 8);
  v65 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_44E0(&qword_20C98);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_17B10();
  uint64_t v75 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  v70 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v63 - v14;
  uint64_t v16 = sub_44E0(&qword_20CA0);
  __chkstk_darwin(v16 - 8);
  v18 = (char *)&v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_17B40();
  uint64_t v19 = *(void *)(v71 - 8);
  uint64_t v20 = __chkstk_darwin(v71);
  v22 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v67 = (char *)&v63 - v23;
  uint64_t v24 = sub_17C00();
  uint64_t v72 = *(void *)(v24 - 8);
  uint64_t v73 = v24;
  __chkstk_darwin(v24);
  v26 = (char *)&v63 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_20BB0 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_18400();
  uint64_t v64 = sub_53AC(v27, (uint64_t)qword_20C70);
  v28 = sub_183F0();
  os_log_type_t v29 = sub_184B0();
  BOOL v30 = os_log_type_enabled(v28, v29);
  v74 = v26;
  if (v30)
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_0, v28, v29, "ShowClockIntentHandler.handle() is called", v31, 2u);
    swift_slowDealloc();
  }

  sub_17BD0();
  id v32 = [a1 offset];
  if (v32)
  {
    v33 = v32;
    v34 = v70;
    sub_17AD0();

    uint64_t v35 = v75;
    v36 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
    v36(v10, v34, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v10, 1, v11) != 1)
    {
      v36(v15, v10, v11);
      goto LABEL_10;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v75 + 56))(v10, 1, 1, v11);
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v72 + 56))(v65, 1, 1, v73);
  uint64_t v37 = sub_17C10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v66, 1, 1, v37);
  sub_17B00();
  sub_53E4((uint64_t)v10, &qword_20C98);
LABEL_10:
  sub_17B30();
  v38 = v74;
  sub_17BC0();
  uint64_t v39 = v19;
  v40 = *(void (**)(char *, uint64_t))(v19 + 8);
  uint64_t v41 = v71;
  v40(v22, v71);
  uint64_t v42 = v75 + 8;
  v43 = *(void (**)(char *, uint64_t))(v75 + 8);
  v43(v15, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v18, 1, v41) == 1)
  {
    sub_53E4((uint64_t)v18, &qword_20CA0);
    v44 = sub_183F0();
    os_log_type_t v45 = sub_184A0();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_0, v44, v45, "Failed to calucate the date.", v46, 2u);
      swift_slowDealloc();
    }

    v47 = (char *)[objc_allocWithZone((Class)type metadata accessor for ShowClockIntentResponse()) init];
    v48 = &v47[OBJC_IVAR___ShowClockIntentResponse_code];
    swift_beginAccess();
    *(void *)v48 = 5;
    [v47 setUserActivity:0];
    v68(v47);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v67, v18, v41);
    v49 = (char *)[objc_allocWithZone((Class)type metadata accessor for ShowClockIntentResponse()) init];
    uint64_t v75 = v42;
    v50 = &v49[OBJC_IVAR___ShowClockIntentResponse_code];
    swift_beginAccess();
    *(void *)v50 = 4;
    [v49 setUserActivity:0];
    sub_44E0(&qword_20CA8);
    uint64_t v51 = sub_17BE0();
    uint64_t v52 = *(void *)(v51 - 8);
    uint64_t v53 = v52;
    v65 = (char *)v43;
    uint64_t v54 = *(void *)(v52 + 72);
    unint64_t v55 = (*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    uint64_t v64 = v11;
    v66 = (char *)v40;
    uint64_t v56 = swift_allocObject();
    *(_OWORD *)(v56 + 16) = xmmword_18BF0;
    unint64_t v57 = v56 + v55;
    v58 = *(void (**)(unint64_t, void, uint64_t))(v53 + 104);
    v58(v57, enum case for Calendar.Component.year(_:), v51);
    v58(v57 + v54, enum case for Calendar.Component.month(_:), v51);
    v58(v57 + 2 * v54, enum case for Calendar.Component.day(_:), v51);
    v58(v57 + 3 * v54, enum case for Calendar.Component.hour(_:), v51);
    v58(v57 + 4 * v54, enum case for Calendar.Component.minute(_:), v51);
    v58(v57 + 5 * v54, enum case for Calendar.Component.second(_:), v51);
    v58(v57 + 6 * v54, enum case for Calendar.Component.weekday(_:), v51);
    v58(v57 + 7 * v54, enum case for Calendar.Component.weekOfMonth(_:), v51);
    v58(v57 + 8 * v54, enum case for Calendar.Component.weekOfYear(_:), v51);
    sub_5440(v56);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v59 = v70;
    v60 = v67;
    sub_17BA0();
    v38 = v74;
    swift_bridgeObjectRelease();
    Class isa = sub_17AC0().super.isa;
    ((void (*)(char *, uint64_t))v65)(v59, v64);
    [v49 setDateTime:isa];

    v68(v49);
    ((void (*)(char *, uint64_t))v66)(v60, v71);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v38, v73);
}

id ShowClockIntentResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id ShowClockIntentHandler.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShowClockIntentHandler();
  return objc_msgSendSuper2(&v2, "init");
}

id ShowClockIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShowClockIntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_53AC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_53E4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_44E0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_5440(uint64_t a1)
{
  uint64_t v2 = sub_17BE0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_44E0(&qword_20CD8);
    uint64_t v9 = sub_18520();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    v15 = (void (**)(char *, uint64_t))(v11 - 8);
    v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_61DC(&qword_20CE0);
      uint64_t v16 = sub_18430();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_61DC(&qword_20CE8);
          char v23 = sub_18440();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t type metadata accessor for ShowClockIntentHandler()
{
  return self;
}

uint64_t sub_5754(void *a1, uint64_t a2)
{
  uint64_t v67 = a2;
  uint64_t v3 = sub_44E0(&qword_20C88);
  __chkstk_darwin(v3 - 8);
  v65 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_44E0(&qword_20C90);
  __chkstk_darwin(v5 - 8);
  uint64_t v64 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_44E0(&qword_20C98);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_17B10();
  uint64_t v73 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  v68 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v63 - v13;
  uint64_t v15 = sub_44E0(&qword_20CA0);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_17B40();
  uint64_t v18 = *(void *)(v69 - 8);
  uint64_t v19 = __chkstk_darwin(v69);
  uint64_t v21 = (char *)&v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v66 = (char *)&v63 - v22;
  uint64_t v23 = sub_17C00();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v70 = v23;
  uint64_t v71 = v24;
  __chkstk_darwin(v23);
  v26 = (char *)&v63 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_20BB0 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_18400();
  uint64_t v63 = sub_53AC(v27, (uint64_t)qword_20C70);
  BOOL v28 = sub_183F0();
  os_log_type_t v29 = sub_184B0();
  BOOL v30 = os_log_type_enabled(v28, v29);
  uint64_t v72 = v26;
  if (v30)
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_0, v28, v29, "ShowClockIntentHandler.handle() is called", v31, 2u);
    swift_slowDealloc();
  }

  sub_17BD0();
  id v32 = [a1 offset];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = v68;
    sub_17AD0();

    uint64_t v35 = v73;
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v73 + 32);
    v36(v9, v34, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v9, 0, 1, v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v9, 1, v10) != 1)
    {
      v36(v14, v9, v10);
      goto LABEL_10;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v73 + 56))(v9, 1, 1, v10);
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v71 + 56))(v64, 1, 1, v70);
  uint64_t v37 = sub_17C10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v65, 1, 1, v37);
  sub_17B00();
  sub_53E4((uint64_t)v9, &qword_20C98);
LABEL_10:
  sub_17B30();
  v38 = v72;
  sub_17BC0();
  uint64_t v39 = v18;
  v40 = *(void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v41 = v69;
  v40(v21, v69);
  uint64_t v43 = v73 + 8;
  uint64_t v42 = *(void (**)(char *, uint64_t))(v73 + 8);
  v42(v14, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v17, 1, v41) == 1)
  {
    sub_53E4((uint64_t)v17, &qword_20CA0);
    v44 = sub_183F0();
    os_log_type_t v45 = sub_184A0();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_0, v44, v45, "Failed to calucate the date.", v46, 2u);
      swift_slowDealloc();
    }

    v47 = (char *)[objc_allocWithZone((Class)type metadata accessor for ShowClockIntentResponse()) init];
    v48 = &v47[OBJC_IVAR___ShowClockIntentResponse_code];
    swift_beginAccess();
    *(void *)v48 = 5;
    [v47 setUserActivity:0];
    (*(void (**)(uint64_t, char *))(v67 + 16))(v67, v47);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v66, v17, v41);
    v49 = (char *)[objc_allocWithZone((Class)type metadata accessor for ShowClockIntentResponse()) init];
    uint64_t v73 = v43;
    v50 = &v49[OBJC_IVAR___ShowClockIntentResponse_code];
    swift_beginAccess();
    *(void *)v50 = 4;
    [v49 setUserActivity:0];
    sub_44E0(&qword_20CA8);
    uint64_t v51 = sub_17BE0();
    uint64_t v52 = *(void *)(v51 - 8);
    uint64_t v63 = v10;
    uint64_t v64 = (char *)v42;
    uint64_t v53 = v52;
    v65 = (char *)v40;
    uint64_t v54 = *(void *)(v52 + 72);
    unint64_t v55 = (*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    uint64_t v56 = swift_allocObject();
    *(_OWORD *)(v56 + 16) = xmmword_18BF0;
    unint64_t v57 = v56 + v55;
    v58 = *(void (**)(unint64_t, void, uint64_t))(v53 + 104);
    v58(v57, enum case for Calendar.Component.year(_:), v51);
    v58(v57 + v54, enum case for Calendar.Component.month(_:), v51);
    v58(v57 + 2 * v54, enum case for Calendar.Component.day(_:), v51);
    v58(v57 + 3 * v54, enum case for Calendar.Component.hour(_:), v51);
    v58(v57 + 4 * v54, enum case for Calendar.Component.minute(_:), v51);
    v58(v57 + 5 * v54, enum case for Calendar.Component.second(_:), v51);
    v58(v57 + 6 * v54, enum case for Calendar.Component.weekday(_:), v51);
    v58(v57 + 7 * v54, enum case for Calendar.Component.weekOfMonth(_:), v51);
    v58(v57 + 8 * v54, enum case for Calendar.Component.weekOfYear(_:), v51);
    sub_5440(v56);
    swift_setDeallocating();
    v38 = v72;
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v59 = v68;
    v60 = v66;
    sub_17BA0();
    swift_bridgeObjectRelease();
    Class isa = sub_17AC0().super.isa;
    ((void (*)(char *, uint64_t))v64)(v59, v63);
    [v49 setDateTime:isa];

    (*(void (**)(uint64_t, char *))(v67 + 16))(v67, v49);
    ((void (*)(char *, uint64_t))v65)(v60, v69);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v38, v70);
}

uint64_t sub_61DC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_17BE0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_6220(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_6284()
{
  uint64_t v0 = sub_18400();
  sub_6220(v0, qword_20D50);
  sub_53AC(v0, (uint64_t)qword_20D50);
  return sub_18310();
}

uint64_t sub_62D0(uint64_t a1)
{
  if (_s15ClockFlowPlugin0aB7FactoryV04makeB4From5parse07SiriKitB003AnyB0CSgAF5ParseO_tF_0(a1))
  {
    sub_17D60();
    return swift_release();
  }
  else
  {
    if (qword_20BB8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_18400();
    sub_53AC(v2, (uint64_t)qword_20D50);
    uint64_t v3 = sub_183F0();
    os_log_type_t v4 = sub_184A0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v3, v4, "ClockFlowPlugin unable to handle input parse", v5, 2u);
      swift_slowDealloc();
    }

    uint64_t v6 = sub_183C0();
    v8[3] = v6;
    v8[4] = (uint64_t)&protocol witness table for ABCReport;
    uint64_t v7 = sub_6790(v8);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, enum case for ABCReport.clockParseRejection(_:), v6);
    sub_18350();
    _s20HandleIntentStrategyVwxx_0((uint64_t)v8);
    return sub_17D50();
  }
}

uint64_t sub_6460()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ClockFlowPlugin()
{
  return self;
}

uint64_t sub_6494(uint64_t a1)
{
  return sub_62D0(a1);
}

void sub_64AC(uint64_t *a1@<X8>)
{
  type metadata accessor for ClockFlowPlugin();
  uint64_t v2 = swift_allocObject();
  sub_181C0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = [self bundleForClass:ObjCClassFromMetadata];
  sub_181B0();

  *a1 = v2;
}

uint64_t sub_6570(uint64_t a1, uint64_t a2)
{
  return sub_6844(&qword_20E10, a2, (void (*)(uint64_t))type metadata accessor for ClockFlowPlugin);
}

uint64_t sub_65B8(uint64_t a1)
{
  uint64_t v1 = _s15ClockFlowPlugin0aB7FactoryV04makeB4From5parse07SiriKitB003AnyB0CSgAF5ParseO_tF_0(a1);
  if (v1) {
    return v1;
  }
  if (qword_20BB8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_18400();
  sub_53AC(v3, (uint64_t)qword_20D50);
  id v4 = sub_183F0();
  os_log_type_t v5 = sub_184A0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, v4, v5, "ClockFlowPlugin unable to handle input parse", v6, 2u);
    swift_slowDealloc();
  }

  uint64_t v7 = sub_183C0();
  v10[3] = v7;
  v10[4] = (uint64_t)&protocol witness table for ABCReport;
  uint64_t v8 = sub_6790(v10);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v8, enum case for ABCReport.clockParseRejection(_:), v7);
  sub_18350();
  _s20HandleIntentStrategyVwxx_0((uint64_t)v10);
  sub_183B0();
  swift_allocObject();
  v10[0] = sub_183A0();
  sub_6844(&qword_20E18, 255, (void (*)(uint64_t))&type metadata accessor for NoOpFlow);
  uint64_t v2 = sub_17D40();
  swift_release();
  return v2;
}

uint64_t *sub_6790(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t _s20HandleIntentStrategyVwxx_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_6844(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s20HandleIntentStrategyVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s20HandleIntentStrategyVwcp(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *_s20HandleIntentStrategyVwca(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *sub_6944(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 _s20HandleIntentStrategyVwtk(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s20HandleIntentStrategyVwta(uint64_t a1, uint64_t a2)
{
  _s20HandleIntentStrategyVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t _s20HandleIntentStrategyVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s20HandleIntentStrategyVwst(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s20HandleIntentStrategyVMa()
{
  return &_s20HandleIntentStrategyVN;
}

uint64_t sub_6C64()
{
  uint64_t v0 = sub_18400();
  sub_6220(v0, qword_20E20);
  sub_53AC(v0, (uint64_t)qword_20E20);
  return sub_18310();
}

uint64_t sub_6CB0(uint64_t a1, uint64_t a2)
{
  v3[21] = a2;
  v3[22] = v2;
  v3[20] = a1;
  uint64_t v4 = sub_17F30();
  v3[23] = v4;
  v3[24] = *(void *)(v4 - 8);
  v3[25] = swift_task_alloc();
  sub_18240();
  v3[26] = swift_task_alloc();
  uint64_t v5 = sub_17E80();
  v3[27] = v5;
  v3[28] = *(void *)(v5 - 8);
  v3[29] = swift_task_alloc();
  uint64_t v6 = sub_17E00();
  v3[30] = v6;
  v3[31] = *(void *)(v6 - 8);
  v3[32] = swift_task_alloc();
  uint64_t v7 = sub_18260();
  v3[33] = v7;
  v3[34] = *(void *)(v7 - 8);
  v3[35] = swift_task_alloc();
  uint64_t v8 = sub_18300();
  v3[36] = v8;
  v3[37] = *(void *)(v8 - 8);
  v3[38] = swift_task_alloc();
  uint64_t v9 = sub_18400();
  v3[39] = v9;
  v3[40] = *(void *)(v9 - 8);
  v3[41] = swift_task_alloc();
  uint64_t v10 = sub_182A0();
  v3[42] = v10;
  v3[43] = *(void *)(v10 - 8);
  v3[44] = swift_task_alloc();
  uint64_t v11 = sub_182B0();
  v3[45] = v11;
  v3[46] = *(void *)(v11 - 8);
  v3[47] = swift_task_alloc();
  v3[48] = swift_task_alloc();
  uint64_t v12 = sub_17B40();
  v3[49] = v12;
  v3[50] = *(void *)(v12 - 8);
  v3[51] = swift_task_alloc();
  v3[52] = swift_task_alloc();
  v3[53] = swift_task_alloc();
  uint64_t v13 = sub_17BE0();
  v3[54] = v13;
  v3[55] = *(void *)(v13 - 8);
  v3[56] = swift_task_alloc();
  sub_44E0(&qword_20C88);
  v3[57] = swift_task_alloc();
  sub_44E0(&qword_20C90);
  v3[58] = swift_task_alloc();
  uint64_t v14 = sub_17B10();
  v3[59] = v14;
  v3[60] = *(void *)(v14 - 8);
  v3[61] = swift_task_alloc();
  v3[62] = swift_task_alloc();
  v3[63] = swift_task_alloc();
  uint64_t v15 = sub_17C00();
  v3[64] = v15;
  v3[65] = *(void *)(v15 - 8);
  v3[66] = swift_task_alloc();
  v3[67] = swift_task_alloc();
  v3[68] = swift_task_alloc();
  sub_44E0(&qword_20CA0);
  v3[69] = swift_task_alloc();
  v3[70] = swift_task_alloc();
  v3[71] = swift_task_alloc();
  v3[72] = swift_task_alloc();
  v3[73] = swift_task_alloc();
  v3[74] = swift_task_alloc();
  v3[75] = sub_44E0(&qword_20C98);
  v3[76] = swift_task_alloc();
  v3[77] = swift_task_alloc();
  return _swift_task_switch(sub_730C, 0, 0);
}

uint64_t sub_730C()
{
  v136 = v0;
  if (qword_20BC0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_53AC(v0[39], (uint64_t)qword_20E20);
  v0[78] = v1;
  uint64_t v2 = sub_183F0();
  os_log_type_t v3 = sub_184B0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "ShowClock.HandleIntentStrategy.makeIntentHandledResponse() called.", v4, 2u);
    swift_slowDealloc();
  }

  sub_44E0(&qword_20E90);
  v125 = (void *)sub_17F10();
  v0[79] = v125;
  uint64_t v5 = (void *)sub_17EF0();
  v0[80] = v5;
  id v6 = v5;
  uint64_t v7 = sub_183F0();
  os_log_type_t v8 = sub_184B0();
  uint64_t v126 = v1;
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v135[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    id v10 = [v6 dateTime];
    if (v10)
    {
      uint64_t v11 = v10;
      sub_17AD0();

      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = 1;
    }
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[60] + 56))(v0[77], v12, 1, v0[59]);
    uint64_t v13 = sub_18470();
    v0[19] = sub_15A3C(v13, v14, v135);
    sub_18500();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_0, v7, v8, "DateTime: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_17BD0();
  v117 = v6;
  id v15 = [v6 dateTime];
  uint64_t v16 = v0[76];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = v0[62];
    uint64_t v20 = v0[59];
    uint64_t v19 = v0[60];
    sub_17AD0();

    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32);
    v21(v16, v18, v20);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v20);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v16, 1, v20) != 1)
    {
      v21(v0[63], v0[76], v0[59]);
      goto LABEL_16;
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[60] + 56))(v0[76], 1, 1, v0[59]);
  }
  uint64_t v22 = v0[76];
  uint64_t v23 = v0[57];
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[65] + 56))(v0[58], 1, 1, v0[64]);
  uint64_t v24 = sub_17C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 1, 1, v24);
  sub_17B00();
  sub_53E4(v22, &qword_20C98);
LABEL_16:
  uint64_t v25 = v0[74];
  uint64_t v129 = v0[73];
  uint64_t v26 = v0[68];
  uint64_t v27 = v0[65];
  uint64_t v29 = v0[63];
  uint64_t v28 = v0[64];
  uint64_t v31 = v0[59];
  uint64_t v30 = v0[60];
  uint64_t v32 = v0[55];
  uint64_t v127 = v0[56];
  uint64_t v33 = v0[50];
  uint64_t v133 = v0[49];
  sub_17BB0();
  v124 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
  v124(v29, v31);
  v128 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  v128(v26, v28);
  sub_17BD0();
  unsigned int v122 = enum case for Calendar.Component.weekOfYear(_:);
  v121 = *(void (**)(uint64_t))(v32 + 104);
  v121(v127);
  uint64_t v34 = v129;
  sub_BA4C(v25, v129);
  uint64_t v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
  v0[81] = v35;
  v0[82] = (v33 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  v130 = v35;
  int v36 = v35(v34, 1, v133);
  uint64_t v37 = v0[73];
  if (v36 == 1)
  {
    sub_17B30();
    sub_53E4(v37, &qword_20CA0);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[50] + 32))(v0[53], v0[73], v0[49]);
  }
  uint64_t v119 = v0[71];
  uint64_t v120 = v0[74];
  uint64_t v38 = v0[67];
  uint64_t v39 = v0[64];
  uint64_t v41 = v0[55];
  uint64_t v40 = v0[56];
  uint64_t v42 = v0[53];
  uint64_t v43 = v0[54];
  uint64_t v45 = v0[49];
  uint64_t v44 = v0[50];
  uint64_t v116 = sub_17BF0();
  v46 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
  v0[83] = v46;
  v0[84] = (v44 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v46(v42, v45);
  v47 = v46;
  v48 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
  v41 += 8;
  v48(v40, v43);
  v128(v38, v39);
  sub_17BD0();
  sub_44E0(&qword_20CA8);
  uint64_t v49 = *(void *)(v41 + 64);
  unint64_t v50 = (*(unsigned __int8 *)(v41 + 72) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 72);
  uint64_t v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = xmmword_18CB0;
  unint64_t v52 = v51 + v50;
  ((void (*)(unint64_t, void, uint64_t))v121)(v52, enum case for Calendar.Component.calendar(_:), v43);
  ((void (*)(unint64_t, void, uint64_t))v121)(v52 + v49, enum case for Calendar.Component.yearForWeekOfYear(_:), v43);
  ((void (*)(unint64_t, void, uint64_t))v121)(v52 + 2 * v49, v122, v43);
  sub_5440(v51);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_BA4C(v120, v119);
  int v53 = v130(v119, 1, v45);
  uint64_t v54 = v0[71];
  v118 = v47;
  if (v53 == 1)
  {
    sub_17B30();
    sub_53E4(v54, &qword_20CA0);
  }
  else
  {
    (*(void (**)(void, uint64_t, void))(v0[50] + 32))(v0[52], v54, v0[49]);
  }
  uint64_t v123 = v0[74];
  uint64_t v55 = v0[70];
  uint64_t v56 = v0[66];
  uint64_t v57 = v0[64];
  uint64_t v58 = v0[61];
  uint64_t v59 = v0[59];
  uint64_t v60 = v0[52];
  uint64_t v61 = v0[49];
  sub_17BA0();
  swift_bridgeObjectRelease();
  v118(v60, v61);
  v128(v56, v57);
  sub_17AF0();
  v124(v58, v59);
  sub_18140();
  swift_allocObject();
  sub_18130();
  sub_BA4C(v123, v55);
  LODWORD(v55) = v130(v55, 1, v61);
  uint64_t v62 = v0[70];
  if (v55 == 1)
  {
    sub_53E4(v0[70], &qword_20CA0);
  }
  else
  {
    uint64_t v63 = v0[49];
    sub_17B20();
    v118(v62, v63);
  }
  sub_18120();
  swift_release();
  uint64_t v134 = sub_18110();
  v0[85] = v134;
  swift_release();
  uint64_t v64 = sub_183F0();
  os_log_type_t v65 = sub_184B0();
  if (os_log_type_enabled(v64, v65))
  {
    v66 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v66 = 0;
    _os_log_impl(&dword_0, v64, v65, "Hitting RF path for ShowClock flow.", v66, 2u);
    swift_slowDealloc();
  }
  uint64_t v68 = v0[43];
  uint64_t v67 = v0[44];
  uint64_t v70 = v0[41];
  uint64_t v69 = v0[42];
  uint64_t v71 = v0[39];
  uint64_t v72 = v0[40];

  uint64_t v73 = enum case for SiriTimeMeasurement.LogDescription.dialogPatternResponseTime(_:);
  v74 = *(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 104);
  v0[86] = v74;
  v0[87] = (v68 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v74(v67, v73, v69);
  uint64_t v75 = *(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16);
  v0[88] = v75;
  v0[89] = (v72 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v75(v70, v126, v71);
  mach_absolute_time();
  sub_182C0();
  id v76 = [v125 clockRequestType];
  if (!v76)
  {
LABEL_39:
    id v93 = v125;
    v94 = sub_183F0();
    os_log_type_t v95 = sub_184A0();
    if (os_log_type_enabled(v94, v95))
    {
      v96 = (uint8_t *)swift_slowAlloc();
      v135[0] = swift_slowAlloc();
      *(_DWORD *)v96 = 136315138;
      id v97 = [v93 clockRequestType];
      if (v97)
      {
        v98 = v97;
        uint64_t v99 = sub_18460();
        uint64_t v101 = v100;
      }
      else
      {
        uint64_t v99 = 0;
        uint64_t v101 = 0;
      }
      v0[16] = v99;
      v0[17] = v101;
      sub_44E0(&qword_20EA8);
      uint64_t v108 = sub_18470();
      v0[18] = sub_15A3C(v108, v109, v135);
      sub_18500();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_0, v94, v95, "ShowClock.HandleIntentStrategy fail to parse clockRequestType from %s", v96, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    sub_44E0(&qword_20E98);
    sub_BAB4();
    swift_allocError();
    swift_willThrow();
    swift_release();

    uint64_t v110 = v0[74];
    uint64_t v111 = v0[72];
    (*(void (**)(void, void))(v0[46] + 8))(v0[48], v0[45]);
    sub_53E4(v110, &qword_20CA0);
    sub_53E4(v111, &qword_20CA0);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v112 = (uint64_t (*)(void))v0[1];
    return v112();
  }
  v77 = v76;
  uint64_t v78 = sub_18460();
  v80 = v79;

  v81._rawValue = &off_1CE90;
  v138._countAndFlagsBits = v78;
  v138._object = v80;
  Swift::Int v82 = sub_18570(v81, v138);
  swift_bridgeObjectRelease();
  switch(v82)
  {
    case 2:
      uint64_t v102 = v0[72];
      uint64_t v103 = v0[22];
      type metadata accessor for ShowClockCATPatternsExecutor(0);
      sub_18230();
      v0[103] = sub_18170();
      v104 = (void *)swift_task_alloc();
      v0[104] = v104;
      v104[2] = v134;
      v104[3] = v116;
      v104[4] = v103;
      v104[5] = v102;
      v105 = (void *)swift_task_alloc();
      v0[105] = v105;
      void *v105 = v0;
      v105[1] = sub_9790;
      return sub_C0E8((uint64_t)sub_BB58, (uint64_t)v104);
    case 1:
      type metadata accessor for ShowClockCATPatternsExecutor(0);
      sub_18230();
      uint64_t v106 = sub_18170();
      v0[107] = v106;
      v132 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_20FD0 + dword_20FD0);
      swift_retain();
      v107 = (void *)swift_task_alloc();
      v0[108] = v107;
      void *v107 = v0;
      v107[1] = sub_99CC;
      return v132(v106, v134);
    case 0:
      uint64_t v84 = v0[37];
      uint64_t v83 = v0[38];
      uint64_t v85 = v0[36];
      sub_182F0();
      BOOL v86 = sub_182D0();
      (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v85);
      if (v86)
      {
        v87 = sub_183F0();
        os_log_type_t v88 = sub_184B0();
        if (os_log_type_enabled(v87, v88))
        {
          v89 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v89 = 0;
          _os_log_impl(&dword_0, v87, v88, "showTime flow SMART", v89, 2u);
          swift_slowDealloc();
        }

        if (qword_20BC8 != -1) {
          swift_once();
        }
        swift_retain();
        sub_44E0(&qword_20EB0);
        uint64_t v90 = swift_allocObject();
        v0[90] = v90;
        *(_OWORD *)(v90 + 16) = xmmword_18CC0;
        *(void *)(v90 + 32) = 1701669236;
        *(void *)(v90 + 40) = 0xE400000000000000;
        *(void *)(v90 + 72) = sub_18150();
        *(void *)(v90 + 48) = v134;
        v131 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:)
                                                                                   + async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
        swift_retain();
        v91 = (void *)swift_task_alloc();
        v0[91] = v91;
        void *v91 = v0;
        v91[1] = sub_85D0;
        return v131(0xD000000000000027, 0x80000000000193F0, v90);
      }
      else
      {
        uint64_t v113 = v0[21];
        type metadata accessor for ShowClockCATPatternsExecutor(0);
        sub_18230();
        v0[99] = sub_18170();
        uint64_t v114 = swift_task_alloc();
        v0[100] = v114;
        *(void *)(v114 + 16) = v134;
        *(void *)(v114 + 24) = v113;
        v115 = (void *)swift_task_alloc();
        v0[101] = v115;
        void *v115 = v0;
        v115[1] = sub_9554;
        return sub_C444((uint64_t)sub_BB64, v114);
      }
    default:
      goto LABEL_39;
  }
}

uint64_t sub_85D0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 736) = a1;
  *(void *)(v3 + 744) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_8AEC;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = sub_86FC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_86FC()
{
  uint64_t v1 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[81];
  uint64_t v2 = v0[69];
  uint64_t v3 = v0[49];
  sub_BA4C(v0[74], v2);
  if (v1(v2, 1, v3) == 1)
  {
    sub_53E4(v0[69], &qword_20CA0);
    uint64_t v4 = sub_183F0();
    os_log_type_t v5 = sub_184A0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_0, v4, v5, "Can NOT retrieve Date for showTime response.", v6, 2u);
      swift_slowDealloc();
    }
    uint64_t v7 = (void *)v0[92];
    os_log_type_t v8 = (void *)v0[80];
    uint64_t v9 = (void *)v0[79];

    sub_44E0(&qword_20E98);
    sub_BAB4();
    swift_allocError();
    swift_willThrow();

    swift_release();
    uint64_t v10 = v0[74];
    uint64_t v11 = v0[72];
    (*(void (**)(void, void))(v0[46] + 8))(v0[48], v0[45]);
    sub_53E4(v10, &qword_20CA0);
    sub_53E4(v11, &qword_20CA0);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
  else
  {
    (*(void (**)(void, void, void))(v0[50] + 32))(v0[51], v0[69], v0[49]);
    unint64_t v14 = (void *)swift_task_alloc();
    v0[94] = v14;
    *unint64_t v14 = v0;
    v14[1] = sub_8D64;
    uint64_t v15 = v0[85];
    uint64_t v16 = v0[51];
    uint64_t v17 = v0[35];
    return sub_EB4C(v17, v16, v15);
  }
}

uint64_t sub_8AEC()
{
  uint64_t v1 = (void *)v0[80];
  uint64_t v2 = (void *)v0[79];
  swift_bridgeObjectRelease();
  swift_release_n();

  uint64_t v3 = v0[74];
  uint64_t v4 = v0[72];
  (*(void (**)(void, void))(v0[46] + 8))(v0[48], v0[45]);
  sub_53E4(v3, &qword_20CA0);
  sub_53E4(v4, &qword_20CA0);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_8D64()
{
  *(void *)(*(void *)v1 + 760) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_A23C;
  }
  else {
    uint64_t v2 = sub_8E78;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_8E78()
{
  uint64_t v16 = (void (*)(uint64_t, void, uint64_t))v0[86];
  uint64_t v17 = v0[78];
  uint64_t v18 = (void (*)(uint64_t, uint64_t, uint64_t))v0[88];
  uint64_t v1 = v0[44];
  uint64_t v2 = v0[41];
  uint64_t v3 = v0[42];
  uint64_t v4 = v0[39];
  uint64_t v5 = v0[34];
  uint64_t v6 = v0[35];
  uint64_t v7 = v0[33];
  sub_17DF0();
  sub_17E70();
  uint64_t v8 = sub_18270();
  v0[5] = v8;
  v0[6] = sub_BB6C();
  uint64_t v9 = sub_6790(v0 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 16))(v9, v6, v7);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, enum case for SiriClockSnippetModels.timeView(_:), v8);
  v16(v1, enum case for SiriTimeMeasurement.LogDescription.dialogResponseTime(_:), v3);
  v18(v2, v17, v4);
  mach_absolute_time();
  sub_182C0();
  uint64_t v10 = (void *)swift_task_alloc();
  v0[96] = (uint64_t)v10;
  void *v10 = v0;
  v10[1] = sub_906C;
  uint64_t v11 = v0[47];
  uint64_t v12 = v0[32];
  uint64_t v13 = v0[29];
  uint64_t v14 = v0[20];
  return DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)(v14, v12, v13, v0 + 2, v11, 0, 0, 0);
}

uint64_t sub_906C()
{
  uint64_t v1 = *v0;
  uint64_t v13 = *v0 + 16;
  uint64_t v2 = *(void *)(*v0 + 376);
  uint64_t v3 = *(void *)(*v0 + 368);
  uint64_t v4 = *(void *)(*v0 + 360);
  uint64_t v12 = *(void *)(*v0 + 256);
  uint64_t v5 = *(void *)(*v0 + 248);
  uint64_t v6 = *(void *)(*v0 + 240);
  uint64_t v7 = *(void *)(*v0 + 232);
  uint64_t v8 = *(void *)(*v0 + 224);
  uint64_t v9 = *(void *)(*v0 + 216);
  swift_task_dealloc();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v1 + 776) = v10;
  *(void *)(v1 + 784) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v10(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v12, v6);
  sub_53E4(v13, &qword_20EC0);
  return _swift_task_switch(sub_92B0, 0, 0);
}

uint64_t sub_92B0()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 664);
  uint64_t v2 = *(void **)(v0 + 640);
  uint64_t v3 = *(void **)(v0 + 632);
  uint64_t v4 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 392);
  uint64_t v7 = *(void *)(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 280);
  uint64_t v8 = *(void *)(v0 + 264);

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  v1(v4, v5);
  uint64_t v9 = *(void *)(v0 + 592);
  uint64_t v10 = *(void *)(v0 + 576);
  (*(void (**)(void, void))(v0 + 776))(*(void *)(v0 + 384), *(void *)(v0 + 360));
  sub_53E4(v9, &qword_20CA0);
  sub_53E4(v10, &qword_20CA0);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_9554(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[7] = v2;
  v3[8] = a1;
  v3[9] = v1;
  v3[102] = v1;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_A4CC;
  }
  else {
    uint64_t v4 = sub_96AC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_96AC()
{
  v0[110] = v0[8];
  sub_17DF0();
  sub_17F20();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[111] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_9E70;
  uint64_t v2 = v0[48];
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[20];
  return PatternExecutionResult.generatePatternOutput(manifest:measure:)(v4, v3, v2);
}

uint64_t sub_9790(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[10] = v2;
  v3[11] = a1;
  v3[12] = v1;
  v3[106] = v1;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_A734;
  }
  else {
    uint64_t v4 = sub_98E8;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_98E8()
{
  v0[110] = v0[11];
  sub_17DF0();
  sub_17F20();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[111] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_9E70;
  uint64_t v2 = v0[48];
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[20];
  return PatternExecutionResult.generatePatternOutput(manifest:measure:)(v4, v3, v2);
}

uint64_t sub_99CC(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[13] = v2;
  v3[14] = a1;
  v3[15] = v1;
  v3[109] = v1;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v1) {
    uint64_t v4 = sub_9C08;
  }
  else {
    uint64_t v4 = sub_9B24;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_9B24()
{
  v0[110] = v0[14];
  sub_17DF0();
  sub_17F20();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[111] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_9E70;
  uint64_t v2 = v0[48];
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[20];
  return PatternExecutionResult.generatePatternOutput(manifest:measure:)(v4, v3, v2);
}

uint64_t sub_9C08()
{
  uint64_t v1 = (void *)v0[80];
  uint64_t v2 = (void *)v0[79];
  swift_release();

  uint64_t v3 = v0[74];
  uint64_t v4 = v0[72];
  (*(void (**)(void, void))(v0[46] + 8))(v0[48], v0[45]);
  sub_53E4(v3, &qword_20CA0);
  sub_53E4(v4, &qword_20CA0);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_9E70()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 896) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[24] + 8))(v2[25], v2[23]);
  if (v0) {
    uint64_t v3 = sub_A99C;
  }
  else {
    uint64_t v3 = sub_9FD8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_9FD8()
{
  uint64_t v1 = (void *)v0[110];
  uint64_t v2 = (void *)v0[80];
  uint64_t v3 = (void *)v0[79];
  uint64_t v4 = v0[46];
  swift_release();

  uint64_t v5 = v0[74];
  uint64_t v6 = v0[72];
  (*(void (**)(void, void))(v4 + 8))(v0[48], v0[45]);
  sub_53E4(v5, &qword_20CA0);
  sub_53E4(v6, &qword_20CA0);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_A23C()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 664);
  uint64_t v2 = *(void **)(v0 + 640);
  uint64_t v3 = *(void **)(v0 + 632);
  uint64_t v4 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 392);

  swift_release();
  v1(v4, v5);
  uint64_t v6 = *(void *)(v0 + 592);
  uint64_t v7 = *(void *)(v0 + 576);
  (*(void (**)(void, void))(*(void *)(v0 + 368) + 8))(*(void *)(v0 + 384), *(void *)(v0 + 360));
  sub_53E4(v6, &qword_20CA0);
  sub_53E4(v7, &qword_20CA0);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_A4CC()
{
  uint64_t v1 = (void *)v0[80];
  uint64_t v2 = (void *)v0[79];
  swift_release();

  uint64_t v3 = v0[74];
  uint64_t v4 = v0[72];
  (*(void (**)(void, void))(v0[46] + 8))(v0[48], v0[45]);
  sub_53E4(v3, &qword_20CA0);
  sub_53E4(v4, &qword_20CA0);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_A734()
{
  uint64_t v1 = (void *)v0[80];
  uint64_t v2 = (void *)v0[79];
  swift_release();

  uint64_t v3 = v0[74];
  uint64_t v4 = v0[72];
  (*(void (**)(void, void))(v0[46] + 8))(v0[48], v0[45]);
  sub_53E4(v3, &qword_20CA0);
  sub_53E4(v4, &qword_20CA0);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_A99C()
{
  uint64_t v1 = (void *)v0[110];
  uint64_t v2 = (void *)v0[80];
  uint64_t v3 = (void *)v0[79];
  swift_release();

  uint64_t v4 = v0[74];
  uint64_t v5 = v0[72];
  (*(void (**)(void, void))(v0[46] + 8))(v0[48], v0[45]);
  sub_53E4(v4, &qword_20CA0);
  sub_53E4(v5, &qword_20CA0);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_AC0C(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_18340();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_44E0(&qword_20EC8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ShowClockIntentHandledResponseShowTimeParameters(0);
  uint64_t v12 = *(int *)(v11 + 24);
  swift_retain();
  swift_release();
  *(uint64_t *)((char *)a1 + v12) = a2;
  sub_181A0();
  sub_44E0(&qword_20E90);
  sub_17F00();
  uint64_t v13 = sub_18190();
  swift_release();
  *a1 = v13;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for PunchOutApp.clock(_:), v4);
  sub_18320();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_BBC4((uint64_t)v10, (uint64_t)a1 + *(int *)(v11 + 20));
}

uint64_t sub_ADD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_44E0(&qword_20CA0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  swift_release();
  *(void *)a1 = a2;
  *(double *)(a1 + 16) = (double)a3;
  *(unsigned char *)(a1 + 24) = 0;
  id v12 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v13 = sub_18450();
  id v14 = [v12 initWithSuiteName:v13];

  if (v14)
  {
    NSString v15 = sub_18450();
    unsigned __int8 v16 = [v14 BOOLForKey:v15];
  }
  else
  {
    unsigned __int8 v16 = 0;
  }
  *(unsigned char *)(a1 + 25) = v16;
  sub_18140();
  swift_allocObject();
  sub_18130();
  sub_BA4C(a5, (uint64_t)v11);
  uint64_t v17 = sub_17B40();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1, v17) == 1)
  {
    sub_53E4((uint64_t)v11, &qword_20CA0);
  }
  else
  {
    sub_17B20();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v17);
  }
  sub_18120();
  swift_release();
  uint64_t v19 = sub_18110();
  swift_release();
  uint64_t result = swift_release();
  *(void *)(a1 + 8) = v19;
  return result;
}

uint64_t sub_B03C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_BC3C;
  return HandleIntentFlowStrategyAsync.makePromptForDeviceUnlock(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_B100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_BC3C;
  return HandleIntentFlowStrategyAsync.makeHandoffForAuthenticationResponse(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_B1C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_BC3C;
  return HandleIntentFlowStrategyAsync.makePreHandleIntentOutput(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_B288(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_B330;
  return sub_6CB0(a1, a2);
}

uint64_t sub_B330()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_B464, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_B464()
{
  v0[3] = v0[5];
  sub_44E0(&qword_20E88);
  sub_18360();
  swift_willThrow();
  swift_errorRelease();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_B524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_BC3C;
  return HandleIntentFlowStrategyAsync.makeContinueInAppResponse(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_B5E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_BC3C;
  return HandleIntentFlowStrategyAsync.makeInProgressResponse(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_B6AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_B770;
  return HandleIntentFlowStrategyAsync.makeFailureHandlingIntentResponse(rchRecord:)(a1, a2, a3, a4);
}

uint64_t sub_B770()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_B864(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_17DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = swift_task_alloc();
  sub_17DE0();
  id v7 = objc_allocWithZone((Class)type metadata accessor for ShowClockIntentHandler());
  swift_retain();
  [v7 init];
  type metadata accessor for ShowClockIntent();
  id v8 = a2;
  sub_17DB0();
  uint64_t v9 = sub_17DD0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v4);
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(uint64_t))(v2 + 8);
  return sub_BC2C(v10, v2, v9);
}

unint64_t sub_B9F4()
{
  unint64_t result = qword_20E40[0];
  if (!qword_20E40[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_20E40);
  }
  return result;
}

uint64_t sub_BA4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_44E0(&qword_20CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_BAB4()
{
  unint64_t result = qword_20EA0;
  if (!qword_20EA0)
  {
    sub_BB10(&qword_20E98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20EA0);
  }
  return result;
}

uint64_t sub_BB10(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_BB58(uint64_t a1)
{
  return sub_ADD0(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_BB64(uint64_t *a1)
{
  return sub_AC0C(a1, *(void *)(v1 + 16));
}

unint64_t sub_BB6C()
{
  unint64_t result = qword_20EB8;
  if (!qword_20EB8)
  {
    sub_18270();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20EB8);
  }
  return result;
}

uint64_t sub_BBC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_44E0(&qword_20EC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_BC2C(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_BC40()
{
  uint64_t v0 = sub_18240();
  __chkstk_darwin(v0 - 8);
  type metadata accessor for ShowClockCATsSimple();
  sub_18230();
  uint64_t result = sub_18210();
  qword_214A8 = result;
  return result;
}

uint64_t type metadata accessor for ShowClockCATPatternsExecutor(uint64_t a1)
{
  return sub_CA44(a1, (uint64_t *)&unk_20ED0);
}

uint64_t sub_BCEC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_BD2C(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  sub_44E0(&qword_20EB0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_18DA0;
  *(void *)(v8 + 32) = 0x44746E6572727563;
  *(void *)(v8 + 40) = 0xEB00000000657461;
  if (a1)
  {
    uint64_t v9 = sub_18150();
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    *(void *)(v8 + 56) = 0;
    *(void *)(v8 + 64) = 0;
  }
  *(void *)(v8 + 48) = v10;
  *(void *)(v8 + 72) = v9;
  strcpy((char *)(v8 + 80), "weekStartDate");
  *(_WORD *)(v8 + 94) = -4864;
  if (a2)
  {
    uint64_t v11 = sub_18150();
    uint64_t v12 = a2;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    *(void *)(v8 + 104) = 0;
    *(void *)(v8 + 112) = 0;
  }
  *(void *)(v8 + 96) = v12;
  *(void *)(v8 + 120) = v11;
  *(void *)(v8 + 128) = 0x626D754E6B656577;
  *(void *)(v8 + 136) = 0xEA00000000007265;
  if (a4)
  {
    a3 = 0;
    NSString v13 = 0;
    *(void *)(v8 + 152) = 0;
    *(void *)(v8 + 160) = 0;
  }
  else
  {
    NSString v13 = &type metadata for Double;
  }
  *(void *)(v8 + 144) = a3;
  id v14 = (void *)(v8 + 192);
  *(void *)(v8 + 168) = v13;
  *(void *)(v8 + 176) = 0xD000000000000011;
  *(void *)(v8 + 184) = 0x80000000000194B0;
  if ((a4 & 0xFF00) == 0x200)
  {
    NSString v15 = 0;
    *id v14 = 0;
    *(void *)(v8 + 200) = 0;
    *(void *)(v8 + 208) = 0;
  }
  else
  {
    *(unsigned char *)id v14 = HIBYTE(a4) & 1;
    NSString v15 = &type metadata for Bool;
  }
  *(void *)(v8 + 216) = v15;
  swift_retain();
  swift_retain();
  return v8;
}

uint64_t sub_BEC8()
{
  uint64_t v1 = sub_44E0(&qword_20EC8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_44E0(&qword_20EB0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_18CB0;
  *(void *)(v4 + 32) = 7368801;
  *(void *)(v4 + 40) = 0xE300000000000000;
  uint64_t v5 = *v0;
  if (*v0)
  {
    uint64_t v6 = sub_181A0();
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    *(void *)(v4 + 56) = 0;
    *(void *)(v4 + 64) = 0;
  }
  *(void *)(v4 + 48) = v7;
  *(void *)(v4 + 72) = v6;
  *(void *)(v4 + 80) = 0x7463416B636F6C63;
  *(void *)(v4 + 88) = 0xEB000000006E6F69;
  uint64_t v8 = type metadata accessor for ShowClockIntentHandledResponseShowTimeParameters(0);
  sub_CAD8((uint64_t)v0 + *(int *)(v8 + 20), (uint64_t)v3, &qword_20EC8);
  uint64_t v9 = sub_181E0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v3, 1, v9) == 1)
  {
    swift_retain();
    sub_53E4((uint64_t)v3, &qword_20EC8);
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
  }
  else
  {
    *(void *)(v4 + 120) = v9;
    uint64_t v11 = sub_6790((uint64_t *)(v4 + 96));
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(v11, v3, v9);
    swift_retain();
  }
  *(void *)(v4 + 128) = 1701669236;
  *(void *)(v4 + 136) = 0xE400000000000000;
  uint64_t v12 = *(uint64_t *)((char *)v0 + *(int *)(v8 + 24));
  if (v12)
  {
    uint64_t v13 = sub_18150();
  }
  else
  {
    uint64_t v13 = 0;
    *(void *)(v4 + 152) = 0;
    *(void *)(v4 + 160) = 0;
  }
  *(void *)(v4 + 144) = v12;
  *(void *)(v4 + 168) = v13;
  swift_retain();
  return v4;
}

uint64_t sub_C0E8(uint64_t a1, uint64_t a2)
{
  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  return _swift_task_switch(sub_C10C, 0, 0);
}

uint64_t sub_C10C()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 48);
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 16) = 0;
  *(_WORD *)(v0 + 40) = 513;
  v1(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  *(void *)(v0 + 72) = v2;
  *(void *)(v0 + 80) = v3;
  uint64_t v5 = sub_BD2C(v2, v3, v4, *(unsigned __int8 *)(v0 + 40) | (unsigned __int16)(*(unsigned __int8 *)(v0 + 41) << 8));
  *(void *)(v0 + 88) = v5;
  uint64_t v8 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v6;
  void *v6 = v0;
  v6[1] = sub_C21C;
  return v8(0xD000000000000027, 0x8000000000019480, v5);
}

uint64_t sub_C21C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 104) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_C3D8;
  }
  else
  {
    *(void *)(v4 + 112) = a1;
    uint64_t v5 = sub_C368;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_C368()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 112);
  return v1(v2);
}

uint64_t sub_C3D8()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_C444(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = type metadata accessor for ShowClockIntentHandledResponseShowTimeParameters(0);
  v3[6] = swift_task_alloc();
  return _swift_task_switch(sub_C4DC, 0, 0);
}

uint64_t sub_C4DC()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = (void *)v0[6];
  uint64_t v3 = (void (*)(void *))v0[2];
  *uint64_t v1 = 0;
  uint64_t v4 = (char *)v1 + *(int *)(v2 + 20);
  uint64_t v5 = sub_181E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(void *)((char *)v1 + *(int *)(v2 + 24)) = 0;
  v3(v1);
  uint64_t v6 = sub_BEC8();
  v0[7] = v6;
  uint64_t v9 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  uint64_t v7 = (void *)swift_task_alloc();
  v0[8] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_C624;
  return v9(0xD000000000000027, 0x80000000000193F0, v6);
}

uint64_t sub_C624(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_C7E4;
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    uint64_t v5 = sub_C770;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_C770()
{
  sub_CA7C(v0[6]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[10];
  return v1(v2);
}

uint64_t sub_C7E4()
{
  sub_CA7C(*(void *)(v0 + 48));
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_C854(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18240();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_44E0(&qword_20C68);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_CAD8(a1, (uint64_t)v10, &qword_20C68);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_18160();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_53E4(a1, &qword_20C68);
  return v11;
}

uint64_t sub_C9EC()
{
  sub_18180();

  return swift_deallocClassInstance();
}

uint64_t sub_CA1C()
{
  return type metadata accessor for ShowClockCATPatternsExecutor(0);
}

uint64_t type metadata accessor for ShowClockIntentHandledResponseShowTimeParameters(uint64_t a1)
{
  return sub_CA44(a1, (uint64_t *)&unk_20F88);
}

uint64_t sub_CA44(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_CA7C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ShowClockIntentHandledResponseShowTimeParameters(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_CAD8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_44E0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t *sub_CB3C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_181E0();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_retain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = sub_44E0(&qword_20EC8);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *(uint64_t *)((char *)v7 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  swift_retain();
  return v7;
}

uint64_t sub_CCDC(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_181E0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }

  return swift_release();
}

void *sub_CDAC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_181E0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_retain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = sub_44E0(&qword_20EC8);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_retain();
  return a1;
}

void *sub_CEF0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_181E0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_44E0(&qword_20EC8);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

void *sub_D0A4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_181E0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_44E0(&qword_20EC8);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_D1D4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_181E0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_44E0(&qword_20EC8);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_D378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_D38C);
}

uint64_t sub_D38C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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
    uint64_t v9 = sub_44E0(&qword_20EC8);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    int v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_D44C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_D460);
}

void *sub_D460(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_44E0(&qword_20EC8);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_D50C()
{
  sub_D5A4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_D5A4()
{
  if (!qword_20F98)
  {
    sub_181E0();
    unint64_t v0 = sub_184F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_20F98);
    }
  }
}

uint64_t sub_D5FC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_D61C, 0, 0);
}

uint64_t sub_D61C()
{
  uint64_t v1 = v0[3];
  sub_44E0(&qword_20EB0);
  uint64_t v2 = swift_allocObject();
  v0[4] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_18CC0;
  *(void *)(v2 + 32) = 1702125924;
  *(void *)(v2 + 40) = 0xE400000000000000;
  *(void *)(v2 + 72) = sub_18150();
  *(void *)(v2 + 48) = v1;
  int v5 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapper.executePattern(patternId:parameters:));
  swift_retain();
  int v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  *int v3 = v0;
  v3[1] = sub_D740;
  return v5(0xD000000000000027, 0x80000000000194D0, v2);
}

uint64_t sub_D740(uint64_t a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v4 = swift_bridgeObjectRelease();
  int v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_D864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t _s12FlowStrategyVMa()
{
  return sub_E96C();
}

uint64_t sub_D884()
{
  uint64_t v0 = sub_18400();
  sub_6220(v0, qword_20FD8);
  sub_53AC(v0, (uint64_t)qword_20FD8);
  return sub_18310();
}

uint64_t sub_D8D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (qword_20BD0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_18400();
  sub_53AC(v4, (uint64_t)qword_20FD8);
  int v5 = sub_183F0();
  os_log_type_t v6 = sub_184B0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "ClockIntents.FlowStrategy.actionForInput() called.", v7, 2u);
    swift_slowDealloc();
  }

  return sub_FBF4(a1, a2);
}

uint64_t sub_D9DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_D8D0(a1, a2);
}

uint64_t sub_D9E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_210B0 + dword_210B0);
  os_log_type_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(a3 + 24);
  void *v6 = v3;
  v6[1] = sub_DA98;
  return v10(a1, v7, v8);
}

uint64_t sub_DA98(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  int v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_DB9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_BC3C;
  return RCHFlowStrategyAsync.makeErrorResponse(error:)(a1, a2, a3, a4);
}

uint64_t sub_DC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_BC3C;
  return ResolveConfirmFlowStrategyAsync.makeAppDoesNotSupportIntentResponse(app:intent:)(a1, a2, a3, a4, a5);
}

uint64_t sub_DD2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_BC3C;
  return ResolveConfirmFlowStrategyAsync.makeAppNotFoundOnDeviceResponse(app:intent:)(a1, a2, a3, a4, a5);
}

uint64_t sub_DDF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_BC3C;
  return ResolveConfirmFlowStrategyAsync.makeDeviceIncompatibleResponse(app:intent:)(a1, a2, a3, a4, a5);
}

uint64_t sub_DEC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_B770;
  return ResolveConfirmFlowStrategyAsync.makeErrorResponse(error:app:intent:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_DFA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_BC3C;
  return RouteConfirmIntentResponseFlowStrategyAsync.makeFailureConfirmingIntentResponse(app:intent:intentResponse:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_E07C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_210B8 + dword_210B8);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  uint64_t v8 = *(void *)(a3 + 16);
  *uint64_t v7 = v3;
  v7[1] = sub_E13C;
  return v10(a1, a2, v8);
}

uint64_t sub_E13C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_E238()
{
  return swift_getWitnessTable();
}

uint64_t sub_E254()
{
  return swift_getWitnessTable();
}

uint64_t sub_E270()
{
  return swift_getWitnessTable();
}

uint64_t sub_E28C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  return _swift_task_switch(sub_E2B0, 0, 0);
}

uint64_t sub_E2B0()
{
  if (qword_20BD0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_18400();
  v0[6] = sub_53AC(v1, (uint64_t)qword_20FD8);
  uint64_t v2 = sub_183F0();
  os_log_type_t v3 = sub_184B0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "ClockIntents.FlowStrategy.makeIntentFromParse() called.", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)&dword_211C0 + dword_211C0);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[7] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_E418;
  uint64_t v6 = v0[3];
  return v8(v6);
}

uint64_t sub_E418(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 64) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return _swift_task_switch(sub_E54C, 0, 0);
  }
}

uint64_t sub_E54C()
{
  uint64_t v11 = v0;
  uint64_t v1 = (void *)v0[8];
  if (v1)
  {
    if (swift_dynamicCastUnknownClass())
    {
      uint64_t v2 = (uint64_t (*)(void))v0[1];
      return v2();
    }
  }
  uint64_t v4 = sub_183F0();
  os_log_type_t v5 = sub_184A0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v7 = sub_18610();
    v0[2] = sub_15A3C(v7, v8, &v10);
    sub_18500();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v4, v5, "Intent is nil, or cannot cast converted intent to IntentType %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  type metadata accessor for ClockIntents.FlowError();
  swift_getWitnessTable();
  swift_allocError();
  sub_18360();
  swift_willThrow();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_E7A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_17DC0();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return _swift_task_switch(sub_E868, 0, 0);
}

uint64_t sub_E868()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v4 = (void *)v0[3];
  sub_17DE0();
  id v5 = objc_allocWithZone((Class)type metadata accessor for ShowClockIntentHandler());
  swift_retain();
  [v5 init];
  id v6 = v4;
  sub_17DB0();
  uint64_t v7 = sub_17DD0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  unint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  return v8(v7);
}

uint64_t sub_E96C()
{
  return swift_getGenericMetadata();
}

uint64_t sub_E99C()
{
  uint64_t v0 = sub_18290();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for SiriTimeAppBundleId.clockApp(_:), v0);
  uint64_t v4 = sub_18280();
  uint64_t v6 = v5;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_214C0 = v4;
  *(void *)algn_214C8 = v6;
  return result;
}

uint64_t sub_EA9C()
{
  if (qword_20BD8 != -1) {
    swift_once();
  }
  sub_183E0();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t result = sub_183D0();
  qword_214D0 = result;
  return result;
}

uint64_t sub_EB4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  sub_44E0(&qword_20C68);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_18340();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_17B90();
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  sub_44E0(&qword_20EC8);
  v3[18] = swift_task_alloc();
  uint64_t v6 = sub_181E0();
  v3[19] = v6;
  v3[20] = *(void *)(v6 - 8);
  v3[21] = swift_task_alloc();
  uint64_t v7 = sub_17B40();
  v3[22] = v7;
  v3[23] = *(void *)(v7 - 8);
  v3[24] = swift_task_alloc();
  uint64_t v8 = sub_17B70();
  v3[25] = v8;
  v3[26] = *(void *)(v8 - 8);
  v3[27] = swift_task_alloc();
  return _swift_task_switch(sub_EDE0, 0, 0);
}

uint64_t sub_EDE0()
{
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  uint64_t v4 = v0[24];
  uint64_t v3 = v0[25];
  uint64_t v5 = v0[22];
  uint64_t v6 = v0[23];
  uint64_t v7 = v0[9];
  sub_17B60();
  v0[6] = sub_17B50();
  v0[7] = v8;
  v0[28] = v8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
  uint64_t v11 = (uint64_t (__cdecl *)())((char *)&dword_210E8 + dword_210E8);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[29] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_EEF0;
  return v11();
}

uint64_t sub_EEF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = v2;
  v4[30] = v2;
  swift_task_dealloc();
  if (v2)
  {
    (*(void (**)(void, void))(v4[23] + 8))(v4[24], v4[22]);
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_F280;
  }
  else
  {
    uint64_t v5 = sub_F030;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_F030()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[18];
  sub_18100();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_53E4(v0[18], &qword_20EC8);
  }
  else
  {
    uint64_t v5 = v0[20];
    uint64_t v4 = v0[21];
    uint64_t v6 = v0[19];
    (*(void (**)(uint64_t, void, uint64_t))(v5 + 32))(v4, v0[18], v6);
    sub_181D0();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  }
  if (qword_20BE8 != -1) {
    swift_once();
  }
  uint64_t v7 = v0[17];
  uint64_t v9 = v0[15];
  uint64_t v8 = v0[16];
  uint64_t v11 = v0[13];
  uint64_t v10 = v0[14];
  uint64_t v12 = v0[12];
  uint64_t v13 = sub_53AC(v9, (uint64_t)qword_210C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v13, v9);
  (*(void (**)(uint64_t, void, uint64_t))(v11 + 104))(v10, enum case for PunchOutApp.clock(_:), v12);
  sub_18330();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  sub_18250();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_F280()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_F338()
{
  uint64_t v0 = sub_17B90();
  sub_6220(v0, qword_210C0);
  sub_53AC(v0, (uint64_t)qword_210C0);
  return sub_17B80();
}

uint64_t sub_F384()
{
  uint64_t v0 = sub_18240();
  __chkstk_darwin(v0 - 8);
  type metadata accessor for ShowClockCATs_Async();
  sub_18230();
  uint64_t result = sub_18170();
  qword_210D8 = result;
  return result;
}

uint64_t sub_F410()
{
  uint64_t v1 = sub_17E60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  uint64_t v2 = sub_17EA0();
  v0[5] = v2;
  v0[6] = *(void *)(v2 - 8);
  v0[7] = swift_task_alloc();
  sub_44E0(&qword_210F0);
  v0[8] = swift_task_alloc();
  return _swift_task_switch(sub_F558, 0, 0);
}

uint64_t sub_F558()
{
  if (qword_20BF0 != -1) {
    swift_once();
  }
  uint64_t v4 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void *))((char *)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:)
                                                                                   + async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_F658;
  uint64_t v2 = *(void *)(v0 + 56);
  return v4(v2, 0xD000000000000020, 0x8000000000019560, &_swiftEmptyArrayStorage);
}

uint64_t sub_F658()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_F964;
  }
  else {
    uint64_t v2 = sub_F76C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_F76C()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v4 = sub_17E90();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = sub_17EC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (v5)
  {
    (*(void (**)(void, unint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v0[8], v4+ ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80)), v6);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }
  uint64_t v9 = v0[8];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v9, v8, 1, v6);
  swift_bridgeObjectRelease();
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v9, 1, v6);
  uint64_t v11 = v0[8];
  if (v10 == 1)
  {
    sub_53E4(v0[8], &qword_210F0);
    uint64_t v12 = 0;
    unint64_t v13 = 0xE000000000000000;
  }
  else
  {
    uint64_t v15 = v0[3];
    uint64_t v14 = v0[4];
    uint64_t v16 = v0[2];
    sub_17EB0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v6);
    uint64_t v12 = sub_17E50();
    unint64_t v13 = v17;
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
  return v18(v12, v13);
}

uint64_t sub_F964()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for ShowClockCATs_Async()
{
  uint64_t result = qword_210F8;
  if (!qword_210F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_FA28()
{
  return swift_initClassMetadata2();
}

uint64_t sub_FA68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18240();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_44E0(&qword_20C68);
  __chkstk_darwin(v8 - 8);
  int v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_4524(a1, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_18160();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_458C(a1);
  return v11;
}

uint64_t sub_FBEC()
{
  return type metadata accessor for ShowClockCATs_Async();
}

uint64_t sub_FBF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_17F50();
  uint64_t v30 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_17F60();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v25 - v12;
  sub_17F40();
  char v14 = sub_10054((uint64_t)v13);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v8 + 8);
  v31(v13, v7);
  if ((v14 & 1) == 0) {
    return sub_17E20();
  }
  uint64_t v29 = a2;
  sub_17F40();
  int v15 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v11, v7);
  if (v15 == enum case for Parse.NLv4IntentOnly(_:))
  {
    (*(void (**)(char *, uint64_t))(v8 + 96))(v11, v7);
    swift_unknownObjectRelease();
    return sub_17E10();
  }
  if (v15 == enum case for Parse.uso(_:))
  {
    v31(v11, v7);
    return sub_17E10();
  }
  if (qword_20BF8 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_18400();
  sub_53AC(v17, (uint64_t)qword_21148);
  uint64_t v18 = v30;
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v6, a1, v4);
  uint64_t v19 = sub_183F0();
  os_log_type_t v20 = sub_184A0();
  int v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    int v28 = v21;
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v33 = v27;
    uint64_t v26 = v22;
    *(_DWORD *)uint64_t v22 = 136315138;
    v25[1] = v22 + 4;
    sub_17F40();
    uint64_t v23 = sub_18470();
    uint64_t v32 = sub_15A3C(v23, v24, &v33);
    sub_18500();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v4);
    _os_log_impl(&dword_0, v19, (os_log_type_t)v28, "Received unexpected NL parse: %s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v4);
  }

  sub_17E20();
  return ((uint64_t (*)(char *, uint64_t))v31)(v11, v7);
}

uint64_t sub_10008()
{
  uint64_t v0 = sub_18400();
  sub_6220(v0, qword_21148);
  sub_53AC(v0, (uint64_t)qword_21148);
  return sub_18310();
}

uint64_t sub_10054(uint64_t a1)
{
  uint64_t v2 = sub_17FA0();
  uint64_t v46 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_17F80();
  os_log_t v48 = *(os_log_t *)(v5 - 8);
  uint64_t v49 = v5;
  __chkstk_darwin(v5);
  v47 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_17F60();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  char v14 = (char *)&v46 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v46 - v15;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v17((char *)&v46 - v15, a1, v7);
  int v18 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v16, v7);
  if (v18 == enum case for Parse.NLv3IntentOnly(_:))
  {
    if (qword_20BF8 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_18400();
    sub_53AC(v19, (uint64_t)qword_21148);
    os_log_type_t v20 = sub_183F0();
    os_log_type_t v21 = sub_184A0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_0, v20, v21, "On-Device Clock received an NLv3 parse – this is unsupported", v22, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v16, v7);
LABEL_29:
    char v23 = 0;
    return v23 & 1;
  }
  if (v18 == enum case for Parse.NLv4IntentOnly(_:))
  {
    (*(void (**)(char *, uint64_t))(v8 + 96))(v16, v7);
    swift_getObjectType();
    if (!sub_184C0())
    {
      if (qword_20BF8 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_18400();
      sub_53AC(v37, (uint64_t)qword_21148);
      uint64_t v38 = sub_183F0();
      os_log_type_t v39 = sub_184A0();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v40 = 0;
        _os_log_impl(&dword_0, v38, v39, "ClockFlowUtils.makeIntentFromParse USO task is empty", v40, 2u);
        swift_slowDealloc();
        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
      }
      goto LABEL_29;
    }
    char v23 = sub_10804();
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    if (v18 != enum case for Parse.uso(_:))
    {
      if (qword_20BF8 != -1) {
        swift_once();
      }
      uint64_t v28 = sub_18400();
      sub_53AC(v28, (uint64_t)qword_21148);
      v17(v14, a1, v7);
      uint64_t v29 = sub_183F0();
      os_log_type_t v30 = sub_184A0();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = swift_slowAlloc();
        os_log_t v48 = v29;
        uint64_t v32 = (uint8_t *)v31;
        uint64_t v49 = swift_slowAlloc();
        uint64_t v51 = v49;
        *(_DWORD *)uint64_t v32 = 136315138;
        v47 = (char *)(v32 + 4);
        v17(v11, (uint64_t)v14, v7);
        uint64_t v33 = sub_18470();
        uint64_t v50 = sub_15A3C(v33, v34, &v51);
        sub_18500();
        swift_bridgeObjectRelease();
        uint64_t v35 = *(void (**)(char *, uint64_t))(v8 + 8);
        v35(v14, v7);
        os_log_t v36 = v48;
        _os_log_impl(&dword_0, v48, v30, "Received invalid timer parse: %s", v32, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        uint64_t v35 = *(void (**)(char *, uint64_t))(v8 + 8);
        v35(v14, v7);
      }
      v35(v16, v7);
      goto LABEL_29;
    }
    (*(void (**)(char *, uint64_t))(v8 + 96))(v16, v7);
    uint64_t v25 = v47;
    os_log_t v24 = v48;
    uint64_t v26 = v49;
    ((void (*)(char *, char *, uint64_t))v48[4].isa)(v47, v16, v49);
    sub_17F70();
    uint64_t v27 = sub_17F90();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v4, v2);
    if (!v27)
    {
      if (qword_20BF8 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_18400();
      sub_53AC(v41, (uint64_t)qword_21148);
      uint64_t v42 = sub_183F0();
      os_log_type_t v43 = sub_184A0();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v44 = 0;
        _os_log_impl(&dword_0, v42, v43, "ClockFlowUtils.makeIntentFromParse USO task is empty", v44, 2u);
        swift_slowDealloc();
      }

      ((void (*)(char *, uint64_t))v24[1].isa)(v25, v26);
      goto LABEL_29;
    }
    char v23 = sub_10804();
    swift_release();
    ((void (*)(char *, uint64_t))v24[1].isa)(v25, v26);
  }
  return v23 & 1;
}

uint64_t sub_10804()
{
  uint64_t v0 = sub_17FF0();
  uint64_t v138 = *(void *)(v0 - 8);
  uint64_t v139 = v0;
  __chkstk_darwin(v0);
  uint64_t v129 = (char *)v128 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_44E0(&qword_21160);
  __chkstk_darwin(v132);
  v135 = (char *)v128 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_44E0(&qword_21168);
  __chkstk_darwin(v3 - 8);
  uint64_t v133 = (char *)v128 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_44E0(&qword_21170);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v130 = (uint64_t)v128 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v142 = (uint64_t)v128 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v134 = (char *)v128 - v11;
  __chkstk_darwin(v10);
  v136 = (char *)v128 - v12;
  uint64_t v13 = sub_18030();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v140 = v13;
  uint64_t v141 = v14;
  __chkstk_darwin(v13);
  v131 = (char *)v128 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_44E0(&qword_21178);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v137 = (uint64_t)v128 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  os_log_type_t v20 = (char *)v128 - v19;
  uint64_t v21 = sub_44E0(&qword_21180);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  os_log_t v24 = (char *)v128 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v22);
  uint64_t v27 = (char *)v128 - v26;
  uint64_t v28 = __chkstk_darwin(v25);
  os_log_type_t v30 = (char *)v128 - v29;
  uint64_t v31 = __chkstk_darwin(v28);
  uint64_t v33 = (char *)v128 - v32;
  uint64_t v34 = __chkstk_darwin(v31);
  os_log_t v36 = (char *)v128 - v35;
  __chkstk_darwin(v34);
  uint64_t v38 = (char *)v128 - v37;
  uint64_t v39 = sub_44E0(&qword_20C98);
  __chkstk_darwin(v39 - 8);
  uint64_t v41 = (char *)v128 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18000();
  if (!v146)
  {
    sub_53E4((uint64_t)&v145, &qword_21188);
    if (qword_20BF8 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_18400();
    sub_53AC(v49, (uint64_t)qword_21148);
    uint64_t v50 = sub_183F0();
    os_log_type_t v51 = sub_184B0();
    if (os_log_type_enabled(v50, v51))
    {
      unint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v52 = 0;
      _os_log_impl(&dword_0, v50, v51, "Task is invalid, returning isValidClockTask = false", v52, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  sub_13DC8(&v145, v147);
  sub_13DD8((uint64_t)v147, (uint64_t)&v145);
  sub_180B0();
  if (!swift_dynamicCast())
  {
    if (qword_20BF8 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_18400();
    sub_53AC(v53, (uint64_t)qword_21148);
    sub_13DD8((uint64_t)v147, (uint64_t)&v145);
    uint64_t v54 = sub_183F0();
    os_log_type_t v55 = sub_184A0();
    if (!os_log_type_enabled(v54, v55))
    {
LABEL_39:

      _s20HandleIntentStrategyVwxx_0((uint64_t)&v145);
LABEL_108:
      _s20HandleIntentStrategyVwxx_0((uint64_t)v147);
      return 0;
    }
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v144 = swift_slowAlloc();
    *(_DWORD *)uint64_t v56 = 136315138;
    sub_13DD8((uint64_t)&v145, (uint64_t)v143);
    uint64_t v57 = sub_18470();
    v143[0] = sub_15A3C(v57, v58, &v144);
    sub_18500();
    swift_bridgeObjectRelease();
    _s20HandleIntentStrategyVwxx_0((uint64_t)&v145);
    _os_log_impl(&dword_0, v54, v55, "Receiving unsupported uso task: %s", v56, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
LABEL_107:

    goto LABEL_108;
  }
  v128[1] = v143[0];
  switch(sub_13E34())
  {
    case 1u:
      swift_retain();
      sub_180F0();
      swift_release();
      if (!(void)v145) {
        goto LABEL_49;
      }
      uint64_t v59 = sub_18040();
      swift_release();
      if (!v59) {
        goto LABEL_49;
      }
      sub_18020();
      uint64_t v61 = v140;
      uint64_t v60 = v141;
      (*(void (**)(char *, void, uint64_t))(v141 + 104))(v36, enum case for UsoEntity_common_DateTime.DefinedValues.common_DateTime_Now(_:), v140);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v60 + 56))(v36, 0, 1, v61);
      uint64_t v62 = (uint64_t)&v20[*(int *)(v16 + 48)];
      sub_CAD8((uint64_t)v38, (uint64_t)v20, &qword_21180);
      sub_CAD8((uint64_t)v36, v62, &qword_21180);
      uint64_t v63 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v60 + 48);
      if (v63((uint64_t)v20, 1, v61) == 1)
      {
        sub_53E4((uint64_t)v36, &qword_21180);
        sub_53E4((uint64_t)v38, &qword_21180);
        if (v63(v62, 1, v61) == 1)
        {
          sub_53E4((uint64_t)v20, &qword_21180);
          goto LABEL_48;
        }
      }
      else
      {
        sub_CAD8((uint64_t)v20, (uint64_t)v33, &qword_21180);
        if (v63(v62, 1, v61) != 1)
        {
          uint64_t v81 = v141;
          Swift::Int v82 = *(void (**)(char *, uint64_t, uint64_t))(v141 + 32);
          uint64_t v142 = v59;
          uint64_t v83 = v131;
          v82(v131, v62, v61);
          sub_14024(&qword_21198, (void (*)(uint64_t))&type metadata accessor for UsoEntity_common_DateTime.DefinedValues);
          LODWORD(v137) = sub_18440();
          uint64_t v84 = *(void (**)(char *, uint64_t))(v81 + 8);
          v84(v83, v61);
          sub_53E4((uint64_t)v36, &qword_21180);
          sub_53E4((uint64_t)v38, &qword_21180);
          v84(v33, v61);
          sub_53E4((uint64_t)v20, &qword_21180);
          if (v137)
          {
LABEL_48:
            swift_release();
LABEL_49:
            swift_retain();
            sub_180F0();
            swift_release();
            if ((void)v145)
            {
              uint64_t v85 = sub_18050();
              swift_release();
              if (v85)
              {
                uint64_t v86 = (uint64_t)v136;
                sub_17FE0();
                if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v138 + 48))(v86, 1, v139) == 1)
                {
                  sub_53E4(v86, &qword_21170);
                  if (qword_20BF8 != -1) {
                    swift_once();
                  }
                  uint64_t v87 = sub_18400();
                  sub_53AC(v87, (uint64_t)qword_21148);
                  os_log_type_t v88 = sub_183F0();
                  os_log_type_t v89 = sub_184A0();
                  if (os_log_type_enabled(v88, v89))
                  {
                    uint64_t v90 = (uint8_t *)swift_slowAlloc();
                    *(_WORD *)uint64_t v90 = 0;
                    _os_log_impl(&dword_0, v88, v89, "ClockFlowPlugin does not support arbitrary date references", v90, 2u);
                    swift_slowDealloc();
                  }
                  swift_release();

                  goto LABEL_97;
                }
                swift_release();
                sub_53E4(v86, &qword_21170);
              }
            }
            swift_retain();
            sub_180F0();
            swift_release();
            if (!(void)v145) {
              goto LABEL_110;
            }
            uint64_t v95 = sub_18010();
            swift_release();
            if (!v95) {
              goto LABEL_110;
            }
            swift_release();
            if (qword_20BF8 != -1) {
              swift_once();
            }
            uint64_t v96 = sub_18400();
            sub_53AC(v96, (uint64_t)qword_21148);
            uint64_t v54 = sub_183F0();
            os_log_type_t v97 = sub_184A0();
            if (os_log_type_enabled(v54, v97))
            {
              v98 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v98 = 0;
              _os_log_impl(&dword_0, v54, v97, "ClockFlowPlugin does not support arbitrary date offset values", v98, 2u);
              swift_slowDealloc();
            }
            goto LABEL_106;
          }
LABEL_57:
          if (qword_20BF8 != -1) {
            swift_once();
          }
          uint64_t v91 = sub_18400();
          sub_53AC(v91, (uint64_t)qword_21148);
          v92 = sub_183F0();
          os_log_type_t v93 = sub_184A0();
          if (os_log_type_enabled(v92, v93))
          {
            v94 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v94 = 0;
            _os_log_impl(&dword_0, v92, v93, "ClockFlowPlugin does not support offset anchors that are not 'now'", v94, 2u);
            swift_slowDealloc();
          }
          goto LABEL_96;
        }
        sub_53E4((uint64_t)v36, &qword_21180);
        sub_53E4((uint64_t)v38, &qword_21180);
        (*(void (**)(char *, uint64_t))(v141 + 8))(v33, v61);
      }
      sub_53E4((uint64_t)v20, &qword_21178);
      goto LABEL_57;
    case 2u:
      swift_retain();
      sub_180F0();
      swift_release();
      if (!(void)v145) {
        goto LABEL_73;
      }
      uint64_t v64 = sub_18040();
      swift_release();
      uint64_t v65 = v142;
      if (!v64) {
        goto LABEL_74;
      }
      sub_18020();
      uint64_t v67 = v140;
      uint64_t v66 = v141;
      (*(void (**)(char *, void, uint64_t))(v141 + 104))(v27, enum case for UsoEntity_common_DateTime.DefinedValues.common_DateTime_Now(_:), v140);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v66 + 56))(v27, 0, 1, v67);
      uint64_t v68 = *(int *)(v16 + 48);
      uint64_t v69 = v137;
      uint64_t v70 = v137 + v68;
      sub_CAD8((uint64_t)v30, v137, &qword_21180);
      sub_CAD8((uint64_t)v27, v70, &qword_21180);
      uint64_t v71 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v66 + 48);
      if (v71(v69, 1, v67) == 1)
      {
        sub_53E4((uint64_t)v27, &qword_21180);
        sub_53E4((uint64_t)v30, &qword_21180);
        if (v71(v70, 1, v67) == 1)
        {
          sub_53E4(v69, &qword_21180);
          goto LABEL_72;
        }
        goto LABEL_46;
      }
      sub_CAD8(v69, (uint64_t)v24, &qword_21180);
      if (v71(v70, 1, v67) == 1)
      {
        sub_53E4((uint64_t)v27, &qword_21180);
        sub_53E4((uint64_t)v30, &qword_21180);
        (*(void (**)(char *, uint64_t))(v141 + 8))(v24, v67);
LABEL_46:
        sub_53E4(v69, &qword_21178);
LABEL_80:
        if (qword_20BF8 != -1) {
          swift_once();
        }
        uint64_t v112 = sub_18400();
        sub_53AC(v112, (uint64_t)qword_21148);
        v92 = sub_183F0();
        os_log_type_t v113 = sub_184A0();
        if (os_log_type_enabled(v92, v113))
        {
          uint64_t v114 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v114 = 0;
          _os_log_impl(&dword_0, v92, v113, "ClockFlowPlugin does not support offset anchors that are not 'now'", v114, 2u);
          swift_slowDealloc();
        }
        goto LABEL_96;
      }
      uint64_t v99 = v141;
      uint64_t v100 = v131;
      (*(void (**)(char *, uint64_t, uint64_t))(v141 + 32))(v131, v70, v67);
      sub_14024(&qword_21198, (void (*)(uint64_t))&type metadata accessor for UsoEntity_common_DateTime.DefinedValues);
      char v101 = sub_18440();
      uint64_t v102 = *(void (**)(char *, uint64_t))(v99 + 8);
      v102(v100, v67);
      sub_53E4((uint64_t)v27, &qword_21180);
      sub_53E4((uint64_t)v30, &qword_21180);
      v102(v24, v67);
      sub_53E4(v137, &qword_21180);
      if ((v101 & 1) == 0) {
        goto LABEL_80;
      }
LABEL_72:
      swift_release();
LABEL_73:
      uint64_t v65 = v142;
LABEL_74:
      swift_retain();
      sub_180F0();
      swift_release();
      if ((void)v145)
      {
        uint64_t v103 = sub_18050();
        swift_release();
        if (v103)
        {
          if (sub_17FC0() && (uint64_t v104 = sub_17FB0(), swift_release(), v104))
          {
            uint64_t v105 = (uint64_t)v133;
            sub_18090();
            swift_release();
            uint64_t v106 = sub_180A0();
            int v107 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v106 - 8) + 48))(v105, 1, v106);
            uint64_t v109 = v138;
            uint64_t v108 = v139;
            uint64_t v110 = (uint64_t)v135;
            uint64_t v111 = (uint64_t)v134;
            if (v107 != 1)
            {
              swift_release();
              sub_53E4(v105, &qword_21168);
              goto LABEL_100;
            }
          }
          else
          {
            uint64_t v115 = sub_180A0();
            uint64_t v105 = (uint64_t)v133;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v115 - 8) + 56))(v133, 1, 1, v115);
            uint64_t v109 = v138;
            uint64_t v108 = v139;
            uint64_t v110 = (uint64_t)v135;
            uint64_t v111 = (uint64_t)v134;
          }
          sub_53E4(v105, &qword_21168);
          uint64_t v141 = v103;
          sub_17FE0();
          (*(void (**)(uint64_t, void, uint64_t))(v109 + 104))(v65, enum case for UsoEntity_common_Date.DefinedValues.common_Date_Today(_:), v108);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v109 + 56))(v65, 0, 1, v108);
          uint64_t v116 = v110 + *(int *)(v132 + 48);
          sub_CAD8(v111, v110, &qword_21170);
          sub_CAD8(v65, v116, &qword_21170);
          v117 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v109 + 48);
          if (v117(v110, 1, v108) == 1)
          {
            sub_53E4(v65, &qword_21170);
            sub_53E4(v111, &qword_21170);
            if (v117(v116, 1, v108) == 1)
            {
              sub_53E4(v110, &qword_21170);
LABEL_99:
              swift_release();
              goto LABEL_100;
            }
          }
          else
          {
            uint64_t v118 = v130;
            sub_CAD8(v110, v130, &qword_21170);
            if (v117(v116, 1, v108) != 1)
            {
              unsigned int v122 = v129;
              (*(void (**)(char *, uint64_t, uint64_t))(v109 + 32))(v129, v116, v108);
              sub_14024(&qword_21190, (void (*)(uint64_t))&type metadata accessor for UsoEntity_common_Date.DefinedValues);
              LODWORD(v140) = sub_18440();
              uint64_t v123 = *(void (**)(char *, uint64_t))(v109 + 8);
              v123(v122, v108);
              sub_53E4(v142, &qword_21170);
              sub_53E4(v111, &qword_21170);
              v123((char *)v118, v108);
              sub_53E4(v110, &qword_21170);
              if (v140) {
                goto LABEL_99;
              }
              goto LABEL_92;
            }
            sub_53E4(v142, &qword_21170);
            sub_53E4(v111, &qword_21170);
            (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v118, v108);
          }
          sub_53E4(v110, &qword_21160);
LABEL_92:
          if (qword_20BF8 != -1) {
            swift_once();
          }
          uint64_t v119 = sub_18400();
          sub_53AC(v119, (uint64_t)qword_21148);
          v92 = sub_183F0();
          os_log_type_t v120 = sub_184A0();
          if (os_log_type_enabled(v92, v120))
          {
            v121 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v121 = 0;
            _os_log_impl(&dword_0, v92, v120, "ClockFlowPlugin does not support arbitrary date references", v121, 2u);
            swift_slowDealloc();
          }
LABEL_96:
          swift_release();

          goto LABEL_97;
        }
      }
LABEL_100:
      swift_retain();
      sub_180F0();
      swift_release();
      if ((void)v145)
      {
        uint64_t v124 = sub_18010();
        swift_release();
        if (v124)
        {
          swift_release();
          if (qword_20BF8 != -1) {
            swift_once();
          }
          uint64_t v125 = sub_18400();
          sub_53AC(v125, (uint64_t)qword_21148);
          uint64_t v54 = sub_183F0();
          os_log_type_t v126 = sub_184A0();
          if (os_log_type_enabled(v54, v126))
          {
            uint64_t v127 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v127 = 0;
            _os_log_impl(&dword_0, v54, v126, "ClockFlowPlugin does not support arbitrary date offset values", v127, 2u);
            swift_slowDealloc();
          }
LABEL_106:
          swift_release();
          goto LABEL_107;
        }
      }
LABEL_110:
      _s20HandleIntentStrategyVwxx_0((uint64_t)v147);
      swift_release();
      return 1;
    case 3u:
      if (qword_20BF8 != -1) {
        swift_once();
      }
      uint64_t v72 = sub_18400();
      sub_53AC(v72, (uint64_t)qword_21148);
      sub_13DD8((uint64_t)v147, (uint64_t)&v145);
      uint64_t v54 = sub_183F0();
      os_log_type_t v73 = sub_184A0();
      if (os_log_type_enabled(v54, v73))
      {
        v74 = (uint8_t *)swift_slowAlloc();
        uint64_t v144 = swift_slowAlloc();
        *(_DWORD *)v74 = 136315138;
        sub_13DD8((uint64_t)&v145, (uint64_t)v143);
        uint64_t v75 = sub_18470();
        v143[0] = sub_15A3C(v75, v76, &v144);
        sub_18500();
        swift_bridgeObjectRelease();
        _s20HandleIntentStrategyVwxx_0((uint64_t)&v145);
        v77 = "Receiving unsupported clock request type: %s";
        goto LABEL_37;
      }
      swift_release();
      goto LABEL_39;
    default:
      sub_121F8(v41);
      uint64_t v42 = sub_17B10();
      int v43 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v42 - 8) + 48))(v41, 1, v42);
      sub_53E4((uint64_t)v41, &qword_20C98);
      if (v43 == 1)
      {
        if (qword_20BF8 != -1) {
          swift_once();
        }
        uint64_t v44 = sub_18400();
        sub_53AC(v44, (uint64_t)qword_21148);
        uint64_t v45 = sub_183F0();
        os_log_type_t v46 = sub_184B0();
        if (os_log_type_enabled(v45, v46))
        {
          v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v47 = 0;
          _os_log_impl(&dword_0, v45, v46, "ClockFlowPlugin accepting clock input as valid current time input", v47, 2u);
          swift_slowDealloc();
        }
        swift_release();

        _s20HandleIntentStrategyVwxx_0((uint64_t)v147);
        return 1;
      }
      if (qword_20BF8 != -1) {
        swift_once();
      }
      uint64_t v78 = sub_18400();
      sub_53AC(v78, (uint64_t)qword_21148);
      sub_13DD8((uint64_t)v147, (uint64_t)&v145);
      uint64_t v54 = sub_183F0();
      os_log_type_t v73 = sub_184A0();
      if (!os_log_type_enabled(v54, v73))
      {

        _s20HandleIntentStrategyVwxx_0((uint64_t)&v145);
LABEL_97:
        swift_release();
        goto LABEL_108;
      }
      v74 = (uint8_t *)swift_slowAlloc();
      uint64_t v144 = swift_slowAlloc();
      *(_DWORD *)v74 = 136315138;
      sub_13DD8((uint64_t)&v145, (uint64_t)v143);
      uint64_t v79 = sub_18470();
      v143[0] = sub_15A3C(v79, v80, &v144);
      sub_18500();
      swift_bridgeObjectRelease();
      _s20HandleIntentStrategyVwxx_0((uint64_t)&v145);
      v77 = "Receiving unsupported clock date offset: %s";
LABEL_37:
      _os_log_impl(&dword_0, v54, v73, v77, v74, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      goto LABEL_106;
  }
}

uint64_t sub_121F8@<X0>(char *a1@<X8>)
{
  uint64_t v102 = a1;
  uint64_t v1 = sub_44E0(&qword_20C98);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v87 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_44E0(&qword_211A0);
  __chkstk_darwin(v4 - 8);
  v92 = (char *)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_180D0();
  uint64_t v94 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  os_log_type_t v93 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_18030();
  uint64_t v98 = *(void *)(v100 - 8);
  __chkstk_darwin(v100);
  uint64_t v90 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_44E0(&qword_21178);
  __chkstk_darwin(v9);
  uint64_t v99 = (uint64_t)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_44E0(&qword_21180);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v91 = (uint64_t)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v87 - v15;
  __chkstk_darwin(v14);
  uint64_t v101 = (uint64_t)&v87 - v17;
  uint64_t v18 = sub_44E0(&qword_20C88);
  __chkstk_darwin(v18 - 8);
  uint64_t v96 = (char *)&v87 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_44E0(&qword_20C90);
  __chkstk_darwin(v20 - 8);
  uint64_t v95 = (char *)&v87 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_17B10();
  uint64_t v103 = *(void *)(v22 - 8);
  uint64_t v104 = v22;
  uint64_t v23 = __chkstk_darwin(v22);
  os_log_type_t v89 = (char *)&v87 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  os_log_type_t v97 = (char *)&v87 - v25;
  uint64_t v26 = sub_44E0(&qword_21170);
  __chkstk_darwin(v26 - 8);
  uint64_t v28 = (char *)&v87 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_17FF0();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v33 = (char *)&v87 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  uint64_t v35 = (char *)&v87 - v34;
  sub_180F0();
  os_log_t v36 = v105;
  if (!v105)
  {
    if (qword_20BF8 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_18400();
    sub_53AC(v46, (uint64_t)qword_21148);
    v47 = sub_183F0();
    os_log_type_t v48 = sub_184B0();
    BOOL v49 = os_log_type_enabled(v47, v48);
    uint64_t v44 = v102;
    uint64_t v39 = v103;
    uint64_t v38 = v104;
    if (v49)
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_0, v47, v48, "ClockFlowPlugin task contains no reference", v50, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v44, 1, 1, v38);
  }
  uint64_t v88 = v6;
  uint64_t v37 = sub_18050();
  if (!v37)
  {
    os_log_type_t v97 = v36;
    uint64_t v51 = sub_18040();
    uint64_t v87 = v3;
    if (v51)
    {
      uint64_t v52 = v101;
      sub_18020();
      swift_release();
      uint64_t v53 = v100;
      uint64_t v54 = v98;
    }
    else
    {
      uint64_t v54 = v98;
      uint64_t v53 = v100;
      uint64_t v52 = v101;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v98 + 56))(v101, 1, 1, v100);
    }
    (*(void (**)(char *, void, uint64_t))(v54 + 104))(v16, enum case for UsoEntity_common_DateTime.DefinedValues.common_DateTime_Now(_:), v53);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v16, 0, 1, v53);
    uint64_t v58 = v99;
    uint64_t v59 = v99 + *(int *)(v9 + 48);
    sub_CAD8(v52, v99, &qword_21180);
    sub_CAD8((uint64_t)v16, v59, &qword_21180);
    uint64_t v60 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 48);
    int v61 = v60(v58, 1, v53);
    uint64_t v62 = v88;
    if (v61 == 1)
    {
      sub_53E4((uint64_t)v16, &qword_21180);
      sub_53E4(v52, &qword_21180);
      int v63 = v60(v59, 1, v53);
      uint64_t v44 = v102;
      if (v63 == 1)
      {
        sub_53E4(v58, &qword_21180);
        uint64_t v39 = v103;
        uint64_t v38 = v104;
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v64 = v91;
      sub_CAD8(v58, v91, &qword_21180);
      if (v60(v59, 1, v53) != 1)
      {
        uint64_t v66 = v90;
        (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v90, v59, v53);
        sub_14024(&qword_21198, (void (*)(uint64_t))&type metadata accessor for UsoEntity_common_DateTime.DefinedValues);
        char v67 = sub_18440();
        uint64_t v68 = *(void (**)(char *, uint64_t))(v54 + 8);
        v68(v66, v53);
        sub_53E4((uint64_t)v16, &qword_21180);
        sub_53E4(v101, &qword_21180);
        v68((char *)v64, v53);
        sub_53E4(v58, &qword_21180);
        uint64_t v44 = v102;
        uint64_t v39 = v103;
        uint64_t v38 = v104;
        if (v67) {
          goto LABEL_29;
        }
        goto LABEL_26;
      }
      sub_53E4((uint64_t)v16, &qword_21180);
      sub_53E4(v101, &qword_21180);
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v64, v53);
      uint64_t v44 = v102;
    }
    sub_53E4(v58, &qword_21178);
    uint64_t v39 = v103;
    uint64_t v38 = v104;
LABEL_26:
    uint64_t v65 = sub_18040();
    swift_release();
    if (v65)
    {
LABEL_39:
      if (qword_20BF8 != -1) {
        swift_once();
      }
      uint64_t v78 = sub_18400();
      sub_53AC(v78, (uint64_t)qword_21148);
      uint64_t v79 = sub_183F0();
      os_log_type_t v80 = sub_184B0();
      if (os_log_type_enabled(v79, v80))
      {
        uint64_t v81 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v81 = 0;
        _os_log_impl(&dword_0, v79, v80, "ClockFlowPlugin Could not find reference offset", v81, 2u);
        swift_slowDealloc();
      }

      goto LABEL_44;
    }
LABEL_29:
    if (sub_18070())
    {
      uint64_t v69 = (uint64_t)v92;
      sub_180C0();
      swift_release();
      uint64_t v70 = v94;
      int v71 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v94 + 48))(v69, 1, v62);
      uint64_t v72 = v93;
      if (v71 != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v70 + 32))(v93, v69, v62);
LABEL_34:
        if (sub_18010())
        {
          uint64_t v73 = (uint64_t)v87;
          sub_18080();
          swift_release();
          (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v62);
          v74 = *(uint64_t (**)(char *, void, uint64_t, uint64_t))(v39 + 56);
          v74((char *)v73, 0, 1, v38);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v73, 1, v38) != 1)
          {
            swift_release();
            uint64_t v75 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
            unint64_t v76 = v89;
            v75(v89, v87, v38);
            v75(v44, v76, v38);
            return v74(v44, 0, 1, v38);
          }
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v62);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v87, 1, 1, v38);
        }
        sub_53E4((uint64_t)v87, &qword_20C98);
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v70 = v94;
      uint64_t v69 = (uint64_t)v92;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v94 + 56))(v92, 1, 1, v62);
      uint64_t v72 = v93;
    }
    (*(void (**)(char *, void, uint64_t))(v70 + 104))(v72, enum case for UsoEntity_common_OffsetDirection.DefinedValues.common_OffsetDirection_After(_:), v62);
    sub_53E4(v69, &qword_211A0);
    goto LABEL_34;
  }
  uint64_t v101 = v37;
  sub_17FE0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) == 1)
  {
    sub_53E4((uint64_t)v28, &qword_21170);
    uint64_t v39 = v103;
    uint64_t v38 = v104;
    if (qword_20BF8 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_18400();
    sub_53AC(v40, (uint64_t)qword_21148);
    uint64_t v41 = sub_183F0();
    os_log_type_t v42 = sub_184A0();
    BOOL v43 = os_log_type_enabled(v41, v42);
    uint64_t v44 = v102;
    if (v43)
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v45 = 0;
      _os_log_impl(&dword_0, v41, v42, "ClockFlowPlugin does not yet support arbitrary absolute date references", v45, 2u);
      swift_slowDealloc();
    }

    swift_release();
LABEL_44:
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v44, 1, 1, v38);
  }
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v35, v28, v29);
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v33, v35, v29);
  int v55 = (*(uint64_t (**)(char *, uint64_t))(v30 + 88))(v33, v29);
  uint64_t v56 = v103;
  uint64_t v57 = v104;
  if (v55 == enum case for UsoEntity_common_Date.DefinedValues.common_Date_Tomorrow(_:)
    || v55 == enum case for UsoEntity_common_Date.DefinedValues.common_Date_DayBeforeYesterday(_:)
    || v55 == enum case for UsoEntity_common_Date.DefinedValues.common_Date_DayAfterTomorrow(_:))
  {
    goto LABEL_51;
  }
  if (v55 == enum case for UsoEntity_common_Date.DefinedValues.common_Date_Today(_:))
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v35, v29);
    swift_release();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v56 + 56))(v102, 1, 1, v57);
  }
  if (v55 == enum case for UsoEntity_common_Date.DefinedValues.common_Date_Yesterday(_:))
  {
LABEL_51:
    uint64_t v82 = sub_17C00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56))(v95, 1, 1, v82);
    uint64_t v83 = sub_17C10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v83 - 8) + 56))(v96, 1, 1, v83);
    uint64_t v84 = v97;
    sub_17B00();
    sub_17AE0();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v35, v29);
    uint64_t v85 = v102;
    (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v102, v84, v57);
    return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v85, 0, 1, v57);
  }
  else
  {
    uint64_t v86 = *(void (**)(char *, uint64_t))(v30 + 8);
    v86(v35, v29);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v56 + 56))(v102, 1, 1, v57);
    return ((uint64_t (*)(char *, uint64_t))v86)(v33, v29);
  }
}

uint64_t sub_134E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v1 = sub_44E0(&qword_20C88);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_44E0(&qword_20C90);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_17B10();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v46 = v7;
  uint64_t v47 = v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_44E0(&qword_21168);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_180A0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v44 - v19;
  sub_180F0();
  if (!v49)
  {
    if (qword_20BF8 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_18400();
    sub_53AC(v29, (uint64_t)qword_21148);
    uint64_t v30 = sub_183F0();
    os_log_type_t v31 = sub_184B0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_0, v30, v31, "ClockFlowPlugin task contains no reference", v32, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56))(v48, 1, 1, v46);
  }
  uint64_t v45 = v20;
  if (!sub_18050() || (uint64_t v21 = sub_17FC0(), swift_release(), !v21) || (v22 = sub_17FB0(), swift_release(), !v22))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    goto LABEL_9;
  }
  sub_18090();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
LABEL_9:
    sub_53E4((uint64_t)v13, &qword_21168);
    if (qword_20BF8 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_18400();
    sub_53AC(v25, (uint64_t)qword_21148);
    uint64_t v26 = sub_183F0();
    os_log_type_t v27 = sub_184B0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_0, v26, v27, "Could not find listPosition in ClockFlowPlugin task", v28, 2u);
      swift_slowDealloc();
    }

    goto LABEL_14;
  }
  uint64_t v23 = v45;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v45, v13, v14);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v23, v14);
  int v24 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v18, v14);
  if (v24 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Previous(_:)) {
    goto LABEL_24;
  }
  if (v24 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Current(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v23, v14);
LABEL_14:
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56))(v48, 1, 1, v46);
  }
  if (v24 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Next(_:))
  {
LABEL_24:
    uint64_t v34 = sub_17C00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v6, 1, 1, v34);
    uint64_t v35 = sub_17C10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v3, 1, 1, v35);
    sub_17B00();
    sub_17AB0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v23, v14);
    uint64_t v37 = v47;
    uint64_t v36 = v48;
    uint64_t v38 = v46;
    (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))(v48, v10, v46);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v37 + 56))(v36, 0, 1, v38);
  }
  if (qword_20BF8 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_18400();
  sub_53AC(v39, (uint64_t)qword_21148);
  uint64_t v40 = sub_183F0();
  os_log_type_t v41 = sub_184A0();
  if (os_log_type_enabled(v40, v41))
  {
    os_log_type_t v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v42 = 0;
    _os_log_impl(&dword_0, v40, v41, "ClockFlowPlugin does not yet support arbitrary absolute date references", v42, 2u);
    uint64_t v23 = v45;
    swift_slowDealloc();
  }

  swift_release();
  BOOL v43 = *(void (**)(char *, uint64_t))(v15 + 8);
  v43(v23, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56))(v48, 1, 1, v46);
  return ((uint64_t (*)(char *, uint64_t))v43)(v18, v14);
}

_OWORD *sub_13DC8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_13DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_13E34()
{
  uint64_t v0 = sub_18300();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_180E0();
  if (v13 && (uint64_t v4 = sub_18050(), swift_release(), v4) && (v5 = sub_17FD0(), swift_release(), v5))
  {
    swift_release();
  }
  else
  {
    sub_180E0();
    if (v13)
    {
      uint64_t v6 = sub_18060();
      swift_release();
      if (v6)
      {
        swift_release();
        return 0;
      }
    }
    sub_180E0();
    if (v13)
    {
      uint64_t v8 = sub_18050();
      swift_release();
      if (v8)
      {
        uint64_t v9 = sub_17FC0();
        swift_release();
        if (v9)
        {
          swift_release();
          sub_182F0();
          BOOL v10 = sub_182E0();
          (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
          if (v10) {
            return 2;
          }
        }
      }
    }
    sub_180E0();
    if (v13)
    {
      uint64_t v11 = sub_18050();
      swift_release();
      if (v11)
      {
        swift_release();
        return 1;
      }
    }
  }
  return 3;
}

uint64_t sub_14024(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1406C()
{
  uint64_t v0 = sub_18400();
  sub_6220(v0, qword_211A8);
  sub_53AC(v0, (uint64_t)qword_211A8);
  return sub_18310();
}

id sub_140B8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_44E0(&qword_20C98);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v55 - v8;
  uint64_t v10 = sub_17B10();
  uint64_t v64 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v55 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v55 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v55 - v20;
  id v22 = [objc_allocWithZone(v2) init];
  if (!a1) {
    goto LABEL_7;
  }
  swift_retain();
  id v23 = v22;
  sub_18000();
  if (!v68)
  {

    swift_release();
    sub_53E4((uint64_t)v67, &qword_21188);
LABEL_7:
    if (qword_20C00 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_18400();
    sub_53AC(v24, (uint64_t)qword_211A8);
    uint64_t v25 = sub_183F0();
    os_log_type_t v26 = sub_184B0();
    if (os_log_type_enabled(v25, v26))
    {
      os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v27 = 0;
      _os_log_impl(&dword_0, v25, v26, "Task is nil, returning empty ShowClockIntent", v27, 2u);
      swift_slowDealloc();
    }

    swift_release();
    return 0;
  }
  sub_13DC8(v67, v69);
  sub_13DD8((uint64_t)v69, (uint64_t)v67);
  sub_180B0();
  if (swift_dynamicCast())
  {
    uint64_t v63 = v65[0];
    uint64_t v62 = sub_13E34();
    switch((char)v62)
    {
      case 1:
        uint64_t v61 = 0x656D6954776F6873;
        swift_bridgeObjectRelease();
        goto LABEL_18;
      case 3:
        swift_release();
        swift_release_n();

        goto LABEL_21;
      default:
        uint64_t v61 = 0x656D6954776F6873;
        char v34 = sub_18590();
        swift_bridgeObjectRelease();
        if (v34)
        {
LABEL_18:
          sub_121F8(v9);
          uint64_t v35 = v64;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v9, 1, v10) == 1)
          {
            sub_53E4((uint64_t)v9, &qword_20C98);
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v21, v9, v10);
            if (qword_20C00 != -1) {
              swift_once();
            }
            uint64_t v37 = sub_18400();
            sub_53AC(v37, (uint64_t)qword_211A8);
            (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v19, v21, v10);
            uint64_t v38 = sub_183F0();
            os_log_type_t v39 = sub_184B0();
            LODWORD(v59) = v39;
            if (os_log_type_enabled(v38, v39))
            {
              os_log_t v58 = v38;
              uint64_t v40 = (uint8_t *)swift_slowAlloc();
              uint64_t v57 = swift_slowAlloc();
              v67[0] = v57;
              uint64_t v56 = v40;
              *(_DWORD *)uint64_t v40 = 136315138;
              uint64_t v60 = (void (*)(char *, uint64_t))(v40 + 4);
              sub_15438();
              uint64_t v41 = sub_18580();
              v65[0] = sub_15A3C(v41, v42, v67);
              sub_18500();
              swift_bridgeObjectRelease();
              uint64_t v60 = *(void (**)(char *, uint64_t))(v64 + 8);
              v60(v19, v10);
              _os_log_impl(&dword_0, v58, (os_log_type_t)v59, "Using date component offset: %s", v56, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
              uint64_t v60 = *(void (**)(char *, uint64_t))(v35 + 8);
              v60(v19, v10);
            }
            Class isa = sub_17AC0().super.isa;
            [v23 setOffset:isa];

            v60(v21, v10);
          }
        }
        if (!(_BYTE)v62) {
          goto LABEL_34;
        }
        if (v62 == 1)
        {
          uint64_t v61 = 0x65746144776F6873;
LABEL_34:
          char v44 = sub_18590();
          swift_bridgeObjectRelease();
          if ((v44 & 1) == 0)
          {
LABEL_45:
            NSString v54 = sub_18450();
            swift_bridgeObjectRelease();
            [v23 setClockRequestType:v54];

            swift_release_n();
            swift_release();
            _s20HandleIntentStrategyVwxx_0((uint64_t)v69);
            return v23;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        sub_134E4((uint64_t)v7);
        uint64_t v45 = v64;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v7, 1, v10) == 1)
        {
          sub_53E4((uint64_t)v7, &qword_20C98);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v16, v7, v10);
          if (qword_20C00 != -1) {
            swift_once();
          }
          uint64_t v46 = sub_18400();
          sub_53AC(v46, (uint64_t)qword_211A8);
          (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v13, v16, v10);
          uint64_t v47 = sub_183F0();
          os_log_type_t v48 = sub_184B0();
          if (os_log_type_enabled(v47, v48))
          {
            uint64_t v61 = (uint64_t)v47;
            uint64_t v49 = (uint8_t *)swift_slowAlloc();
            uint64_t v60 = (void (*)(char *, uint64_t))swift_slowAlloc();
            v67[0] = (uint64_t)v60;
            uint64_t v59 = v49;
            *(_DWORD *)uint64_t v49 = 136315138;
            sub_15438();
            uint64_t v50 = sub_18580();
            v65[0] = sub_15A3C(v50, v51, v67);
            sub_18500();
            swift_bridgeObjectRelease();
            uint64_t v52 = *(void (**)(char *, uint64_t))(v45 + 8);
            v52(v13, v10);
            uint64_t v47 = v61;
            _os_log_impl(&dword_0, (os_log_t)v61, v48, "Using date component offset: %s", v59, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            uint64_t v52 = *(void (**)(char *, uint64_t))(v45 + 8);
            v52(v13, v10);
          }

          Class v53 = sub_17AC0().super.isa;
          [v23 setOffset:v53];

          v52(v16, v10);
        }
        goto LABEL_45;
    }
  }

  if (qword_20C00 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_18400();
  sub_53AC(v28, (uint64_t)qword_211A8);
  sub_13DD8((uint64_t)v69, (uint64_t)v67);
  uint64_t v29 = sub_183F0();
  os_log_type_t v30 = sub_184A0();
  if (os_log_type_enabled(v29, v30))
  {
    os_log_type_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v31 = 136315138;
    sub_13DD8((uint64_t)v67, (uint64_t)v65);
    uint64_t v32 = sub_18470();
    v65[0] = sub_15A3C(v32, v33, &v66);
    sub_18500();
    swift_bridgeObjectRelease();
    _s20HandleIntentStrategyVwxx_0((uint64_t)v67);
    _os_log_impl(&dword_0, v29, v30, "Receiving unsupported uso task: %s", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_release_n();
LABEL_21:
  }
  else
  {

    swift_release();
    _s20HandleIntentStrategyVwxx_0((uint64_t)v67);
    swift_release();
  }
  _s20HandleIntentStrategyVwxx_0((uint64_t)v69);
  return 0;
}

uint64_t sub_14BE4(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = sub_17FA0();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  uint64_t v3 = sub_17F80();
  v1[7] = v3;
  v1[8] = *(void *)(v3 - 8);
  v1[9] = swift_task_alloc();
  uint64_t v4 = sub_17F60();
  v1[10] = v4;
  v1[11] = *(void *)(v4 - 8);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  return _swift_task_switch(sub_14D78, 0, 0);
}

uint64_t sub_14D78()
{
  NSString v54 = v0;
  if (qword_20C00 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_18400();
  sub_53AC(v1, (uint64_t)qword_211A8);
  uint64_t v2 = sub_183F0();
  os_log_type_t v3 = sub_184B0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "ClockFlowUtils.makeIntentFromParse() called.", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[14];
  uint64_t v7 = v0[10];
  uint64_t v8 = v0[11];

  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v9(v6, v5, v7);
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 88))(v6, v7);
  uint64_t v11 = v0[10];
  if (v10 == enum case for Parse.NLv4IntentOnly(_:))
  {
    (*(void (**)(void, void))(v0[11] + 96))(v0[14], v0[10]);
    swift_getObjectType();
    uint64_t v12 = sub_184C0();
    if (v12)
    {
      uint64_t v13 = v12;
      type metadata accessor for ShowClockIntent();
      id v14 = sub_140B8(v13);
      swift_unknownObjectRelease();
LABEL_11:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      os_log_type_t v26 = (uint64_t (*)(id))v0[1];
      return v26(v14);
    }
    os_log_type_t v39 = sub_183F0();
    os_log_type_t v40 = sub_184A0();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_0, v39, v40, "ClockFlowUtils.makeIntentFromParse USO task is empty", v41, 2u);
      swift_slowDealloc();
    }

    sub_44E0(&qword_20E98);
    sub_BAB4();
    swift_allocError();
    swift_willThrow();
    swift_unknownObjectRelease();
  }
  else if (v10 == enum case for Parse.uso(_:))
  {
    uint64_t v15 = v0[14];
    uint64_t v17 = v0[8];
    uint64_t v16 = v0[9];
    uint64_t v19 = v0[6];
    uint64_t v18 = v0[7];
    uint64_t v20 = v0[4];
    uint64_t v21 = v0[5];
    (*(void (**)(uint64_t, uint64_t))(v0[11] + 96))(v15, v11);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v16, v15, v18);
    sub_17F70();
    uint64_t v22 = sub_17F90();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
    if (v22)
    {
      uint64_t v24 = v0[8];
      uint64_t v23 = v0[9];
      uint64_t v25 = v0[7];
      type metadata accessor for ShowClockIntent();
      id v14 = sub_140B8(v22);
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
      goto LABEL_11;
    }
    char v44 = sub_183F0();
    os_log_type_t v45 = sub_184A0();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v46 = 0;
      _os_log_impl(&dword_0, v44, v45, "ClockFlowUtils.makeIntentFromParse USO task is empty", v46, 2u);
      swift_slowDealloc();
    }
    uint64_t v48 = v0[8];
    uint64_t v47 = v0[9];
    uint64_t v49 = v0[7];

    sub_44E0(&qword_20E98);
    sub_BAB4();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
  }
  else
  {
    v9(v0[13], v0[3], v11);
    uint64_t v28 = sub_183F0();
    os_log_type_t v29 = sub_184A0();
    BOOL v30 = os_log_type_enabled(v28, v29);
    uint64_t v31 = v0[13];
    if (v30)
    {
      os_log_type_t type = v29;
      uint64_t v32 = v0[11];
      uint64_t v33 = v0[12];
      uint64_t v34 = v0[10];
      log = v28;
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 136315138;
      v9(v33, v31, v34);
      uint64_t v36 = sub_18470();
      v0[2] = sub_15A3C(v36, v37, &v53);
      sub_18500();
      swift_bridgeObjectRelease();
      uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
      v38(v31, v34);
      _os_log_impl(&dword_0, log, type, "ClockFlowUtils.makeIntentFromParse Received unsupported parse: %s", v35, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v0[11] + 8);
      v38(v0[13], v0[10]);
    }
    uint64_t v42 = v0[14];
    uint64_t v43 = v0[10];
    sub_44E0(&qword_20E98);
    sub_BAB4();
    swift_allocError();
    swift_willThrow();
    v38(v42, v43);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v50 = (uint64_t (*)(void))v0[1];
  return v50();
}

unint64_t sub_15438()
{
  unint64_t result = qword_211C8[0];
  if (!qword_211C8[0])
  {
    sub_17B10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_211C8);
  }
  return result;
}

uint64_t static ShowClockIntent.shouldSkipDefaultSchemaCheck()()
{
  return 1;
}

uint64_t type metadata accessor for ClockIntents()
{
  return sub_E96C();
}

uint64_t sub_154C0(unsigned int *a1, int a2)
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

unsigned char *sub_15510(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x155ACLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_155D4()
{
  return 0;
}

uint64_t type metadata accessor for ClockIntents.FlowError()
{
  return sub_E96C();
}

uint64_t sub_155F4()
{
  return swift_getWitnessTable();
}

Swift::Int sub_15610()
{
  return sub_18600();
}

void sub_15654()
{
}

Swift::Int sub_1567C()
{
  return sub_18600();
}

uint64_t sub_156CC()
{
  uint64_t v0 = sub_18400();
  sub_6220(v0, qword_212D0);
  sub_53AC(v0, (uint64_t)qword_212D0);
  return sub_18310();
}

uint64_t sub_15718(uint64_t a1)
{
  type metadata accessor for ShowClockIntent();
  type metadata accessor for ShowClockIntentResponse();
  sub_17D20();
  if (qword_20BE0 != -1) {
    swift_once();
  }
  sub_17CF0();
  sub_44E0(&qword_212E8);
  sub_17D10();
  if (qword_20C08 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_18400();
  sub_53AC(v2, (uint64_t)qword_212D0);
  int v3 = sub_183F0();
  os_log_type_t v4 = sub_184B0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "AppResolution completion set.", v5, 2u);
    swift_slowDealloc();
  }

  sub_158E0(a1, (uint64_t)v7);
  sub_15944();
  sub_17CE0();
  sub_17D00();
  _s20HandleIntentStrategyVwxx_0(a1);
  return sub_15998((uint64_t)v7);
}

uint64_t sub_158E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_15944()
{
  unint64_t result = qword_212F0;
  if (!qword_212F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_212F0);
  }
  return result;
}

uint64_t sub_15998(uint64_t a1)
{
  return a1;
}

uint64_t sub_159F0()
{
  uint64_t v0 = sub_18400();
  sub_6220(v0, qword_212F8);
  sub_53AC(v0, (uint64_t)qword_212F8);
  return sub_18310();
}

uint64_t sub_15A3C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_15B10(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_13DD8((uint64_t)v12, *a3);
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
      sub_13DD8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  _s20HandleIntentStrategyVwxx_0((uint64_t)v12);
  return v7;
}

uint64_t sub_15B10(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_18510();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_15CCC(a5, a6);
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
  uint64_t v8 = sub_18540();
  if (!v8)
  {
    sub_18550();
    __break(1u);
LABEL_17:
    uint64_t result = sub_18560();
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

uint64_t sub_15CCC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_15D64(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_15F44(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_15F44(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_15D64(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_15EDC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_18530();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_18550();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_18480();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_18560();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_18550();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_15EDC(uint64_t a1, uint64_t a2)
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
  sub_44E0(&qword_213B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_15F44(char a1, int64_t a2, char a3, char *a4)
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
    sub_44E0(&qword_213B0);
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
  uint64_t result = sub_18560();
  __break(1u);
  return result;
}

uint64_t sub_16094()
{
  uint64_t v0 = sub_44E0(&qword_213B8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unint64_t v3 = (char *)&v19[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_44E0(&qword_212E8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  int64_t v8 = (char *)&v19[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v19[-1] - v9;
  if (qword_20C10 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_18400();
  sub_53AC(v11, (uint64_t)qword_212F8);
  uint64_t v12 = sub_183F0();
  os_log_type_t v13 = sub_184B0();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_0, v12, v13, "ClockFlowFactory: making showClockFlow.", v14, 2u);
    swift_slowDealloc();
  }

  sub_18390();
  sub_18380();
  sub_18370();
  swift_release();
  sub_15718((uint64_t)v19);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  sub_44E0(&qword_213C0);
  swift_allocObject();
  sub_17D30();
  swift_retain();
  sub_44E0(&qword_213C8);
  sub_1685C(&qword_213D0, &qword_213C8);
  sub_17E40();
  uint64_t v15 = sub_17E30();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v19[0] = v15;
  sub_44E0(&qword_213D8);
  sub_1685C(&qword_213E0, &qword_213D8);
  uint64_t v16 = sub_17D40();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v16;
}

uint64_t _s15ClockFlowPlugin0aB7FactoryV04makeB4From5parse07SiriKitB003AnyB0CSgAF5ParseO_tF_0(uint64_t a1)
{
  uint64_t v2 = sub_17F60();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v27 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v27 - v10;
  if (qword_20C10 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_18400();
  uint64_t v13 = sub_53AC(v12, (uint64_t)qword_212F8);
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v32(v11, a1, v2);
  uint64_t v31 = v13;
  id v14 = sub_183F0();
  os_log_type_t v15 = sub_18490();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v28 = a1;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    os_log_type_t v29 = v6;
    uint64_t v34 = v18;
    uint64_t v30 = v3;
    *(_DWORD *)uint64_t v17 = 136315138;
    v32(v9, (uint64_t)v11, v2);
    uint64_t v19 = sub_18470();
    uint64_t v33 = sub_15A3C(v19, v20, &v34);
    uint64_t v3 = v30;
    sub_18500();
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v3 + 8);
    v21(v11, v2);
    _os_log_impl(&dword_0, v14, v15, "Making flow from parse: %s", v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v6 = v29;
    swift_slowDealloc();
    a1 = v28;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v21 = *(void (**)(char *, uint64_t))(v3 + 8);
    v21(v11, v2);
  }

  v32(v6, a1, v2);
  int v22 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  if (v22 == enum case for Parse.NLv4IntentOnly(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
    swift_unknownObjectRelease();
  }
  else
  {
    if (v22 != enum case for Parse.uso(_:))
    {
      uint64_t v24 = sub_183F0();
      os_log_type_t v25 = sub_184A0();
      if (os_log_type_enabled(v24, v25))
      {
        os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v26 = 0;
        _os_log_impl(&dword_0, v24, v25, "ClockFlowPlugin cannot make flow from the provided parse. Exiting.", v26, 2u);
        swift_slowDealloc();
      }

      v21(v6, v2);
      return 0;
    }
    v21(v6, v2);
  }
  if (sub_10054(a1)) {
    return sub_16094();
  }
  return 0;
}

ValueMetadata *type metadata accessor for ClockFlowFactory()
{
  return &type metadata for ClockFlowFactory;
}

uint64_t type metadata accessor for ClockFlowProvider()
{
  return self;
}

uint64_t sub_1685C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_BB10(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for TimeSuggestionsCATsSimple()
{
  uint64_t result = qword_213E8;
  if (!qword_213E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_168EC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1692C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18240();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_44E0(&qword_20C68);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  sub_4524(a1, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_181F0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_458C(a1);
  return v11;
}

uint64_t sub_16AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_18240();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a2, v3);
  uint64_t v7 = sub_18200();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a2, v3);
  return v7;
}

uint64_t sub_16BC0()
{
  return type metadata accessor for TimeSuggestionsCATsSimple();
}

char *ShowClockIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  uint64_t v5 = (char *)[objc_allocWithZone(v2) init];
  uint64_t v6 = &v5[OBJC_IVAR___ShowClockIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id ShowClockIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShowClockIntent();
  return objc_msgSendSuper2(&v2, "init");
}

id ShowClockIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ShowClockIntent();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ShowClockIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_18450();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  return v7;
}

id ShowClockIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_18450();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ShowClockIntent();
  id v6 = objc_msgSendSuper2(&v8, "initWithIdentifier:backingStore:", v5, a3);

  return v6;
}

id ShowClockIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_18450();
  swift_bridgeObjectRelease();
  NSString v8 = sub_18450();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_18410().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  id v10 = [objc_allocWithZone(v5) initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id ShowClockIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_18450();
  swift_bridgeObjectRelease();
  NSString v8 = sub_18450();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_18410().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for ShowClockIntent();
  id v10 = objc_msgSendSuper2(&v12, "initWithDomain:verb:parametersByName:", v7, v8, v9.super.isa);

  return v10;
}

id ShowClockIntent.__deallocating_deinit()
{
  return sub_17930(type metadata accessor for ShowClockIntent);
}

unint64_t ShowClockIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_17968(a1);
}

BOOL sub_1721C(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_17230()
{
  Swift::UInt v1 = *v0;
  sub_185E0();
  sub_185F0(v1);
  return sub_18600();
}

void sub_17278()
{
  sub_185F0(*v0);
}

Swift::Int sub_172A4()
{
  Swift::UInt v1 = *v0;
  sub_185E0();
  sub_185F0(v1);
  return sub_18600();
}

unint64_t sub_172E8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_17968(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1731C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ShowClockIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___ShowClockIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *ShowClockIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___ShowClockIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

uint64_t type metadata accessor for ShowClockIntent()
{
  return self;
}

id ShowClockIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___ShowClockIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShowClockIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id ShowClockIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id ShowClockIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___ShowClockIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ShowClockIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ShowClockIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id ShowClockIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___ShowClockIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ShowClockIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_17738(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___ShowClockIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for ShowClockIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id ShowClockIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.Class isa = sub_18410().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id ShowClockIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___ShowClockIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_18410().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ShowClockIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, "initWithPropertiesByName:", v2.super.isa);

  if (v3) {
  return v3;
  }
}

id ShowClockIntentResponse.__deallocating_deinit()
{
  return sub_17930(type metadata accessor for ShowClockIntentResponse);
}

id sub_17930(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_17968(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for ShowClockIntentResponse()
{
  return self;
}

unint64_t sub_179A0()
{
  unint64_t result = qword_21440;
  if (!qword_21440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21440);
  }
  return result;
}

uint64_t sub_179F4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___ShowClockIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_17A48(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___ShowClockIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ShowClockIntentResponseCode()
{
  return &type metadata for ShowClockIntentResponseCode;
}

uint64_t sub_17AB0()
{
  return DateComponents.weekOfYear.setter();
}

NSDateComponents sub_17AC0()
{
  return DateComponents._bridgeToObjectiveC()();
}

uint64_t sub_17AD0()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_17AE0()
{
  return DateComponents.day.setter();
}

uint64_t sub_17AF0()
{
  return DateComponents.date.getter();
}

uint64_t sub_17B00()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t sub_17B10()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_17B20()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_17B30()
{
  return Date.init()();
}

uint64_t sub_17B40()
{
  return type metadata accessor for Date();
}

uint64_t sub_17B50()
{
  return UUID.uuidString.getter();
}

uint64_t sub_17B60()
{
  return UUID.init()();
}

uint64_t sub_17B70()
{
  return type metadata accessor for UUID();
}

uint64_t sub_17B80()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_17B90()
{
  return type metadata accessor for Locale();
}

uint64_t sub_17BA0()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t sub_17BB0()
{
  return Calendar.date(from:)();
}

uint64_t sub_17BC0()
{
  return Calendar.date(byAdding:to:wrappingComponents:)();
}

uint64_t sub_17BD0()
{
  return static Calendar.current.getter();
}

uint64_t sub_17BE0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_17BF0()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_17C00()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_17C10()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_17C40()
{
  return HandleIntentFlowStrategyAsync.authenticationPolicy.getter();
}

uint64_t sub_17CE0()
{
  return static RCHChildFlowFactoryHelper.makeHandleIntentFlowProducer<A>(strategy:)();
}

uint64_t sub_17CF0()
{
  return static RCHChildFlowFactoryHelper.makeAppResolutionFlowProducer<A, B>(app:)();
}

uint64_t sub_17D00()
{
  return RCHChildFlowProducersAsync.handleIntentFlowProducer.setter();
}

uint64_t sub_17D10()
{
  return RCHChildFlowProducersAsync.appResolutionFlowProducer.setter();
}

uint64_t sub_17D20()
{
  return RCHChildFlowProducersAsync.init()();
}

uint64_t sub_17D30()
{
  return RCHChildFlowFactory.init(producers:)();
}

uint64_t sub_17D40()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_17D50()
{
  return static FlowSearchResult.noFlow.getter();
}

uint64_t sub_17D60()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_17D70()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_17D80()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_17D90(Swift::String refId)
{
}

void sub_17DA0()
{
}

uint64_t sub_17DB0()
{
  return SiriKitIntentHandler.init<A>(app:intentHandler:intent:)();
}

uint64_t sub_17DC0()
{
  return type metadata accessor for SiriKitIntentHandler();
}

uint64_t sub_17DD0()
{
  return static SiriKitIntentExecutionBehavior.embeddedIntentHandler(intentHandler:)();
}

uint64_t sub_17DE0()
{
  return type metadata accessor for SiriKitIntentExecutionBehavior();
}

uint64_t sub_17DF0()
{
  return static DialogPhase.completion.getter();
}

uint64_t sub_17E00()
{
  return type metadata accessor for DialogPhase();
}

uint64_t sub_17E10()
{
  return static ActionForInput.handle()();
}

uint64_t sub_17E20()
{
  return static ActionForInput.ignore()();
}

uint64_t sub_17E30()
{
  return RCHFlowFactory.makeAppResolvingRCHFlow()();
}

uint64_t sub_17E40()
{
  return RCHFlowFactory.init(strategy:childFlowFactory:)();
}

uint64_t sub_17E50()
{
  return TemplatingText.text.getter();
}

uint64_t sub_17E60()
{
  return type metadata accessor for TemplatingText();
}

uint64_t sub_17E70()
{
  return NLContextUpdate.init()();
}

uint64_t sub_17E80()
{
  return type metadata accessor for NLContextUpdate();
}

uint64_t sub_17E90()
{
  return TemplatingResult.sections.getter();
}

uint64_t sub_17EA0()
{
  return type metadata accessor for TemplatingResult();
}

uint64_t sub_17EB0()
{
  return TemplatingSection.content.getter();
}

uint64_t sub_17EC0()
{
  return type metadata accessor for TemplatingSection();
}

uint64_t sub_17EE0()
{
  return RCHFlowStrategyAsync.makeParameterMetadata(intent:)();
}

uint64_t sub_17EF0()
{
  return IntentResolutionRecord.intentResponse.getter();
}

uint64_t sub_17F00()
{
  return IntentResolutionRecord.app.getter();
}

uint64_t sub_17F10()
{
  return IntentResolutionRecord.intent.getter();
}

uint64_t sub_17F20()
{
  return OutputGenerationManifest.init(dialogPhase:_:)();
}

uint64_t sub_17F30()
{
  return type metadata accessor for OutputGenerationManifest();
}

uint64_t sub_17F40()
{
  return Input.parse.getter();
}

uint64_t sub_17F50()
{
  return type metadata accessor for Input();
}

uint64_t sub_17F60()
{
  return type metadata accessor for Parse();
}

uint64_t sub_17F70()
{
  return USOParse.userParse.getter();
}

uint64_t sub_17F80()
{
  return type metadata accessor for USOParse();
}

uint64_t sub_17F90()
{
  return Siri_Nlu_External_UserParse.firstUsoTask.getter();
}

uint64_t sub_17FA0()
{
  return type metadata accessor for Siri_Nlu_External_UserParse();
}

uint64_t sub_17FB0()
{
  return dispatch thunk of CodeGenGlobalArgs.usoListPosition.getter();
}

uint64_t sub_17FC0()
{
  return dispatch thunk of UsoEntity_common_Date.weekOfYear.getter();
}

uint64_t sub_17FD0()
{
  return dispatch thunk of UsoEntity_common_Date.monthOfYear.getter();
}

uint64_t sub_17FE0()
{
  return dispatch thunk of UsoEntity_common_Date.definedValue.getter();
}

uint64_t sub_17FF0()
{
  return type metadata accessor for UsoEntity_common_Date.DefinedValues();
}

uint64_t sub_18000()
{
  return static UsoTask_CodegenConverter.convert(task:)();
}

uint64_t sub_18010()
{
  return dispatch thunk of UsoEntity_common_DateTime.offsetValue.getter();
}

uint64_t sub_18020()
{
  return dispatch thunk of UsoEntity_common_DateTime.definedValue.getter();
}

uint64_t sub_18030()
{
  return type metadata accessor for UsoEntity_common_DateTime.DefinedValues();
}

uint64_t sub_18040()
{
  return dispatch thunk of UsoEntity_common_DateTime.offsetReference.getter();
}

uint64_t sub_18050()
{
  return dispatch thunk of UsoEntity_common_DateTime.date.getter();
}

uint64_t sub_18060()
{
  return dispatch thunk of UsoEntity_common_DateTime.time.getter();
}

uint64_t sub_18070()
{
  return dispatch thunk of UsoEntity_common_DateTime.direction.getter();
}

uint64_t sub_18080()
{
  return UsoEntity_common_Duration.dateComponents(direction:)();
}

uint64_t sub_18090()
{
  return dispatch thunk of UsoEntity_common_ListPosition.definedValue.getter();
}

uint64_t sub_180A0()
{
  return type metadata accessor for UsoEntity_common_ListPosition.DefinedValues();
}

uint64_t sub_180B0()
{
  return type metadata accessor for UsoTask_request_common_DateTime();
}

uint64_t sub_180C0()
{
  return dispatch thunk of UsoEntity_common_OffsetDirection.definedValue.getter();
}

uint64_t sub_180D0()
{
  return type metadata accessor for UsoEntity_common_OffsetDirection.DefinedValues();
}

uint64_t sub_180E0()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceSelect.select.getter();
}

uint64_t sub_180F0()
{
  return dispatch thunk of Uso_VerbTemplate_ReferenceSelect.reference.getter();
}

uint64_t sub_18100()
{
  return dispatch thunk of DialogCalendar.timeDescriptiveAbsolute.getter();
}

uint64_t sub_18110()
{
  return dispatch thunk of DialogCalendar.Builder.build()();
}

uint64_t sub_18120()
{
  return dispatch thunk of DialogCalendar.Builder.withSecs(_:)();
}

uint64_t sub_18130()
{
  return DialogCalendar.Builder.init()();
}

uint64_t sub_18140()
{
  return type metadata accessor for DialogCalendar.Builder();
}

uint64_t sub_18150()
{
  return type metadata accessor for DialogCalendar();
}

uint64_t sub_18160()
{
  return CATWrapper.init(templateDir:options:globals:)();
}

uint64_t sub_18170()
{
  return CATWrapper.__allocating_init(options:globals:)();
}

uint64_t sub_18180()
{
  return CATWrapper.deinit();
}

uint64_t sub_18190()
{
  return SirikitApp.init(app:)();
}

uint64_t sub_181A0()
{
  return type metadata accessor for SirikitApp();
}

uint64_t sub_181B0()
{
  return static CATExecutor.registerBundle(bundle:templateDir:)();
}

uint64_t sub_181C0()
{
  return type metadata accessor for CATExecutor();
}

uint64_t sub_181D0()
{
  return SpeakableString.print.getter();
}

uint64_t sub_181E0()
{
  return type metadata accessor for SpeakableString();
}

uint64_t sub_181F0()
{
  return CATWrapperSimple.init(templateDir:options:globals:)();
}

uint64_t sub_18200()
{
  return CATWrapperSimple.init(useResponseMode:options:)();
}

uint64_t sub_18210()
{
  return CATWrapperSimple.__allocating_init(options:globals:)();
}

uint64_t sub_18220()
{
  return CATWrapperSimple.deinit();
}

uint64_t sub_18230()
{
  return static CATOption.defaultMode.getter();
}

uint64_t sub_18240()
{
  return type metadata accessor for CATOption();
}

uint64_t sub_18250()
{
  return ClockTimeSnippetModel.init(id:date:currentTimeStaticTitle:timeDescriptiveAbsolute:locale:punchoutURL:)();
}

uint64_t sub_18260()
{
  return type metadata accessor for ClockTimeSnippetModel();
}

uint64_t sub_18270()
{
  return type metadata accessor for SiriClockSnippetModels();
}

uint64_t sub_18280()
{
  return SiriTimeAppBundleId.rawValue.getter();
}

uint64_t sub_18290()
{
  return type metadata accessor for SiriTimeAppBundleId();
}

uint64_t sub_182A0()
{
  return type metadata accessor for SiriTimeMeasurement.LogDescription();
}

uint64_t sub_182B0()
{
  return type metadata accessor for SiriTimeMeasurement();
}

uint64_t sub_182C0()
{
  return SiriTimeMeasurement.init(_:log:startTime:)();
}

BOOL sub_182D0()
{
  return SiriTimeFeatureFlagsImpl.isClockSmartEnabled()();
}

BOOL sub_182E0()
{
  return SiriTimeFeatureFlagsImpl.isWeekOfYearEnabled()();
}

uint64_t sub_182F0()
{
  return static SiriTimeFeatureFlagsImpl.instance.getter();
}

uint64_t sub_18300()
{
  return type metadata accessor for SiriTimeFeatureFlagsImpl();
}

uint64_t sub_18310()
{
  return static SiriTimeLog.clockFlow.getter();
}

uint64_t sub_18320()
{
  return PunchOutApp.toResponseFrameworkCommandAction()();
}

uint64_t sub_18330()
{
  return PunchOutApp.url.getter();
}

uint64_t sub_18340()
{
  return type metadata accessor for PunchOutApp();
}

uint64_t sub_18350()
{
  return static BarbaraWalters.stopThePresses(for:)();
}

uint64_t sub_18360()
{
  return static BarbaraWalters.logAndReturnError<A>(context:_:)();
}

uint64_t sub_18370()
{
  return ApplicationContext.deviceState.getter();
}

uint64_t sub_18380()
{
  return static ApplicationContext.shared.getter();
}

uint64_t sub_18390()
{
  return type metadata accessor for ApplicationContext();
}

uint64_t sub_183A0()
{
  return NoOpFlow.init()();
}

uint64_t sub_183B0()
{
  return type metadata accessor for NoOpFlow();
}

uint64_t sub_183C0()
{
  return type metadata accessor for ABCReport();
}

uint64_t sub_183D0()
{
  return App.init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)();
}

uint64_t sub_183E0()
{
  return type metadata accessor for App();
}

uint64_t sub_183F0()
{
  return Logger.logObject.getter();
}

uint64_t sub_18400()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_18410()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_18420()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_18430()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_18440()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_18450()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_18460()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_18470()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_18480()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_18490()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_184A0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_184B0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_184C0()
{
  return SIRINLUUserDialogAct.firstUsoTask.getter();
}

uint64_t sub_184F0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_18500()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_18510()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_18520()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_18530()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_18540()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_18550()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_18560()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_18570(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_18580()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_18590()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_185A0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_185B0()
{
  return Error._code.getter();
}

uint64_t sub_185C0()
{
  return Error._domain.getter();
}

uint64_t sub_185D0()
{
  return Error._userInfo.getter();
}

uint64_t sub_185E0()
{
  return Hasher.init(_seed:)();
}

void sub_185F0(Swift::UInt a1)
{
}

Swift::Int sub_18600()
{
  return Hasher._finalize()();
}

uint64_t sub_18610()
{
  return _typeName(_:qualified:)();
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

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return _swift_dynamicCastUnknownClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
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