uint64_t sub_1000016C4()
{
  uint64_t v0;

  v0 = sub_1000189E0();
  sub_100017E90(v0, qword_100020D30);
  sub_100016D20(v0, (uint64_t)qword_100020D30);
  return sub_1000189D0();
}

uint64_t sub_100001748()
{
  if (qword_1000202D0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1000189E0();

  return sub_100016D20(v0, (uint64_t)qword_100020D30);
}

void sub_1000017AC()
{
  qword_100020D48 = 0x6A2E657069636572;
  unk_100020D50 = 0xEB000000006E6F73;
}

unint64_t sub_1000017D8(char a1)
{
  unint64_t result = 0xD00000000000002ALL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000027;
      break;
    case 2:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 4:
      unint64_t result = 0x6165726C41736168;
      break;
    case 5:
      unint64_t result = 0xD000000000000017;
      break;
    case 6:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 7:
      unint64_t result = 0xD00000000000002BLL;
      break;
    case 8:
    case 15:
      unint64_t result = 0xD000000000000014;
      break;
    case 9:
      unint64_t result = 0xD000000000000025;
      break;
    case 10:
      unint64_t result = 0xD000000000000024;
      break;
    case 11:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 12:
      unint64_t result = 0xD000000000000020;
      break;
    case 13:
      unint64_t result = 0xD000000000000016;
      break;
    case 14:
      unint64_t result = 0xD000000000000018;
      break;
    case 16:
      unint64_t result = 0xD000000000000022;
      break;
    case 17:
      unint64_t result = 0xD000000000000019;
      break;
    case 18:
      unint64_t result = 0xD000000000000019;
      break;
    case 19:
      unint64_t result = 0xD000000000000024;
      break;
    case 20:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000019D4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_1000017D8(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_1000017D8(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100018CC0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_100001A60()
{
  char v1 = *v0;
  sub_100018D40();
  sub_1000017D8(v1);
  sub_100018A80();
  swift_bridgeObjectRelease();
  return sub_100018D60();
}

uint64_t sub_100001AC4()
{
  sub_1000017D8(*v0);
  sub_100018A80();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100001B18()
{
  char v1 = *v0;
  sub_100018D40();
  sub_1000017D8(v1);
  sub_100018A80();
  swift_bridgeObjectRelease();
  return sub_100018D60();
}

uint64_t sub_100001B78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100016830();
  *a1 = result;
  return result;
}

unint64_t sub_100001BA8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000017D8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100001BE4(char a1)
{
  if (a1) {
    return 0x65636E4F6E7572;
  }
  else {
    return 0x7453657069636572;
  }
}

BOOL sub_100001C24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100001C3C()
{
  Swift::UInt v1 = *v0;
  sub_100018D40();
  sub_100018D50(v1);
  return sub_100018D60();
}

void sub_100001C84()
{
  sub_100018D50(*v0);
}

Swift::Int sub_100001CB0()
{
  Swift::UInt v1 = *v0;
  sub_100018D40();
  sub_100018D50(v1);
  return sub_100018D60();
}

uint64_t sub_100001CF4()
{
  return sub_100001BE4(*v0);
}

uint64_t sub_100001CFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100016884(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100001D24()
{
  return 0;
}

void sub_100001D30(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100001D3C(uint64_t a1)
{
  unint64_t v2 = sub_100016CCC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100001D78(uint64_t a1)
{
  unint64_t v2 = sub_100016CCC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100001DB4(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v12 = a4;
  uint64_t v6 = sub_100014284(&qword_100020190);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016C88(a1, a1[3]);
  sub_100016CCC();
  sub_100018DB0();
  char v14 = 0;
  sub_100018C80();
  if (!v4)
  {
    char v13 = 1;
    sub_100018C90();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100001F28@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100016980(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6 & 1;
  }
  return result;
}

uint64_t sub_100001F5C(void *a1)
{
  return sub_100001DB4(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_100001F7C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_100018A70();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100018A60();
  uint64_t v8 = sub_100018A50();
  unint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t result = 0;
  if (v10 >> 60 != 15)
  {
    int v12 = self;
    Class isa = sub_100018870().super.isa;
    v24[0] = 0;
    id v14 = [v12 JSONObjectWithData:isa options:1 error:v24];

    if (v14)
    {
      id v15 = v24[0];
      sub_100018B80();
      sub_100017E38(v8, v10);
      swift_unknownObjectRelease();
      sub_100014284(&qword_100020270);
      if (swift_dynamicCast()) {
        return v23;
      }
      else {
        return 0;
      }
    }
    else
    {
      id v16 = v24[0];
      uint64_t v17 = sub_1000187B0();

      swift_willThrow();
      if (qword_1000202D0 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_1000189E0();
      sub_100016D20(v18, (uint64_t)qword_100020D30);
      swift_bridgeObjectRetain_n();
      v19 = sub_1000189C0();
      os_log_type_t v20 = sub_100018B30();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v22 = v17;
        v21 = (uint8_t *)swift_slowAlloc();
        v24[0] = (id)swift_slowAlloc();
        *(_DWORD *)v21 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_1000150A4(a1, a2, (uint64_t *)v24);
        sub_100018B60();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to parse dictionary from string %s", v21, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        sub_100017E38(v8, v10);
      }
      else
      {
        sub_100017E38(v8, v10);
        swift_bridgeObjectRelease_n();
      }
      swift_errorRelease();

      return 0;
    }
  }
  return result;
}

uint64_t sub_10000231C(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  sub_100014284(&qword_1000201B0);
  v2[10] = swift_task_alloc();
  uint64_t v3 = sub_100014284(&qword_1000200A8);
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  return _swift_task_switch(sub_100002410, 0, 0);
}

uint64_t sub_100002410()
{
  os_log_type_t v20 = v0;
  id v1 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v2 = sub_100018A30();
  id v3 = [v1 initWithSuiteName:v2];
  v0[14] = v3;

  if (v3)
  {
    uint64_t v4 = (void *)swift_task_alloc();
    v0[15] = v4;
    uint64_t v5 = type metadata accessor for AppStoreEvalLighthouseWorker();
    uint64_t v6 = sub_100018428(&qword_100020160, (void (*)(uint64_t))type metadata accessor for AppStoreEvalLighthouseWorker);
    unint64_t v7 = sub_1000146D0();
    unint64_t v8 = sub_100014724();
    *uint64_t v4 = v0;
    v4[1] = sub_10000274C;
    uint64_t v9 = v0[10];
    uint64_t v10 = v0[8];
    return MLHostExtension.loadConfig<A>(context:)(v9, v10, v5, &type metadata for AppStoreEvalLighthouseWorkerConfig, v6, v7, v8);
  }
  else
  {
    if (qword_1000202D0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1000189E0();
    sub_100016D20(v11, (uint64_t)qword_100020D30);
    int v12 = sub_1000189C0();
    os_log_type_t v13 = sub_100018B30();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      v19[0] = swift_slowAlloc();
      *(_DWORD *)id v14 = 136315138;
      v0[5] = sub_1000150A4(0xD00000000000002DLL, 0x8000000100019C80, v19);
      sub_100018B60();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed to instantiate userDefaults with suiteName %s. Exiting early.", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    v19[3] = (uint64_t)&type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    v19[4] = sub_100016E14();
    LOBYTE(v19[0]) = 0;
    id v15 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v16 = sub_1000188C0();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = (uint64_t (*)(uint64_t))v0[1];
    return v17(v16);
  }
}

uint64_t sub_10000274C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100002848, 0, 0);
}

uint64_t sub_100002848()
{
  uint64_t v44 = v0;
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 80);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_1000173D4(v3, &qword_1000201B0);
    if (qword_1000202D0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1000189E0();
    sub_100016D20(v4, (uint64_t)qword_100020D30);
    uint64_t v5 = sub_1000189C0();
    os_log_type_t v6 = sub_100018B30();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unable to parse config. Exiting early.", v7, 2u);
      swift_slowDealloc();
    }
    unint64_t v8 = *(void **)(v0 + 112);

    v42 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v43 = sub_100016E14();
    LOBYTE(v41[0]) = 2;
    id v9 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v10 = sub_1000188C0();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(*(void *)(v0 + 104), v3, v1);
    if (qword_1000202D0 != -1) {
      swift_once();
    }
    uint64_t v11 = *(void **)(v0 + 64);
    uint64_t v12 = sub_1000189E0();
    sub_100016D20(v12, (uint64_t)qword_100020D30);
    id v13 = v11;
    id v14 = sub_1000189C0();
    os_log_type_t v15 = sub_100018B30();
    BOOL v16 = os_log_type_enabled(v14, v15);
    uint64_t v17 = *(void **)(v0 + 64);
    if (v16)
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      v41[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315138;
      uint64_t v19 = sub_100018990();
      *(void *)(v0 + 56) = sub_1000150A4(v19, v20, v41);
      sub_100018B60();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v14, v15, "context.taskName %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    sub_100018920();
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(v0 + 32) == 1
      && (uint64_t v21 = *(void **)(v0 + 112),
          sub_100018990(),
          NSString v22 = sub_100018A30(),
          swift_bridgeObjectRelease(),
          unsigned int v23 = [v21 BOOLForKey:v22],
          v22,
          v23))
    {
      id v24 = *(id *)(v0 + 64);
      v25 = sub_1000189C0();
      os_log_type_t v26 = sub_100018B30();
      BOOL v27 = os_log_type_enabled(v25, v26);
      v28 = *(void **)(v0 + 64);
      if (v27)
      {
        v29 = (uint8_t *)swift_slowAlloc();
        v41[0] = swift_slowAlloc();
        *(_DWORD *)v29 = 136315138;
        uint64_t v30 = sub_100018990();
        *(void *)(v0 + 48) = sub_1000150A4(v30, v31, v41);
        sub_100018B60();
        swift_bridgeObjectRelease();

        _os_log_impl((void *)&_mh_execute_header, v25, v26, "%s has already run and runOnce is true. Exiting early.", v29, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      uint64_t v32 = *(void *)(v0 + 104);
      v33 = *(void **)(v0 + 112);
      uint64_t v34 = *(void *)(v0 + 88);
      uint64_t v35 = *(void *)(v0 + 96);
      v42 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
      unint64_t v43 = sub_100016E14();
      LOBYTE(v41[0]) = 4;
      id v38 = objc_allocWithZone((Class)sub_1000188E0());
      uint64_t v37 = sub_1000188C0();
    }
    else
    {
      uint64_t v32 = *(void *)(v0 + 104);
      v33 = *(void **)(v0 + 112);
      uint64_t v34 = *(void *)(v0 + 88);
      uint64_t v35 = *(void *)(v0 + 96);
      id v36 = objc_allocWithZone((Class)sub_1000188E0());
      uint64_t v37 = sub_1000188D0();
    }
    uint64_t v10 = v37;

    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v32, v34);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  v39 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v39(v10);
}

id sub_100002DB8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v2 = sub_100018A30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }
  id v3 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithSuiteName:v2];

  return v3;
}

uint64_t sub_100002E24(uint64_t a1)
{
  v2[95] = v1;
  v2[94] = a1;
  uint64_t v3 = sub_1000187C0();
  v2[96] = v3;
  v2[97] = *(void *)(v3 - 8);
  v2[98] = swift_task_alloc();
  uint64_t v4 = sub_100018850();
  v2[99] = v4;
  v2[100] = *(void *)(v4 - 8);
  v2[101] = swift_task_alloc();
  v2[102] = swift_task_alloc();
  v2[103] = swift_task_alloc();
  v2[104] = swift_task_alloc();
  v2[105] = swift_task_alloc();
  v2[106] = swift_task_alloc();
  v2[107] = swift_task_alloc();
  sub_100014284(&qword_1000201A0);
  v2[108] = swift_task_alloc();
  v2[109] = swift_task_alloc();
  v2[110] = swift_task_alloc();
  v2[111] = swift_task_alloc();
  v2[112] = swift_task_alloc();
  v2[113] = swift_task_alloc();
  sub_100014284(&qword_1000201A8);
  v2[114] = swift_task_alloc();
  uint64_t v5 = sub_1000189B0();
  v2[115] = v5;
  v2[116] = *(void *)(v5 - 8);
  v2[117] = swift_task_alloc();
  uint64_t v6 = sub_100018970();
  v2[118] = v6;
  v2[119] = *(void *)(v6 - 8);
  v2[120] = swift_task_alloc();
  sub_100014284(&qword_1000201B0);
  v2[121] = swift_task_alloc();
  uint64_t v7 = sub_100014284(&qword_1000200A8);
  v2[122] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[123] = v8;
  v2[124] = *(void *)(v8 + 64);
  v2[125] = swift_task_alloc();
  v2[126] = swift_task_alloc();
  uint64_t v9 = sub_1000189E0();
  v2[127] = v9;
  v2[128] = *(void *)(v9 - 8);
  v2[129] = swift_task_alloc();
  v2[130] = swift_task_alloc();
  v2[131] = swift_task_alloc();
  v2[132] = swift_task_alloc();
  v2[133] = swift_task_alloc();
  v2[134] = swift_task_alloc();
  v2[135] = swift_task_alloc();
  v2[136] = swift_task_alloc();
  v2[137] = swift_task_alloc();
  v2[138] = swift_task_alloc();
  v2[139] = swift_task_alloc();
  v2[140] = swift_task_alloc();
  v2[141] = swift_task_alloc();
  v2[142] = swift_task_alloc();
  v2[143] = swift_task_alloc();
  v2[144] = swift_task_alloc();
  v2[145] = swift_task_alloc();
  v2[146] = swift_task_alloc();
  v2[147] = swift_task_alloc();
  v2[148] = swift_task_alloc();
  v2[149] = swift_task_alloc();
  v2[150] = swift_task_alloc();
  v2[151] = swift_task_alloc();
  v2[152] = swift_task_alloc();
  v2[153] = swift_task_alloc();
  v2[154] = swift_task_alloc();
  v2[155] = swift_task_alloc();
  v2[156] = swift_task_alloc();
  v2[157] = swift_task_alloc();
  v2[158] = swift_task_alloc();
  v2[159] = swift_task_alloc();
  v2[160] = swift_task_alloc();
  v2[161] = swift_task_alloc();
  v2[162] = swift_task_alloc();
  return _swift_task_switch(sub_1000033A8, 0, 0);
}

uint64_t sub_1000033A8()
{
  v56 = v0;
  if (qword_1000202D0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[162];
  uint64_t v2 = v0[128];
  uint64_t v3 = v0[127];
  uint64_t v4 = (void *)v0[94];
  uint64_t v5 = sub_100016D20(v3, (uint64_t)qword_100020D30);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[163] = v6;
  v0[164] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v52 = v6;
  v6(v1, v5, v3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v4;
  id v8 = v4;
  uint64_t v9 = sub_1000189C0();
  os_log_type_t v10 = sub_100018B30();
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = 64;
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = 8;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_100018718;
  *(void *)(v13 + 24) = v7;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_100016DC4;
  *(void *)(v14 + 24) = v13;
  v0[165] = sub_100014284(&qword_1000201B8);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100019310;
  *(void *)(v15 + 32) = sub_100016DA0;
  *(void *)(v15 + 40) = v11;
  *(void *)(v15 + 48) = sub_10001871C;
  *(void *)(v15 + 56) = v12;
  *(void *)(v15 + 64) = sub_100016DEC;
  *(void *)(v15 + 72) = v14;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  os_log_type_t v16 = v10;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    v55[0] = (void *)swift_slowAlloc();
    v54[0] = 0;
    *(_WORD *)uint64_t v17 = 258;
    v17[2] = *(unsigned char *)(v11 + 16);
    swift_release();
    v17[3] = *(unsigned char *)(v12 + 16);
    v53 = v17 + 4;
    swift_release();
    sub_1000156FC((uint64_t *)&v53, v55, (uint64_t)v54, *(uint64_t (**)(void))(v14 + 16));
    uint64_t v18 = v0[162];
    uint64_t v19 = v0[128];
    uint64_t v20 = v0[127];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v9, v16, "Context: %@", v17, 0xCu);
    sub_100014284(&qword_100020218);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v21(v18, v20);
  }
  else
  {
    uint64_t v22 = v0[162];
    uint64_t v23 = v0[128];
    uint64_t v24 = v0[127];

    swift_release();
    swift_release();
    swift_release();
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v21(v22, v24);
  }
  v0[166] = v21;
  sub_100017224(0, &qword_1000201C0);
  id v25 = sub_100002DB8(0xD00000000000002DLL, 0x8000000100019C80);
  v0[167] = v25;
  if (v25)
  {
    os_log_type_t v26 = (void *)swift_task_alloc();
    v0[168] = v26;
    uint64_t v27 = type metadata accessor for AppStoreEvalLighthouseWorker();
    uint64_t v28 = sub_100018428(&qword_100020160, (void (*)(uint64_t))type metadata accessor for AppStoreEvalLighthouseWorker);
    unint64_t v29 = sub_1000146D0();
    unint64_t v30 = sub_100014724();
    *os_log_type_t v26 = v0;
    v26[1] = sub_100003E10;
    uint64_t v31 = v0[121];
    uint64_t v32 = v0[94];
    return MLHostExtension.loadConfig<A>(context:)(v31, v32, v27, &type metadata for AppStoreEvalLighthouseWorkerConfig, v28, v29, v30);
  }
  else
  {
    uint64_t v33 = v0[131];
    uint64_t v34 = v0[127];
    uint64_t v35 = sub_100001748();
    v52(v33, v35, v34);
    id v36 = sub_1000189C0();
    os_log_type_t v37 = sub_100018B30();
    uint64_t v38 = swift_allocObject();
    *(unsigned char *)(v38 + 16) = 32;
    uint64_t v39 = swift_allocObject();
    *(unsigned char *)(v39 + 16) = 8;
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_100019310;
    *(void *)(v40 + 32) = sub_100018720;
    *(void *)(v40 + 40) = v38;
    *(void *)(v40 + 48) = sub_100018724;
    *(void *)(v40 + 56) = v39;
    *(void *)(v40 + 64) = sub_100014FC4;
    *(void *)(v40 + 72) = 0;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v36, v37))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v55[0] = (void *)swift_slowAlloc();
      *(_WORD *)v41 = 258;
      v41[2] = *(unsigned char *)(v38 + 16);
      swift_release();
      uint64_t v41[3] = *(unsigned char *)(v39 + 16);
      swift_release();
      v54[0] = sub_1000150A4(0xD00000000000002DLL, 0x8000000100019C80, (uint64_t *)v55);
      sub_100018B60();
      uint64_t v42 = v0[131];
      uint64_t v43 = v0[127];
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Failed to instantiate userDefaults with suiteName %s. Exiting early.", v41, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v44 = v42;
      uint64_t v45 = v43;
    }
    else
    {
      uint64_t v46 = v0[131];
      uint64_t v47 = v0[127];

      swift_release();
      swift_release();
      uint64_t v44 = v46;
      uint64_t v45 = v47;
    }
    v21(v44, v45);
    v54[3] = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    v54[4] = sub_100016E14();
    LOBYTE(v54[0]) = 1;
    id v48 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v51 = sub_1000188C0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v49 = (uint64_t (*)(uint64_t))v0[1];
    return v49(v51);
  }
}

uint64_t sub_100003E10()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100003F38, 0, 0);
}

uint64_t sub_100003F38()
{
  v748 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0[123];
  uint64_t v3 = v0[122];
  uint64_t v4 = v0[121];
  v742 = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v4, 1, v3) == 1)
  {
    uint64_t v5 = (void (*)(uint64_t, uint64_t, uint64_t))v0[163];
    uint64_t v6 = v0[132];
    uint64_t v7 = v0[127];
    sub_1000173D4(v4, &qword_1000201B0);
    uint64_t v8 = sub_100001748();
    v5(v6, v8, v7);
    uint64_t v9 = sub_1000189C0();
    os_log_type_t v10 = sub_100018B30();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v12 = (void (*)(uint64_t, uint64_t))v1[166];
    uint64_t v13 = v1[132];
    uint64_t v14 = v1[127];
    if (v11)
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = 0;
      *(_WORD *)uint64_t v15 = 0;
      v743[0] = (uint64_t)(v15 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unable to parse config. Exiting early.", v15, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v12(v13, v14);
    uint64_t v40 = (void *)v1[167];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    LOBYTE(v744) = 3;
    id v41 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v703 = sub_1000188C0();

    goto LABEL_82;
  }
  os_log_type_t v16 = (void (*)(uint64_t, uint64_t, uint64_t))v0[163];
  uint64_t v17 = v1[161];
  uint64_t v18 = v1[127];
  uint64_t v19 = v1[126];
  uint64_t v736 = v1[125];
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
  v1[169] = v20;
  v1[170] = (v2 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v20(v19, v4, v3);
  uint64_t v21 = sub_100001748();
  v1[171] = v21;
  v16(v17, v21, v18);
  uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  uint64_t v22 = v2 + 16;
  v1[172] = v23;
  v1[173] = v22 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v23(v736, v19, v3);
  int v24 = *(_DWORD *)(v22 + 64);
  *((_DWORD *)v1 + 113) = v24;
  unint64_t v25 = (v24 + 16) & ~(unint64_t)v24;
  uint64_t v26 = swift_allocObject();
  v20(v26 + v25, v736, v3);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = sub_100016E74;
  *(void *)(v27 + 24) = v26;
  uint64_t v28 = sub_1000189C0();
  os_log_type_t v29 = sub_100018B30();
  uint64_t v30 = swift_allocObject();
  *(unsigned char *)(v30 + 16) = 32;
  uint64_t v31 = swift_allocObject();
  *(unsigned char *)(v31 + 16) = 8;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = sub_100016EEC;
  *(void *)(v32 + 24) = v27;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = sub_100016F14;
  *(void *)(v33 + 24) = v32;
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_100019310;
  *(void *)(v34 + 32) = sub_100018728;
  *(void *)(v34 + 40) = v30;
  *(void *)(v34 + 48) = sub_10001872C;
  *(void *)(v34 + 56) = v31;
  *(void *)(v34 + 64) = sub_100016F3C;
  *(void *)(v34 + 72) = v33;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    v747[0] = 0;
    *(void *)&long long v744 = swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 258;
    v35[2] = *(unsigned char *)(v30 + 16);
    swift_release();
    v35[3] = *(unsigned char *)(v31 + 16);
    v743[0] = (uint64_t)(v35 + 4);
    swift_release();
    sub_10001502C(v743, (uint64_t)v747, (uint64_t *)&v744, *(uint64_t (**)(void))(v33 + 16));
    id v36 = v742;
    os_log_type_t v37 = (void (*)(uint64_t, uint64_t))v742[166];
    uint64_t v38 = v742[161];
    uint64_t v39 = v742[127];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Configuration: %s", v35, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v37(v38, v39);
  }
  else
  {
    id v36 = v742;
    uint64_t v42 = (void (*)(uint64_t, uint64_t))v742[166];
    uint64_t v43 = v742[161];
    uint64_t v44 = v742[127];
    swift_release();
    swift_release();
    swift_release();

    v42(v43, v44);
  }
  uint64_t v45 = v36[119];
  uint64_t v46 = v36[118];
  uint64_t v47 = v36[117];
  uint64_t v48 = v36[116];
  uint64_t v49 = v36[115];
  uint64_t v50 = v36[114];
  uint64_t v51 = swift_allocObject();
  v36[174] = v51;
  *(void *)(v51 + 16) = 0;
  sub_100018930();
  sub_1000189A0();
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v50, 1, v46) != 1)
  {
    (*(void (**)(void, void, void))(v36[119] + 32))(v36[120], v36[114], v36[118]);
    sub_1000188B0();
    uint64_t v74 = sub_100018960();
    uint64_t v76 = v75;
    v36[175] = v75;
    uint64_t v77 = sub_100018950();
    uint64_t v79 = v78;
    v36[176] = v78;
    v80 = (void *)swift_task_alloc();
    v36[177] = v80;
    void *v80 = v36;
    v80[1] = sub_10000A644;
    uint64_t v81 = v36[94];
    uint64_t v82 = v74;
    uint64_t v83 = v76;
    uint64_t v84 = v77;
    uint64_t v85 = v79;
    return static MLHostAsset.getRemoteAsset(context:assetType:assetSpecifier:)(v81, v82, v83, v84, v85);
  }
  sub_1000173D4(v36[114], &qword_1000201A8);
  v740 = (void (*)(uint64_t, uint64_t))v36[166];
  v723 = (void (*)(uint64_t, uint64_t, uint64_t))v36[172];
  v727 = (void (*)(unint64_t, uint64_t, uint64_t))v36[169];
  v52 = (void (*)(uint64_t, uint64_t, uint64_t))v36[163];
  uint64_t v53 = v36[158];
  uint64_t v54 = v36[127];
  uint64_t v55 = v36[126];
  uint64_t v56 = v36[125];
  unint64_t v57 = (*((unsigned __int8 *)v36 + 452) + 16) & ~(unint64_t)*((unsigned __int8 *)v36 + 452);
  uint64_t v720 = v36[171];
  uint64_t v58 = v36[122];
  sub_100017224(0, &qword_1000201D0);
  id v737 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  v36[179] = v737;
  v52(v53, v720, v54);
  v723(v56, v55, v58);
  uint64_t v59 = swift_allocObject();
  v727(v59 + v57, v56, v58);
  v60 = sub_1000189C0();
  os_log_type_t v61 = sub_100018B30();
  uint64_t v62 = swift_allocObject();
  *(unsigned char *)(v62 + 16) = 32;
  uint64_t v63 = swift_allocObject();
  *(unsigned char *)(v63 + 16) = 8;
  uint64_t v64 = swift_allocObject();
  *(void *)(v64 + 16) = sub_100016F88;
  *(void *)(v64 + 24) = v59;
  uint64_t v65 = swift_allocObject();
  *(void *)(v65 + 16) = sub_1000185D4;
  *(void *)(v65 + 24) = v64;
  uint64_t v66 = swift_allocObject();
  *(_OWORD *)(v66 + 16) = xmmword_100019310;
  *(void *)(v66 + 32) = sub_100018730;
  *(void *)(v66 + 40) = v62;
  *(void *)(v66 + 48) = sub_100018734;
  *(void *)(v66 + 56) = v63;
  *(void *)(v66 + 64) = sub_10001860C;
  *(void *)(v66 + 72) = v65;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v60, v61))
  {
    v67 = (uint8_t *)swift_slowAlloc();
    uint64_t v68 = swift_slowAlloc();
    v747[0] = 0;
    *(void *)&long long v744 = v68;
    *(_WORD *)v67 = 258;
    v67[2] = *(unsigned char *)(v62 + 16);
    swift_release();
    v67[3] = *(unsigned char *)(v63 + 16);
    v743[0] = (uint64_t)(v67 + 4);
    swift_release();
    sub_10001502C(v743, (uint64_t)v747, (uint64_t *)&v744, *(uint64_t (**)(void))(v65 + 16));
    v69 = v742;
    uint64_t v70 = v742[158];
    uint64_t v71 = v742[127];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v60, v61, "Recipe: %s", v67, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v72 = v70;
    uint64_t v73 = v71;
  }
  else
  {
    v69 = v742;
    uint64_t v86 = v742[158];
    uint64_t v87 = v742[127];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v72 = v86;
    uint64_t v73 = v87;
  }
  v740(v72, v73);
  sub_100018920();
  v88 = v737;
  if (v69[54] || v69[55] != 0xE000000000000000)
  {
    char v89 = sub_100018CC0();
    swift_bridgeObjectRelease();
    if ((v89 & 1) == 0)
    {
      sub_100018920();
      uint64_t v106 = sub_100001F7C(v69[60], v69[61]);
      swift_bridgeObjectRelease();
      if (!v106)
      {
        v231 = (void (*)(uint64_t, uint64_t, uint64_t))v69[172];
        uint64_t v232 = v69[171];
        v233 = (void (*)(unint64_t, uint64_t, uint64_t))v69[169];
        v234 = (void (*)(uint64_t, uint64_t, uint64_t))v69[163];
        uint64_t v235 = v69[157];
        uint64_t v236 = v69[127];
        uint64_t v237 = v69[126];
        uint64_t v238 = v69[125];
        v239 = v69;
        unint64_t v240 = (*((unsigned __int8 *)v69 + 452) + 16) & ~(unint64_t)*((unsigned __int8 *)v69 + 452);
        uint64_t v241 = v239[122];
        v234(v235, v232, v236);
        v231(v238, v237, v241);
        uint64_t v242 = swift_allocObject();
        v233(v242 + v240, v238, v241);
        v243 = sub_1000189C0();
        os_log_type_t v244 = sub_100018B40();
        uint64_t v245 = swift_allocObject();
        *(unsigned char *)(v245 + 16) = 32;
        uint64_t v246 = swift_allocObject();
        *(unsigned char *)(v246 + 16) = 8;
        uint64_t v247 = swift_allocObject();
        *(void *)(v247 + 16) = sub_100016FB8;
        *(void *)(v247 + 24) = v242;
        uint64_t v248 = swift_allocObject();
        *(void *)(v248 + 16) = sub_1000185D8;
        *(void *)(v248 + 24) = v247;
        uint64_t v249 = swift_allocObject();
        *(_OWORD *)(v249 + 16) = xmmword_100019310;
        *(void *)(v249 + 32) = sub_100018738;
        *(void *)(v249 + 40) = v245;
        *(void *)(v249 + 48) = sub_10001873C;
        *(void *)(v249 + 56) = v246;
        *(void *)(v249 + 64) = sub_100018610;
        *(void *)(v249 + 72) = v248;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v243, v244))
        {
          v250 = (uint8_t *)swift_slowAlloc();
          uint64_t v251 = swift_slowAlloc();
          v747[0] = 0;
          *(void *)&long long v744 = v251;
          *(_WORD *)v250 = 258;
          v250[2] = *(unsigned char *)(v245 + 16);
          swift_release();
          v250[3] = *(unsigned char *)(v246 + 16);
          v743[0] = (uint64_t)(v250 + 4);
          swift_release();
          sub_10001502C(v743, (uint64_t)v747, (uint64_t *)&v744, *(uint64_t (**)(void))(v248 + 16));
          v252 = v742;
          uint64_t v253 = v742[157];
          uint64_t v254 = v742[127];
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v243, v244, "Failed to parse recipeString into dictionary: %s", v250, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v255 = v253;
          uint64_t v256 = v254;
        }
        else
        {
          v252 = v742;
          uint64_t v303 = v742[157];
          uint64_t v304 = v742[127];
          swift_release();
          swift_release();
          swift_release();

          uint64_t v255 = v303;
          uint64_t v256 = v304;
        }
        v740(v255, v256);
        v305 = (void *)v252[167];
        uint64_t v185 = v252[126];
        uint64_t v186 = v252[123];
        uint64_t v187 = v252[122];
        v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
        unint64_t v746 = sub_100016E14();
        LOBYTE(v744) = 6;
        id v306 = objc_allocWithZone((Class)sub_1000188E0());
        uint64_t v703 = sub_1000188C0();

        goto LABEL_77;
      }
      sub_10001248C(v106);
      swift_bridgeObjectRelease();
      Class isa = sub_1000189F0().super.isa;
      swift_bridgeObjectRelease();
      [v737 setRecipe:isa];

      goto LABEL_25;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v90 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69[100] + 56);
  v90(v69[113], 1, 1, v69[99]);
  sub_100018980();
  v733 = v90;
  if (v91)
  {
    uint64_t v92 = v69[106];
    uint64_t v721 = v69[100];
    uint64_t v730 = v69[99];
    uint64_t v93 = v69[98];
    uint64_t v94 = v69[97];
    uint64_t v725 = v69[96];
    ((void (*)(void, uint64_t, uint64_t))v90)(v69[112], 1, 1);
    uint64_t v95 = enum case for URL.DirectoryHint.inferFromPath(_:);
    uint64_t v96 = sub_1000187C0();
    v97 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v96 - 8) + 104);
    v97(v93, v95, v96);
    sub_100018830();
    v742[69] = 0xD000000000000012;
    v742[70] = 0x8000000100019DA0;
    uint64_t v98 = v95;
    v69 = v742;
    v97(v93, v98, v96);
    sub_100017780();
    sub_100018840();
    (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v93, v725);
    swift_bridgeObjectRelease();
    v99 = *(void (**)(uint64_t, uint64_t))(v721 + 8);
    v99(v92, v730);
    id v100 = [self defaultManager];
    sub_100018810();
    NSString v101 = sub_100018A30();
    swift_bridgeObjectRelease();
    LODWORD(v92) = [v100 fileExistsAtPath:v101];

    if (v92)
    {
      uint64_t v102 = v742[113];
      uint64_t v103 = v742[107];
      uint64_t v104 = v742[100];
      uint64_t v105 = v742[99];
      sub_1000173D4(v102, &qword_1000201A0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 32))(v102, v103, v105);
      v733(v102, 0, 1, v105);
    }
    else
    {
      v99(v742[107], v742[99]);
    }
  }
  uint64_t v125 = v69[111];
  uint64_t v126 = v69[100];
  uint64_t v127 = v69[99];
  sub_100017DCC(v69[113], v125, &qword_1000201A0);
  v128 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v126 + 48);
  LODWORD(v127) = v128(v125, 1, v127);
  sub_1000173D4(v125, &qword_1000201A0);
  if (v127 == 1)
  {
    ((void (*)(void, void, void))v69[163])(v69[156], v69[171], v69[127]);
    v129 = sub_1000189C0();
    os_log_type_t v130 = sub_100018B30();
    BOOL v131 = os_log_type_enabled(v129, v130);
    uint64_t v132 = v69[156];
    uint64_t v133 = v69[127];
    v728 = v128;
    if (v131)
    {
      v134 = (uint8_t *)swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = 0;
      *(_WORD *)v134 = 0;
      v743[0] = (uint64_t)(v134 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v129, v130, "Didn't find a recipe in taskParameters. Checking mobileAssets.", v134, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v740(v132, v133);
    v69 = v742;
    uint64_t v135 = v742[174];
    swift_beginAccess();
    if (!*(void *)(v135 + 16))
    {
      ((void (*)(void, void, void))v742[163])(v742[155], v742[171], v742[127]);
      v152 = sub_1000189C0();
      os_log_type_t v153 = sub_100018B40();
      BOOL v154 = os_log_type_enabled(v152, v153);
      uint64_t v155 = v742[155];
      uint64_t v156 = v742[127];
      if (v154)
      {
        v157 = (uint8_t *)swift_slowAlloc();
        v747[0] = 0;
        *(void *)&long long v744 = 0;
        *(_WORD *)v157 = 0;
        v743[0] = (uint64_t)(v157 + 2);
        sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v152, v153, "No MobileAsset found.", v157, 2u);
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      v740(v155, v156);
      v184 = (void *)v742[167];
      uint64_t v185 = v742[126];
      uint64_t v186 = v742[123];
      uint64_t v187 = v742[122];
      uint64_t v188 = v742[113];
      v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
      unint64_t v746 = sub_100016E14();
      char v189 = 7;
      goto LABEL_76;
    }
    swift_retain();
    sub_1000188A0();
    if (qword_1000202D8 != -1) {
      swift_once();
    }
    uint64_t v136 = v742[106];
    uint64_t v718 = v742[112];
    uint64_t v137 = v742[104];
    uint64_t v138 = v742[100];
    uint64_t v139 = v742[99];
    uint64_t v140 = v742[98];
    uint64_t v141 = v742[97];
    uint64_t v711 = v742[96];
    uint64_t v142 = unk_100020D50;
    v742[63] = qword_100020D48;
    v742[64] = v142;
    uint64_t v143 = enum case for URL.DirectoryHint.inferFromPath(_:);
    unsigned int v713 = enum case for URL.DirectoryHint.inferFromPath(_:);
    uint64_t v144 = sub_1000187C0();
    v712 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v144 - 8) + 104);
    v712(v140, v143, v144);
    sub_100017780();
    swift_bridgeObjectRetain();
    sub_100018840();
    (*(void (**)(uint64_t, uint64_t))(v141 + 8))(v140, v711);
    swift_bridgeObjectRelease();
    v145 = *(void (**)(uint64_t, uint64_t))(v138 + 8);
    v145(v137, v139);
    sub_1000187D0();
    v145(v136, v139);
    v733(v718, 1, 1, v139);
    v712(v140, v713, v144);
    sub_100018830();
    id v146 = [self defaultManager];
    sub_100018810();
    NSString v147 = sub_100018A30();
    swift_bridgeObjectRelease();
    LODWORD(v137) = [v146 fileExistsAtPath:v147];
    swift_release();

    if (v137)
    {
      uint64_t v148 = v742[113];
      uint64_t v149 = v742[105];
      uint64_t v150 = v742[100];
      uint64_t v151 = v742[99];
      sub_1000173D4(v148, &qword_1000201A0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v150 + 32))(v148, v149, v151);
      v733(v148, 0, 1, v151);
    }
    else
    {
      v145(v742[105], v742[99]);
    }
    v128 = v728;
  }
  uint64_t v158 = v69[110];
  uint64_t v159 = v69[99];
  sub_100017DCC(v69[113], v158, &qword_1000201A0);
  if (v128(v158, 1, v159) == 1)
  {
    uint64_t v160 = v69[171];
    v161 = (void (*)(uint64_t, uint64_t, uint64_t))v69[163];
    uint64_t v162 = v69[153];
    uint64_t v163 = v69[127];
    sub_1000173D4(v69[110], &qword_1000201A0);
    v161(v162, v160, v163);
    v164 = sub_1000189C0();
    os_log_type_t v165 = sub_100018B40();
    BOOL v166 = os_log_type_enabled(v164, v165);
    uint64_t v167 = v69[153];
    uint64_t v168 = v69[127];
    if (v166)
    {
      v169 = (uint8_t *)swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = 0;
      *(_WORD *)v169 = 0;
      v743[0] = (uint64_t)(v169 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v164, v165, "Unable to get recipe from task folder or mobileAssets", v169, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v740(v167, v168);
    v184 = (void *)v69[167];
    uint64_t v185 = v69[126];
    uint64_t v186 = v69[123];
    uint64_t v187 = v69[122];
    uint64_t v188 = v69[113];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    char v189 = 8;
LABEL_76:
    LOBYTE(v744) = v189;
    id v293 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v703 = sub_1000188C0();

    sub_1000173D4(v188, &qword_1000201A0);
LABEL_77:
    (*(void (**)(uint64_t, uint64_t))(v186 + 8))(v185, v187);
LABEL_81:
    swift_release();
LABEL_82:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v301 = (uint64_t (*)(uint64_t))v742[1];
    return v301(v703);
  }
  (*(void (**)(void, void, void))(v69[100] + 32))(v69[103], v69[110], v69[99]);
  uint64_t v201 = sub_100018860();
  unint64_t v203 = v202;
  v204 = (id *)(v69 + 90);
  v205 = self;
  v206.super.Class isa = sub_100018870().super.isa;
  uint64_t v207 = _swiftEmptyArrayStorage[2];
  if (v207)
  {
    uint64_t v208 = 0;
    v209 = &_swiftEmptyArrayStorage[4];
    do
    {
      uint64_t v211 = *v209++;
      uint64_t v210 = v211;
      if ((v211 & ~v208) == 0) {
        uint64_t v210 = 0;
      }
      v208 |= v210;
      --v207;
    }
    while (v207);
  }
  else
  {
    uint64_t v208 = 0;
  }
  swift_bridgeObjectRelease();
  id *v204 = 0;
  id v307 = [v205 JSONObjectWithData:v206.super.isa options:v208 error:v69 + 90];

  id v308 = *v204;
  if (!v307)
  {
    v316 = v308;
    uint64_t v317 = sub_1000187B0();

    swift_willThrow();
    sub_100017838(v201, v203);
    ((void (*)(void, void, void))v69[163])(v69[130], v69[171], v69[127]);
    uint64_t v170 = swift_allocObject();
    *(void *)(v170 + 16) = v317;
    swift_errorRetain();
    v171 = sub_1000189C0();
    os_log_type_t v172 = sub_100018B40();
    uint64_t v173 = swift_allocObject();
    *(unsigned char *)(v173 + 16) = 32;
    uint64_t v174 = swift_allocObject();
    *(unsigned char *)(v174 + 16) = 8;
    uint64_t v175 = swift_allocObject();
    *(void *)(v175 + 16) = sub_1000177D4;
    *(void *)(v175 + 24) = v170;
    uint64_t v176 = swift_allocObject();
    *(void *)(v176 + 16) = sub_1000185F8;
    *(void *)(v176 + 24) = v175;
    uint64_t v177 = swift_allocObject();
    *(_OWORD *)(v177 + 16) = xmmword_100019310;
    *(void *)(v177 + 32) = sub_1000187A0;
    *(void *)(v177 + 40) = v173;
    *(void *)(v177 + 48) = sub_1000187A4;
    *(void *)(v177 + 56) = v174;
    *(void *)(v177 + 64) = sub_100018640;
    *(void *)(v177 + 72) = v176;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v171, v172))
    {
      v178 = (uint8_t *)swift_slowAlloc();
      uint64_t v179 = swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = v179;
      *(_WORD *)v178 = 258;
      v178[2] = *(unsigned char *)(v173 + 16);
      swift_release();
      v178[3] = *(unsigned char *)(v174 + 16);
      v743[0] = (uint64_t)(v178 + 4);
      swift_release();
      sub_10001502C(v743, (uint64_t)v747, (uint64_t *)&v744, *(uint64_t (**)(void))(v176 + 16));
      uint64_t v180 = v69[130];
      uint64_t v181 = v69[127];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v171, v172, "Got error when reading recipe file: %s", v178, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v182 = v180;
      uint64_t v183 = v181;
    }
    else
    {
      uint64_t v190 = v69[130];
      uint64_t v191 = v69[127];
      swift_release();
      swift_release();
      swift_release();

      uint64_t v182 = v190;
      uint64_t v183 = v191;
    }
    v740(v182, v183);
    v192 = (void *)v69[167];
    uint64_t v193 = v69[126];
    uint64_t v194 = v69[123];
    uint64_t v195 = v69[122];
    uint64_t v196 = v69[113];
    uint64_t v197 = v69[103];
    uint64_t v198 = v742[100];
    uint64_t v199 = v742[99];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    LOBYTE(v744) = 10;
    id v200 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v703 = sub_1000188C0();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v198 + 8))(v197, v199);
    sub_1000173D4(v196, &qword_1000201A0);
    (*(void (**)(uint64_t, uint64_t))(v194 + 8))(v193, v195);
    goto LABEL_81;
  }
  uint64_t v309 = (uint64_t)(v69 + 10);
  sub_100018B80();
  swift_unknownObjectRelease();
  sub_100017890((uint64_t)(v69 + 10), (uint64_t)(v69 + 6));
  sub_100014284(&qword_1000201F0);
  if (!swift_dynamicCast())
  {
    ((void (*)(void, void, void))v69[163])(v69[154], v69[171], v69[127]);
    v336 = sub_1000189C0();
    os_log_type_t v337 = sub_100018B40();
    BOOL v338 = os_log_type_enabled(v336, v337);
    uint64_t v339 = v69[154];
    uint64_t v340 = v69[127];
    if (v338)
    {
      v341 = (uint8_t *)swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = 0;
      *(_WORD *)v341 = 0;
      v743[0] = (uint64_t)(v341 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
      v69 = v742;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v336, v337, "Unable to parse recipe into dictionary.", v341, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v740(v339, v340);
    v407 = (void *)v69[167];
    uint64_t v741 = v69[126];
    uint64_t v408 = v69[123];
    uint64_t v734 = v69[122];
    uint64_t v409 = v69[113];
    uint64_t v410 = v69[103];
    uint64_t v411 = v69[100];
    uint64_t v412 = v742[99];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    LOBYTE(v744) = 9;
    id v413 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v703 = sub_1000188C0();
    sub_100017838(v201, v203);

    sub_1000178EC(v309);
    (*(void (**)(uint64_t, uint64_t))(v411 + 8))(v410, v412);
    sub_1000173D4(v409, &qword_1000201A0);
    (*(void (**)(uint64_t, uint64_t))(v408 + 8))(v741, v734);
    goto LABEL_81;
  }
  uint64_t v310 = v69[113];
  uint64_t v311 = v69[103];
  uint64_t v312 = v69[100];
  uint64_t v313 = v69[99];
  Class v314 = sub_1000189F0().super.isa;
  swift_bridgeObjectRelease();
  [v737 setRecipe:v314];
  unint64_t v315 = v203;
  v88 = v737;
  sub_100017838(v201, v315);

  sub_1000178EC((uint64_t)(v69 + 10));
  (*(void (**)(uint64_t, uint64_t))(v312 + 8))(v311, v313);
  sub_1000173D4(v310, &qword_1000201A0);
LABEL_25:
  v738 = v69 + 75;
  ((void (*)(void, void, void))v69[163])(v69[152], v69[171], v69[127]);
  uint64_t v108 = swift_allocObject();
  *(void *)(v108 + 16) = v88;
  uint64_t v109 = swift_allocObject();
  *(void *)(v109 + 16) = sub_100017058;
  *(void *)(v109 + 24) = v108;
  id v110 = v88;
  v111 = sub_1000189C0();
  v112 = v69;
  os_log_type_t v113 = sub_100018B30();
  uint64_t v114 = swift_allocObject();
  *(unsigned char *)(v114 + 16) = 32;
  uint64_t v115 = swift_allocObject();
  *(unsigned char *)(v115 + 16) = 8;
  uint64_t v116 = swift_allocObject();
  *(void *)(v116 + 16) = sub_1000170C8;
  *(void *)(v116 + 24) = v109;
  uint64_t v117 = swift_allocObject();
  *(void *)(v117 + 16) = sub_1000185DC;
  *(void *)(v117 + 24) = v116;
  uint64_t v118 = swift_allocObject();
  *(_OWORD *)(v118 + 16) = xmmword_100019310;
  *(void *)(v118 + 32) = sub_100018740;
  *(void *)(v118 + 40) = v114;
  *(void *)(v118 + 48) = sub_100018744;
  *(void *)(v118 + 56) = v115;
  *(void *)(v118 + 64) = sub_100018614;
  *(void *)(v118 + 72) = v117;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v111, v113))
  {
    v119 = (uint8_t *)swift_slowAlloc();
    uint64_t v120 = swift_slowAlloc();
    v747[0] = 0;
    *(void *)&long long v744 = v120;
    *(_WORD *)v119 = 258;
    v119[2] = *(unsigned char *)(v114 + 16);
    swift_release();
    v119[3] = *(unsigned char *)(v115 + 16);
    v743[0] = (uint64_t)(v119 + 4);
    swift_release();
    sub_10001502C(v743, (uint64_t)v747, (uint64_t *)&v744, *(uint64_t (**)(void))(v117 + 16));
    uint64_t v121 = v112[152];
    uint64_t v122 = v112[127];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v111, v113, "worker.recipe: %s", v119, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v123 = v121;
    uint64_t v124 = v122;
  }
  else
  {
    uint64_t v212 = v112[152];
    uint64_t v213 = v112[127];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v123 = v212;
    uint64_t v124 = v213;
  }
  v740(v123, v124);
  uint64_t v214 = v112[174];
  if (os_variant_has_internal_diagnostics()) {
    uint64_t v215 = 1001;
  }
  else {
    uint64_t v215 = 5001;
  }
  sub_100017224(0, &qword_1000201D8);
  sub_100018990();
  id v216 = sub_100012BBC(0x74736F484C4DLL, 0xE600000000000000, v215);
  [v110 setTriExperimentIdentifiers:v216];

  swift_beginAccess();
  uint64_t v217 = v112[109];
  uint64_t v218 = v112[100];
  uint64_t v219 = v112[99];
  if (*(void *)(v214 + 16))
  {
    swift_retain();
    sub_1000188A0();
    swift_release();
    v220 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v218 + 56);
    v220(v217, 0, 1, v219);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v218 + 48))(v217, 1, v219) != 1)
    {
      v221 = v742;
      uint64_t v222 = v742[106];
      uint64_t v223 = v742[102];
      uint64_t v224 = v742[100];
      uint64_t v225 = v742[99];
      (*(void (**)(uint64_t, void, uint64_t))(v224 + 32))(v223, v742[109], v225);
      sub_1000187D0();
      sub_1000187F0();
      swift_bridgeObjectRelease();
      sub_100018800(v226);
      v228 = v227;
      v229 = *(void (**)(uint64_t, uint64_t))(v224 + 8);
      v229(v222, v225);
      [v110 setModelsURL:v228];

      v229(v223, v225);
      v230 = v738;
      goto LABEL_69;
    }
  }
  else
  {
    v220 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v218 + 56);
    v220(v112[109], 1, 1, v112[99]);
  }
  v230 = v738;
  v221 = v742;
  sub_1000173D4(v742[109], &qword_1000201A0);
LABEL_69:
  uint64_t v257 = swift_allocObject();
  v221[180] = v257;
  *(void *)(v257 + 16) = 0;
  id v258 = [v110 recipe];
  uint64_t v259 = sub_100018A00();

  sub_1000127F4(v259);
  swift_bridgeObjectRelease();
  Class v260 = sub_1000189F0().super.isa;
  swift_bridgeObjectRelease();
  v221[75] = *(void *)(v257 + 16);
  id v739 = [v110 checkIfModelShouldBeDownloaded:v260 outError:v230];
  v221[181] = v739;

  v261 = (void *)v221[75];
  v262 = *(void **)(v257 + 16);
  *(void *)(v257 + 16) = v261;
  id v263 = v261;

  uint64_t v264 = v221[171];
  v265 = (void (*)(void, uint64_t, uint64_t))v221[163];
  uint64_t v266 = v221[127];
  if (*(void *)(v257 + 16))
  {
    v265(v221[151], v264, v266);
    swift_retain();
    v267 = sub_1000189C0();
    os_log_type_t v268 = sub_100018B30();
    uint64_t v269 = swift_allocObject();
    *(unsigned char *)(v269 + 16) = 64;
    uint64_t v270 = swift_allocObject();
    *(unsigned char *)(v270 + 16) = 8;
    uint64_t v271 = swift_allocObject();
    *(void *)(v271 + 16) = sub_100018714;
    *(void *)(v271 + 24) = v257;
    uint64_t v272 = swift_allocObject();
    *(_OWORD *)(v272 + 16) = xmmword_100019310;
    *(void *)(v272 + 32) = sub_100018798;
    *(void *)(v272 + 40) = v269;
    *(void *)(v272 + 48) = sub_10001879C;
    *(void *)(v272 + 56) = v270;
    *(void *)(v272 + 64) = sub_10001863C;
    *(void *)(v272 + 72) = v271;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v273 = v268;
    if (os_log_type_enabled(v267, v268))
    {
      v274 = (uint8_t *)swift_slowAlloc();
      v747[0] = (void *)swift_slowAlloc();
      *(void *)&long long v744 = 0;
      *(_WORD *)v274 = 258;
      v274[2] = *(unsigned char *)(v269 + 16);
      swift_release();
      v274[3] = *(unsigned char *)(v270 + 16);
      v743[0] = (uint64_t)(v274 + 4);
      swift_release();
      sub_1000156FC(v743, v747, (uint64_t)&v744, *(uint64_t (**)(void))(v271 + 16));
      uint64_t v275 = v221[151];
      uint64_t v276 = v742[127];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v267, v273, "Got error getting data processor: %@", v274, 0xCu);
      sub_100014284(&qword_100020218);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v221 = v742;
      uint64_t v277 = v275;
      uint64_t v278 = v276;
    }
    else
    {
      uint64_t v294 = v221[151];
      uint64_t v295 = v221[127];
      swift_release();
      swift_release();
      swift_release();

      uint64_t v277 = v294;
      uint64_t v278 = v295;
    }
    v740(v277, v278);
    v296 = (void *)v221[167];
    uint64_t v297 = v221[126];
    uint64_t v298 = v221[123];
    uint64_t v299 = v221[122];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    LOBYTE(v744) = 11;
    id v300 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v703 = sub_1000188C0();

    (*(void (**)(uint64_t, uint64_t))(v298 + 8))(v297, v299);
    goto LABEL_80;
  }
  v732 = v220;
  v265(v221[150], v264, v266);
  uint64_t v279 = swift_allocObject();
  *(void *)(v279 + 16) = v110;
  id v726 = v110;
  v280 = sub_1000189C0();
  os_log_type_t v281 = sub_100018B30();
  uint64_t v282 = swift_allocObject();
  *(unsigned char *)(v282 + 16) = 64;
  uint64_t v283 = swift_allocObject();
  *(unsigned char *)(v283 + 16) = 8;
  uint64_t v284 = swift_allocObject();
  *(void *)(v284 + 16) = sub_100017124;
  *(void *)(v284 + 24) = v279;
  uint64_t v285 = swift_allocObject();
  *(void *)(v285 + 16) = sub_100018600;
  *(void *)(v285 + 24) = v284;
  uint64_t v286 = swift_allocObject();
  *(_OWORD *)(v286 + 16) = xmmword_100019310;
  *(void *)(v286 + 32) = sub_100018748;
  *(void *)(v286 + 40) = v282;
  *(void *)(v286 + 48) = sub_10001874C;
  *(void *)(v286 + 56) = v283;
  *(void *)(v286 + 64) = sub_100018618;
  *(void *)(v286 + 72) = v285;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  os_log_type_t v287 = v281;
  if (os_log_type_enabled(v280, v281))
  {
    v288 = (uint8_t *)swift_slowAlloc();
    v747[0] = (void *)swift_slowAlloc();
    *(void *)&long long v744 = 0;
    *(_WORD *)v288 = 258;
    v288[2] = *(unsigned char *)(v282 + 16);
    swift_release();
    v288[3] = *(unsigned char *)(v283 + 16);
    v743[0] = (uint64_t)(v288 + 4);
    swift_release();
    sub_1000156FC(v743, v747, (uint64_t)&v744, *(uint64_t (**)(void))(v285 + 16));
    uint64_t v289 = v221[150];
    uint64_t v290 = v221[127];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v280, v287, "Trial experiment identifiers: %@", v288, 0xCu);
    sub_100014284(&qword_100020218);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v291 = v289;
    uint64_t v292 = v290;
  }
  else
  {
    uint64_t v318 = v221[150];
    uint64_t v319 = v221[127];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v291 = v318;
    uint64_t v292 = v319;
  }
  v740(v291, v292);
  uint64_t v320 = v221[174];
  uint64_t v321 = swift_allocObject();
  v221[182] = v321;
  sub_100018850();
  uint64_t v729 = v257;
  uint64_t v731 = v321;
  *(void *)(v321 + 16) = _swiftEmptyArrayStorage;
  v322 = (uint64_t *)(v321 + 16);
  uint64_t v323 = v221[108];
  uint64_t v324 = v221[100];
  uint64_t v325 = v221[99];
  if (!*(void *)(v320 + 16))
  {
    v732(v221[108], 1, 1, v221[99]);
    goto LABEL_100;
  }
  swift_retain();
  sub_1000188A0();
  swift_release();
  v732(v323, 0, 1, v325);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v324 + 48))(v323, 1, v325) == 1)
  {
LABEL_100:
    uint64_t v342 = v742[171];
    v343 = (void (*)(uint64_t, uint64_t, uint64_t))v742[163];
    uint64_t v344 = v742[149];
    uint64_t v345 = v742[127];
    sub_1000173D4(v742[108], &qword_1000201A0);
    v343(v344, v342, v345);
    v346 = sub_1000189C0();
    os_log_type_t v347 = sub_100018B30();
    BOOL v348 = os_log_type_enabled(v346, v347);
    uint64_t v349 = v742[149];
    uint64_t v350 = v742[127];
    if (v348)
    {
      v351 = (uint8_t *)swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = 0;
      *(_WORD *)v351 = 0;
      v743[0] = (uint64_t)(v351 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v346, v347, "No task folder found", v351, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v740(v349, v350);
    goto LABEL_104;
  }
  (*(void (**)(void, void, void))(v742[100] + 32))(v742[101], v742[108], v742[99]);
  id v326 = [self defaultManager];
  sub_1000187E0();
  NSString v327 = sub_100018A30();
  swift_bridgeObjectRelease();
  v742[85] = 0;
  id v328 = [v326 contentsOfDirectoryAtPath:v327 error:v742 + 85];

  v329 = (void *)v742[85];
  if (!v328)
  {
    uint64_t v446 = v742[171];
    v447 = (void (*)(uint64_t, uint64_t, uint64_t))v742[163];
    uint64_t v448 = v742[129];
    uint64_t v449 = v742[127];
    id v450 = v329;
    uint64_t v451 = sub_1000187B0();

    swift_willThrow();
    v447(v448, v446, v449);
    uint64_t v452 = swift_allocObject();
    *(void *)(v452 + 16) = v451;
    swift_errorRetain();
    v453 = sub_1000189C0();
    LOBYTE(v448) = sub_100018B40();
    uint64_t v454 = swift_allocObject();
    *(unsigned char *)(v454 + 16) = 32;
    uint64_t v455 = swift_allocObject();
    *(unsigned char *)(v455 + 16) = 8;
    uint64_t v456 = swift_allocObject();
    *(void *)(v456 + 16) = sub_10001773C;
    *(void *)(v456 + 24) = v452;
    uint64_t v457 = swift_allocObject();
    *(void *)(v457 + 16) = sub_1000185F4;
    *(void *)(v457 + 24) = v456;
    uint64_t v458 = swift_allocObject();
    *(_OWORD *)(v458 + 16) = xmmword_100019310;
    *(void *)(v458 + 32) = sub_100018790;
    *(void *)(v458 + 40) = v454;
    *(void *)(v458 + 48) = sub_100018794;
    *(void *)(v458 + 56) = v455;
    *(void *)(v458 + 64) = sub_100018638;
    *(void *)(v458 + 72) = v457;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v459 = v448;
    if (os_log_type_enabled(v453, (os_log_type_t)v448))
    {
      v460 = (uint8_t *)swift_slowAlloc();
      uint64_t v461 = swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = v461;
      *(_WORD *)v460 = 258;
      v460[2] = *(unsigned char *)(v454 + 16);
      swift_release();
      v460[3] = *(unsigned char *)(v455 + 16);
      v743[0] = (uint64_t)(v460 + 4);
      swift_release();
      sub_10001502C(v743, (uint64_t)v747, (uint64_t *)&v744, *(uint64_t (**)(void))(v457 + 16));
      uint64_t v462 = v742[129];
      uint64_t v463 = v742[127];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v453, v459, "Found a task folder, but got error while trying to access contents: %s", v460, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v464 = v462;
      uint64_t v465 = v463;
    }
    else
    {
      uint64_t v484 = v742[129];
      uint64_t v485 = v742[127];
      swift_release();
      swift_release();
      swift_release();

      uint64_t v464 = v484;
      uint64_t v465 = v485;
    }
    v740(v464, v465);
    v486 = (void *)v742[167];
    uint64_t v487 = v742[126];
    uint64_t v488 = v742[123];
    uint64_t v489 = v742[122];
    uint64_t v490 = v742[101];
    uint64_t v491 = v742[100];
    uint64_t v492 = v742[99];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    LOBYTE(v744) = 12;
    id v493 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v703 = sub_1000188C0();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v491 + 8))(v490, v492);
    (*(void (**)(uint64_t, uint64_t))(v488 + 8))(v487, v489);
    goto LABEL_154;
  }
  uint64_t v330 = v742[101];
  uint64_t v331 = v742[100];
  uint64_t v332 = v742[99];
  uint64_t v333 = sub_100018AE0();
  id v334 = v329;

  uint64_t v335 = sub_100012C68(v333);
  (*(void (**)(uint64_t, uint64_t))(v331 + 8))(v330, v332);
  swift_bridgeObjectRelease();
  uint64_t *v322 = v335;
  swift_bridgeObjectRelease();
LABEL_104:
  v352 = v742;
  ((void (*)(void, void, void))v742[163])(v742[148], v742[171], v742[127]);
  uint64_t v353 = swift_allocObject();
  *(void *)(v353 + 16) = sub_1000171B4;
  *(void *)(v353 + 24) = v731;
  swift_retain();
  v354 = sub_1000189C0();
  os_log_type_t v355 = sub_100018B30();
  uint64_t v356 = swift_allocObject();
  *(unsigned char *)(v356 + 16) = 32;
  uint64_t v357 = swift_allocObject();
  *(unsigned char *)(v357 + 16) = 8;
  uint64_t v358 = swift_allocObject();
  *(void *)(v358 + 16) = sub_1000171FC;
  *(void *)(v358 + 24) = v353;
  uint64_t v359 = swift_allocObject();
  *(void *)(v359 + 16) = sub_1000185E0;
  *(void *)(v359 + 24) = v358;
  uint64_t v360 = swift_allocObject();
  *(_OWORD *)(v360 + 16) = xmmword_100019310;
  *(void *)(v360 + 32) = sub_100018750;
  *(void *)(v360 + 40) = v356;
  *(void *)(v360 + 48) = sub_100018754;
  *(void *)(v360 + 56) = v357;
  *(void *)(v360 + 64) = sub_10001861C;
  *(void *)(v360 + 72) = v359;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v354, v355))
  {
    v361 = (uint8_t *)swift_slowAlloc();
    uint64_t v362 = swift_slowAlloc();
    v747[0] = 0;
    *(void *)&long long v744 = v362;
    *(_WORD *)v361 = 258;
    v361[2] = *(unsigned char *)(v356 + 16);
    swift_release();
    v361[3] = *(unsigned char *)(v357 + 16);
    v743[0] = (uint64_t)(v361 + 4);
    swift_release();
    sub_10001502C(v743, (uint64_t)v747, (uint64_t *)&v744, *(uint64_t (**)(void))(v359 + 16));
    v352 = v742;
    uint64_t v363 = v742[148];
    uint64_t v364 = v742[127];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v354, v355, "All URLS: %s", v361, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v365 = v363;
    uint64_t v366 = v364;
  }
  else
  {
    uint64_t v367 = v742[148];
    uint64_t v368 = v742[127];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v365 = v367;
    uint64_t v366 = v368;
  }
  v740(v365, v366);
  uint64_t v369 = v352[171];
  v370 = (void (*)(uint64_t, uint64_t, uint64_t))v352[163];
  uint64_t v371 = v352[147];
  uint64_t v372 = v352[127];
  sub_100017224(0, &qword_1000201E0);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v373 = sub_100012EB4();
  v352[183] = v373;
  v370(v371, v369, v372);
  uint64_t v374 = swift_allocObject();
  *(void *)(v374 + 16) = v373;
  id v724 = v373;
  v375 = sub_1000189C0();
  os_log_type_t v376 = sub_100018B30();
  uint64_t v377 = swift_allocObject();
  *(unsigned char *)(v377 + 16) = 64;
  uint64_t v378 = swift_allocObject();
  *(unsigned char *)(v378 + 16) = 8;
  uint64_t v379 = swift_allocObject();
  *(void *)(v379 + 16) = sub_100017260;
  *(void *)(v379 + 24) = v374;
  uint64_t v380 = swift_allocObject();
  *(void *)(v380 + 16) = sub_100018604;
  *(void *)(v380 + 24) = v379;
  uint64_t v381 = swift_allocObject();
  *(_OWORD *)(v381 + 16) = xmmword_100019310;
  *(void *)(v381 + 32) = sub_100018758;
  *(void *)(v381 + 40) = v377;
  *(void *)(v381 + 48) = sub_10001875C;
  *(void *)(v381 + 56) = v378;
  *(void *)(v381 + 64) = sub_100018620;
  *(void *)(v381 + 72) = v380;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v375, v376))
  {
    v382 = (uint8_t *)swift_slowAlloc();
    v747[0] = (void *)swift_slowAlloc();
    *(void *)&long long v744 = 0;
    *(_WORD *)v382 = 258;
    v382[2] = *(unsigned char *)(v377 + 16);
    swift_release();
    v382[3] = *(unsigned char *)(v378 + 16);
    v743[0] = (uint64_t)(v382 + 4);
    swift_release();
    sub_1000156FC(v743, v747, (uint64_t)&v744, *(uint64_t (**)(void))(v380 + 16));
    uint64_t v383 = v742[147];
    uint64_t v384 = v742[127];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v375, v376, "taskAttachments: %@", v382, 0xCu);
    sub_100014284(&qword_100020218);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v385 = v383;
    uint64_t v386 = v384;
  }
  else
  {
    uint64_t v387 = v352[147];
    uint64_t v388 = v352[127];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v385 = v387;
    uint64_t v386 = v388;
  }
  v740(v385, v386);
  uint64_t v81 = (uint64_t)[v739 getCoreDictionary];
  if (!v81) {
    goto LABEL_284;
  }
  v389 = (void *)v81;
  uint64_t v716 = v742[171];
  uint64_t v390 = v742[146];
  uint64_t v714 = v742[127];
  v715 = (void (*)(uint64_t, uint64_t, uint64_t))v742[163];
  sub_100018A00();

  Class v391 = sub_1000189F0().super.isa;
  swift_bridgeObjectRelease();
  id v392 = [v726 recipe];
  uint64_t v393 = sub_100018A00();

  sub_1000127F4(v393);
  swift_bridgeObjectRelease();
  v394 = v742;
  Class v395 = sub_1000189F0().super.isa;
  swift_bridgeObjectRelease();
  v742[87] = *(void *)(v729 + 16);
  id v396 = [v726 gatherMetricsToReturn:v391 withRecipe:v395 withAttachments:v724 outError:v742 + 87];

  v397 = (void *)v742[87];
  v398 = *(void **)(v729 + 16);
  *(void *)(v729 + 16) = v397;
  id v399 = v397;

  uint64_t v400 = sub_100018AE0();
  v722 = sub_100012F2C(v400);
  v742[184] = v722;
  swift_bridgeObjectRelease();
  v715(v390, v716, v714);
  v401 = sub_1000189C0();
  os_log_type_t v402 = sub_100018B30();
  BOOL v403 = os_log_type_enabled(v401, v402);
  uint64_t v404 = v742[146];
  uint64_t v405 = v742[127];
  if (v403)
  {
    v406 = (uint8_t *)swift_slowAlloc();
    v747[0] = 0;
    *(void *)&long long v744 = 0;
    *(_WORD *)v406 = 0;
    v743[0] = (uint64_t)(v406 + 2);
    sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v401, v402, "Gathered metrics!", v406, 2u);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  v740(v404, v405);
  v742[185] = 0;
  ((void (*)(void, void, void))v742[163])(v742[145], v742[171], v742[127]);
  uint64_t v414 = swift_allocObject();
  *(void *)(v414 + 16) = v722;
  uint64_t v415 = swift_allocObject();
  *(void *)(v415 + 16) = sub_100018710;
  *(void *)(v415 + 24) = v414;
  swift_bridgeObjectRetain();
  v416 = sub_1000189C0();
  os_log_type_t v417 = sub_100018B30();
  uint64_t v418 = swift_allocObject();
  *(unsigned char *)(v418 + 16) = 32;
  uint64_t v419 = swift_allocObject();
  *(unsigned char *)(v419 + 16) = 8;
  uint64_t v420 = swift_allocObject();
  *(void *)(v420 + 16) = sub_100017288;
  *(void *)(v420 + 24) = v415;
  uint64_t v421 = swift_allocObject();
  *(void *)(v421 + 16) = sub_1000185E4;
  *(void *)(v421 + 24) = v420;
  uint64_t v422 = swift_allocObject();
  *(_OWORD *)(v422 + 16) = xmmword_100019310;
  *(void *)(v422 + 32) = sub_100018760;
  *(void *)(v422 + 40) = v418;
  *(void *)(v422 + 48) = sub_100018764;
  *(void *)(v422 + 56) = v419;
  *(void *)(v422 + 64) = sub_100018624;
  *(void *)(v422 + 72) = v421;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v416, v417))
  {
    v423 = (uint8_t *)swift_slowAlloc();
    uint64_t v424 = swift_slowAlloc();
    v747[0] = 0;
    *(void *)&long long v744 = v424;
    *(_WORD *)v423 = 258;
    v423[2] = *(unsigned char *)(v418 + 16);
    swift_release();
    v423[3] = *(unsigned char *)(v419 + 16);
    v743[0] = (uint64_t)(v423 + 4);
    swift_release();
    sub_10001502C(v743, (uint64_t)v747, (uint64_t *)&v744, *(uint64_t (**)(void))(v421 + 16));
    v394 = v742;
    uint64_t v425 = v742[145];
    uint64_t v426 = v742[127];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v416, v417, "Results: %s", v423, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v427 = v425;
    uint64_t v428 = v426;
  }
  else
  {
    uint64_t v429 = v742[145];
    uint64_t v430 = v742[127];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v427 = v429;
    uint64_t v428 = v430;
  }
  v740(v427, v428);
  uint64_t v431 = v394[171];
  v432 = (void (*)(uint64_t, uint64_t, uint64_t))v394[163];
  uint64_t v433 = v394[127];
  if (*(void *)(v729 + 16))
  {
    uint64_t v434 = v394[144];
    swift_bridgeObjectRelease();
    v432(v434, v431, v433);
    swift_retain();
    v435 = sub_1000189C0();
    os_log_type_t v436 = sub_100018B30();
    uint64_t v437 = swift_allocObject();
    *(unsigned char *)(v437 + 16) = 64;
    uint64_t v438 = swift_allocObject();
    *(unsigned char *)(v438 + 16) = 8;
    uint64_t v439 = swift_allocObject();
    *(void *)(v439 + 16) = sub_1000176A0;
    *(void *)(v439 + 24) = v729;
    uint64_t v440 = swift_allocObject();
    *(_OWORD *)(v440 + 16) = xmmword_100019310;
    *(void *)(v440 + 32) = sub_100018788;
    *(void *)(v440 + 40) = v437;
    *(void *)(v440 + 48) = sub_10001878C;
    *(void *)(v440 + 56) = v438;
    *(void *)(v440 + 64) = sub_100018634;
    *(void *)(v440 + 72) = v439;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v435, v436))
    {
      v441 = (uint8_t *)swift_slowAlloc();
      v747[0] = (void *)swift_slowAlloc();
      *(void *)&long long v744 = 0;
      *(_WORD *)v441 = 258;
      v441[2] = *(unsigned char *)(v437 + 16);
      swift_release();
      v441[3] = *(unsigned char *)(v438 + 16);
      v743[0] = (uint64_t)(v441 + 4);
      swift_release();
      sub_1000156FC(v743, v747, (uint64_t)&v744, *(uint64_t (**)(void))(v439 + 16));
      uint64_t v442 = v394[144];
      uint64_t v443 = v394[127];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v435, v436, "Got error getting metrics: %@", v441, 0xCu);
      sub_100014284(&qword_100020218);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v444 = v442;
      uint64_t v445 = v443;
    }
    else
    {
      uint64_t v477 = v394[144];
      uint64_t v478 = v394[127];
      swift_release();
      swift_release();
      swift_release();

      uint64_t v444 = v477;
      uint64_t v445 = v478;
    }
    v740(v444, v445);
    v479 = (void *)v394[167];
    uint64_t v480 = v394[126];
    uint64_t v481 = v394[123];
    uint64_t v482 = v394[122];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    char v483 = 13;
LABEL_153:
    LOBYTE(v744) = v483;
    id v523 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v703 = sub_1000188C0();

    (*(void (**)(uint64_t, uint64_t))(v481 + 8))(v480, v482);
LABEL_154:
    swift_release();
LABEL_80:
    swift_release();
    goto LABEL_81;
  }
  v432(v394[143], v394[171], v394[127]);
  uint64_t v466 = swift_allocObject();
  *(void *)(v466 + 16) = v726;
  id v726 = v726;
  v467 = sub_1000189C0();
  os_log_type_t v468 = sub_100018B30();
  v469 = v394;
  uint64_t v470 = swift_allocObject();
  *(unsigned char *)(v470 + 16) = 32;
  uint64_t v471 = swift_allocObject();
  *(unsigned char *)(v471 + 16) = 8;
  uint64_t v472 = swift_allocObject();
  *(void *)(v472 + 16) = sub_1000172B0;
  *(void *)(v472 + 24) = v466;
  uint64_t v473 = swift_allocObject();
  *(void *)(v473 + 16) = sub_1000185E8;
  *(void *)(v473 + 24) = v472;
  uint64_t v474 = swift_allocObject();
  *(_OWORD *)(v474 + 16) = xmmword_100019310;
  *(void *)(v474 + 32) = sub_100018768;
  *(void *)(v474 + 40) = v470;
  *(void *)(v474 + 48) = sub_10001876C;
  *(void *)(v474 + 56) = v471;
  *(void *)(v474 + 64) = sub_100018628;
  *(void *)(v474 + 72) = v473;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v467, v468))
  {
    v475 = (uint8_t *)swift_slowAlloc();
    uint64_t v476 = swift_slowAlloc();
    v747[0] = 0;
    *(void *)&long long v744 = v476;
    *(_WORD *)v475 = 258;
    v475[2] = *(unsigned char *)(v470 + 16);
    swift_release();
    v475[3] = *(unsigned char *)(v471 + 16);
    v743[0] = (uint64_t)(v475 + 4);
    swift_release();
    sub_10001502C(v743, (uint64_t)v747, (uint64_t *)&v744, *(uint64_t (**)(void))(v473 + 16));
    v496 = v742;
    uint64_t v497 = v742[143];
    uint64_t v498 = v742[127];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v467, v468, "Logging strategies: %s", v475, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v740(v497, v498);
  }
  else
  {
    uint64_t v494 = v469[143];
    uint64_t v495 = v469[127];
    swift_release();
    swift_release();
    swift_release();

    v740(v494, v495);
    v496 = v469;
  }
  uint64_t v499 = sub_100018A40();
  uint64_t v501 = v500;
  id v502 = [v726 recipe];
  uint64_t v503 = sub_100018A00();

  sub_100013188(v499, v501, v503, (_OWORD *)v496 + 13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v496[29])
  {
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)(v496 + 26), &qword_1000201E8);
LABEL_149:
    ((void (*)(void, void, void))v496[163])(v496[133], v496[171], v496[127]);
    v517 = sub_1000189C0();
    os_log_type_t v518 = sub_100018B40();
    BOOL v519 = os_log_type_enabled(v517, v518);
    uint64_t v520 = v496[133];
    uint64_t v521 = v496[127];
    if (v519)
    {
      v522 = (uint8_t *)swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = 0;
      *(_WORD *)v522 = 0;
      v743[0] = (uint64_t)(v522 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v517, v518, "Logging strategies missing", v522, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v740(v520, v521);
    v479 = (void *)v496[167];
    uint64_t v480 = v496[126];
    uint64_t v481 = v496[123];
    uint64_t v482 = v496[122];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    char v483 = 14;
    goto LABEL_153;
  }
  sub_100014284(&qword_100020168);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_149;
  }
  v504 = (void *)v496[89];
  v496[186] = v504;
  if ((sub_1000131EC(0x6E61697373756147, 0xEF6F637369446544, v504) & 1) == 0) {
    goto LABEL_246;
  }
  id v505 = [v726 recipe];
  uint64_t v506 = sub_100018A00();

  sub_100013188(0x436F637369646564, 0xED00006769666E6FLL, v506, (_OWORD *)v496 + 19);
  swift_bridgeObjectRelease();
  if (!v496[41])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)(v496 + 38), &qword_1000201E8);
LABEL_177:
    ((void (*)(void, void, void))v496[163])(v496[135], v496[171], v496[127]);
    v536 = sub_1000189C0();
    os_log_type_t v537 = sub_100018B40();
    BOOL v538 = os_log_type_enabled(v536, v537);
    uint64_t v539 = v496[135];
    uint64_t v540 = v496[127];
    if (v538)
    {
      v541 = (uint8_t *)swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = 0;
      *(_WORD *)v541 = 0;
      v743[0] = (uint64_t)(v541 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v536, v537, "Recipe lacked dediscoConfig but specified GaussianDeDisco", v541, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v740(v539, v540);
    v479 = (void *)v496[167];
    uint64_t v480 = v496[126];
    uint64_t v481 = v496[123];
    uint64_t v482 = v496[122];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    char v483 = 15;
    goto LABEL_153;
  }
  uint64_t v507 = sub_100014284(&qword_1000201F0);
  v496[187] = v507;
  v719 = (ValueMetadata *)v507;
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_177;
  }
  uint64_t v710 = v496[78];
  sub_100013188(0x676E69646F636E65, 0xEE00616D65686353, v710, (_OWORD *)v496 + 17);
  if (!v496[37])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)(v496 + 34), &qword_1000201E8);
LABEL_183:
    ((void (*)(void, void, void))v742[163])(v742[136], v742[171], v742[127]);
    v542 = sub_1000189C0();
    os_log_type_t v543 = sub_100018B40();
    BOOL v544 = os_log_type_enabled(v542, v543);
    uint64_t v545 = v742[136];
    uint64_t v546 = v742[127];
    if (v544)
    {
      v547 = (uint8_t *)swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = 0;
      *(_WORD *)v547 = 0;
      v743[0] = (uint64_t)(v547 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v542, v543, "dediscoConfig lacked encodingSchema but specified GaussianDeDisco", v547, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v740(v545, v546);
    v548 = (void *)v742[167];
    uint64_t v549 = v742[126];
    uint64_t v550 = v742[123];
    uint64_t v551 = v742[122];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    char v552 = 16;
    goto LABEL_244;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_183;
  }
  uint64_t v508 = v742[93];
  v742[91] = sub_1000132B4((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v709 = v508;
  sub_100013188(0xD000000000000010, 0x8000000100019D20, v508, (_OWORD *)v742 + 15);
  if (!v742[33])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)(v742 + 30), &qword_1000201E8);
LABEL_189:
    uint64_t v553 = v742[171];
    v554 = (void (*)(uint64_t, uint64_t, uint64_t))v742[163];
    uint64_t v555 = v742[137];
    uint64_t v556 = v742[127];
    swift_bridgeObjectRelease();
    v554(v555, v553, v556);
    v557 = sub_1000189C0();
    os_log_type_t v558 = sub_100018B40();
    BOOL v559 = os_log_type_enabled(v557, v558);
    uint64_t v560 = v742[137];
    uint64_t v561 = v742[127];
    if (v559)
    {
      v562 = (uint8_t *)swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = 0;
      *(_WORD *)v562 = 0;
      v743[0] = (uint64_t)(v562 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v557, v558, "Got malformed dataContentTypes", v562, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v740(v560, v561);
    v548 = (void *)v742[167];
    uint64_t v549 = v742[126];
    uint64_t v550 = v742[123];
    uint64_t v551 = v742[122];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    char v552 = 17;
    goto LABEL_244;
  }
  uint64_t v707 = sub_100014284(&qword_1000201F8);
  uint64_t v81 = swift_dynamicCast();
  if ((v81 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_189;
  }
  int64_t v509 = 0;
  v708 = v742 + 18;
  v706 = v742 + 2;
  v704 = v742 + 14;
  v705 = v742 + 77;
  uint64_t v510 = v742[88];
  uint64_t v511 = *(void *)(v510 + 64);
  uint64_t v717 = v510 + 64;
  uint64_t v512 = v510;
  uint64_t v513 = -1;
  uint64_t v514 = -1 << *(unsigned char *)(v510 + 32);
  if (-v514 < 64) {
    uint64_t v513 = ~(-1 << -(char)v514);
  }
  unint64_t v515 = v513 & v511;
  int64_t v516 = (unint64_t)(63 - v514) >> 6;
  if ((v513 & v511) != 0) {
    goto LABEL_156;
  }
LABEL_157:
  BOOL v526 = __OFADD__(v509++, 1);
  if (v526)
  {
    __break(1u);
LABEL_283:
    __break(1u);
LABEL_284:
    __break(1u);
LABEL_285:
    __break(1u);
    goto LABEL_286;
  }
  if (v509 < v516)
  {
    unint64_t v527 = *(void *)(v717 + 8 * v509);
    if (v527)
    {
LABEL_167:
      unint64_t v515 = (v527 - 1) & v527;
      for (unint64_t i = __clz(__rbit64(v527)) + (v509 << 6); ; unint64_t i = v524 | (v509 << 6))
      {
        v529 = (uint64_t *)(*(void *)(v512 + 48) + 16 * i);
        uint64_t v530 = *v529;
        uint64_t v531 = v529[1];
        uint64_t v532 = *(void *)(*(void *)(v512 + 56) + 8 * i);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v750._countAndFlagsBits = 0x6E61697373756167;
        v750._object = (void *)0xE90000000000003ALL;
        if (sub_100018AB0(v750))
        {
          v742[65] = v530;
          v742[66] = v531;
          v742[67] = 0x6E61697373756167;
          v742[68] = 0xE90000000000003ALL;
          sub_100017474();
          sub_100018B20();
          uint64_t v533 = sub_100018AC0();
          uint64_t v535 = v534;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v745 = v719;
          *(void *)&long long v744 = v532;
          uint64_t v81 = sub_100013508((uint64_t)&v744, v533, v535);
          if (!v515) {
            goto LABEL_157;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v81 = swift_bridgeObjectRelease();
          if (!v515) {
            goto LABEL_157;
          }
        }
LABEL_156:
        unint64_t v524 = __clz(__rbit64(v515));
        v515 &= v515 - 1;
      }
    }
    int64_t v528 = v509 + 1;
    if (v509 + 1 < v516)
    {
      unint64_t v527 = *(void *)(v717 + 8 * v528);
      if (v527) {
        goto LABEL_166;
      }
      int64_t v528 = v509 + 2;
      if (v509 + 2 >= v516) {
        goto LABEL_193;
      }
      unint64_t v527 = *(void *)(v717 + 8 * v528);
      if (v527)
      {
LABEL_166:
        int64_t v509 = v528;
        goto LABEL_167;
      }
      int64_t v528 = v509 + 3;
      if (v509 + 3 < v516)
      {
        unint64_t v527 = *(void *)(v717 + 8 * v528);
        if (v527) {
          goto LABEL_166;
        }
        while (1)
        {
          int64_t v509 = v528 + 1;
          if (__OFADD__(v528, 1)) {
            goto LABEL_283;
          }
          if (v509 >= v516) {
            break;
          }
          unint64_t v527 = *(void *)(v717 + 8 * v509);
          ++v528;
          if (v527) {
            goto LABEL_167;
          }
        }
      }
    }
  }
LABEL_193:
  swift_release();
  sub_100013188(1701869940, 0xE400000000000000, v709, v708);
  swift_bridgeObjectRelease();
  if (!v742[21])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)v708, &qword_1000201E8);
LABEL_207:
    uint64_t v580 = v742[171];
    v581 = (void (*)(uint64_t, uint64_t, uint64_t))v742[163];
    uint64_t v582 = v742[138];
    uint64_t v583 = v742[127];
    swift_bridgeObjectRelease();
    v581(v582, v580, v583);
    v584 = sub_1000189C0();
    os_log_type_t v585 = sub_100018B40();
    BOOL v586 = os_log_type_enabled(v584, v585);
    uint64_t v587 = v742[138];
    uint64_t v588 = v742[127];
    if (v586)
    {
      v589 = (uint8_t *)swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = 0;
      *(_WORD *)v589 = 0;
      v743[0] = (uint64_t)(v589 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v584, v585, "encodingSchema lacked type", v589, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v740(v587, v588);
    v548 = (void *)v742[167];
    uint64_t v549 = v742[126];
    uint64_t v550 = v742[123];
    uint64_t v551 = v742[122];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    char v552 = 18;
    goto LABEL_244;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_207;
  }
  uint64_t v563 = v742[71];
  uint64_t v564 = v742[72];
  sub_100014284(&qword_100020208);
  uint64_t v565 = swift_allocObject();
  *(_OWORD *)(v565 + 16) = xmmword_100019320;
  *(void *)(v565 + 32) = 1701869940;
  *(void *)(v565 + 40) = 0xE400000000000000;
  *(void *)(v565 + 48) = v563;
  *(void *)(v565 + 56) = v564;
  *(void *)(v565 + 72) = &type metadata for String;
  *(void *)(v565 + 80) = 0xD000000000000012;
  *(void *)(v565 + 88) = 0x8000000100019D40;
  sub_100014284(&qword_100020210);
  uint64_t v566 = swift_allocObject();
  *(_OWORD *)(v566 + 16) = xmmword_100019330;
  *(void *)(v566 + 32) = 0xD000000000000010;
  *(void *)(v566 + 40) = 0x8000000100019D20;
  *(void *)(v566 + 48) = v742[91];
  swift_bridgeObjectRetain();
  unint64_t v567 = sub_1000133EC(v566);
  *(void *)(v565 + 120) = v707;
  *(void *)(v565 + 96) = v567;
  v742[188] = sub_1000132B4(v565);
  sub_100013188(0xD00000000000001DLL, 0x8000000100019D60, v710, v706);
  swift_bridgeObjectRelease();
  if (!v742[5])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)v706, &qword_1000201E8);
LABEL_240:
    uint64_t v600 = v742[171];
    v601 = (void (*)(uint64_t, uint64_t, uint64_t))v742[163];
    uint64_t v602 = v742[139];
    uint64_t v603 = v742[127];
    swift_bridgeObjectRelease();
    v601(v602, v600, v603);
    v604 = sub_1000189C0();
    os_log_type_t v605 = sub_100018B40();
    BOOL v606 = os_log_type_enabled(v604, v605);
    uint64_t v607 = v742[139];
    uint64_t v608 = v742[127];
    if (v606)
    {
      v609 = (uint8_t *)swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = 0;
      *(_WORD *)v609 = 0;
      v743[0] = (uint64_t)(v609 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v604, v605, "dediscoConfig lacked DifferentialPrivacyParameters but specified GaussianDeDisco", v609, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v740(v607, v608);
    v548 = (void *)v742[167];
    uint64_t v549 = v742[126];
    uint64_t v550 = v742[123];
    uint64_t v551 = v742[122];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    char v552 = 19;
LABEL_244:
    LOBYTE(v744) = v552;
    id v610 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v703 = sub_1000188C0();

    (*(void (**)(uint64_t, uint64_t))(v550 + 8))(v549, v551);
    swift_release();
    goto LABEL_80;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_240;
  }
  v742[189] = v742[74];
  v742[190] = [self defaultManager];
  uint64_t v568 = v722[2];
  v742[191] = v568;
  if (!v568)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v496 = v742;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_246:
    v611 = (void *)v496[186];
    unint64_t v612 = v611[2];
    if (v612 > 1)
    {
LABEL_247:
      uint64_t v613 = v496[180];
      v614 = (void *)v496[179];
      sub_100013058(v496[184]);
      swift_bridgeObjectRelease();
      Class v615 = sub_100018AD0().super.isa;
      swift_bridgeObjectRelease();
      Class v616 = sub_100018AD0().super.isa;
      swift_bridgeObjectRelease();
      v496[73] = *(void *)(v613 + 16);
      id v617 = [v614 logAllResultsToCoreAnalyticsOrDeDisco:v615 withLoggingStrategies:v616 outError:v496 + 73];

      v618 = (void *)v496[73];
      v619 = *(void **)(v613 + 16);
      *(void *)(v613 + 16) = v618;
      id v620 = v618;

      goto LABEL_254;
    }
    if (v612 == 1)
    {
      if ((v611[4] != 0x6E61697373756147 || v611[5] != 0xEF6F637369446544) && (sub_100018CC0() & 1) == 0)
      {
        v496 = v742;
        goto LABEL_247;
      }
      v496 = v742;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_254:
    sub_100018920();
    swift_bridgeObjectRelease();
    if (*((unsigned char *)v496 + 472) == 1)
    {
      v621 = (void *)v496[167];
      uint64_t v735 = v496[171];
      v622 = (void (*)(uint64_t, uint64_t, uint64_t))v496[163];
      uint64_t v623 = v496[134];
      uint64_t v624 = v496[127];
      v625 = (void *)v496[94];
      Class v626 = sub_100018B00().super.super.isa;
      sub_100018990();
      NSString v627 = sub_100018A30();
      swift_bridgeObjectRelease();
      [v621 setValue:v626 forKey:v627];

      v622(v623, v735, v624);
      uint64_t v628 = swift_allocObject();
      *(void *)(v628 + 16) = v625;
      id v629 = v625;
      v630 = sub_1000189C0();
      os_log_type_t v631 = sub_100018B30();
      uint64_t v632 = swift_allocObject();
      *(unsigned char *)(v632 + 16) = 32;
      uint64_t v633 = swift_allocObject();
      *(unsigned char *)(v633 + 16) = 8;
      uint64_t v634 = swift_allocObject();
      *(void *)(v634 + 16) = sub_100017430;
      *(void *)(v634 + 24) = v628;
      uint64_t v635 = swift_allocObject();
      *(void *)(v635 + 16) = sub_1000185EC;
      *(void *)(v635 + 24) = v634;
      uint64_t v636 = swift_allocObject();
      *(_OWORD *)(v636 + 16) = xmmword_100019310;
      *(void *)(v636 + 32) = sub_100018770;
      *(void *)(v636 + 40) = v632;
      *(void *)(v636 + 48) = sub_100018774;
      *(void *)(v636 + 56) = v633;
      *(void *)(v636 + 64) = sub_10001862C;
      *(void *)(v636 + 72) = v635;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v630, v631))
      {
        uint64_t v637 = v496[185];
        v638 = (uint8_t *)swift_slowAlloc();
        uint64_t v639 = swift_slowAlloc();
        v747[0] = 0;
        *(void *)&long long v744 = v639;
        *(_WORD *)v638 = 258;
        v638[2] = *(unsigned char *)(v632 + 16);
        uint64_t v640 = v496[185];
        if (v637) {
          goto LABEL_126;
        }
        swift_release();
        v638[3] = *(unsigned char *)(v633 + 16);
        v743[0] = (uint64_t)(v638 + 4);
        uint64_t v653 = v742[185];
        if (v640) {
          goto LABEL_126;
        }
        swift_release();
        sub_10001502C(v743, (uint64_t)v747, (uint64_t *)&v744, *(uint64_t (**)(void))(v635 + 16));
        if (v653) {
          goto LABEL_126;
        }
        v496 = v742;
        uint64_t v654 = v742[134];
        uint64_t v655 = v742[127];
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v630, v631, "Execution state saved for taskName %s.", v638, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v643 = v654;
        uint64_t v644 = v655;
      }
      else
      {
        uint64_t v641 = v496[134];
        uint64_t v642 = v496[127];
        swift_release();
        swift_release();
        swift_release();

        uint64_t v643 = v641;
        uint64_t v644 = v642;
      }
      v740(v643, v644);
    }
    v645 = (void *)v496[183];
    v646 = (void *)v496[181];
    v647 = (void *)v496[179];
    v648 = (void *)v742[167];
    uint64_t v649 = v742[126];
    uint64_t v650 = v742[123];
    uint64_t v651 = v742[122];
    id v652 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v703 = sub_1000188D0();

    (*(void (**)(uint64_t, uint64_t))(v650 + 8))(v649, v651);
    swift_release();
    goto LABEL_80;
  }
  v742[192] = 0;
  uint64_t v569 = v742[184];
  uint64_t v570 = *(void *)(v569 + 16);
  uint64_t v81 = swift_bridgeObjectRetain();
  if (!v570)
  {
LABEL_286:
    __break(1u);
LABEL_287:
    __break(1u);
    return static MLHostAsset.getRemoteAsset(context:assetType:assetSpecifier:)(v81, v82, v83, v84, v85);
  }
  uint64_t v571 = *(void *)(v569 + 32);
  swift_bridgeObjectRetain();
  sub_100013188(0x74654D6C65646F4DLL, 0xEC00000073636972, v571, v704);
  swift_bridgeObjectRelease();
  if (!v742[17])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)v704, &qword_1000201E8);
    swift_bridgeObjectRelease();
LABEL_269:
    uint64_t v656 = v742[171];
    v657 = (void (*)(uint64_t, uint64_t, uint64_t))v742[163];
    uint64_t v658 = v742[140];
    uint64_t v659 = v742[127];
    swift_bridgeObjectRelease();
    v657(v658, v656, v659);
    v660 = sub_1000189C0();
    os_log_type_t v661 = sub_100018B40();
    if (os_log_type_enabled(v660, v661))
    {
      uint64_t v662 = v742[140];
      uint64_t v663 = v742[127];
      v664 = (uint8_t *)swift_slowAlloc();
      v747[0] = 0;
      *(void *)&long long v744 = 0;
      *(_WORD *)v664 = 0;
      v743[0] = (uint64_t)(v664 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v743, (uint64_t)v747, (uint64_t)&v744);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v660, v661, "Measurements were malformed", v664, 2u);
      swift_slowDealloc();

      v740(v662, v663);
    }
    else
    {
      uint64_t v665 = v742[140];
      uint64_t v666 = v742[127];
      swift_bridgeObjectRelease();

      v740(v665, v666);
    }
    v667 = (void *)v742[190];
    v668 = (void *)v742[183];
    v669 = (void *)v742[181];
    v670 = (void *)v742[179];
    v671 = (void *)v742[167];
    uint64_t v672 = v742[126];
    uint64_t v673 = v742[123];
    uint64_t v674 = v742[122];
    v745 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v746 = sub_100016E14();
    LOBYTE(v744) = 20;
    id v675 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v703 = sub_1000188C0();

    (*(void (**)(uint64_t, uint64_t))(v673 + 8))(v672, v674);
    swift_release();
    goto LABEL_80;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    goto LABEL_269;
  }
  uint64_t v572 = v742[76];
  unint64_t *v705 = sub_1000132B4((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v573 = v572 + 64;
  uint64_t v574 = -1;
  uint64_t v575 = -1 << *(unsigned char *)(v572 + 32);
  if (-v575 < 64) {
    uint64_t v574 = ~(-1 << -(char)v575);
  }
  unint64_t v576 = v574 & *(void *)(v572 + 64);
  int64_t v577 = (unint64_t)(63 - v575) >> 6;
  uint64_t v578 = v742[91];
  uint64_t v81 = swift_bridgeObjectRetain();
  int64_t v579 = 0;
  if (v576) {
    goto LABEL_212;
  }
LABEL_213:
  BOOL v526 = __OFADD__(v579++, 1);
  if (v526) {
    goto LABEL_285;
  }
  if (v579 < v577)
  {
    unint64_t v592 = *(void *)(v573 + 8 * v579);
    if (v592)
    {
LABEL_227:
      unint64_t v576 = (v592 - 1) & v592;
      for (unint64_t j = __clz(__rbit64(v592)) + (v579 << 6); ; unint64_t j = v590 | (v579 << 6))
      {
        v594 = (uint64_t *)(*(void *)(v572 + 48) + 16 * j);
        uint64_t v596 = *v594;
        uint64_t v595 = v594[1];
        uint64_t v597 = *(void *)(v578 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v597)
        {
          sub_1000157B4(v596, v595);
          char v599 = v598;
          swift_bridgeObjectRelease();
          if (v599)
          {
            swift_bridgeObjectRetain();
            sub_100013188(v596, v595, v572, &v744);
            swift_bridgeObjectRelease();
            uint64_t v81 = sub_100013508((uint64_t)&v744, v596, v595);
            if (!v576) {
              goto LABEL_213;
            }
            goto LABEL_212;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        uint64_t v81 = swift_bridgeObjectRelease();
        if (!v576) {
          goto LABEL_213;
        }
LABEL_212:
        unint64_t v590 = __clz(__rbit64(v576));
        v576 &= v576 - 1;
      }
    }
    int64_t v593 = v579 + 1;
    if (v579 + 1 < v577)
    {
      unint64_t v592 = *(void *)(v573 + 8 * v593);
      if (v592) {
        goto LABEL_226;
      }
      int64_t v593 = v579 + 2;
      if (v579 + 2 < v577)
      {
        unint64_t v592 = *(void *)(v573 + 8 * v593);
        if (v592) {
          goto LABEL_226;
        }
        int64_t v593 = v579 + 3;
        if (v579 + 3 < v577)
        {
          unint64_t v592 = *(void *)(v573 + 8 * v593);
          if (v592) {
            goto LABEL_226;
          }
          int64_t v593 = v579 + 4;
          if (v579 + 4 < v577)
          {
            unint64_t v592 = *(void *)(v573 + 8 * v593);
            if (!v592)
            {
              int64_t v593 = v579 + 5;
              if (v579 + 5 < v577)
              {
                unint64_t v592 = *(void *)(v573 + 8 * v593);
                if (!v592)
                {
                  while (1)
                  {
                    int64_t v579 = v593 + 1;
                    if (__OFADD__(v593, 1)) {
                      goto LABEL_287;
                    }
                    if (v579 >= v577) {
                      goto LABEL_273;
                    }
                    unint64_t v592 = *(void *)(v573 + 8 * v579);
                    ++v593;
                    if (v592) {
                      goto LABEL_227;
                    }
                  }
                }
                goto LABEL_226;
              }
              goto LABEL_273;
            }
LABEL_226:
            int64_t v579 = v593;
            goto LABEL_227;
          }
        }
      }
    }
  }
LABEL_273:
  uint64_t v676 = v742[171];
  v677 = (void (*)(uint64_t, uint64_t, uint64_t))v742[163];
  uint64_t v678 = v742[142];
  uint64_t v679 = v742[127];
  swift_release();
  v677(v678, v676, v679);
  uint64_t v680 = swift_allocObject();
  *(void *)(v680 + 16) = v572;
  uint64_t v681 = swift_allocObject();
  *(void *)(v681 + 16) = sub_1000174C8;
  *(void *)(v681 + 24) = v680;
  v682 = sub_1000189C0();
  os_log_type_t v683 = sub_100018B30();
  uint64_t v684 = swift_allocObject();
  *(unsigned char *)(v684 + 16) = 32;
  uint64_t v685 = swift_allocObject();
  *(unsigned char *)(v685 + 16) = 8;
  uint64_t v686 = swift_allocObject();
  *(void *)(v686 + 16) = sub_1000174D4;
  *(void *)(v686 + 24) = v681;
  uint64_t v687 = swift_allocObject();
  *(void *)(v687 + 16) = sub_1000185F0;
  *(void *)(v687 + 24) = v686;
  uint64_t v688 = swift_allocObject();
  *(_OWORD *)(v688 + 16) = xmmword_100019310;
  *(void *)(v688 + 32) = sub_100018778;
  *(void *)(v688 + 40) = v684;
  *(void *)(v688 + 48) = sub_10001877C;
  *(void *)(v688 + 56) = v685;
  *(void *)(v688 + 64) = sub_100018630;
  *(void *)(v688 + 72) = v687;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (!os_log_type_enabled(v682, v683))
  {
    uint64_t v697 = v742[142];
    uint64_t v698 = v742[127];
    swift_release();
    swift_release();
    swift_release();

    v740(v697, v698);
    goto LABEL_279;
  }
  uint64_t v689 = v742[185];
  v690 = (uint8_t *)swift_slowAlloc();
  uint64_t v691 = swift_slowAlloc();
  v742[83] = 0;
  v742[84] = v691;
  *(_WORD *)v690 = 258;
  v690[2] = *(unsigned char *)(v684 + 16);
  v742[82] = v690 + 3;
  uint64_t v692 = v742[185];
  if (!v689)
  {
    swift_release();
    v693 = (unsigned char *)v742[82];
    unsigned char *v693 = *(unsigned char *)(v685 + 16);
    v742[82] = v693 + 1;
    uint64_t v694 = v742[185];
    if (!v692)
    {
      swift_release();
      sub_10001502C(v742 + 82, (uint64_t)(v742 + 83), v742 + 84, *(uint64_t (**)(void))(v687 + 16));
      if (!v694)
      {
        uint64_t v695 = v742[142];
        uint64_t v696 = v742[127];
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v682, v683, "Measurements: %s", v690, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v740(v695, v696);
LABEL_279:
        uint64_t v699 = v742[190];
        uint64_t v700 = swift_task_alloc();
        v742[193] = v700;
        long long v701 = *((_OWORD *)v742 + 94);
        *(void *)(v700 + 16) = v699;
        *(void *)(v700 + 24) = 0xD000000000000031;
        *(void *)(v700 + 32) = 0x8000000100019CE0;
        *(void *)(v700 + 40) = v705;
        *(_OWORD *)(v700 + 48) = v701;
        v702 = (void *)swift_task_alloc();
        v742[194] = v702;
        void *v702 = v742;
        v702[1] = sub_100010D6C;
        return withCheckedContinuation<A>(isolation:function:_:)((char *)v742 + 449, 0, 0, 0xD000000000000010, 0x8000000100019D80, sub_100017574, v700, &type metadata for Bool);
      }
    }
  }
LABEL_126:
  return swift_errorRelease();
}

uint64_t sub_10000A644(uint64_t a1)
{
  *(void *)(*(void *)v1 + 1424) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10000A7B4, 0, 0);
}

uint64_t sub_10000A7B4()
{
  uint64_t v725 = v0;
  uint64_t v1 = *(void *)(v0 + 1392);
  uint64_t v2 = *(void *)(v0 + 1368);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1304);
  uint64_t v4 = *(void *)(v0 + 1280);
  uint64_t v5 = *(void *)(v0 + 1016);
  *(void *)(v1 + 16) = *(void *)(v0 + 1424);
  swift_release();
  v3(v4, v2, v5);
  swift_retain();
  uint64_t v6 = sub_1000189C0();
  LOBYTE(v4) = sub_100018B30();
  uint64_t v7 = swift_allocObject();
  *(unsigned char *)(v7 + 16) = 32;
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 16) = 8;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10001793C;
  *(void *)(v9 + 24) = v1;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_1000185FC;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100019310;
  *(void *)(v11 + 32) = sub_1000187A8;
  *(void *)(v11 + 40) = v7;
  *(void *)(v11 + 48) = sub_1000187AC;
  *(void *)(v11 + 56) = v8;
  *(void *)(v11 + 64) = sub_100018644;
  *(void *)(v11 + 72) = v10;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  os_log_type_t v12 = v4;
  uint64_t v719 = v0;
  if (os_log_type_enabled(v6, (os_log_type_t)v4))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    v724[0] = 0;
    *(void *)&long long v721 = swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 258;
    v13[2] = *(unsigned char *)(v7 + 16);
    swift_release();
    v13[3] = *(unsigned char *)(v8 + 16);
    v720[0] = (uint64_t)(v13 + 4);
    swift_release();
    sub_10001502C(v720, (uint64_t)v724, (uint64_t *)&v721, *(uint64_t (**)(void))(v10 + 16));
    uint64_t v14 = *(void *)(v0 + 1280);
    uint64_t v15 = *(void *)(v0 + 1024);
    uint64_t v16 = *(void *)(v0 + 1016);
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v6, v12, "Got ML host asset: %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v718 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v718(v14, v16);
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 1280);
    uint64_t v18 = *(void *)(v0 + 1024);
    uint64_t v19 = *(void *)(v0 + 1016);
    swift_release();
    swift_release();
    swift_release();

    uint64_t v718 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v718(v17, v19);
  }
  uint64_t v20 = *(void *)(v0 + 1392);
  swift_beginAccess();
  if (!*(void *)(v20 + 16))
  {
    (*(void (**)(void, void, void))(v0 + 1304))(*(void *)(v0 + 1272), *(void *)(v0 + 1368), *(void *)(v0 + 1016));
    uint64_t v44 = sub_1000189C0();
    os_log_type_t v45 = sub_100018B30();
    BOOL v46 = os_log_type_enabled(v44, v45);
    uint64_t v47 = *(void *)(v0 + 1272);
    uint64_t v48 = *(void *)(v0 + 1016);
    if (v46)
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = 0;
      *(_WORD *)uint64_t v49 = 0;
      v720[0] = (uint64_t)(v49 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Failed to get mlhostAsset", v49, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v718(v47, v48);
    v69 = *(void **)(v0 + 1336);
    uint64_t v70 = *(void *)(v0 + 1008);
    uint64_t v71 = *(void *)(v0 + 984);
    uint64_t v72 = *(void *)(v0 + 976);
    uint64_t v73 = *(void *)(v0 + 960);
    uint64_t v74 = *(void *)(v0 + 952);
    uint64_t v75 = *(void *)(v0 + 944);
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    LOBYTE(v721) = 5;
    id v76 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v677 = sub_1000188C0();

    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v73, v75);
    (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v70, v72);
    goto LABEL_74;
  }
  (*(void (**)(void, void))(*(void *)(v0 + 952) + 8))(*(void *)(v0 + 960), *(void *)(v0 + 944));
  uint64_t v699 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1376);
  uint64_t v695 = *(void *)(v0 + 1368);
  v702 = *(void (**)(unint64_t, uint64_t, uint64_t))(v0 + 1352);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1304);
  uint64_t v22 = *(void *)(v0 + 1264);
  uint64_t v23 = *(void *)(v0 + 1016);
  uint64_t v24 = *(void *)(v0 + 1008);
  uint64_t v25 = *(void *)(v0 + 1000);
  unint64_t v26 = (*(unsigned __int8 *)(v0 + 452) + 16) & ~(unint64_t)*(unsigned __int8 *)(v0 + 452);
  uint64_t v27 = *(void *)(v0 + 976);
  sub_100017224(0, &qword_1000201D0);
  id v714 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  *(void *)(v0 + 1432) = v714;
  v21(v22, v695, v23);
  v699(v25, v24, v27);
  uint64_t v28 = swift_allocObject();
  v702(v28 + v26, v25, v27);
  os_log_type_t v29 = sub_1000189C0();
  os_log_type_t v30 = sub_100018B30();
  uint64_t v31 = swift_allocObject();
  *(unsigned char *)(v31 + 16) = 32;
  uint64_t v32 = swift_allocObject();
  *(unsigned char *)(v32 + 16) = 8;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = sub_100016F88;
  *(void *)(v33 + 24) = v28;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = sub_1000185D4;
  *(void *)(v34 + 24) = v33;
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_100019310;
  *(void *)(v35 + 32) = sub_100018730;
  *(void *)(v35 + 40) = v31;
  *(void *)(v35 + 48) = sub_100018734;
  *(void *)(v35 + 56) = v32;
  *(void *)(v35 + 64) = sub_10001860C;
  *(void *)(v35 + 72) = v34;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  os_log_type_t v36 = v30;
  if (os_log_type_enabled(v29, v30))
  {
    os_log_type_t v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    v724[0] = 0;
    *(void *)&long long v721 = v38;
    *(_WORD *)os_log_type_t v37 = 258;
    v37[2] = *(unsigned char *)(v31 + 16);
    swift_release();
    v37[3] = *(unsigned char *)(v32 + 16);
    v720[0] = (uint64_t)(v37 + 4);
    swift_release();
    sub_10001502C(v720, (uint64_t)v724, (uint64_t *)&v721, *(uint64_t (**)(void))(v34 + 16));
    uint64_t v39 = v719;
    uint64_t v40 = *(void *)(v719 + 1264);
    uint64_t v41 = *(void *)(v719 + 1016);
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v29, v36, "Recipe: %s", v37, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v42 = v40;
    uint64_t v43 = v41;
  }
  else
  {
    uint64_t v39 = v719;
    uint64_t v50 = *(void *)(v719 + 1264);
    uint64_t v51 = *(void *)(v719 + 1016);
    swift_release();
    swift_release();
    swift_release();

    uint64_t v42 = v50;
    uint64_t v43 = v51;
  }
  v718(v42, v43);
  sub_100018920();
  v52 = v714;
  if (*(void *)(v39 + 432) || *(void *)(v39 + 440) != 0xE000000000000000)
  {
    char v53 = sub_100018CC0();
    swift_bridgeObjectRelease();
    if ((v53 & 1) == 0)
    {
      sub_100018920();
      uint64_t v77 = sub_100001F7C(*(void *)(v39 + 480), *(void *)(v39 + 488));
      swift_bridgeObjectRelease();
      if (!v77)
      {
        unint64_t v203 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 1376);
        v708 = *(void (**)(unint64_t, uint64_t, uint64_t))(v39 + 1352);
        uint64_t v204 = *(void *)(v39 + 1008);
        uint64_t v205 = *(void *)(v39 + 1000);
        unint64_t v206 = (*(unsigned __int8 *)(v39 + 452) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 452);
        uint64_t v207 = *(void *)(v39 + 976);
        (*(void (**)(void, void, void))(v39 + 1304))(*(void *)(v39 + 1256), *(void *)(v39 + 1368), *(void *)(v39 + 1016));
        v203(v205, v204, v207);
        uint64_t v208 = swift_allocObject();
        v708(v208 + v206, v205, v207);
        v209 = sub_1000189C0();
        os_log_type_t v210 = sub_100018B40();
        uint64_t v211 = swift_allocObject();
        *(unsigned char *)(v211 + 16) = 32;
        uint64_t v212 = swift_allocObject();
        *(unsigned char *)(v212 + 16) = 8;
        uint64_t v213 = swift_allocObject();
        *(void *)(v213 + 16) = sub_100016FB8;
        *(void *)(v213 + 24) = v208;
        uint64_t v214 = swift_allocObject();
        *(void *)(v214 + 16) = sub_1000185D8;
        *(void *)(v214 + 24) = v213;
        uint64_t v215 = swift_allocObject();
        *(_OWORD *)(v215 + 16) = xmmword_100019310;
        *(void *)(v215 + 32) = sub_100018738;
        *(void *)(v215 + 40) = v211;
        *(void *)(v215 + 48) = sub_10001873C;
        *(void *)(v215 + 56) = v212;
        *(void *)(v215 + 64) = sub_100018610;
        *(void *)(v215 + 72) = v214;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v209, v210))
        {
          id v216 = (uint8_t *)swift_slowAlloc();
          uint64_t v217 = swift_slowAlloc();
          v724[0] = 0;
          *(void *)&long long v721 = v217;
          *(_WORD *)id v216 = 258;
          v216[2] = *(unsigned char *)(v211 + 16);
          swift_release();
          v216[3] = *(unsigned char *)(v212 + 16);
          v720[0] = (uint64_t)(v216 + 4);
          swift_release();
          sub_10001502C(v720, (uint64_t)v724, (uint64_t *)&v721, *(uint64_t (**)(void))(v214 + 16));
          uint64_t v218 = *(void *)(v39 + 1256);
          uint64_t v219 = *(void *)(v39 + 1016);
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v209, v210, "Failed to parse recipeString into dictionary: %s", v216, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v220 = v218;
          uint64_t v221 = v219;
        }
        else
        {
          uint64_t v268 = *(void *)(v39 + 1256);
          uint64_t v269 = *(void *)(v39 + 1016);
          swift_release();
          swift_release();
          swift_release();

          uint64_t v220 = v268;
          uint64_t v221 = v269;
        }
        v718(v220, v221);
        uint64_t v270 = *(void **)(v39 + 1336);
        uint64_t v156 = *(void *)(v39 + 1008);
        uint64_t v157 = *(void *)(v39 + 984);
        uint64_t v158 = *(void *)(v39 + 976);
        v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
        unint64_t v723 = sub_100016E14();
        LOBYTE(v721) = 6;
        id v271 = objc_allocWithZone((Class)sub_1000188E0());
        uint64_t v677 = sub_1000188C0();

        goto LABEL_73;
      }
      sub_10001248C(v77);
      swift_bridgeObjectRelease();
      Class isa = sub_1000189F0().super.isa;
      swift_bridgeObjectRelease();
      [v714 setRecipe:isa];

      goto LABEL_21;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v54 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 + 800) + 56);
  v54(*(void *)(v39 + 904), 1, 1, *(void *)(v39 + 792));
  sub_100018980();
  uint64_t v710 = v54;
  if (v55)
  {
    uint64_t v56 = *(void *)(v719 + 848);
    uint64_t v696 = *(void *)(v719 + 800);
    uint64_t v706 = *(void *)(v719 + 792);
    uint64_t v57 = *(void *)(v719 + 784);
    uint64_t v58 = *(void *)(v719 + 776);
    uint64_t v700 = *(void *)(v719 + 768);
    ((void (*)(void, uint64_t, uint64_t))v54)(*(void *)(v719 + 896), 1, 1);
    uint64_t v59 = enum case for URL.DirectoryHint.inferFromPath(_:);
    uint64_t v60 = sub_1000187C0();
    os_log_type_t v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 104);
    v61(v57, v59, v60);
    uint64_t v39 = v719;
    sub_100018830();
    *(void *)(v719 + 552) = 0xD000000000000012;
    *(void *)(v719 + 560) = 0x8000000100019DA0;
    v61(v57, v59, v60);
    sub_100017780();
    sub_100018840();
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v700);
    swift_bridgeObjectRelease();
    uint64_t v62 = *(void (**)(uint64_t, uint64_t))(v696 + 8);
    v62(v56, v706);
    id v63 = [self defaultManager];
    sub_100018810();
    NSString v64 = sub_100018A30();
    swift_bridgeObjectRelease();
    LODWORD(v56) = [v63 fileExistsAtPath:v64];

    if (v56)
    {
      uint64_t v65 = *(void *)(v719 + 904);
      uint64_t v66 = *(void *)(v719 + 856);
      uint64_t v67 = *(void *)(v719 + 800);
      uint64_t v68 = *(void *)(v719 + 792);
      sub_1000173D4(v65, &qword_1000201A0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 32))(v65, v66, v68);
      v710(v65, 0, 1, v68);
    }
    else
    {
      v62(*(void *)(v719 + 856), *(void *)(v719 + 792));
    }
  }
  uint64_t v96 = *(void *)(v39 + 888);
  uint64_t v97 = *(void *)(v39 + 800);
  uint64_t v98 = *(void *)(v39 + 792);
  sub_100017DCC(*(void *)(v39 + 904), v96, &qword_1000201A0);
  v99 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v97 + 48);
  LODWORD(v98) = v99(v96, 1, v98);
  sub_1000173D4(v96, &qword_1000201A0);
  if (v98 == 1)
  {
    (*(void (**)(void, void, void))(v39 + 1304))(*(void *)(v39 + 1248), *(void *)(v39 + 1368), *(void *)(v39 + 1016));
    id v100 = sub_1000189C0();
    os_log_type_t v101 = sub_100018B30();
    BOOL v102 = os_log_type_enabled(v100, v101);
    uint64_t v103 = *(void *)(v39 + 1248);
    uint64_t v104 = *(void *)(v39 + 1016);
    uint64_t v707 = v99;
    if (v102)
    {
      uint64_t v105 = (uint8_t *)swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = 0;
      *(_WORD *)uint64_t v105 = 0;
      v720[0] = (uint64_t)(v105 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v100, v101, "Didn't find a recipe in taskParameters. Checking mobileAssets.", v105, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v718(v103, v104);
    uint64_t v39 = v719;
    uint64_t v106 = *(void *)(v719 + 1392);
    swift_beginAccess();
    if (!*(void *)(v106 + 16))
    {
      (*(void (**)(void, void, void))(v719 + 1304))(*(void *)(v719 + 1240), *(void *)(v719 + 1368), *(void *)(v719 + 1016));
      uint64_t v122 = sub_1000189C0();
      os_log_type_t v123 = sub_100018B40();
      BOOL v124 = os_log_type_enabled(v122, v123);
      uint64_t v125 = *(void *)(v719 + 1240);
      uint64_t v126 = *(void *)(v719 + 1016);
      if (v124)
      {
        uint64_t v127 = (uint8_t *)swift_slowAlloc();
        v724[0] = 0;
        *(void *)&long long v721 = 0;
        *(_WORD *)uint64_t v127 = 0;
        v720[0] = (uint64_t)(v127 + 2);
        sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v122, v123, "No MobileAsset found.", v127, 2u);
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      v718(v125, v126);
      BOOL v154 = v714;
      uint64_t v155 = *(void **)(v719 + 1336);
      uint64_t v156 = *(void *)(v719 + 1008);
      uint64_t v157 = *(void *)(v719 + 984);
      uint64_t v158 = *(void *)(v719 + 976);
      uint64_t v159 = *(void *)(v719 + 904);
      v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
      unint64_t v723 = sub_100016E14();
      char v160 = 7;
      goto LABEL_72;
    }
    swift_retain();
    sub_1000188A0();
    if (qword_1000202D8 != -1) {
      swift_once();
    }
    uint64_t v107 = *(void *)(v719 + 848);
    uint64_t v697 = *(void *)(v719 + 896);
    uint64_t v108 = *(void *)(v719 + 832);
    uint64_t v109 = *(void *)(v719 + 792);
    uint64_t v110 = *(void *)(v719 + 784);
    uint64_t v111 = *(void *)(v719 + 776);
    uint64_t v685 = *(void *)(v719 + 768);
    uint64_t v687 = *(void *)(v719 + 800);
    uint64_t v112 = unk_100020D50;
    *(void *)(v719 + 504) = qword_100020D48;
    *(void *)(v719 + 512) = v112;
    uint64_t v113 = enum case for URL.DirectoryHint.inferFromPath(_:);
    unsigned int v689 = enum case for URL.DirectoryHint.inferFromPath(_:);
    uint64_t v114 = sub_1000187C0();
    uint64_t v688 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v114 - 8) + 104);
    v688(v110, v113, v114);
    sub_100017780();
    swift_bridgeObjectRetain();
    sub_100018840();
    (*(void (**)(uint64_t, uint64_t))(v111 + 8))(v110, v685);
    swift_bridgeObjectRelease();
    uint64_t v115 = *(void (**)(uint64_t, uint64_t))(v687 + 8);
    v115(v108, v109);
    sub_1000187D0();
    uint64_t v692 = v115;
    v115(v107, v109);
    v710(v697, 1, 1, v109);
    v688(v110, v689, v114);
    sub_100018830();
    id v116 = [self defaultManager];
    sub_100018810();
    NSString v117 = sub_100018A30();
    swift_bridgeObjectRelease();
    LODWORD(v108) = [v116 fileExistsAtPath:v117];
    swift_release();

    if (v108)
    {
      uint64_t v118 = *(void *)(v719 + 904);
      uint64_t v119 = *(void *)(v719 + 840);
      uint64_t v120 = *(void *)(v719 + 800);
      uint64_t v121 = *(void *)(v719 + 792);
      sub_1000173D4(v118, &qword_1000201A0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v120 + 32))(v118, v119, v121);
      v710(v118, 0, 1, v121);
    }
    else
    {
      v692(*(void *)(v719 + 840), *(void *)(v719 + 792));
    }
    v99 = v707;
  }
  uint64_t v128 = *(void *)(v39 + 880);
  uint64_t v129 = *(void *)(v39 + 792);
  sub_100017DCC(*(void *)(v39 + 904), v128, &qword_1000201A0);
  if (v99(v128, 1, v129) == 1)
  {
    uint64_t v130 = *(void *)(v39 + 1368);
    BOOL v131 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 1304);
    uint64_t v132 = *(void *)(v39 + 1224);
    uint64_t v133 = *(void *)(v39 + 1016);
    sub_1000173D4(*(void *)(v39 + 880), &qword_1000201A0);
    v131(v132, v130, v133);
    v134 = sub_1000189C0();
    os_log_type_t v135 = sub_100018B40();
    BOOL v136 = os_log_type_enabled(v134, v135);
    uint64_t v137 = *(void *)(v39 + 1224);
    uint64_t v138 = *(void *)(v39 + 1016);
    if (v136)
    {
      uint64_t v139 = (uint8_t *)swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = 0;
      *(_WORD *)uint64_t v139 = 0;
      v720[0] = (uint64_t)(v139 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v134, v135, "Unable to get recipe from task folder or mobileAssets", v139, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v718(v137, v138);
    BOOL v154 = v714;
    uint64_t v155 = *(void **)(v39 + 1336);
    uint64_t v156 = *(void *)(v39 + 1008);
    uint64_t v157 = *(void *)(v39 + 984);
    uint64_t v158 = *(void *)(v39 + 976);
    uint64_t v159 = *(void *)(v39 + 904);
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    char v160 = 8;
LABEL_72:
    LOBYTE(v721) = v160;
    id v258 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v677 = sub_1000188C0();

    sub_1000173D4(v159, &qword_1000201A0);
LABEL_73:
    (*(void (**)(uint64_t, uint64_t))(v157 + 8))(v156, v158);
LABEL_74:
    swift_release();
LABEL_75:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v259 = *(uint64_t (**)(uint64_t))(v719 + 8);
    return v259(v677);
  }
  (*(void (**)(void, void, void))(*(void *)(v39 + 800) + 32))(*(void *)(v39 + 824), *(void *)(v39 + 880), *(void *)(v39 + 792));
  uint64_t v172 = sub_100018860();
  unint64_t v174 = v173;
  uint64_t v175 = (id *)(v39 + 720);
  uint64_t v176 = self;
  v177.super.Class isa = sub_100018870().super.isa;
  uint64_t v178 = _swiftEmptyArrayStorage[2];
  if (v178)
  {
    uint64_t v179 = 0;
    uint64_t v180 = &_swiftEmptyArrayStorage[4];
    do
    {
      uint64_t v182 = *v180++;
      uint64_t v181 = v182;
      if ((v182 & ~v179) == 0) {
        uint64_t v181 = 0;
      }
      v179 |= v181;
      --v178;
    }
    while (v178);
  }
  else
  {
    uint64_t v179 = 0;
  }
  swift_bridgeObjectRelease();
  *uint64_t v175 = 0;
  id v272 = [v176 JSONObjectWithData:v177.super.isa options:v179 error:v39 + 720];

  id v273 = *v175;
  if (!v272)
  {
    v280 = v273;
    uint64_t v281 = sub_1000187B0();

    swift_willThrow();
    sub_100017838(v172, v174);
    (*(void (**)(void, void, void))(v39 + 1304))(*(void *)(v39 + 1040), *(void *)(v39 + 1368), *(void *)(v39 + 1016));
    uint64_t v140 = swift_allocObject();
    *(void *)(v140 + 16) = v281;
    swift_errorRetain();
    uint64_t v141 = sub_1000189C0();
    os_log_type_t v142 = sub_100018B40();
    uint64_t v143 = swift_allocObject();
    *(unsigned char *)(v143 + 16) = 32;
    uint64_t v144 = swift_allocObject();
    *(unsigned char *)(v144 + 16) = 8;
    uint64_t v145 = swift_allocObject();
    *(void *)(v145 + 16) = sub_1000177D4;
    *(void *)(v145 + 24) = v140;
    uint64_t v146 = swift_allocObject();
    *(void *)(v146 + 16) = sub_1000185F8;
    *(void *)(v146 + 24) = v145;
    uint64_t v147 = swift_allocObject();
    *(_OWORD *)(v147 + 16) = xmmword_100019310;
    *(void *)(v147 + 32) = sub_1000187A0;
    *(void *)(v147 + 40) = v143;
    *(void *)(v147 + 48) = sub_1000187A4;
    *(void *)(v147 + 56) = v144;
    *(void *)(v147 + 64) = sub_100018640;
    *(void *)(v147 + 72) = v146;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v141, v142))
    {
      uint64_t v148 = (uint8_t *)swift_slowAlloc();
      uint64_t v149 = swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = v149;
      *(_WORD *)uint64_t v148 = 258;
      v148[2] = *(unsigned char *)(v143 + 16);
      swift_release();
      v148[3] = *(unsigned char *)(v144 + 16);
      v720[0] = (uint64_t)(v148 + 4);
      swift_release();
      sub_10001502C(v720, (uint64_t)v724, (uint64_t *)&v721, *(uint64_t (**)(void))(v146 + 16));
      uint64_t v150 = *(void *)(v39 + 1040);
      uint64_t v151 = *(void *)(v39 + 1016);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v141, v142, "Got error when reading recipe file: %s", v148, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v152 = v150;
      uint64_t v153 = v151;
    }
    else
    {
      uint64_t v161 = *(void *)(v39 + 1040);
      uint64_t v162 = *(void *)(v39 + 1016);
      swift_release();
      swift_release();
      swift_release();

      uint64_t v152 = v161;
      uint64_t v153 = v162;
    }
    v718(v152, v153);
    uint64_t v163 = *(void **)(v719 + 1336);
    uint64_t v164 = *(void *)(v719 + 1008);
    uint64_t v165 = *(void *)(v719 + 984);
    uint64_t v166 = *(void *)(v719 + 976);
    uint64_t v167 = *(void *)(v719 + 904);
    uint64_t v168 = *(void *)(v719 + 824);
    uint64_t v169 = *(void *)(v719 + 800);
    uint64_t v170 = *(void *)(v719 + 792);
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    LOBYTE(v721) = 10;
    id v171 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v677 = sub_1000188C0();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v169 + 8))(v168, v170);
    sub_1000173D4(v167, &qword_1000201A0);
    (*(void (**)(uint64_t, uint64_t))(v165 + 8))(v164, v166);
    goto LABEL_74;
  }
  uint64_t v274 = v39 + 80;
  sub_100018B80();
  swift_unknownObjectRelease();
  sub_100017890(v39 + 80, v39 + 48);
  sub_100014284(&qword_1000201F0);
  if (!swift_dynamicCast())
  {
    (*(void (**)(void, void, void))(v39 + 1304))(*(void *)(v39 + 1232), *(void *)(v39 + 1368), *(void *)(v39 + 1016));
    id v300 = sub_1000189C0();
    os_log_type_t v301 = sub_100018B40();
    BOOL v302 = os_log_type_enabled(v300, v301);
    uint64_t v303 = *(void *)(v39 + 1232);
    uint64_t v304 = *(void *)(v39 + 1016);
    if (v302)
    {
      v305 = (uint8_t *)swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = 0;
      *(_WORD *)v305 = 0;
      v720[0] = (uint64_t)(v305 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v300, v301, "Unable to parse recipe into dictionary.", v305, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v718(v303, v304);
    uint64_t v379 = *(void **)(v719 + 1336);
    uint64_t v717 = *(void *)(v719 + 1008);
    uint64_t v380 = *(void *)(v719 + 984);
    uint64_t v712 = *(void *)(v719 + 904);
    uint64_t v713 = *(void *)(v719 + 976);
    uint64_t v381 = *(void *)(v719 + 824);
    uint64_t v382 = *(void *)(v719 + 800);
    uint64_t v383 = *(void *)(v719 + 792);
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    LOBYTE(v721) = 9;
    id v384 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v677 = sub_1000188C0();
    sub_100017838(v172, v174);

    sub_1000178EC(v274);
    (*(void (**)(uint64_t, uint64_t))(v382 + 8))(v381, v383);
    sub_1000173D4(v712, &qword_1000201A0);
    (*(void (**)(uint64_t, uint64_t))(v380 + 8))(v717, v713);
    goto LABEL_74;
  }
  uint64_t v275 = *(void *)(v39 + 904);
  uint64_t v276 = *(void *)(v39 + 824);
  uint64_t v277 = *(void *)(v719 + 800);
  uint64_t v278 = *(void *)(v719 + 792);
  Class v279 = sub_1000189F0().super.isa;
  swift_bridgeObjectRelease();
  v52 = v714;
  [v714 setRecipe:v279];
  sub_100017838(v172, v174);

  sub_1000178EC(v274);
  (*(void (**)(uint64_t, uint64_t))(v277 + 8))(v276, v278);
  uint64_t v39 = v719;
  sub_1000173D4(v275, &qword_1000201A0);
LABEL_21:
  uint64_t v715 = v39 + 600;
  (*(void (**)(void, void, void))(v39 + 1304))(*(void *)(v39 + 1216), *(void *)(v39 + 1368), *(void *)(v39 + 1016));
  uint64_t v79 = swift_allocObject();
  *(void *)(v79 + 16) = v52;
  uint64_t v80 = swift_allocObject();
  *(void *)(v80 + 16) = sub_100017058;
  *(void *)(v80 + 24) = v79;
  id v81 = v52;
  uint64_t v82 = sub_1000189C0();
  os_log_type_t v83 = sub_100018B30();
  uint64_t v84 = (void *)v39;
  uint64_t v85 = swift_allocObject();
  *(unsigned char *)(v85 + 16) = 32;
  uint64_t v86 = swift_allocObject();
  *(unsigned char *)(v86 + 16) = 8;
  uint64_t v87 = swift_allocObject();
  *(void *)(v87 + 16) = sub_1000170C8;
  *(void *)(v87 + 24) = v80;
  uint64_t v88 = swift_allocObject();
  *(void *)(v88 + 16) = sub_1000185DC;
  *(void *)(v88 + 24) = v87;
  uint64_t v89 = swift_allocObject();
  *(_OWORD *)(v89 + 16) = xmmword_100019310;
  *(void *)(v89 + 32) = sub_100018740;
  *(void *)(v89 + 40) = v85;
  *(void *)(v89 + 48) = sub_100018744;
  *(void *)(v89 + 56) = v86;
  *(void *)(v89 + 64) = sub_100018614;
  *(void *)(v89 + 72) = v88;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v82, v83))
  {
    v90 = (uint8_t *)swift_slowAlloc();
    uint64_t v91 = swift_slowAlloc();
    v724[0] = 0;
    *(void *)&long long v721 = v91;
    *(_WORD *)v90 = 258;
    v90[2] = *(unsigned char *)(v85 + 16);
    swift_release();
    v90[3] = *(unsigned char *)(v86 + 16);
    v720[0] = (uint64_t)(v90 + 4);
    swift_release();
    sub_10001502C(v720, (uint64_t)v724, (uint64_t *)&v721, *(uint64_t (**)(void))(v88 + 16));
    uint64_t v92 = v84[152];
    uint64_t v93 = v84[127];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v82, v83, "worker.recipe: %s", v90, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v94 = v92;
    uint64_t v95 = v93;
  }
  else
  {
    uint64_t v183 = v84[152];
    uint64_t v184 = v84[127];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v94 = v183;
    uint64_t v95 = v184;
  }
  v718(v94, v95);
  uint64_t v185 = v84[174];
  if (os_variant_has_internal_diagnostics()) {
    uint64_t v186 = 1001;
  }
  else {
    uint64_t v186 = 5001;
  }
  sub_100017224(0, &qword_1000201D8);
  sub_100018990();
  id v187 = sub_100012BBC(0x74736F484C4DLL, 0xE600000000000000, v186);
  [v81 setTriExperimentIdentifiers:v187];

  swift_beginAccess();
  uint64_t v188 = v84[109];
  uint64_t v189 = v84[100];
  uint64_t v190 = v84[99];
  uint64_t v191 = v84;
  if (*(void *)(v185 + 16))
  {
    swift_retain();
    sub_1000188A0();
    swift_release();
    v192 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v189 + 56);
    v192(v188, 0, 1, v190);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v189 + 48))(v188, 1, v190) != 1)
    {
      uint64_t v193 = v84[109];
      uint64_t v194 = v84[106];
      uint64_t v195 = v84[102];
      uint64_t v196 = v84[100];
      uint64_t v197 = v191[99];
      (*(void (**)(void, uint64_t, uint64_t))(v191[100] + 32))(v191[102], v193, v197);
      sub_1000187D0();
      sub_1000187F0();
      swift_bridgeObjectRelease();
      sub_100018800(v198);
      id v200 = v199;
      uint64_t v201 = *(void (**)(uint64_t, uint64_t))(v196 + 8);
      v201(v194, v197);
      [v81 setModelsURL:v200];

      v201(v195, v197);
      uint64_t v202 = v715;
      goto LABEL_65;
    }
  }
  else
  {
    v192 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v189 + 56);
    v192(v84[109], 1, 1, v84[99]);
  }
  uint64_t v202 = v715;
  sub_1000173D4(v84[109], &qword_1000201A0);
LABEL_65:
  uint64_t v222 = swift_allocObject();
  v191[180] = v222;
  *(void *)(v222 + 16) = 0;
  id v223 = [v81 recipe];
  uint64_t v224 = sub_100018A00();

  sub_1000127F4(v224);
  swift_bridgeObjectRelease();
  Class v225 = sub_1000189F0().super.isa;
  swift_bridgeObjectRelease();
  v191[75] = *(void *)(v222 + 16);
  id v716 = [v81 checkIfModelShouldBeDownloaded:v225 outError:v202];
  v191[181] = v716;

  v226 = (void *)v191[75];
  v227 = *(void **)(v222 + 16);
  *(void *)(v222 + 16) = v226;
  id v228 = v226;

  uint64_t v229 = v191[171];
  v230 = (void (*)(void, uint64_t, uint64_t))v191[163];
  uint64_t v231 = v191[127];
  if (*(void *)(v222 + 16))
  {
    v230(v191[151], v229, v231);
    swift_retain();
    uint64_t v232 = sub_1000189C0();
    os_log_type_t v233 = sub_100018B30();
    uint64_t v234 = swift_allocObject();
    *(unsigned char *)(v234 + 16) = 64;
    uint64_t v235 = swift_allocObject();
    *(unsigned char *)(v235 + 16) = 8;
    uint64_t v236 = swift_allocObject();
    *(void *)(v236 + 16) = sub_100018714;
    *(void *)(v236 + 24) = v222;
    uint64_t v237 = swift_allocObject();
    *(_OWORD *)(v237 + 16) = xmmword_100019310;
    *(void *)(v237 + 32) = sub_100018798;
    *(void *)(v237 + 40) = v234;
    *(void *)(v237 + 48) = sub_10001879C;
    *(void *)(v237 + 56) = v235;
    *(void *)(v237 + 64) = sub_10001863C;
    *(void *)(v237 + 72) = v236;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v232, v233))
    {
      uint64_t v238 = (uint8_t *)swift_slowAlloc();
      v724[0] = (void *)swift_slowAlloc();
      *(void *)&long long v721 = 0;
      *(_WORD *)uint64_t v238 = 258;
      v238[2] = *(unsigned char *)(v234 + 16);
      swift_release();
      v238[3] = *(unsigned char *)(v235 + 16);
      v720[0] = (uint64_t)(v238 + 4);
      swift_release();
      sub_1000156FC(v720, v724, (uint64_t)&v721, *(uint64_t (**)(void))(v236 + 16));
      uint64_t v239 = *(void *)(v719 + 1208);
      uint64_t v240 = *(void *)(v719 + 1016);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v232, v233, "Got error getting data processor: %@", v238, 0xCu);
      sub_100014284(&qword_100020218);
      swift_arrayDestroy();
      uint64_t v191 = (void *)v719;
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v241 = v239;
      uint64_t v242 = v240;
    }
    else
    {
      uint64_t v261 = v191[151];
      uint64_t v262 = v191[127];
      swift_release();
      swift_release();
      swift_release();

      uint64_t v241 = v261;
      uint64_t v242 = v262;
    }
    v718(v241, v242);
    id v263 = (void *)v191[167];
    uint64_t v264 = v191[126];
    uint64_t v265 = v191[123];
    uint64_t v266 = v191[122];
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    LOBYTE(v721) = 11;
    id v267 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v677 = sub_1000188C0();

    (*(void (**)(uint64_t, uint64_t))(v265 + 8))(v264, v266);
    goto LABEL_255;
  }
  uint64_t v709 = v192;
  uint64_t v711 = v222;
  v230(v191[150], v229, v231);
  uint64_t v243 = swift_allocObject();
  *(void *)(v243 + 16) = v81;
  id v703 = v81;
  os_log_type_t v244 = sub_1000189C0();
  os_log_type_t v245 = sub_100018B30();
  uint64_t v246 = swift_allocObject();
  *(unsigned char *)(v246 + 16) = 64;
  uint64_t v247 = swift_allocObject();
  *(unsigned char *)(v247 + 16) = 8;
  uint64_t v248 = v191;
  uint64_t v249 = swift_allocObject();
  *(void *)(v249 + 16) = sub_100017124;
  *(void *)(v249 + 24) = v243;
  uint64_t v250 = swift_allocObject();
  *(void *)(v250 + 16) = sub_100018600;
  *(void *)(v250 + 24) = v249;
  uint64_t v251 = swift_allocObject();
  *(_OWORD *)(v251 + 16) = xmmword_100019310;
  *(void *)(v251 + 32) = sub_100018748;
  *(void *)(v251 + 40) = v246;
  *(void *)(v251 + 48) = sub_10001874C;
  *(void *)(v251 + 56) = v247;
  *(void *)(v251 + 64) = sub_100018618;
  *(void *)(v251 + 72) = v250;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  os_log_type_t v252 = v245;
  if (os_log_type_enabled(v244, v245))
  {
    uint64_t v253 = (uint8_t *)swift_slowAlloc();
    v724[0] = (void *)swift_slowAlloc();
    *(void *)&long long v721 = 0;
    *(_WORD *)uint64_t v253 = 258;
    v253[2] = *(unsigned char *)(v246 + 16);
    swift_release();
    v253[3] = *(unsigned char *)(v247 + 16);
    v720[0] = (uint64_t)(v253 + 4);
    swift_release();
    sub_1000156FC(v720, v724, (uint64_t)&v721, *(uint64_t (**)(void))(v250 + 16));
    uint64_t v254 = v248[150];
    uint64_t v255 = v248[127];
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v244, v252, "Trial experiment identifiers: %@", v253, 0xCu);
    sub_100014284(&qword_100020218);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v256 = v254;
    uint64_t v257 = v255;
  }
  else
  {
    uint64_t v282 = v248[150];
    uint64_t v283 = v248[127];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v256 = v282;
    uint64_t v257 = v283;
  }
  v718(v256, v257);
  uint64_t v284 = v248;
  uint64_t v285 = v248[174];
  uint64_t v286 = swift_allocObject();
  v248[182] = v286;
  sub_100018850();
  *(void *)(v286 + 16) = _swiftEmptyArrayStorage;
  uint64_t v287 = v248[108];
  uint64_t v288 = v248[100];
  uint64_t v289 = v248[99];
  if (!*(void *)(v285 + 16))
  {
    v709(v287, 1, 1, v289);
    goto LABEL_95;
  }
  swift_retain();
  sub_1000188A0();
  swift_release();
  v709(v287, 0, 1, v289);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v288 + 48))(v287, 1, v289) == 1)
  {
LABEL_95:
    uint64_t v306 = v248[171];
    id v307 = (void (*)(uint64_t, uint64_t, uint64_t))v248[163];
    uint64_t v308 = v248[149];
    uint64_t v309 = v248[127];
    sub_1000173D4(v248[108], &qword_1000201A0);
    v307(v308, v306, v309);
    uint64_t v310 = sub_1000189C0();
    os_log_type_t v311 = sub_100018B30();
    BOOL v312 = os_log_type_enabled(v310, v311);
    uint64_t v313 = v248[149];
    uint64_t v314 = v248[127];
    if (v312)
    {
      unint64_t v315 = (uint8_t *)swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = 0;
      *(_WORD *)unint64_t v315 = 0;
      v720[0] = (uint64_t)(v315 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
      uint64_t v284 = (void *)v719;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v310, v311, "No task folder found", v315, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v718(v313, v314);
    goto LABEL_99;
  }
  (*(void (**)(void, void, void))(v248[100] + 32))(v248[101], v248[108], v248[99]);
  id v290 = [self defaultManager];
  sub_1000187E0();
  NSString v291 = sub_100018A30();
  swift_bridgeObjectRelease();
  v248[85] = 0;
  id v292 = [v290 contentsOfDirectoryAtPath:v291 error:v248 + 85];

  id v293 = (void *)v248[85];
  if (!v292)
  {
    uint64_t v418 = v248[171];
    uint64_t v419 = (void (*)(uint64_t, uint64_t, uint64_t))v248[163];
    uint64_t v420 = v248[129];
    uint64_t v421 = v248[127];
    id v422 = v293;
    uint64_t v423 = sub_1000187B0();

    swift_willThrow();
    v419(v420, v418, v421);
    uint64_t v424 = swift_allocObject();
    *(void *)(v424 + 16) = v423;
    swift_errorRetain();
    uint64_t v425 = sub_1000189C0();
    os_log_type_t v426 = sub_100018B40();
    uint64_t v427 = swift_allocObject();
    *(unsigned char *)(v427 + 16) = 32;
    uint64_t v428 = swift_allocObject();
    *(unsigned char *)(v428 + 16) = 8;
    uint64_t v429 = swift_allocObject();
    *(void *)(v429 + 16) = sub_10001773C;
    *(void *)(v429 + 24) = v424;
    uint64_t v430 = swift_allocObject();
    *(void *)(v430 + 16) = sub_1000185F4;
    *(void *)(v430 + 24) = v429;
    uint64_t v431 = swift_allocObject();
    *(_OWORD *)(v431 + 16) = xmmword_100019310;
    *(void *)(v431 + 32) = sub_100018790;
    *(void *)(v431 + 40) = v427;
    *(void *)(v431 + 48) = sub_100018794;
    *(void *)(v431 + 56) = v428;
    *(void *)(v431 + 64) = sub_100018638;
    *(void *)(v431 + 72) = v430;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v425, v426))
    {
      v432 = (uint8_t *)swift_slowAlloc();
      uint64_t v433 = swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = v433;
      *(_WORD *)v432 = 258;
      v432[2] = *(unsigned char *)(v427 + 16);
      swift_release();
      v432[3] = *(unsigned char *)(v428 + 16);
      v720[0] = (uint64_t)(v432 + 4);
      swift_release();
      sub_10001502C(v720, (uint64_t)v724, (uint64_t *)&v721, *(uint64_t (**)(void))(v430 + 16));
      uint64_t v434 = v248[129];
      uint64_t v435 = v248[127];
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v425, v426, "Found a task folder, but got error while trying to access contents: %s", v432, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v436 = v434;
      uint64_t v437 = v435;
    }
    else
    {
      uint64_t v457 = v248[129];
      uint64_t v458 = v248[127];
      swift_release();
      swift_release();
      swift_release();

      uint64_t v436 = v457;
      uint64_t v437 = v458;
    }
    v718(v436, v437);
    os_log_type_t v459 = v248;
    v460 = (void *)v248[167];
    uint64_t v461 = v459[126];
    uint64_t v462 = v459[123];
    uint64_t v463 = v459[122];
    uint64_t v464 = v459[101];
    uint64_t v465 = *(void *)(v719 + 800);
    uint64_t v466 = *(void *)(v719 + 792);
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    LOBYTE(v721) = 12;
    id v467 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v677 = sub_1000188C0();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v465 + 8))(v464, v466);
    (*(void (**)(uint64_t, uint64_t))(v462 + 8))(v461, v463);
    goto LABEL_128;
  }
  uint64_t v294 = v248[101];
  uint64_t v295 = v248[100];
  uint64_t v296 = v248[99];
  uint64_t v297 = sub_100018AE0();
  id v298 = v293;

  uint64_t v299 = sub_100012C68(v297);
  (*(void (**)(uint64_t, uint64_t))(v295 + 8))(v294, v296);
  uint64_t v284 = (void *)v719;
  swift_bridgeObjectRelease();
  *(void *)(v286 + 16) = v299;
  swift_bridgeObjectRelease();
LABEL_99:
  ((void (*)(void, void, void))v284[163])(v284[148], v284[171], v284[127]);
  uint64_t v316 = swift_allocObject();
  *(void *)(v316 + 16) = sub_1000171B4;
  *(void *)(v316 + 24) = v286;
  swift_retain();
  uint64_t v317 = sub_1000189C0();
  os_log_type_t v318 = sub_100018B30();
  uint64_t v319 = swift_allocObject();
  *(unsigned char *)(v319 + 16) = 32;
  uint64_t v320 = swift_allocObject();
  *(unsigned char *)(v320 + 16) = 8;
  uint64_t v321 = swift_allocObject();
  *(void *)(v321 + 16) = sub_1000171FC;
  *(void *)(v321 + 24) = v316;
  v322 = v284;
  uint64_t v323 = swift_allocObject();
  *(void *)(v323 + 16) = sub_1000185E0;
  *(void *)(v323 + 24) = v321;
  uint64_t v324 = swift_allocObject();
  *(_OWORD *)(v324 + 16) = xmmword_100019310;
  *(void *)(v324 + 32) = sub_100018750;
  *(void *)(v324 + 40) = v319;
  *(void *)(v324 + 48) = sub_100018754;
  *(void *)(v324 + 56) = v320;
  *(void *)(v324 + 64) = sub_10001861C;
  *(void *)(v324 + 72) = v323;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v317, v318))
  {
    uint64_t v325 = (uint8_t *)swift_slowAlloc();
    uint64_t v326 = swift_slowAlloc();
    v724[0] = 0;
    *(void *)&long long v721 = v326;
    *(_WORD *)uint64_t v325 = 258;
    v325[2] = *(unsigned char *)(v319 + 16);
    swift_release();
    v325[3] = *(unsigned char *)(v320 + 16);
    v720[0] = (uint64_t)(v325 + 4);
    swift_release();
    sub_10001502C(v720, (uint64_t)v724, (uint64_t *)&v721, *(uint64_t (**)(void))(v323 + 16));
    v322 = (void *)v719;
    uint64_t v327 = *(void *)(v719 + 1184);
    uint64_t v328 = *(void *)(v719 + 1016);
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v317, v318, "All URLS: %s", v325, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v329 = v327;
    uint64_t v330 = v328;
  }
  else
  {
    uint64_t v331 = v322[148];
    uint64_t v332 = v322[127];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v329 = v331;
    uint64_t v330 = v332;
  }
  v718(v329, v330);
  uint64_t v333 = v322[171];
  id v334 = (void (*)(uint64_t, uint64_t, uint64_t))v322[163];
  uint64_t v335 = v322[147];
  uint64_t v336 = v322[127];
  sub_100017224(0, &qword_1000201E0);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v337 = sub_100012EB4();
  v322[183] = v337;
  v334(v335, v333, v336);
  uint64_t v338 = swift_allocObject();
  *(void *)(v338 + 16) = v337;
  id v701 = v337;
  uint64_t v339 = sub_1000189C0();
  os_log_type_t v340 = sub_100018B30();
  uint64_t v341 = swift_allocObject();
  *(unsigned char *)(v341 + 16) = 64;
  uint64_t v342 = swift_allocObject();
  *(unsigned char *)(v342 + 16) = 8;
  uint64_t v343 = swift_allocObject();
  *(void *)(v343 + 16) = sub_100017260;
  *(void *)(v343 + 24) = v338;
  uint64_t v344 = swift_allocObject();
  *(void *)(v344 + 16) = sub_100018604;
  *(void *)(v344 + 24) = v343;
  uint64_t v345 = swift_allocObject();
  *(_OWORD *)(v345 + 16) = xmmword_100019310;
  *(void *)(v345 + 32) = sub_100018758;
  *(void *)(v345 + 40) = v341;
  *(void *)(v345 + 48) = sub_10001875C;
  *(void *)(v345 + 56) = v342;
  *(void *)(v345 + 64) = sub_100018620;
  *(void *)(v345 + 72) = v344;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v339, v340))
  {
    v346 = (uint8_t *)swift_slowAlloc();
    v724[0] = (void *)swift_slowAlloc();
    *(void *)&long long v721 = 0;
    *(_WORD *)v346 = 258;
    v346[2] = *(unsigned char *)(v341 + 16);
    swift_release();
    v346[3] = *(unsigned char *)(v342 + 16);
    v720[0] = (uint64_t)(v346 + 4);
    swift_release();
    sub_1000156FC(v720, v724, (uint64_t)&v721, *(uint64_t (**)(void))(v344 + 16));
    uint64_t v347 = *(void *)(v719 + 1176);
    uint64_t v348 = *(void *)(v719 + 1016);
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v339, v340, "taskAttachments: %@", v346, 0xCu);
    sub_100014284(&qword_100020218);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v349 = v347;
    uint64_t v350 = v348;
  }
  else
  {
    uint64_t v351 = v322[147];
    uint64_t v352 = v322[127];
    swift_release();
    swift_release();
    swift_release();

    uint64_t v349 = v351;
    uint64_t v350 = v352;
  }
  v718(v349, v350);
  uint64_t v353 = (uint64_t)[v716 getCoreDictionary];
  if (!v353)
  {
LABEL_278:
    __break(1u);
LABEL_279:
    __break(1u);
    goto LABEL_280;
  }
  v361 = (void *)v353;
  uint64_t v693 = *(void *)(v719 + 1368);
  uint64_t v362 = *(void *)(v719 + 1168);
  uint64_t v690 = *(void *)(v719 + 1016);
  uint64_t v691 = *(void (**)(uint64_t, uint64_t, uint64_t))(v719 + 1304);
  sub_100018A00();

  Class v363 = sub_1000189F0().super.isa;
  swift_bridgeObjectRelease();
  id v364 = [v703 recipe];
  uint64_t v365 = sub_100018A00();

  sub_1000127F4(v365);
  swift_bridgeObjectRelease();
  Class v366 = sub_1000189F0().super.isa;
  swift_bridgeObjectRelease();
  *(void *)(v719 + 696) = *(void *)(v711 + 16);
  id v367 = [v703 gatherMetricsToReturn:v363 withRecipe:v366 withAttachments:v701 outError:v719 + 696];

  uint64_t v368 = *(void **)(v719 + 696);
  uint64_t v369 = *(void **)(v711 + 16);
  *(void *)(v711 + 16) = v368;
  id v370 = v368;

  uint64_t v371 = sub_100018AE0();
  uint64_t v372 = sub_100012F2C(v371);
  *(void *)(v719 + 1472) = v372;
  swift_bridgeObjectRelease();
  v691(v362, v693, v690);
  id v373 = sub_1000189C0();
  os_log_type_t v374 = sub_100018B30();
  BOOL v375 = os_log_type_enabled(v373, v374);
  uint64_t v376 = *(void *)(v719 + 1168);
  uint64_t v377 = *(void *)(v719 + 1016);
  if (v375)
  {
    uint64_t v378 = (uint8_t *)swift_slowAlloc();
    v724[0] = 0;
    *(void *)&long long v721 = 0;
    *(_WORD *)uint64_t v378 = 0;
    v720[0] = (uint64_t)(v378 + 2);
    sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v373, v374, "Gathered metrics!", v378, 2u);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  v718(v376, v377);
  *(void *)(v719 + 1480) = 0;
  (*(void (**)(void, void, void))(v719 + 1304))(*(void *)(v719 + 1160), *(void *)(v719 + 1368), *(void *)(v719 + 1016));
  uint64_t v385 = swift_allocObject();
  *(void *)(v385 + 16) = v372;
  uint64_t v386 = swift_allocObject();
  *(void *)(v386 + 16) = sub_100018710;
  *(void *)(v386 + 24) = v385;
  uint64_t v698 = v372;
  swift_bridgeObjectRetain();
  uint64_t v387 = sub_1000189C0();
  os_log_type_t v388 = sub_100018B30();
  uint64_t v389 = swift_allocObject();
  *(unsigned char *)(v389 + 16) = 32;
  uint64_t v390 = (void *)v719;
  uint64_t v391 = swift_allocObject();
  *(unsigned char *)(v391 + 16) = 8;
  uint64_t v392 = swift_allocObject();
  *(void *)(v392 + 16) = sub_100017288;
  *(void *)(v392 + 24) = v386;
  uint64_t v393 = swift_allocObject();
  *(void *)(v393 + 16) = sub_1000185E4;
  *(void *)(v393 + 24) = v392;
  uint64_t v394 = swift_allocObject();
  *(_OWORD *)(v394 + 16) = xmmword_100019310;
  *(void *)(v394 + 32) = sub_100018760;
  *(void *)(v394 + 40) = v389;
  *(void *)(v394 + 48) = sub_100018764;
  *(void *)(v394 + 56) = v391;
  *(void *)(v394 + 64) = sub_100018624;
  *(void *)(v394 + 72) = v393;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v387, v388))
  {
    Class v395 = (uint8_t *)swift_slowAlloc();
    uint64_t v396 = swift_slowAlloc();
    v724[0] = 0;
    *(void *)&long long v721 = v396;
    *(_WORD *)Class v395 = 258;
    v395[2] = *(unsigned char *)(v389 + 16);
    swift_release();
    v395[3] = *(unsigned char *)(v391 + 16);
    v720[0] = (uint64_t)(v395 + 4);
    swift_release();
    sub_10001502C(v720, (uint64_t)v724, (uint64_t *)&v721, *(uint64_t (**)(void))(v393 + 16));
    uint64_t v390 = (void *)v719;
    uint64_t v397 = *(void *)(v719 + 1160);
    uint64_t v398 = *(void *)(v719 + 1016);
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v387, v388, "Results: %s", v395, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v399 = v397;
    uint64_t v400 = v398;
  }
  else
  {
    uint64_t v401 = *(void *)(v719 + 1160);
    uint64_t v402 = *(void *)(v719 + 1016);
    swift_release();
    swift_release();
    swift_release();

    uint64_t v399 = v401;
    uint64_t v400 = v402;
  }
  v718(v399, v400);
  uint64_t v403 = v390[171];
  uint64_t v404 = (void (*)(uint64_t, uint64_t, uint64_t))v390[163];
  uint64_t v405 = v390[127];
  if (*(void *)(v711 + 16))
  {
    uint64_t v406 = v390[144];
    swift_bridgeObjectRelease();
    v404(v406, v403, v405);
    swift_retain();
    v407 = sub_1000189C0();
    os_log_type_t v408 = sub_100018B30();
    uint64_t v409 = swift_allocObject();
    *(unsigned char *)(v409 + 16) = 64;
    uint64_t v410 = swift_allocObject();
    *(unsigned char *)(v410 + 16) = 8;
    uint64_t v411 = swift_allocObject();
    *(void *)(v411 + 16) = sub_1000176A0;
    *(void *)(v411 + 24) = v711;
    uint64_t v412 = swift_allocObject();
    *(_OWORD *)(v412 + 16) = xmmword_100019310;
    *(void *)(v412 + 32) = sub_100018788;
    *(void *)(v412 + 40) = v409;
    *(void *)(v412 + 48) = sub_10001878C;
    *(void *)(v412 + 56) = v410;
    *(void *)(v412 + 64) = sub_100018634;
    *(void *)(v412 + 72) = v411;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v407, v408))
    {
      id v413 = (uint8_t *)swift_slowAlloc();
      v724[0] = (void *)swift_slowAlloc();
      *(void *)&long long v721 = 0;
      *(_WORD *)id v413 = 258;
      v413[2] = *(unsigned char *)(v409 + 16);
      swift_release();
      v413[3] = *(unsigned char *)(v410 + 16);
      v720[0] = (uint64_t)(v413 + 4);
      swift_release();
      sub_1000156FC(v720, v724, (uint64_t)&v721, *(uint64_t (**)(void))(v411 + 16));
      uint64_t v390 = (void *)v719;
      uint64_t v414 = *(void *)(v719 + 1152);
      uint64_t v415 = *(void *)(v719 + 1016);
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v407, v408, "Got error getting metrics: %@", v413, 0xCu);
      sub_100014284(&qword_100020218);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v416 = v414;
      uint64_t v417 = v415;
    }
    else
    {
      uint64_t v450 = v390[144];
      uint64_t v451 = v390[127];
      swift_release();
      swift_release();
      swift_release();

      uint64_t v416 = v450;
      uint64_t v417 = v451;
    }
    v718(v416, v417);
    uint64_t v452 = (void *)v390[167];
    uint64_t v453 = v390[126];
    uint64_t v454 = v390[123];
    uint64_t v455 = v390[122];
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    LOBYTE(v721) = 13;
    id v456 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v677 = sub_1000188C0();

    (*(void (**)(uint64_t, uint64_t))(v454 + 8))(v453, v455);
    swift_release();
    swift_release();
    swift_release();
    goto LABEL_75;
  }
  v404(v390[143], v390[171], v390[127]);
  uint64_t v438 = swift_allocObject();
  *(void *)(v438 + 16) = v703;
  id v439 = v703;
  uint64_t v440 = sub_1000189C0();
  v441 = v390;
  os_log_type_t v442 = sub_100018B30();
  uint64_t v443 = swift_allocObject();
  *(unsigned char *)(v443 + 16) = 32;
  uint64_t v444 = swift_allocObject();
  *(unsigned char *)(v444 + 16) = 8;
  uint64_t v445 = swift_allocObject();
  *(void *)(v445 + 16) = sub_1000172B0;
  *(void *)(v445 + 24) = v438;
  uint64_t v446 = swift_allocObject();
  *(void *)(v446 + 16) = sub_1000185E8;
  *(void *)(v446 + 24) = v445;
  uint64_t v447 = swift_allocObject();
  *(_OWORD *)(v447 + 16) = xmmword_100019310;
  *(void *)(v447 + 32) = sub_100018768;
  *(void *)(v447 + 40) = v443;
  *(void *)(v447 + 48) = sub_10001876C;
  *(void *)(v447 + 56) = v444;
  *(void *)(v447 + 64) = sub_100018628;
  *(void *)(v447 + 72) = v446;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v440, v442))
  {
    uint64_t v448 = (uint8_t *)swift_slowAlloc();
    uint64_t v449 = swift_slowAlloc();
    v724[0] = 0;
    *(void *)&long long v721 = v449;
    *(_WORD *)uint64_t v448 = 258;
    v448[2] = *(unsigned char *)(v443 + 16);
    swift_release();
    v448[3] = *(unsigned char *)(v444 + 16);
    v720[0] = (uint64_t)(v448 + 4);
    swift_release();
    sub_10001502C(v720, (uint64_t)v724, (uint64_t *)&v721, *(uint64_t (**)(void))(v446 + 16));
    uint64_t v704 = *(void *)(v719 + 1144);
    uint64_t v470 = *(void *)(v719 + 1016);
    swift_release();
    os_log_type_t v471 = v442;
    uint64_t v472 = (void *)v719;
    _os_log_impl((void *)&_mh_execute_header, v440, v471, "Logging strategies: %s", v448, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v718(v704, v470);
  }
  else
  {
    uint64_t v468 = v441[143];
    uint64_t v469 = v441[127];
    swift_release();
    swift_release();
    swift_release();

    v718(v468, v469);
    uint64_t v472 = v441;
  }
  uint64_t v473 = sub_100018A40();
  uint64_t v475 = v474;
  id v476 = [v439 recipe];
  uint64_t v477 = sub_100018A00();

  sub_100013188(v473, v475, v477, (_OWORD *)v472 + 13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v478 = (uint64_t)v698;
  if (!v472[29])
  {
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)(v472 + 26), &qword_1000201E8);
LABEL_145:
    ((void (*)(void, void, void))v472[163])(v472[133], v472[171], v472[127]);
    v496 = sub_1000189C0();
    os_log_type_t v497 = sub_100018B40();
    BOOL v498 = os_log_type_enabled(v496, v497);
    uint64_t v499 = v472[133];
    uint64_t v500 = v472[127];
    if (v498)
    {
      uint64_t v501 = (uint8_t *)swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = 0;
      *(_WORD *)uint64_t v501 = 0;
      v720[0] = (uint64_t)(v501 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v496, v497, "Logging strategies missing", v501, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v718(v499, v500);
    id v502 = (void *)v472[167];
    uint64_t v503 = v472[126];
    uint64_t v504 = v472[123];
    uint64_t v505 = v472[122];
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    char v506 = 14;
    goto LABEL_149;
  }
  sub_100014284(&qword_100020168);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_145;
  }
  uint64_t v479 = v472[89];
  v472[186] = v479;
  if ((sub_1000131EC(0x6E61697373756147, 0xEF6F637369446544, (void *)v479) & 1) == 0) {
    goto LABEL_241;
  }
  id v480 = [v439 recipe];
  uint64_t v481 = sub_100018A00();

  sub_100013188(0x436F637369646564, 0xED00006769666E6FLL, v481, (_OWORD *)v472 + 19);
  swift_bridgeObjectRelease();
  if (!v472[41])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)(v472 + 38), &qword_1000201E8);
LABEL_172:
    ((void (*)(void, void, void))v472[163])(v472[135], v472[171], v472[127]);
    int64_t v516 = sub_1000189C0();
    os_log_type_t v517 = sub_100018B40();
    BOOL v518 = os_log_type_enabled(v516, v517);
    uint64_t v519 = v472[135];
    uint64_t v520 = v472[127];
    if (v518)
    {
      uint64_t v521 = (uint8_t *)swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = 0;
      *(_WORD *)uint64_t v521 = 0;
      v720[0] = (uint64_t)(v521 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v516, v517, "Recipe lacked dediscoConfig but specified GaussianDeDisco", v521, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v718(v519, v520);
    id v502 = (void *)v472[167];
    uint64_t v503 = v472[126];
    uint64_t v504 = v472[123];
    uint64_t v505 = v472[122];
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    char v506 = 15;
LABEL_149:
    LOBYTE(v721) = v506;
    id v507 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v677 = sub_1000188C0();

    (*(void (**)(uint64_t, uint64_t))(v504 + 8))(v503, v505);
    swift_release();
    goto LABEL_255;
  }
  uint64_t v482 = sub_100014284(&qword_1000201F0);
  v472[187] = v482;
  v705 = (ValueMetadata *)v482;
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_172;
  }
  uint64_t v483 = v472[78];
  sub_100013188(0x676E69646F636E65, 0xEE00616D65686353, v483, (_OWORD *)v472 + 17);
  uint64_t v686 = v439;
  if (!v472[37])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)(v472 + 34), &qword_1000201E8);
LABEL_178:
    ((void (*)(void, void, void))v472[163])(v472[136], v472[171], v472[127]);
    v522 = sub_1000189C0();
    os_log_type_t v523 = sub_100018B40();
    BOOL v524 = os_log_type_enabled(v522, v523);
    uint64_t v525 = v472[136];
    uint64_t v526 = v472[127];
    if (v524)
    {
      unint64_t v527 = (uint8_t *)swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = 0;
      *(_WORD *)unint64_t v527 = 0;
      v720[0] = (uint64_t)(v527 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v522, v523, "dediscoConfig lacked encodingSchema but specified GaussianDeDisco", v527, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v718(v525, v526);
    int64_t v528 = *(void **)(v719 + 1336);
    uint64_t v529 = *(void *)(v719 + 1008);
    uint64_t v530 = *(void *)(v719 + 984);
    uint64_t v531 = *(void *)(v719 + 976);
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    char v532 = 16;
    goto LABEL_239;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_178;
  }
  uint64_t v683 = v483;
  uint64_t v484 = (uint8_t *)(v472 + 30);
  uint64_t v485 = v472[93];
  v486 = sub_1000132B4((uint64_t)_swiftEmptyArrayStorage);
  v472[91] = v486;
  uint64_t v684 = v485;
  sub_100013188(0xD000000000000010, 0x8000000100019D20, v485, (_OWORD *)v472 + 15);
  if (!v472[33])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)(v472 + 30), &qword_1000201E8);
LABEL_184:
    uint64_t v533 = *(void *)(v719 + 1368);
    uint64_t v534 = *(void (**)(uint64_t, uint64_t, uint64_t))(v719 + 1304);
    uint64_t v535 = *(void *)(v719 + 1096);
    uint64_t v536 = *(void *)(v719 + 1016);
    swift_bridgeObjectRelease();
    v534(v535, v533, v536);
    os_log_type_t v537 = sub_1000189C0();
    os_log_type_t v538 = sub_100018B40();
    BOOL v539 = os_log_type_enabled(v537, v538);
    uint64_t v540 = *(void *)(v719 + 1096);
    uint64_t v541 = *(void *)(v719 + 1016);
    if (v539)
    {
      v542 = (uint8_t *)swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = 0;
      *(_WORD *)v542 = 0;
      v720[0] = (uint64_t)(v542 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v537, v538, "Got malformed dataContentTypes", v542, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v718(v540, v541);
    int64_t v528 = *(void **)(v719 + 1336);
    uint64_t v529 = *(void *)(v719 + 1008);
    uint64_t v530 = *(void *)(v719 + 984);
    uint64_t v531 = *(void *)(v719 + 976);
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    char v532 = 17;
    goto LABEL_239;
  }
  LOBYTE(v487) = v719 - 64;
  uint64_t v681 = sub_100014284(&qword_1000201F8);
  uint64_t v353 = swift_dynamicCast();
  if ((v353 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_184;
  }
  int64_t v488 = 0;
  v682 = (_OWORD *)(v719 + 144);
  uint64_t v680 = (_OWORD *)(v719 + 16);
  uint64_t v678 = (_OWORD *)(v719 + 112);
  uint64_t v679 = (unint64_t *)(v719 + 616);
  uint64_t v489 = *(void *)(v719 + 704);
  uint64_t v490 = *(void *)(v489 + 64);
  uint64_t v694 = v489 + 64;
  uint64_t v491 = v489;
  uint64_t v492 = -1;
  uint64_t v493 = -1 << *(unsigned char *)(v489 + 32);
  if (-v493 < 64) {
    uint64_t v492 = ~(-1 << -(char)v493);
  }
  unint64_t v494 = v492 & v490;
  int64_t v495 = (unint64_t)(63 - v493) >> 6;
  if ((v492 & v490) != 0) {
    goto LABEL_151;
  }
LABEL_152:
  BOOL v510 = __OFADD__(v488++, 1);
  if (v510)
  {
    __break(1u);
    goto LABEL_274;
  }
  if (v488 < v495)
  {
    unint64_t v511 = *(void *)(v694 + 8 * v488);
    if (v511)
    {
LABEL_162:
      unint64_t v494 = (v511 - 1) & v511;
      for (unint64_t i = __clz(__rbit64(v511)) + (v488 << 6); ; unint64_t i = v508 | (v488 << 6))
      {
        uint64_t v513 = *(void *)(v491 + 48) + 16 * i;
        v486 = *(NSObject **)v513;
        uint64_t v478 = *(void *)(v513 + 8);
        uint64_t v484 = *(uint8_t **)(*(void *)(v491 + 56) + 8 * i);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v479 = 0x6E61697373756167;
        v727._countAndFlagsBits = 0x6E61697373756167;
        v727._object = (void *)0xE90000000000003ALL;
        if (sub_100018AB0(v727))
        {
          *(void *)(v719 + 520) = v486;
          *(void *)(v719 + 528) = v478;
          *(void *)(v719 + 536) = 0x6E61697373756167;
          *(void *)(v719 + 544) = 0xE90000000000003ALL;
          sub_100017474();
          sub_100018B20();
          uint64_t v487 = sub_100018AC0();
          uint64_t v515 = v514;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v722 = v705;
          *(void *)&long long v721 = v484;
          v486 = (v719 + 728);
          uint64_t v353 = sub_100013508((uint64_t)&v721, v487, v515);
          if (!v494) {
            goto LABEL_152;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v353 = swift_bridgeObjectRelease();
          if (!v494) {
            goto LABEL_152;
          }
        }
LABEL_151:
        unint64_t v508 = __clz(__rbit64(v494));
        v494 &= v494 - 1;
      }
    }
    int64_t v512 = v488 + 1;
    if (v488 + 1 < v495)
    {
      unint64_t v511 = *(void *)(v694 + 8 * v512);
      if (v511) {
        goto LABEL_161;
      }
      int64_t v512 = v488 + 2;
      if (v488 + 2 >= v495) {
        goto LABEL_188;
      }
      unint64_t v511 = *(void *)(v694 + 8 * v512);
      if (v511)
      {
LABEL_161:
        int64_t v488 = v512;
        goto LABEL_162;
      }
      int64_t v512 = v488 + 3;
      if (v488 + 3 < v495)
      {
        unint64_t v511 = *(void *)(v694 + 8 * v512);
        if (v511) {
          goto LABEL_161;
        }
        while (1)
        {
          int64_t v488 = v512 + 1;
          if (__OFADD__(v512, 1)) {
            break;
          }
          if (v488 >= v495) {
            goto LABEL_188;
          }
          unint64_t v511 = *(void *)(v694 + 8 * v488);
          ++v512;
          if (v511) {
            goto LABEL_162;
          }
        }
        __break(1u);
        goto LABEL_278;
      }
    }
  }
LABEL_188:
  swift_release();
  sub_100013188(1701869940, 0xE400000000000000, v684, v682);
  swift_bridgeObjectRelease();
  if (!*(void *)(v719 + 168))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)v682, &qword_1000201E8);
LABEL_202:
    uint64_t v559 = *(void *)(v719 + 1368);
    uint64_t v560 = *(void (**)(uint64_t, uint64_t, uint64_t))(v719 + 1304);
    uint64_t v561 = *(void *)(v719 + 1104);
    uint64_t v562 = *(void *)(v719 + 1016);
    swift_bridgeObjectRelease();
    v560(v561, v559, v562);
    uint64_t v563 = sub_1000189C0();
    os_log_type_t v564 = sub_100018B40();
    BOOL v565 = os_log_type_enabled(v563, v564);
    uint64_t v566 = *(void *)(v719 + 1104);
    uint64_t v567 = *(void *)(v719 + 1016);
    if (v565)
    {
      uint64_t v568 = (uint8_t *)swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = 0;
      *(_WORD *)uint64_t v568 = 0;
      v720[0] = (uint64_t)(v568 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v563, v564, "encodingSchema lacked type", v568, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v718(v566, v567);
    int64_t v528 = *(void **)(v719 + 1336);
    uint64_t v529 = *(void *)(v719 + 1008);
    uint64_t v530 = *(void *)(v719 + 984);
    uint64_t v531 = *(void *)(v719 + 976);
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    char v532 = 18;
    goto LABEL_239;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_202;
  }
  uint64_t v543 = *(void *)(v719 + 568);
  uint64_t v544 = *(void *)(v719 + 576);
  sub_100014284(&qword_100020208);
  uint64_t v545 = swift_allocObject();
  *(_OWORD *)(v545 + 16) = xmmword_100019320;
  *(void *)(v545 + 32) = 1701869940;
  *(void *)(v545 + 40) = 0xE400000000000000;
  *(void *)(v545 + 48) = v543;
  *(void *)(v545 + 56) = v544;
  *(void *)(v545 + 72) = &type metadata for String;
  *(void *)(v545 + 80) = 0xD000000000000012;
  *(void *)(v545 + 88) = 0x8000000100019D40;
  sub_100014284(&qword_100020210);
  uint64_t v546 = swift_allocObject();
  *(_OWORD *)(v546 + 16) = xmmword_100019330;
  *(void *)(v546 + 32) = 0xD000000000000010;
  *(void *)(v546 + 40) = 0x8000000100019D20;
  *(void *)(v546 + 48) = *(void *)(v719 + 728);
  swift_bridgeObjectRetain();
  unint64_t v547 = sub_1000133EC(v546);
  *(void *)(v545 + 120) = v681;
  *(void *)(v545 + 96) = v547;
  *(void *)(v719 + 1504) = sub_1000132B4(v545);
  unint64_t v494 = 0xD000000000000010;
  sub_100013188(0xD00000000000001DLL, 0x8000000100019D60, v683, v680);
  swift_bridgeObjectRelease();
  if (!*(void *)(v719 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)v680, &qword_1000201E8);
LABEL_235:
    uint64_t v579 = *(void *)(v719 + 1368);
    uint64_t v580 = *(void (**)(uint64_t, uint64_t, uint64_t))(v719 + 1304);
    uint64_t v581 = *(void *)(v719 + 1112);
    uint64_t v582 = *(void *)(v719 + 1016);
    swift_bridgeObjectRelease();
    v580(v581, v579, v582);
    uint64_t v583 = sub_1000189C0();
    os_log_type_t v584 = sub_100018B40();
    BOOL v585 = os_log_type_enabled(v583, v584);
    uint64_t v586 = *(void *)(v719 + 1112);
    uint64_t v587 = *(void *)(v719 + 1016);
    if (v585)
    {
      uint64_t v588 = (uint8_t *)swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = 0;
      *(_WORD *)uint64_t v588 = 0;
      v720[0] = (uint64_t)(v588 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v583, v584, "dediscoConfig lacked DifferentialPrivacyParameters but specified GaussianDeDisco", v588, 2u);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v718(v586, v587);
    int64_t v528 = *(void **)(v719 + 1336);
    uint64_t v529 = *(void *)(v719 + 1008);
    uint64_t v530 = *(void *)(v719 + 984);
    uint64_t v531 = *(void *)(v719 + 976);
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    char v532 = 19;
LABEL_239:
    LOBYTE(v721) = v532;
    id v589 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v677 = sub_1000188C0();

    (*(void (**)(uint64_t, uint64_t))(v530 + 8))(v529, v531);
LABEL_128:
    swift_release();
    goto LABEL_255;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_235;
  }
  *(void *)(v719 + 1512) = *(void *)(v719 + 592);
  *(void *)(v719 + 1520) = [self defaultManager];
  uint64_t v548 = v698[2];
  *(void *)(v719 + 1528) = v548;
  if (!v548)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v472 = (void *)v719;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_241:
    unint64_t v590 = (void *)v472[186];
    unint64_t v591 = v590[2];
    if (v591 <= 1
      && (v591 != 1 || v590[4] == 0x6E61697373756147 && v590[5] == 0xEF6F637369446544 || (sub_100018CC0() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v592 = v472[180];
      int64_t v593 = (void *)v472[179];
      sub_100013058(v472[184]);
      swift_bridgeObjectRelease();
      Class v594 = sub_100018AD0().super.isa;
      swift_bridgeObjectRelease();
      Class v595 = sub_100018AD0().super.isa;
      swift_bridgeObjectRelease();
      v472[73] = *(void *)(v592 + 16);
      id v596 = [v593 logAllResultsToCoreAnalyticsOrDeDisco:v594 withLoggingStrategies:v595 outError:v472 + 73];

      uint64_t v597 = (void *)v472[73];
      char v598 = *(void **)(v592 + 16);
      *(void *)(v592 + 16) = v597;
      id v599 = v597;
    }
    sub_100018920();
    swift_bridgeObjectRelease();
    if (*((unsigned char *)v472 + 472) == 1)
    {
      uint64_t v600 = v472[171];
      v601 = (void *)v472[167];
      uint64_t v602 = (void (*)(uint64_t, uint64_t, uint64_t))v472[163];
      uint64_t v603 = v472[134];
      uint64_t v604 = v472[127];
      os_log_type_t v605 = (void *)v472[94];
      Class v606 = sub_100018B00().super.super.isa;
      sub_100018990();
      NSString v607 = sub_100018A30();
      swift_bridgeObjectRelease();
      [v601 setValue:v606 forKey:v607];

      v602(v603, v600, v604);
      uint64_t v608 = swift_allocObject();
      *(void *)(v608 + 16) = v605;
      id v609 = v605;
      id v610 = sub_1000189C0();
      os_log_type_t v611 = sub_100018B30();
      uint64_t v612 = swift_allocObject();
      *(unsigned char *)(v612 + 16) = 32;
      uint64_t v613 = swift_allocObject();
      *(unsigned char *)(v613 + 16) = 8;
      uint64_t v614 = swift_allocObject();
      *(void *)(v614 + 16) = sub_100017430;
      *(void *)(v614 + 24) = v608;
      uint64_t v615 = swift_allocObject();
      *(void *)(v615 + 16) = sub_1000185EC;
      *(void *)(v615 + 24) = v614;
      uint64_t v616 = swift_allocObject();
      *(_OWORD *)(v616 + 16) = xmmword_100019310;
      *(void *)(v616 + 32) = sub_100018770;
      *(void *)(v616 + 40) = v612;
      *(void *)(v616 + 48) = sub_100018774;
      *(void *)(v616 + 56) = v613;
      *(void *)(v616 + 64) = sub_10001862C;
      *(void *)(v616 + 72) = v615;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v610, v611))
      {
        uint64_t v617 = *(void *)(v719 + 1480);
        v618 = (uint8_t *)swift_slowAlloc();
        uint64_t v619 = swift_slowAlloc();
        v724[0] = 0;
        *(void *)&long long v721 = v619;
        *(_WORD *)v618 = 258;
        v618[2] = *(unsigned char *)(v612 + 16);
        uint64_t v620 = *(void *)(v719 + 1480);
        if (v617) {
          goto LABEL_121;
        }
        swift_release();
        v618[3] = *(unsigned char *)(v613 + 16);
        v720[0] = (uint64_t)(v618 + 4);
        uint64_t v633 = *(void *)(v719 + 1480);
        if (v620) {
          goto LABEL_121;
        }
        swift_release();
        sub_10001502C(v720, (uint64_t)v724, (uint64_t *)&v721, *(uint64_t (**)(void))(v615 + 16));
        if (v633) {
          goto LABEL_121;
        }
        uint64_t v472 = (void *)v719;
        uint64_t v634 = *(void *)(v719 + 1072);
        uint64_t v635 = *(void *)(v719 + 1016);
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v610, v611, "Execution state saved for taskName %s.", v618, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v623 = v634;
        uint64_t v624 = v635;
      }
      else
      {
        uint64_t v472 = (void *)v719;
        uint64_t v621 = *(void *)(v719 + 1072);
        uint64_t v622 = *(void *)(v719 + 1016);
        swift_release();
        swift_release();
        swift_release();

        uint64_t v623 = v621;
        uint64_t v624 = v622;
      }
      v718(v623, v624);
    }
    v625 = (void *)v472[183];
    Class v626 = (void *)v472[181];
    NSString v627 = *(void **)(v719 + 1432);
    uint64_t v628 = *(void **)(v719 + 1336);
    uint64_t v629 = *(void *)(v719 + 1008);
    uint64_t v630 = *(void *)(v719 + 984);
    uint64_t v631 = *(void *)(v719 + 976);
    id v632 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v677 = sub_1000188D0();

    (*(void (**)(uint64_t, uint64_t))(v630 + 8))(v629, v631);
    swift_release();
LABEL_255:
    swift_release();
    goto LABEL_74;
  }
  *(void *)(v719 + 1536) = 0;
  uint64_t v549 = *(void *)(v719 + 1472);
  uint64_t v550 = *(void *)(v549 + 16);
  uint64_t v353 = swift_bridgeObjectRetain();
  if (!v550)
  {
LABEL_280:
    __break(1u);
LABEL_281:
    __break(1u);
    return withCheckedContinuation<A>(isolation:function:_:)(v353, v354, v355, v356, v357, v358, v359, v360);
  }
  uint64_t v551 = *(void *)(v549 + 32);
  swift_bridgeObjectRetain();
  sub_100013188(0x74654D6C65646F4DLL, 0xEC00000073636972, v551, v678);
  swift_bridgeObjectRelease();
  if (!*(void *)(v719 + 136))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4((uint64_t)v678, &qword_1000201E8);
    swift_bridgeObjectRelease();
LABEL_262:
    uint64_t v636 = *(void *)(v719 + 1368);
    uint64_t v637 = *(void (**)(uint64_t, uint64_t, uint64_t))(v719 + 1304);
    uint64_t v638 = *(void *)(v719 + 1120);
    uint64_t v639 = *(void *)(v719 + 1016);
    swift_bridgeObjectRelease();
    v637(v638, v636, v639);
    uint64_t v640 = sub_1000189C0();
    os_log_type_t v641 = sub_100018B40();
    if (os_log_type_enabled(v640, v641))
    {
      uint64_t v642 = *(void *)(v719 + 1120);
      uint64_t v643 = *(void *)(v719 + 1016);
      uint64_t v644 = (uint8_t *)swift_slowAlloc();
      v724[0] = 0;
      *(void *)&long long v721 = 0;
      *(_WORD *)uint64_t v644 = 0;
      v720[0] = (uint64_t)(v644 + 2);
      sub_100014C20((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v720, (uint64_t)v724, (uint64_t)&v721);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v640, v641, "Measurements were malformed", v644, 2u);
      swift_slowDealloc();

      v718(v642, v643);
    }
    else
    {
      uint64_t v645 = *(void *)(v719 + 1120);
      uint64_t v646 = *(void *)(v719 + 1016);
      swift_bridgeObjectRelease();

      v718(v645, v646);
    }
    v647 = *(void **)(v719 + 1520);
    v648 = *(void **)(v719 + 1464);
    uint64_t v649 = *(void **)(v719 + 1448);
    uint64_t v650 = *(void **)(v719 + 1432);
    uint64_t v651 = *(void **)(v719 + 1336);
    uint64_t v652 = *(void *)(v719 + 1008);
    uint64_t v653 = *(void *)(v719 + 984);
    uint64_t v654 = *(void *)(v719 + 976);
    v722 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v723 = sub_100016E14();
    LOBYTE(v721) = 20;
    id v655 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v677 = sub_1000188C0();

    (*(void (**)(uint64_t, uint64_t))(v653 + 8))(v652, v654);
    swift_release();
    goto LABEL_255;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    goto LABEL_262;
  }
  uint64_t v487 = *(void *)(v719 + 608);
  *uint64_t v679 = sub_1000132B4((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v552 = v487 + 64;
  uint64_t v553 = -1;
  uint64_t v554 = -1 << *(unsigned char *)(v487 + 32);
  if (-v554 < 64) {
    uint64_t v553 = ~(-1 << -(char)v554);
  }
  unint64_t v555 = v553 & *(void *)(v487 + 64);
  int64_t v556 = (unint64_t)(63 - v554) >> 6;
  uint64_t v557 = *(void *)(v719 + 728);
  uint64_t v353 = swift_bridgeObjectRetain();
  int64_t v558 = 0;
  if (v555) {
    goto LABEL_207;
  }
LABEL_208:
  BOOL v510 = __OFADD__(v558++, 1);
  if (v510) {
    goto LABEL_279;
  }
  if (v558 < v556)
  {
    unint64_t v571 = *(void *)(v552 + 8 * v558);
    if (v571)
    {
LABEL_222:
      unint64_t v555 = (v571 - 1) & v571;
      for (unint64_t j = __clz(__rbit64(v571)) + (v558 << 6); ; unint64_t j = v569 | (v558 << 6))
      {
        uint64_t v573 = (uint64_t *)(*(void *)(v487 + 48) + 16 * j);
        uint64_t v575 = *v573;
        uint64_t v574 = v573[1];
        uint64_t v576 = *(void *)(v557 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v576)
        {
          sub_1000157B4(v575, v574);
          char v578 = v577;
          swift_bridgeObjectRelease();
          if (v578)
          {
            swift_bridgeObjectRetain();
            sub_100013188(v575, v574, v487, &v721);
            swift_bridgeObjectRelease();
            uint64_t v353 = sub_100013508((uint64_t)&v721, v575, v574);
            if (!v555) {
              goto LABEL_208;
            }
            goto LABEL_207;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        uint64_t v353 = swift_bridgeObjectRelease();
        if (!v555) {
          goto LABEL_208;
        }
LABEL_207:
        unint64_t v569 = __clz(__rbit64(v555));
        v555 &= v555 - 1;
      }
    }
    int64_t v572 = v558 + 1;
    if (v558 + 1 < v556)
    {
      unint64_t v571 = *(void *)(v552 + 8 * v572);
      if (v571) {
        goto LABEL_221;
      }
      int64_t v572 = v558 + 2;
      if (v558 + 2 >= v556) {
        goto LABEL_266;
      }
      unint64_t v571 = *(void *)(v552 + 8 * v572);
      if (v571) {
        goto LABEL_221;
      }
      int64_t v572 = v558 + 3;
      if (v558 + 3 >= v556) {
        goto LABEL_266;
      }
      unint64_t v571 = *(void *)(v552 + 8 * v572);
      if (v571) {
        goto LABEL_221;
      }
      int64_t v572 = v558 + 4;
      if (v558 + 4 >= v556) {
        goto LABEL_266;
      }
      unint64_t v571 = *(void *)(v552 + 8 * v572);
      if (v571)
      {
LABEL_221:
        int64_t v558 = v572;
        goto LABEL_222;
      }
      int64_t v572 = v558 + 5;
      if (v558 + 5 < v556)
      {
        unint64_t v571 = *(void *)(v552 + 8 * v572);
        if (!v571)
        {
          while (1)
          {
            int64_t v558 = v572 + 1;
            if (__OFADD__(v572, 1)) {
              goto LABEL_281;
            }
            if (v558 >= v556) {
              goto LABEL_266;
            }
            unint64_t v571 = *(void *)(v552 + 8 * v558);
            ++v572;
            if (v571) {
              goto LABEL_222;
            }
          }
        }
        goto LABEL_221;
      }
    }
  }
LABEL_266:
  uint64_t v656 = *(void *)(v719 + 1368);
  v657 = *(void (**)(uint64_t, uint64_t, uint64_t))(v719 + 1304);
  uint64_t v658 = *(void *)(v719 + 1136);
  uint64_t v659 = *(void *)(v719 + 1016);
  swift_release();
  v657(v658, v656, v659);
  uint64_t v660 = swift_allocObject();
  *(void *)(v660 + 16) = v487;
  uint64_t v661 = swift_allocObject();
  *(void *)(v661 + 16) = sub_1000174C8;
  *(void *)(v661 + 24) = v660;
  v486 = sub_1000189C0();
  LOBYTE(v487) = sub_100018B30();
  uint64_t v662 = swift_allocObject();
  *(unsigned char *)(v662 + 16) = 32;
  uint64_t v479 = swift_allocObject();
  *(unsigned char *)(v479 + 16) = 8;
  uint64_t v663 = swift_allocObject();
  *(void *)(v663 + 16) = sub_1000174D4;
  *(void *)(v663 + 24) = v661;
  uint64_t v478 = swift_allocObject();
  *(void *)(v478 + 16) = sub_1000185F0;
  *(void *)(v478 + 24) = v663;
  uint64_t v664 = swift_allocObject();
  *(_OWORD *)(v664 + 16) = xmmword_100019310;
  *(void *)(v664 + 32) = sub_100018778;
  *(void *)(v664 + 40) = v662;
  *(void *)(v664 + 48) = sub_10001877C;
  *(void *)(v664 + 56) = v479;
  *(void *)(v664 + 64) = sub_100018630;
  *(void *)(v664 + 72) = v478;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (!os_log_type_enabled(v486, (os_log_type_t)v487))
  {
    uint64_t v667 = *(void *)(v719 + 1136);
    uint64_t v668 = *(void *)(v719 + 1016);
    swift_release();
    swift_release();
    swift_release();

    v718(v667, v668);
    goto LABEL_270;
  }
  uint64_t v665 = *(void *)(v719 + 1480);
  uint64_t v484 = (uint8_t *)swift_slowAlloc();
  uint64_t v666 = swift_slowAlloc();
  *(void *)(v719 + 664) = 0;
  *(void *)(v719 + 672) = v666;
  *(_WORD *)uint64_t v484 = 258;
  v484[2] = *(unsigned char *)(v662 + 16);
  *(void *)(v719 + 656) = v484 + 3;
  int64_t v488 = *(void *)(v719 + 1480);
  if (!v665)
  {
LABEL_274:
    swift_release();
    uint64_t v673 = *(unsigned char **)(v719 + 656);
    *uint64_t v673 = *(unsigned char *)(v479 + 16);
    *(void *)(v719 + 656) = v673 + 1;
    uint64_t v674 = *(void *)(v719 + 1480);
    if (v488) {
      goto LABEL_121;
    }
    swift_release();
    sub_10001502C((uint64_t *)(v719 + 656), v719 + 664, (uint64_t *)(v719 + 672), *(uint64_t (**)(void))(v478 + 16));
    if (v674) {
      goto LABEL_121;
    }
    uint64_t v675 = *(void *)(v719 + 1136);
    uint64_t v676 = *(void *)(v719 + 1016);
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v486, (os_log_type_t)v487, "Measurements: %s", v484, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v718(v675, v676);
LABEL_270:
    uint64_t v669 = *(void *)(v719 + 1520);
    uint64_t v670 = swift_task_alloc();
    *(void *)(v719 + 1544) = v670;
    long long v671 = *(_OWORD *)(v719 + 1504);
    *(void *)(v670 + 16) = v669;
    *(void *)(v670 + 24) = v494 + 33;
    *(void *)(v670 + 32) = 0x8000000100019CE0;
    *(void *)(v670 + 40) = v679;
    *(_OWORD *)(v670 + 48) = v671;
    uint64_t v672 = (void *)swift_task_alloc();
    *(void *)(v719 + 1552) = v672;
    *uint64_t v672 = v719;
    v672[1] = sub_100010D6C;
    uint64_t v353 = v719 + 449;
    unint64_t v357 = 0x8000000100019D80;
    uint64_t v360 = &type metadata for Bool;
    uint64_t v358 = sub_100017574;
    uint64_t v354 = 0;
    uint64_t v355 = 0;
    unint64_t v356 = 0xD000000000000010;
    uint64_t v359 = v670;
    return withCheckedContinuation<A>(isolation:function:_:)(v353, v354, v355, v356, v357, v358, v359, v360);
  }
LABEL_121:
  return swift_errorRelease();
}

uint64_t sub_100010D6C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_100010EB0, 0, 0);
}

uint64_t sub_100010EB0()
{
  uint64_t v154 = v0;
  char v1 = *(unsigned char *)(v0 + 449);
  (*(void (**)(void, void, void))(v0 + 1304))(*(void *)(v0 + 1128), *(void *)(v0 + 1368), *(void *)(v0 + 1016));
  uint64_t v2 = swift_allocObject();
  *(unsigned char *)(v2 + 16) = v1;
  uint64_t v3 = sub_1000189C0();
  os_log_type_t v4 = sub_100018B30();
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = 0;
  uint64_t v6 = swift_allocObject();
  *(unsigned char *)(v6 + 16) = 4;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_100017594;
  *(void *)(v7 + 24) = v2;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1000175BC;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_1000175E8;
  *(void *)(v9 + 24) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_100017610;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100019310;
  *(void *)(v11 + 32) = sub_100018780;
  *(void *)(v11 + 40) = v5;
  *(void *)(v11 + 48) = sub_100018784;
  *(void *)(v11 + 56) = v6;
  *(void *)(v11 + 64) = sub_100017640;
  *(void *)(v11 + 72) = v10;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v12 = *(void *)(v0 + 1480);
    uint64_t v13 = swift_slowAlloc();
    *(_OWORD *)(v0 + 640) = 0u;
    *(_WORD *)uint64_t v13 = 256;
    *(unsigned char *)(v13 + 2) = *(unsigned char *)(v5 + 16);
    *(void *)(v0 + 632) = v13 + 3;
    uint64_t v14 = *(void *)(v0 + 1480);
    if (v12
      || (char v53 = (uint8_t *)v13,
          swift_release(),
          uint64_t v54 = *(unsigned char **)(v0 + 632),
          *uint64_t v54 = *(unsigned char *)(v6 + 16),
          *(void *)(v0 + 632) = v54 + 1,
          uint64_t v55 = *(void *)(v0 + 1480),
          v14))
    {
      return swift_errorRelease();
    }
    uint64_t v114 = swift_release();
    (*(void (**)(long long *__return_ptr, uint64_t))(v10 + 16))(&v150, v114);
    uint64_t v115 = *(void *)(v0 + 632) + 4;
    sub_100018B60();
    *(void *)(v0 + 632) = v115;
    if (v55) {
      return swift_errorRelease();
    }
    uint64_t v135 = *(void *)(v0 + 1128);
    uint64_t v136 = *(void *)(v0 + 1024);
    uint64_t v137 = *(void *)(v0 + 1016);
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Succeded: %{BOOL}d", v53, 8u);
    swift_slowDealloc();

    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v136 + 8);
    v18(v135, v137);
  }
  else
  {
    uint64_t v15 = *(void *)(v0 + 1128);
    uint64_t v16 = *(void *)(v0 + 1024);
    uint64_t v17 = *(void *)(v0 + 1016);
    swift_release();
    swift_release();
    swift_release();

    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v18(v15, v17);
  }
  uint64_t v19 = *(void *)(v0 + 1528);
  uint64_t v20 = *(void *)(v0 + 1536) + 1;
  swift_bridgeObjectRelease();
  if (v20 == v19)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void **)(v0 + 1488);
    unint64_t v22 = v21[2];
    if (v22 <= 1
      && (v22 != 1 || v21[4] == 0x6E61697373756147 && v21[5] == 0xEF6F637369446544 || (sub_100018CC0() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)(v0 + 1440);
      uint64_t v24 = *(void **)(v0 + 1432);
      sub_100013058(*(void *)(v0 + 1472));
      swift_bridgeObjectRelease();
      Class isa = sub_100018AD0().super.isa;
      swift_bridgeObjectRelease();
      Class v26 = sub_100018AD0().super.isa;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 584) = *(void *)(v23 + 16);
      id v27 = [v24 logAllResultsToCoreAnalyticsOrDeDisco:isa withLoggingStrategies:v26 outError:v0 + 584];

      uint64_t v28 = *(void **)(v0 + 584);
      os_log_type_t v29 = *(void **)(v23 + 16);
      *(void *)(v23 + 16) = v28;
      id v30 = v28;
    }
    sub_100018920();
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(v0 + 472) == 1)
    {
      uint64_t v146 = *(void *)(v0 + 1368);
      uint64_t v148 = v18;
      uint64_t v57 = *(void **)(v0 + 1336);
      uint64_t v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1304);
      uint64_t v59 = *(void *)(v0 + 1072);
      uint64_t v60 = *(void *)(v0 + 1016);
      os_log_type_t v61 = *(void **)(v0 + 752);
      Class v62 = sub_100018B00().super.super.isa;
      sub_100018990();
      NSString v63 = sub_100018A30();
      swift_bridgeObjectRelease();
      [v57 setValue:v62 forKey:v63];

      v58(v59, v146, v60);
      uint64_t v64 = swift_allocObject();
      *(void *)(v64 + 16) = v61;
      id v65 = v61;
      uint64_t v66 = sub_1000189C0();
      os_log_type_t v67 = sub_100018B30();
      uint64_t v68 = swift_allocObject();
      *(unsigned char *)(v68 + 16) = 32;
      uint64_t v69 = swift_allocObject();
      *(unsigned char *)(v69 + 16) = 8;
      uint64_t v70 = swift_allocObject();
      *(void *)(v70 + 16) = sub_100017430;
      *(void *)(v70 + 24) = v64;
      uint64_t v71 = swift_allocObject();
      *(void *)(v71 + 16) = sub_1000185EC;
      *(void *)(v71 + 24) = v70;
      uint64_t v72 = swift_allocObject();
      *(_OWORD *)(v72 + 16) = xmmword_100019310;
      *(void *)(v72 + 32) = sub_100018770;
      *(void *)(v72 + 40) = v68;
      *(void *)(v72 + 48) = sub_100018774;
      *(void *)(v72 + 56) = v69;
      *(void *)(v72 + 64) = sub_10001862C;
      *(void *)(v72 + 72) = v71;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v66, v67))
      {
        uint64_t v73 = *(void *)(v0 + 1480);
        uint64_t v74 = (uint8_t *)swift_slowAlloc();
        uint64_t v75 = swift_slowAlloc();
        v153[0] = 0;
        *(void *)&long long v150 = v75;
        *(_WORD *)uint64_t v74 = 258;
        v74[2] = *(unsigned char *)(v68 + 16);
        uint64_t v76 = *(void *)(v0 + 1480);
        if (v73) {
          return swift_errorRelease();
        }
        swift_release();
        v74[3] = *(unsigned char *)(v69 + 16);
        v149[0] = (uint64_t)(v74 + 4);
        uint64_t v138 = *(void *)(v0 + 1480);
        if (v76) {
          return swift_errorRelease();
        }
        swift_release();
        sub_10001502C(v149, (uint64_t)v153, (uint64_t *)&v150, *(uint64_t (**)(void))(v71 + 16));
        if (v138) {
          return swift_errorRelease();
        }
        uint64_t v141 = *(void *)(v0 + 1072);
        uint64_t v142 = *(void *)(v0 + 1016);
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v66, v67, "Execution state saved for taskName %s.", v74, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v118 = v141;
        uint64_t v119 = v142;
      }
      else
      {
        uint64_t v116 = *(void *)(v0 + 1072);
        uint64_t v117 = *(void *)(v0 + 1016);
        swift_release();
        swift_release();
        swift_release();

        uint64_t v118 = v116;
        uint64_t v119 = v117;
      }
      v148(v118, v119);
    }
    uint64_t v120 = *(void **)(v0 + 1464);
    uint64_t v121 = *(void **)(v0 + 1448);
    uint64_t v122 = *(void **)(v0 + 1432);
    os_log_type_t v123 = *(void **)(v0 + 1336);
    uint64_t v124 = *(void *)(v0 + 1008);
    uint64_t v125 = *(void *)(v0 + 984);
    uint64_t v126 = *(void *)(v0 + 976);
    id v127 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v145 = sub_1000188D0();

    (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v124, v126);
    goto LABEL_67;
  }
  unint64_t v31 = *(void *)(v0 + 1536) + 1;
  *(void *)(v0 + 1536) = v31;
  uint64_t v32 = *(void *)(v0 + 1472);
  if (*(void *)(v32 + 16) <= v31) {
    goto LABEL_84;
  }
  uint64_t v33 = *(void *)(v32 + 8 * v31 + 32);
  swift_bridgeObjectRetain();
  sub_100013188(0x74654D6C65646F4DLL, 0xEC00000073636972, v33, (_OWORD *)(v0 + 112));
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 136))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000173D4(v0 + 112, &qword_1000201E8);
    swift_bridgeObjectRelease();
LABEL_55:
    uint64_t v77 = *(void *)(v0 + 1368);
    uint64_t v78 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1304);
    uint64_t v79 = *(void *)(v0 + 1120);
    uint64_t v80 = *(void *)(v0 + 1016);
    swift_bridgeObjectRelease();
    v78(v79, v77, v80);
    id v81 = sub_1000189C0();
    os_log_type_t v82 = sub_100018B40();
    if (os_log_type_enabled(v81, v82))
    {
      uint64_t v83 = *(void *)(v0 + 1120);
      uint64_t v84 = *(void *)(v0 + 1016);
      uint64_t v85 = (uint8_t *)swift_slowAlloc();
      v153[0] = 0;
      *(void *)&long long v150 = 0;
      *(_WORD *)uint64_t v85 = 0;
      v149[0] = (uint64_t)(v85 + 2);
      sub_100014C20((uint64_t)&_swiftEmptyArrayStorage, (uint64_t)v149, (uint64_t)v153, (uint64_t)&v150);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v81, v82, "Measurements were malformed", v85, 2u);
      swift_slowDealloc();

      v18(v83, v84);
    }
    else
    {
      uint64_t v86 = *(void *)(v0 + 1120);
      uint64_t v87 = *(void *)(v0 + 1016);
      swift_bridgeObjectRelease();

      v18(v86, v87);
    }
    uint64_t v88 = *(void **)(v0 + 1520);
    uint64_t v89 = *(void **)(v0 + 1464);
    v90 = *(void **)(v0 + 1448);
    uint64_t v91 = *(void **)(v0 + 1432);
    uint64_t v92 = *(void **)(v0 + 1336);
    uint64_t v93 = *(void *)(v0 + 1008);
    uint64_t v94 = *(void *)(v0 + 984);
    uint64_t v95 = *(void *)(v0 + 976);
    uint64_t v151 = &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
    unint64_t v152 = sub_100016E14();
    LOBYTE(v150) = 20;
    id v96 = objc_allocWithZone((Class)sub_1000188E0());
    uint64_t v145 = sub_1000188C0();

    (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v93, v95);
LABEL_67:
    swift_release();
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v128 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v128(v145);
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    goto LABEL_55;
  }
  uint64_t v147 = v18;
  uint64_t v34 = *(void *)(v0 + 608);
  *(void *)(v0 + 616) = sub_1000132B4((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v35 = v34 + 64;
  uint64_t v36 = -1;
  uint64_t v37 = -1 << *(unsigned char *)(v34 + 32);
  if (-v37 < 64) {
    uint64_t v36 = ~(-1 << -(char)v37);
  }
  unint64_t v38 = v36 & *(void *)(v34 + 64);
  int64_t v39 = (unint64_t)(63 - v37) >> 6;
  uint64_t v40 = *(void *)(v0 + 728);
  swift_bridgeObjectRetain();
  int64_t v41 = 0;
  if (v38) {
    goto LABEL_17;
  }
LABEL_18:
  while (2)
  {
    int64_t v44 = v41 + 1;
    if (__OFADD__(v41, 1))
    {
      __break(1u);
LABEL_84:
      __break(1u);
      goto LABEL_85;
    }
    if (v44 < v39)
    {
      unint64_t v45 = *(void *)(v35 + 8 * v44);
      ++v41;
      if (v45) {
        goto LABEL_35;
      }
      int64_t v41 = v44 + 1;
      if (v44 + 1 >= v39) {
        break;
      }
      unint64_t v45 = *(void *)(v35 + 8 * v41);
      if (v45) {
        goto LABEL_35;
      }
      int64_t v41 = v44 + 2;
      if (v44 + 2 >= v39) {
        break;
      }
      unint64_t v45 = *(void *)(v35 + 8 * v41);
      if (v45) {
        goto LABEL_35;
      }
      int64_t v41 = v44 + 3;
      if (v44 + 3 >= v39) {
        break;
      }
      unint64_t v45 = *(void *)(v35 + 8 * v41);
      if (v45) {
        goto LABEL_35;
      }
      int64_t v41 = v44 + 4;
      if (v44 + 4 >= v39) {
        break;
      }
      unint64_t v45 = *(void *)(v35 + 8 * v41);
      if (v45)
      {
LABEL_35:
        unint64_t v38 = (v45 - 1) & v45;
        for (unint64_t i = __clz(__rbit64(v45)) + (v41 << 6); ; unint64_t i = v42 | (v41 << 6))
        {
          uint64_t v47 = (uint64_t *)(*(void *)(v34 + 48) + 16 * i);
          uint64_t v49 = *v47;
          uint64_t v48 = v47[1];
          uint64_t v50 = *(void *)(v40 + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (!v50) {
            break;
          }
          sub_1000157B4(v49, v48);
          char v52 = v51;
          swift_bridgeObjectRelease();
          if ((v52 & 1) == 0) {
            goto LABEL_16;
          }
          swift_bridgeObjectRetain();
          sub_100013188(v49, v48, v34, &v150);
          swift_bridgeObjectRelease();
          sub_100013508((uint64_t)&v150, v49, v48);
          if (!v38) {
            goto LABEL_18;
          }
LABEL_17:
          unint64_t v42 = __clz(__rbit64(v38));
          v38 &= v38 - 1;
        }
        swift_bridgeObjectRelease();
LABEL_16:
        swift_bridgeObjectRelease();
        if (!v38) {
          continue;
        }
        goto LABEL_17;
      }
      int64_t v46 = v44 + 5;
      if (v46 < v39)
      {
        unint64_t v45 = *(void *)(v35 + 8 * v46);
        if (v45)
        {
          int64_t v41 = v46;
          goto LABEL_35;
        }
        while (1)
        {
          int64_t v41 = v46 + 1;
          if (__OFADD__(v46, 1)) {
            break;
          }
          if (v41 >= v39) {
            goto LABEL_59;
          }
          unint64_t v45 = *(void *)(v35 + 8 * v41);
          ++v46;
          if (v45) {
            goto LABEL_35;
          }
        }
LABEL_85:
        __break(1u);
      }
    }
    break;
  }
LABEL_59:
  uint64_t v97 = *(void *)(v0 + 1368);
  uint64_t v98 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1304);
  uint64_t v99 = *(void *)(v0 + 1136);
  uint64_t v100 = *(void *)(v0 + 1016);
  swift_release();
  v98(v99, v97, v100);
  uint64_t v101 = swift_allocObject();
  *(void *)(v101 + 16) = v34;
  uint64_t v102 = swift_allocObject();
  *(void *)(v102 + 16) = sub_1000174C8;
  *(void *)(v102 + 24) = v101;
  uint64_t v103 = sub_1000189C0();
  os_log_type_t v104 = sub_100018B30();
  uint64_t v105 = swift_allocObject();
  *(unsigned char *)(v105 + 16) = 32;
  uint64_t v106 = swift_allocObject();
  *(unsigned char *)(v106 + 16) = 8;
  uint64_t v107 = swift_allocObject();
  *(void *)(v107 + 16) = sub_1000174D4;
  *(void *)(v107 + 24) = v102;
  uint64_t v108 = swift_allocObject();
  *(void *)(v108 + 16) = sub_1000185F0;
  *(void *)(v108 + 24) = v107;
  uint64_t v109 = swift_allocObject();
  *(_OWORD *)(v109 + 16) = xmmword_100019310;
  *(void *)(v109 + 32) = sub_100018778;
  *(void *)(v109 + 40) = v105;
  *(void *)(v109 + 48) = sub_10001877C;
  *(void *)(v109 + 56) = v106;
  *(void *)(v109 + 64) = sub_100018630;
  *(void *)(v109 + 72) = v108;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v103, v104))
  {
    uint64_t v110 = *(void *)(v0 + 1480);
    uint64_t v111 = (uint8_t *)swift_slowAlloc();
    uint64_t v112 = swift_slowAlloc();
    *(void *)(v0 + 664) = 0;
    *(void *)(v0 + 672) = v112;
    *(_WORD *)uint64_t v111 = 258;
    v111[2] = *(unsigned char *)(v105 + 16);
    *(void *)(v0 + 656) = v111 + 3;
    uint64_t v113 = *(void *)(v0 + 1480);
    if (v110) {
      return swift_errorRelease();
    }
    swift_release();
    uint64_t v139 = *(unsigned char **)(v0 + 656);
    *uint64_t v139 = *(unsigned char *)(v106 + 16);
    *(void *)(v0 + 656) = v139 + 1;
    uint64_t v140 = *(void *)(v0 + 1480);
    if (v113) {
      return swift_errorRelease();
    }
    swift_release();
    sub_10001502C((uint64_t *)(v0 + 656), v0 + 664, (uint64_t *)(v0 + 672), *(uint64_t (**)(void))(v108 + 16));
    if (v140) {
      return swift_errorRelease();
    }
    uint64_t v143 = *(void *)(v0 + 1136);
    uint64_t v144 = *(void *)(v0 + 1016);
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v103, v104, "Measurements: %s", v111, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v147(v143, v144);
  }
  else
  {
    uint64_t v129 = *(void *)(v0 + 1136);
    uint64_t v130 = *(void *)(v0 + 1016);
    swift_release();
    swift_release();
    swift_release();

    v147(v129, v130);
  }
  uint64_t v131 = *(void *)(v0 + 1520);
  uint64_t v132 = swift_task_alloc();
  *(void *)(v0 + 1544) = v132;
  long long v133 = *(_OWORD *)(v0 + 1504);
  *(void *)(v132 + 16) = v131;
  *(void *)(v132 + 24) = 0xD000000000000031;
  *(void *)(v132 + 32) = 0x8000000100019CE0;
  *(void *)(v132 + 40) = v0 + 616;
  *(_OWORD *)(v132 + 48) = v133;
  v134 = (void *)swift_task_alloc();
  *(void *)(v0 + 1552) = v134;
  void *v134 = v0;
  v134[1] = sub_100010D6C;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 449, 0, 0, 0xD000000000000010, 0x8000000100019D80, sub_100017574, v132, &type metadata for Bool);
}

unint64_t sub_10001248C(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100014284(&qword_100020248);
    uint64_t v2 = (void *)sub_100018C30();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v11 = (char *)&type metadata for Any + 8;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_100017E30();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    uint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    sub_100017DBC(v6, v7);
    sub_100017DBC(v7, v40);
    sub_100017DBC(v40, &v38);
    unint64_t result = sub_1000157B4(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      uint64_t v12 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      uint64_t v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      uint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      sub_1000178EC((uint64_t)v18);
      unint64_t result = (unint64_t)sub_100017DBC(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v27 = (uint64_t *)(v2[6] + 16 * result);
    *id v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_100017DBC(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1000127F4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100014284(&qword_100020268);
    uint64_t v2 = (void *)sub_100018C30();
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
  uint64_t v6 = (char *)(v2 + 8);
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
    sub_100017890(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_100017DBC(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_100017DBC(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_100017DBC(v36, v37);
    sub_100017DBC(v37, &v33);
    uint64_t result = sub_100018BB0(v2[5]);
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
    uint64_t result = (uint64_t)sub_100017DBC(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_100017E30();
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

id sub_100012BBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v5 = sub_100018A30();
  swift_bridgeObjectRelease();
  NSString v6 = sub_100018A30();
  swift_bridgeObjectRelease();
  id v7 = [v4 initWithExperimentId:v5 deploymentId:a3 treatmentId:v6];

  return v7;
}

uint64_t sub_100012C68(uint64_t a1)
{
  sub_100014284(&qword_1000201A0);
  __chkstk_darwin();
  id v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100018850();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  int64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (!v9) {
    return (uint64_t)v10;
  }
  uint64_t v18 = v1;
  unint64_t v22 = (unint64_t *)&_swiftEmptyArrayStorage;
  sub_1000162D4(0, v9, 0);
  uint64_t v10 = v22;
  uint64_t v20 = v6;
  unint64_t v21 = (uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48);
  unint64_t v11 = (void (**)(char *, char *, uint64_t))(v6 + 32);
  uint64_t v12 = a1 + 40;
  uint64_t v19 = v4;
  while (1)
  {
    swift_bridgeObjectRetain();
    sub_100018820();
    uint64_t result = (*v21)(v4, 1, v5);
    if (result == 1) {
      break;
    }
    unint64_t v14 = *v11;
    (*v11)(v8, v4, v5);
    swift_bridgeObjectRelease();
    unint64_t v22 = v10;
    int64_t v15 = v8;
    unint64_t v17 = v10[2];
    unint64_t v16 = v10[3];
    if (v17 >= v16 >> 1)
    {
      sub_1000162D4(v16 > 1, v17 + 1, 1);
      uint64_t v10 = v22;
    }
    v12 += 16;
    v10[2] = v17 + 1;
    v14((char *)v10+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(void *)(v20 + 72) * v17, v15, v5);
    --v9;
    int64_t v8 = v15;
    id v4 = v19;
    if (!v9) {
      return (uint64_t)v10;
    }
  }
  __break(1u);
  return result;
}

id sub_100012EB4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_100018850();
  Class isa = sub_100018AD0().super.isa;
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithURLs:isa];

  return v2;
}

void *sub_100012F2C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  id v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
    sub_1000162B4(0, v1, 0);
    uint64_t v4 = a1 + 32;
    id v2 = &_swiftEmptyArrayStorage;
    do
    {
      sub_100017890(v4, (uint64_t)v9);
      sub_100014284(&qword_1000201F0);
      swift_dynamicCast();
      uint64_t v5 = v9[4];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1000162B4(0, v2[2] + 1, 1);
        id v2 = v10;
      }
      unint64_t v7 = v2[2];
      unint64_t v6 = v2[3];
      if (v7 >= v6 >> 1)
      {
        sub_1000162B4(v6 > 1, v7 + 1, 1);
        id v2 = v10;
      }
      v2[2] = v7 + 1;
      v2[v7 + 4] = v5;
      v4 += 32;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void *sub_100013058(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  id v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    int64_t v9 = &_swiftEmptyArrayStorage;
    sub_100016294(0, v1, 0);
    uint64_t v4 = a1 + 32;
    id v2 = &_swiftEmptyArrayStorage;
    do
    {
      swift_bridgeObjectRetain();
      sub_100014284(&qword_1000201F0);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100016294(0, v2[2] + 1, 1);
        id v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_100016294(v5 > 1, v6 + 1, 1);
        id v2 = v9;
      }
      v2[2] = v6 + 1;
      sub_100017DBC(&v8, &v2[4 * v6 + 4]);
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

double sub_100013188@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1000157B4(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_100017890(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_1000131EC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_100018CC0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  int64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_100018CC0() & 1) != 0) {
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

unint64_t sub_1000132B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100014284(&qword_100020248);
  uint64_t v2 = sub_100018C30();
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
    sub_100017DCC(v6, (uint64_t)&v15, &qword_100020250);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000157B4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100017DBC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1000133EC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100014284(&qword_100020240);
  uint64_t v2 = (void *)sub_100018C30();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000157B4(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

uint64_t sub_100013508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_100017DBC((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_100015E08(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000173D4(a1, &qword_1000201E8);
    sub_10001582C(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_1000173D4((uint64_t)v9, &qword_1000201E8);
  }
}

void sub_1000135E0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v20 = a7;
  uint64_t v21 = a1;
  id v24 = a2;
  uint64_t v8 = sub_100014284(&qword_100020238);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin();
  NSString v23 = sub_100018A30();
  uint64_t v11 = swift_bridgeObjectRetain();
  sub_1000127F4(v11);
  swift_bridgeObjectRelease();
  Class isa = sub_1000189F0().super.isa;
  swift_bridgeObjectRelease();
  sub_1000127F4(a6);
  Class v12 = sub_1000189F0().super.isa;
  swift_bridgeObjectRelease();
  sub_1000127F4(v20);
  Class v13 = sub_1000189F0().super.isa;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v21, v8);
  unint64_t v14 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v15 + v14, (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_100017AA0;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001387C;
  aBlock[3] = &unk_10001DBA0;
  uint64_t v16 = _Block_copy(aBlock);
  swift_release();
  long long v17 = v23;
  Class v18 = isa;
  [v24 encodeAndUploadToDediscoWithIdentifier:v23 measurements:isa withEncodingSchemas:v12 metadata:v13 completion:v16];
  _Block_release(v16);
}

void sub_10001387C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1000138E8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100018648;
  return sub_10000231C(a1);
}

uint64_t sub_10001397C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100013A10;
  return sub_100002E24(a1);
}

uint64_t sub_100013A10(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100013B0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100013BF0;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100013BF0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100013CE4(uint64_t a1)
{
  uint64_t v2 = sub_100018428(&qword_100020160, (void (*)(uint64_t))type metadata accessor for AppStoreEvalLighthouseWorker);

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100013D60()
{
  return sub_100018910();
}

unint64_t sub_100013DBC(unint64_t a1, unint64_t a2, char a3)
{
  uint64_t v6 = sub_100018D90();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = &type metadata for AppStoreEvalLighthouseWorkerConfig;
  unint64_t v16 = a1;
  unint64_t v17 = a2;
  char v18 = a3;
  swift_bridgeObjectRetain();
  sub_100018D70();
  sub_100018D80();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v10 = sub_100013F80();
  swift_release();
  unint64_t v16 = 0xD000000000000023;
  unint64_t v17 = 0x8000000100019BB0;
  uint64_t v15 = v10;
  sub_100014284(&qword_100020168);
  sub_100017E4C(&qword_100020170, &qword_100020168);
  uint64_t v11 = sub_100018A20();
  Class v13 = v12;
  swift_bridgeObjectRelease();
  v20._countAndFlagsBits = v11;
  v20._object = v13;
  sub_100018A90(v20);
  swift_bridgeObjectRelease();
  v21._countAndFlagsBits = 41;
  v21._object = (void *)0xE100000000000000;
  sub_100018A90(v21);
  return v16;
}

void *sub_100013F80()
{
  swift_retain();
  sub_100018BE0();
  swift_release();
  sub_100018C50();
  if (*((void *)&v9 + 1))
  {
    id v0 = _swiftEmptyArrayStorage;
    do
    {
      v6[0] = v7;
      v6[1] = v8;
      v6[2] = v9;
      v1._object = (void *)*((void *)&v7 + 1);
      if (*((void *)&v7 + 1))
      {
        v1._countAndFlagsBits = *(void *)&v6[0];
        sub_100018A90(v1);
        v10._countAndFlagsBits = 8250;
        v10._object = (void *)0xE200000000000000;
        sub_100018A90(v10);
        sub_100018BF0();
        sub_1000173D4((uint64_t)v6, &qword_100020178);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v0 = sub_100014EB4(0, v0[2] + 1, 1, v0);
        }
        unint64_t v3 = v0[2];
        unint64_t v2 = v0[3];
        if (v3 >= v2 >> 1) {
          id v0 = sub_100014EB4((void *)(v2 > 1), v3 + 1, 1, v0);
        }
        v0[2] = v3 + 1;
        uint64_t v4 = &v0[2 * v3];
        v4[4] = 0;
        v4[5] = 0xE000000000000000;
      }
      else
      {
        sub_1000173D4((uint64_t)v6, &qword_100020178);
      }
      sub_100018C50();
    }
    while (*((void *)&v9 + 1));
  }
  else
  {
    id v0 = _swiftEmptyArrayStorage;
  }
  swift_release();
  return v0;
}

unint64_t sub_10001412C()
{
  return sub_100013DBC(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for AppStoreEvalLighthouseWorker()
{
  uint64_t result = qword_1000202F0;
  if (!qword_1000202F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100014214(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014284(&qword_1000200A8);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100014284(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000142C8(uint64_t a1)
{
  uint64_t v2 = sub_100014284(&qword_1000200A8);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100014330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014284(&qword_1000200A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100014398(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014284(&qword_1000200A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100014400(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014284(&qword_1000200A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100014468(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014284(&qword_1000200A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000144D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000144E4);
}

uint64_t sub_1000144E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014284(&qword_1000200A8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100014554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100014568);
}

uint64_t sub_100014568(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014284(&qword_1000200A8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_1000145DC()
{
  sub_100014668();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100014668()
{
  if (!qword_100020108)
  {
    sub_1000146D0();
    sub_100014724();
    unint64_t v0 = sub_100018940();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100020108);
    }
  }
}

unint64_t sub_1000146D0()
{
  unint64_t result = qword_100020110;
  if (!qword_100020110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020110);
  }
  return result;
}

unint64_t sub_100014724()
{
  unint64_t result = qword_100020118;
  if (!qword_100020118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020118);
  }
  return result;
}

uint64_t destroy for AppStoreEvalLighthouseWorkerConfig()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s28AppStoreEvalLighthouseWorker34AppStoreEvalLighthouseWorkerConfigVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppStoreEvalLighthouseWorkerConfig(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for AppStoreEvalLighthouseWorkerConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppStoreEvalLighthouseWorkerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppStoreEvalLighthouseWorkerConfig(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppStoreEvalLighthouseWorkerConfig(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for AppStoreEvalLighthouseWorkerConfig()
{
  return &type metadata for AppStoreEvalLighthouseWorkerConfig;
}

uint64_t sub_100014904()
{
  return sub_100018428(&qword_1000200A0, (void (*)(uint64_t))type metadata accessor for AppStoreEvalLighthouseWorker);
}

uint64_t sub_10001494C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000149D0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100014A18(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100014A20@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100014A34@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100014A48@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100014A5C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100014A8C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100014AB8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100014ADC(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100014AF0(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100014B04(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100014B18@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100014B2C(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100014B40(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100014B54(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100014B68()
{
  return *v0 == 0;
}

uint64_t sub_100014B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100014B90(void *result)
{
  *v1 &= ~*result;
  return result;
}

BOOL sub_100014BA4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100014BB8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100016B58(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *sub_100014BF8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_100014C04@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100014C14(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100014C20(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(result + 16);
  if (v4)
  {
    uint64_t v8 = swift_bridgeObjectRetain() + 40;
    do
    {
      long long v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 - 8);
      swift_retain();
      v9(a2, a3, a4);
      swift_release();
      v8 += 16;
      --v4;
    }
    while (v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100014CB8(void (*a1)(uint64_t))
{
  uint64_t v2 = sub_100014284(&qword_1000200A8);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin();
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1(v4);
  sub_100017E4C(&qword_100020280, &qword_1000200A8);
  uint64_t v7 = sub_100018CA0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return v7;
}

uint64_t sub_100014DD8(void (*a1)(uint64_t *__return_ptr))
{
  a1(&v3);
  sub_100018850();
  uint64_t v1 = sub_100018AF0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_100014E44(void (*a1)(uint64_t *__return_ptr))
{
  a1(&v3);
  sub_100014284(&qword_1000201F0);
  uint64_t v1 = sub_100018AF0();
  swift_bridgeObjectRelease();
  return v1;
}

void *sub_100014EB4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100014284(&qword_100020180);
      Swift::String v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      Class v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      Swift::String v10 = _swiftEmptyArrayStorage;
      Class v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100016B90(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100014FC4(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  sub_1000150A4(0xD00000000000002DLL, 0x8000000100019C80, a3);
  uint64_t v4 = *a1 + 8;
  uint64_t result = sub_100018B60();
  *a1 = v4;
  return result;
}

uint64_t sub_10001502C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1000150A4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100018B60();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1000150A4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100015178(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100017890((uint64_t)v12, *a3);
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
      sub_100017890((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000178EC((uint64_t)v12);
  return v7;
}

uint64_t sub_100015178(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100018B70();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100015334(a5, a6);
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
  uint64_t v8 = sub_100018BD0();
  if (!v8)
  {
    sub_100018C00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100018C40();
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

uint64_t sub_100015334(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000153CC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000155AC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000155AC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000153CC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100015544(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100018BC0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100018C00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100018AA0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100018C40();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100018C00();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100015544(uint64_t a1, uint64_t a2)
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
  sub_100014284(&qword_100020278);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000155AC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100014284(&qword_100020278);
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
  Class v13 = a4 + 32;
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
  uint64_t result = sub_100018C40();
  __break(1u);
  return result;
}

void sub_1000156FC(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_100018B60();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t sub_1000157B4(uint64_t a1, uint64_t a2)
{
  sub_100018D40();
  sub_100018A80();
  Swift::Int v4 = sub_100018D60();

  return sub_100015FC8(a1, a2, v4);
}

double sub_10001582C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  Swift::Int v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1000157B4(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *Swift::Int v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1000160AC();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_100017DBC((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_100015C30(v8, v11);
    *Swift::Int v4 = v11;
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

uint64_t sub_100015930(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100014284(&qword_100020248);
  uint64_t v6 = sub_100018C20();
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
              unint64_t v3 = v2;
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
      Swift::String v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      id v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_100017DBC(v24, v35);
      }
      else
      {
        sub_100017890((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_100018D40();
      sub_100018A80();
      uint64_t result = sub_100018D60();
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
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_100017DBC(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

unint64_t sub_100015C30(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_100018BA0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_100018D40();
        swift_bridgeObjectRetain();
        sub_100018A80();
        Swift::Int v10 = sub_100018D60();
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
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *int64_t v18 = v20 & v19;
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

_OWORD *sub_100015E08(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  Swift::Int v10 = (void *)*v4;
  unint64_t v12 = sub_1000157B4(a2, a3);
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
      sub_1000160AC();
      goto LABEL_7;
    }
    sub_100015930(v15, a4 & 1);
    unint64_t v21 = sub_1000157B4(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_100018CE0();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_1000178EC((uint64_t)v19);
    return sub_100017DBC(a1, v19);
  }
LABEL_13:
  sub_100015F5C(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_100015F5C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100017DBC(a4, (_OWORD *)(a5[7] + 32 * a1));
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

unint64_t sub_100015FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100018CC0() & 1) == 0)
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
      while (!v14 && (sub_100018CC0() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1000160AC()
{
  uint64_t v1 = v0;
  sub_100014284(&qword_100020248);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100018C10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
    sub_100017890(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_100017DBC(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
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

uint64_t sub_100016294(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000162F4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000162B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100016464(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1000162D4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000165F0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1000162F4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100014284(&qword_100020258);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100018C40();
  __break(1u);
  return result;
}

uint64_t sub_100016464(char a1, int64_t a2, char a3, void *a4)
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
    sub_100014284(&qword_100020260);
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
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
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
    sub_100014284(&qword_1000201F0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100018C40();
  __break(1u);
  return result;
}

uint64_t sub_1000165F0(char a1, int64_t a2, char a3, void *a4)
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
    unint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100014284(&qword_100020230);
  uint64_t v10 = *(void *)(sub_100018850() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
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
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_100018850() - 8);
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
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_100018C40();
  __break(1u);
  return result;
}

uint64_t sub_100016830()
{
  unint64_t v0 = sub_100018CD0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x15) {
    return 21;
  }
  else {
    return v0;
  }
}

uint64_t sub_100016884(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7453657069636572 && a2 == 0xEC000000676E6972;
  if (v3 || (sub_100018CC0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65636E4F6E7572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100018CC0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100016980(void *a1)
{
  uint64_t v3 = sub_100014284(&qword_100020188);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  sub_100016C88(a1, a1[3]);
  sub_100016CCC();
  sub_100018DA0();
  if (v1)
  {
    sub_1000178EC((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9[15] = 0;
    uint64_t v7 = sub_100018C60();
    v9[14] = 1;
    sub_100018C70();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    sub_1000178EC((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_100016B58(uint64_t a1)
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

uint64_t sub_100016B90(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100018C40();
  __break(1u);
  return result;
}

void *sub_100016C88(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100016CCC()
{
  unint64_t result = qword_100020580[0];
  if (!qword_100020580[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100020580);
  }
  return result;
}

uint64_t sub_100016D20(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100016D58()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100016D90()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char **sub_100016DA0(unsigned char **result)
{
  uint64_t v2 = *result;
  *uint64_t v2 = *(unsigned char *)(v1 + 16);
  *unint64_t result = v2 + 1;
  return result;
}

uint64_t sub_100016DB4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100016DC4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_100016DEC(uint64_t *a1, void **a2, uint64_t a3)
{
  sub_1000156FC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_100016DF4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100016E04()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_100016E14()
{
  unint64_t result = qword_1000201C8;
  if (!qword_1000201C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000201C8);
  }
  return result;
}

uint64_t sub_100016E68()
{
  return sub_100017A14(&qword_1000200A8);
}

uint64_t sub_100016E74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100014284(&qword_1000200A8);
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return v5(a1, v6, v3);
}

uint64_t sub_100016EEC()
{
  return sub_100014CB8(*(void (**)(uint64_t))(v0 + 16));
}

uint64_t sub_100016EF4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100016F04()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100016F14()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100016F3C(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10001502C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_100016F44()
{
  swift_release();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100016F7C()
{
  return sub_100017A14(&qword_1000200A8);
}

uint64_t sub_100016F8C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100016F9C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100016FAC()
{
  return sub_100017A14(&qword_1000200A8);
}

uint64_t sub_100016FBC()
{
  sub_100014284(&qword_1000200A8);
  sub_100014284(&qword_1000200A8);
  sub_100018920();
  return v1;
}

uint64_t sub_100017038()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017048()
{
  return _swift_deallocObject(v0, 17, 7);
}

void sub_100017058(uint64_t *a1@<X8>)
{
  id v3 = [*(id *)(v1 + 16) recipe];
  uint64_t v4 = sub_100018A00();

  *a1 = v4;
}

uint64_t sub_1000170CC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000170DC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000170EC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

id sub_100017124()
{
  id v1 = [*(id *)(v0 + 16) triExperimentIdentifiers];

  return v1;
}

uint64_t sub_10001715C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001716C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001717C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000171B4@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  *a1 = *(void *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000171FC()
{
  return sub_100014DD8(*(void (**)(uint64_t *__return_ptr))(v0 + 16));
}

uint64_t sub_100017204()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017214()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017224(uint64_t a1, unint64_t *a2)
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

id sub_100017260()
{
  return *(id *)(v0 + 16);
}

uint64_t sub_100017268()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017278()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017288()
{
  return sub_100014E44(*(void (**)(uint64_t *__return_ptr))(v0 + 16));
}

uint64_t sub_100017290()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000172A0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000172B0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = sub_100018A40();
  uint64_t v4 = v3;
  id v5 = [v1 recipe];
  uint64_t v6 = sub_100018A00();

  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_1000157B4(v2, v4), (v8 & 1) != 0)) {
    sub_100017890(*(void *)(v6 + 56) + 32 * v7, (uint64_t)v11);
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100014284(&qword_1000201E8);
  uint64_t v9 = sub_100018B50();
  sub_1000173D4((uint64_t)v11, &qword_1000201E8);
  return v9;
}

uint64_t sub_1000173B4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000173C4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000173D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100014284(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100017430()
{
  return sub_100018990();
}

uint64_t sub_100017454()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017464()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_100017474()
{
  unint64_t result = qword_100020200;
  if (!qword_100020200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020200);
  }
  return result;
}

uint64_t sub_1000174C8@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000174D8()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v3);
  uint64_t v1 = sub_100018A10();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_100017554()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017564()
{
  return _swift_deallocObject(v0, 17, 7);
}

void sub_100017574(uint64_t a1)
{
  sub_1000135E0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_100017584()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017594()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_10001759C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000175AC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000175BC()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_1000175E8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100017610@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_100017640(uint64_t *a1)
{
  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  uint64_t v3 = *a1 + 4;
  uint64_t result = sub_100018B60();
  *a1 = v3;
  return result;
}

void *sub_1000176A0()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

uint64_t sub_1000176E4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000176F4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017704()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100017740()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017750()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017760()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017770()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_100017780()
{
  unint64_t result = qword_100020220;
  if (!qword_100020220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020220);
  }
  return result;
}

uint64_t sub_1000177D8()
{
  return sub_100018CF0();
}

uint64_t sub_100017818()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017828()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100017838(uint64_t a1, unint64_t a2)
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

uint64_t sub_100017890(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000178EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001793C()
{
  return sub_100018B50();
}

uint64_t sub_100017990()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000179A0()
{
  return _swift_deallocObject(v0, 17, 7);
}

void type metadata accessor for ReadingOptions()
{
  if (!qword_100020290)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100020290);
    }
  }
}

uint64_t sub_100017A08()
{
  return sub_100017A14(&qword_100020238);
}

uint64_t sub_100017A14(uint64_t *a1)
{
  uint64_t v2 = sub_100014284(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_100017AA0(uint64_t a1)
{
  sub_100014284(&qword_100020238);
  if (a1)
  {
    swift_errorRetain();
    if (qword_1000202D0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1000189E0();
    sub_100016D20(v2, (uint64_t)qword_100020D30);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v3 = sub_1000189C0();
    os_log_type_t v4 = sub_100018B30();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 138412290;
      swift_errorRetain();
      uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
      sub_100018B60();
      *uint64_t v6 = v12;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Found error: %@", v5, 0xCu);
      sub_100014284(&qword_100020218);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    sub_100014284(&qword_100020238);
    sub_100018B10();
    return swift_errorRelease();
  }
  else
  {
    if (qword_1000202D0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1000189E0();
    sub_100016D20(v7, (uint64_t)qword_100020D30);
    char v8 = sub_1000189C0();
    os_log_type_t v9 = sub_100018B30();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "error was nil", v10, 2u);
      swift_slowDealloc();
    }

    sub_100014284(&qword_100020238);
    return sub_100018B10();
  }
}

uint64_t sub_100017DA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100017DB4()
{
  return swift_release();
}

_OWORD *sub_100017DBC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100017DCC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100014284(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100017E30()
{
  return swift_release();
}

uint64_t sub_100017E38(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100017838(a1, a2);
  }
  return a1;
}

uint64_t sub_100017E4C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000149D0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_100017E90(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for AppStoreEvalLighthouseWorkerErrorCode(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppStoreEvalLighthouseWorkerErrorCode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEC) {
    goto LABEL_17;
  }
  if (a2 + 20 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 20) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 20;
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
      return (*a1 | (v4 << 8)) - 20;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 20;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x15;
  int v8 = v6 - 21;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppStoreEvalLighthouseWorkerErrorCode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 20 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 20) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEB)
  {
    unsigned int v6 = ((a2 - 236) >> 8) + 1;
    *uint64_t result = a2 + 20;
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
        JUMPOUT(0x100018060);
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
          *uint64_t result = a2 + 20;
        break;
    }
  }
  return result;
}

uint64_t sub_100018088(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100018094(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppStoreEvalLighthouseWorkerErrorCode()
{
  return &type metadata for AppStoreEvalLighthouseWorkerErrorCode;
}

uint64_t getEnumTagSinglePayload for AppStoreEvalLighthouseWorkerConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AppStoreEvalLighthouseWorkerConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100018208);
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

uint64_t sub_100018230(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001823C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppStoreEvalLighthouseWorkerConfig.CodingKeys()
{
  return &type metadata for AppStoreEvalLighthouseWorkerConfig.CodingKeys;
}

unint64_t sub_10001825C()
{
  unint64_t result = qword_100020690[0];
  if (!qword_100020690[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100020690);
  }
  return result;
}

unint64_t sub_1000182B4()
{
  unint64_t result = qword_100020298;
  if (!qword_100020298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020298);
  }
  return result;
}

uint64_t sub_100018308()
{
  return sub_100018428(&qword_1000202A0, (void (*)(uint64_t))type metadata accessor for ReadingOptions);
}

uint64_t sub_100018350()
{
  return sub_100018428(&qword_1000202A8, (void (*)(uint64_t))type metadata accessor for ReadingOptions);
}

uint64_t sub_100018398()
{
  return sub_100018428(&qword_1000202B0, (void (*)(uint64_t))type metadata accessor for ReadingOptions);
}

uint64_t sub_1000183E0()
{
  return sub_100018428(&qword_1000202B8, (void (*)(uint64_t))type metadata accessor for ReadingOptions);
}

uint64_t sub_100018428(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100018474()
{
  unint64_t result = qword_1000202C0;
  if (!qword_1000202C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000202C0);
  }
  return result;
}

unint64_t sub_1000184CC()
{
  unint64_t result = qword_1000202C8;
  if (!qword_1000202C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000202C8);
  }
  return result;
}

unint64_t sub_100018528()
{
  unint64_t result = qword_100020CA0;
  if (!qword_100020CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CA0);
  }
  return result;
}

unint64_t sub_100018580()
{
  unint64_t result = qword_100020CA8[0];
  if (!qword_100020CA8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100020CA8);
  }
  return result;
}

uint64_t sub_1000187B0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000187C0()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_1000187D0()
{
  return URL.absoluteString.getter();
}

uint64_t sub_1000187E0()
{
  return URL.relativeString.getter();
}

uint64_t sub_1000187F0()
{
  return URL.init(fileURLWithPath:)();
}

void sub_100018800(NSURL *retstr@<X8>)
{
}

uint64_t sub_100018810()
{
  return URL.path.getter();
}

uint64_t sub_100018820()
{
  return URL.init(string:)();
}

uint64_t sub_100018830()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_100018840()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_100018850()
{
  return type metadata accessor for URL();
}

uint64_t sub_100018860()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_100018870()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100018880()
{
  return static AppExtension.main()();
}

uint64_t sub_1000188A0()
{
  return MLHostAsset.url.getter();
}

uint64_t sub_1000188B0()
{
  return type metadata accessor for MLHostAsset();
}

uint64_t sub_1000188C0()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_1000188D0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_1000188E0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100018910()
{
  return MLHostParameters.init(taskParameters:)();
}

uint64_t sub_100018920()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_100018930()
{
  return MLHostParameters.systemParameters.getter();
}

uint64_t sub_100018940()
{
  return type metadata accessor for MLHostParameters();
}

uint64_t sub_100018950()
{
  return MLHostAssetParameters.assetSpecifier.getter();
}

uint64_t sub_100018960()
{
  return MLHostAssetParameters.assetType.getter();
}

uint64_t sub_100018970()
{
  return type metadata accessor for MLHostAssetParameters();
}

uint64_t sub_100018980()
{
  return MLHostExtensionContext.taskFolder.getter();
}

uint64_t sub_100018990()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_1000189A0()
{
  return MLHostSystemParameters.mobileAsset.getter();
}

uint64_t sub_1000189B0()
{
  return type metadata accessor for MLHostSystemParameters();
}

uint64_t sub_1000189C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000189D0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000189E0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_1000189F0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100018A00()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018A10()
{
  return Dictionary.description.getter();
}

uint64_t sub_100018A20()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_100018A30()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100018A40()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018A50()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_100018A60()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_100018A70()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_100018A80()
{
  return String.hash(into:)();
}

void sub_100018A90(Swift::String a1)
{
}

Swift::Int sub_100018AA0()
{
  return String.UTF8View._foreignCount()();
}

BOOL sub_100018AB0(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_100018AC0()
{
  return String.init(_:)();
}

NSArray sub_100018AD0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100018AE0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018AF0()
{
  return Array.description.getter();
}

NSNumber sub_100018B00()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_100018B10()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100018B20()
{
  return Collection<>.trimmingPrefix<A>(_:)();
}

uint64_t sub_100018B30()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100018B40()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100018B50()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_100018B60()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100018B70()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100018B80()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100018BA0()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_100018BB0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100018BC0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100018BD0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100018BE0()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_100018BF0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100018C00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100018C10()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100018C20()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100018C30()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100018C40()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100018C50()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

uint64_t sub_100018C60()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100018C70()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100018C80()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100018C90()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100018CA0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100018CC0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100018CD0()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_100018CE0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100018CF0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100018D00()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100018D10()
{
  return Error._code.getter();
}

uint64_t sub_100018D20()
{
  return Error._domain.getter();
}

uint64_t sub_100018D30()
{
  return Error._userInfo.getter();
}

uint64_t sub_100018D40()
{
  return Hasher.init(_seed:)();
}

void sub_100018D50(Swift::UInt a1)
{
}

Swift::Int sub_100018D60()
{
  return Hasher._finalize()();
}

uint64_t sub_100018D70()
{
  return Mirror.init(reflecting:)();
}

uint64_t sub_100018D80()
{
  return Mirror.children.getter();
}

uint64_t sub_100018D90()
{
  return type metadata accessor for Mirror();
}

uint64_t sub_100018DA0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100018DB0()
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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